#!/usr/bin/python3

import struct
from lib.TokenType import TokenType
from lib import AST

class CompilerNasm:
    def __init__(self, error_handler, target_bits=16):
        self.error_handler = error_handler
        self.target_bits = target_bits
        self.nasm_code = ""
        self.data_section = ""
        
        # Системы управления переменными и функциями
        self.global_variables = {}  # {"var_name": ("type", "label", size)}
        self.local_variables = {}   # {"var_name": ("type", offset_from_bp, size)}
        self.function_signatures = {}  # {"func_name": {"params": [...], "return_type": ...}}
        self.array_sizes = {}       # {"array_name": size}
        
        # НОВОЕ: Поддержка структур
        self.struct_definitions = {}  # {"struct_name": {"size": total_size, "fields": {...}}}
        self.enum_definitions = {}  
        
        # Счётчики для уникальных меток
        self.label_counter = 0
        self.string_counter = 0
        self.current_function = None
        
        # Настройки архитектуры
        self.main_reg = "ax" if target_bits == 16 else "eax"
        self.base_reg = "bp" if target_bits == 16 else "ebp" 
        self.stack_reg = "sp" if target_bits == 16 else "esp"
        self.temp_reg = "bx" if target_bits == 16 else "ebx"
        self.addr_reg = "bx" if target_bits == 16 else "ebx"

    def emit(self, code):
        """Добавляет код в выходной поток"""
        self.nasm_code += code

    def emit_data(self, data):
        """Добавляет данные в секцию данных"""
        self.data_section += data

    def get_label(self, prefix="L"):
        """Генерирует уникальную метку"""
        label = f"{prefix}_{self.label_counter}"
        self.label_counter += 1
        return label

    def compile(self, ast, std_lib_code=""):
        """Главная функция компиляции"""
        # Заголовок NASM
        self.emit(f"BITS {self.target_bits}\n")
        self.emit("ORG 0x8000\n\n")
        self.emit("section .text\n\n")
        self.emit("jmp _start\n")
        
        # Сначала обрабатываем объявления структур
        for node in ast.statements:
            if isinstance(node, AST.StructDeclarationNode):
                self.visit(node)
            elif isinstance(node, AST.EnumDeclarationNode):
                self.visit(node)
        
        # Затем глобальные объявления переменных
        for node in ast.statements:
            if isinstance(node, (AST.VariableDeclarationNode, AST.ArrayDeclarationNode)):
                self.visit_global_declaration(node)
        
        # Затем функции
        for node in ast.statements:
            if isinstance(node, AST.FunctionDeclarationNode):
                self.visit(node)
        
        # Добавляем секцию данных
        if self.data_section:
            self.emit("\n; == DATA SECTION ==\n")
            self.emit(self.data_section)
        
        return self.nasm_code

    def visit(self, node):
        """Диспетчер для обработки узлов AST"""
        method_name = f'visit_{type(node).__name__}'
        visitor = getattr(self, method_name, self.generic_visit)
        return visitor(node)
    
    def visit_with_context(self, node, context_info=""):
        """Обертка для visit с добавлением контекста ошибок"""
        try:
            return self.visit(node)
        except Exception as e:
            print(f"DEBUG: Error in {context_info}")
            print(f"DEBUG: Node type: {type(node).__name__}")
            print(f"DEBUG: Node details: {vars(node)}")
            print(f"DEBUG: Current function: {self.current_function}")
            
            # Если есть информация о токене, используем error_handler
            if hasattr(node, 'token') and node.token:
                self.error_handler.raise_syntax_error(
                    f"Compilation error: {str(e)}\nContext: {context_info}",
                    node.token
                )
            else:
                # Иначе просто перебрасываем исключение с дополнительной информацией
                raise Exception(f"Compilation error in {context_info}: {str(e)}")

    def generic_visit(self, node):
        """Обработчик по умолчанию"""
        raise Exception(f'No visitor for {type(node).__name__}')

    def visit_global_declaration(self, node):
        """Обрабатывает глобальные объявления переменных и массивов"""
        if isinstance(node, AST.VariableDeclarationNode):
            var_label = f"_var_{node.name}"
            size = self.get_type_size(node.var_type)
            self.global_variables[node.name] = (node.var_type, var_label, size)

            # ИСПРАВЛЕНО: Для структур используем правильный размер
            if node.var_type in self.struct_definitions:
                struct_size = self.struct_definitions[node.var_type]['size']
                self.emit_data(f"{var_label}: times {struct_size} db 0 ; struct {node.var_type}\n")
            else:
                # Для примитивных типов
                if size == 1:
                    self.emit_data(f"{var_label}: db 0\n")
                elif size == 2:
                    self.emit_data(f"{var_label}: dw 0\n")
                else:
                    self.emit_data(f"{var_label}: dd 0\n")

        elif isinstance(node, AST.ArrayDeclarationNode):
            if not isinstance(node.size_node, AST.NumberLiteralNode):
                raise TypeError("Array size must be constant")
            
            array_label = f"_arr_{node.name}"
            element_size = self.get_type_size(node.var_type)
            array_size = node.size_node.value
            
            self.global_variables[node.name] = ("array", array_label, element_size)
            self.array_sizes[node.name] = array_size
            
            # Если есть инициализатор
            if node.initial_value and isinstance(node.initial_value, AST.StringLiteralNode):
                # Инициализация строкой
                string_data = self._extract_string_data(node.initial_value)
                bytes_data = ", ".join(str(ord(char)) for char in string_data)
                # Дополняем нулями до размера массива
                remaining = array_size - len(string_data) - 1  # -1 для нулевого терминатора
                if remaining > 0:
                    self.emit_data(f"{array_label}: db {bytes_data}, 0, times {remaining} db 0\n")
                else:
                    self.emit_data(f"{array_label}: db {bytes_data}, 0\n")
            else:
                # Обычная инициализация нулями
                if element_size == 1:
                    self.emit_data(f"{array_label}: times {array_size} db 0\n")
                elif element_size == 2:
                    self.emit_data(f"{array_label}: times {array_size} dw 0\n")
                else:
                    self.emit_data(f"{array_label}: times {array_size} dd 0\n")

    def _extract_string_data(self, segments):
        """Извлекает строковые данные из сегментов"""
        if isinstance(segments, str):
            return segments
        
        result = ""
        for segment in segments:
            if isinstance(segment, tuple) and len(segment) == 2:
                is_string, data = segment
                if is_string:
                    result += data
                else:
                    result += chr(data)
            elif isinstance(segment, str):
                result += segment
        return result

    def visit_FunctionDeclarationNode(self, node):
        """Генерирует функцию с правильной обработкой локальных переменных"""
        self.current_function = node.name
        self.local_variables.clear()

        # Регистрируем параметры функции
        param_offset = 4 if self.target_bits == 16 else 8
        for param_type, param_name in node.params:
            param_size = 2 if self.target_bits == 16 else 4
            self.local_variables[param_name] = (param_type, param_offset, param_size)
            param_offset += param_size

        # ИСПРАВЛЕНО: Находим ВСЕ локальные объявления
        local_declarations = self.find_local_declarations(node.body)
        
        self._temp_array_declarations = local_declarations
        
        # Отладочная информация
        print(f"DEBUG: Found {len(local_declarations)} local declarations in function '{node.name}':")
        for decl in local_declarations:
            print(f"  - {type(decl).__name__}: {decl.name} ({decl.var_type if hasattr(decl, 'var_type') else 'unknown type'})")

        # Вычисляем общий размер локальных переменных
        local_size = 0
        
        # Регистрируем все локальные переменные
        for decl in local_declarations:
            if isinstance(decl, AST.VariableDeclarationNode):
                if decl.var_type in self.struct_definitions:
                    var_size = self.struct_definitions[decl.var_type]['size']
                else:
                    var_size = self.get_type_size(decl.var_type)
                
                local_size += var_size
                self.local_variables[decl.name] = (decl.var_type, -local_size, var_size)
                print(f"DEBUG: Registered variable '{decl.name}' at offset {-local_size}")
                
            elif isinstance(decl, AST.ArrayDeclarationNode):
                if not isinstance(decl.size_node, AST.NumberLiteralNode):
                    raise TypeError("Local array size must be constant")
                
                array_size = decl.size_node.value
                
                # ИСПРАВЛЕНО: Проверяем только в struct_definitions (без жесткого списка)
                if decl.var_type in self.struct_definitions:
                    # Это структура - получаем её реальный размер
                    element_size = self.struct_definitions[decl.var_type]['size']
                    total_size = element_size * array_size
                    
                    # КЛЮЧЕВОЕ: Регистрируем как {type}[] для правильного определения
                    self.local_variables[decl.name] = (f"{decl.var_type}[]", -local_size - total_size, element_size)
                    print(f"DEBUG: Registered struct array '{decl.name}' of type '{decl.var_type}[]' at offset {-local_size - total_size}")
                else:
                    # Примитивный тип
                    element_size = self.get_type_size(decl.var_type)
                    total_size = element_size * array_size
                    self.local_variables[decl.name] = ("array", -local_size - total_size, element_size)
                    print(f"DEBUG: Registered primitive array '{decl.name}' at offset {-local_size - total_size}")
                
                local_size += total_size
                self.array_sizes[decl.name] = array_size

        # Пролог функции
        self.emit(f"{node.name}:\n")
        self.emit(f" push {self.base_reg}\n")
        self.emit(f" mov {self.base_reg}, {self.stack_reg}\n")
        
        if local_size > 0:
            self.emit(f" sub {self.stack_reg}, {local_size}\n")

        # Инициализируем локальные массивы строками
        for decl in local_declarations:
            if isinstance(decl, AST.ArrayDeclarationNode) and decl.initial_value:
                if isinstance(decl.initial_value, AST.StringLiteralNode):
                    self._initialize_local_array_with_string(decl)

        # Обрабатываем тело функции
        for stmt in node.body:
            self.visit(stmt)

        # Эпилог
        self.emit(f".{node.name}_end:\n")
        self.emit(f" mov {self.stack_reg}, {self.base_reg}\n")
        self.emit(f" pop {self.base_reg}\n")
        self.emit(" ret\n\n")

        self.current_function = None

    def visit_local_array_initialization(self, array_node):
        """Обрабатывает инициализацию локального массива"""
        if isinstance(array_node.initial_value, AST.StringLiteralNode):
            # Создаем временную строку в секции данных
            temp_label = f"_temp_str_{self.string_counter}"
            self.string_counter += 1
            
            string_data = self._extract_string_data(array_node.initial_value)
            bytes_data = ", ".join(str(ord(char)) for char in string_data)
            self.emit_data(f"{temp_label}: db {bytes_data}, 0\n")
            
            # Генерируем код копирования
            var_info = self.local_variables[array_node.name]
            array_offset = var_info[1]
            array_size = self.array_sizes[array_node.name]
            
            copy_label = self.get_label("strcpy")
            
            self.emit(f"; --- Initialize array '{array_node.name}' from {temp_label} ---\n")
            self.emit(f"    mov si, {self.base_reg}\n")
            self.emit(f"    sub si, {-array_offset}\n")
            self.emit(f"    mov di, {temp_label}\n")
            self.emit(f"    mov cx, {min(len(string_data) + 1, array_size)}\n")
            self.emit(f"{copy_label}:\n")
            self.emit(f"    mov al, [di]\n")
            self.emit(f"    mov [si], al\n")
            self.emit(f"    inc si\n")
            self.emit(f"    inc di\n")
            self.emit(f"    dec cx\n")
            self.emit(f"    jnz {copy_label}\n")

    def visit_VariableReferenceNode(self, node):
        """Загружает значение переменной с использованием компактного NASM синтаксиса"""
        if node.name in self.local_variables:
            var_type, offset, size = self.local_variables[node.name]
            
            if var_type == "array":
                # Для массивов возвращаем адрес
                if offset > 0:
                    self.emit(f"    lea {self.main_reg}, [{self.base_reg}+{offset}]\n")
                else:
                    self.emit(f"    lea {self.main_reg}, [{self.base_reg}{offset}]\n")
            else:
                # Для переменных загружаем значение
                if size == 1:
                    self.emit(f"    xor {self.main_reg}, {self.main_reg}\n")
                    if offset > 0:
                        self.emit(f"    mov al, [{self.base_reg}+{offset}]\n")
                    else:
                        self.emit(f"    mov al, [{self.base_reg}{offset}]\n")
                elif size == 2:
                    if offset > 0:
                        self.emit(f"    mov {self.main_reg}, [{self.base_reg}+{offset}]\n")
                    else:
                        self.emit(f"    mov {self.main_reg}, [{self.base_reg}{offset}]\n")
                else:
                    if self.target_bits == 16:
                        if offset > 0:
                            self.emit(f"    mov {self.main_reg}, [{self.base_reg}+{offset}]\n")
                        else:
                            self.emit(f"    mov {self.main_reg}, [{self.base_reg}{offset}]\n")
                    else:
                        if offset > 0:
                            self.emit(f"    mov {self.main_reg}, dword [{self.base_reg}+{offset}]\n")
                        else:
                            self.emit(f"    mov {self.main_reg}, dword [{self.base_reg}{offset}]\n")
                    
        elif node.name in self.global_variables:
            var_type, label, size = self.global_variables[node.name]
            
            if var_type == "array":
                self.emit(f"    mov {self.main_reg}, {label}\n")
            else:
                if size == 1:
                    self.emit(f"    xor {self.main_reg}, {self.main_reg}\n")
                    self.emit(f"    mov al, [{label}]\n")
                else:
                    self.emit(f"    mov {self.main_reg}, [{label}]\n")
        else:
            raise NameError(f"Variable '{node.name}' not defined")
        
    def visit_CompoundStatementNode(self, node):
        """Генерирует код для составных операций"""
        for statement in node.statements:
            self.visit(statement)

    def visit_ArrayAccessNode(self, node):
        """Чтение элемента массива"""
        self.visit(node.index_node)
        self.emit(f" push {self.main_reg} ; Save index\n")
        
        # Получаем информацию о переменной
        if node.name in self.local_variables:
            var_type, offset, element_size = self.local_variables[node.name]
            if var_type == 'char*':
                element_size = 1
            
            # ИСПРАВЛЕНИЕ: Различаем указатели и массивы
            if var_type.endswith('*'):
                # Для указателей загружаем значение
                if offset > 0:
                    self.emit(f" mov {self.temp_reg}, [{self.base_reg}+{offset}]\n")
                else:
                    self.emit(f" mov {self.temp_reg}, [{self.base_reg}{offset}]\n")
            else:
                # Для массивов используем lea
                if offset > 0:
                    self.emit(f" lea {self.temp_reg}, [{self.base_reg}+{offset}]\n")
                else:
                    self.emit(f" lea {self.temp_reg}, [{self.base_reg}{offset}]\n")
                    
        elif node.name in self.global_variables:
            var_type, label, element_size = self.global_variables[node.name]
            
            # ИСПРАВЛЕНИЕ: Для указателей загружаем значение
            if var_type.endswith('*'):
                self.emit(f" mov {self.temp_reg}, [{label}]\n")
            else:
                self.emit(f" mov {self.temp_reg}, {label}\n")
        else:
            raise NameError(f"Array '{node.name}' not defined")
        
        # Вычисляем смещение
        self.emit(f" pop {self.main_reg} ; Restore index\n")
        
        # ИСПРАВЛЕНИЕ: Для char* не умножаем индекс
        if element_size > 1:
            if element_size == 2:
                self.emit(f" shl {self.main_reg}, 1\n")
            elif element_size == 4:
                self.emit(f" shl {self.main_reg}, 2\n")
            else:
                self.emit(f" imul {self.main_reg}, {element_size}\n")
        
        # Индекс для 16-битного режима
        if self.target_bits == 16:
            self.emit(f" mov si, {self.main_reg}\n")
            index_reg = "si"
        else:
            index_reg = self.main_reg
        
        # ИСПРАВЛЕНИЕ: Правильная загрузка для разных размеров
        if element_size == 1:
            self.emit(f" xor {self.main_reg}, {self.main_reg}\n")
            self.emit(f" mov al, [{self.temp_reg}+{index_reg}]\n")
        elif element_size == 2:
            if self.target_bits == 16:
                self.emit(f" mov {self.main_reg}, word [{self.temp_reg}+{index_reg}]\n")
            else:
                self.emit(f" xor {self.main_reg}, {self.main_reg}\n")
                self.emit(f" mov ax, word [{self.temp_reg}+{index_reg}]\n")
        else:
            size_prefix = 'word' if self.target_bits == 16 else 'dword'
            self.emit(f" mov {self.main_reg}, {size_prefix} [{self.temp_reg}+{index_reg}]\n")

    def visit_ArrayDeclarationNode(self, node):
        """Обрабатывает объявление массивов в NASM"""
        if not isinstance(node.size_node, AST.NumberLiteralNode):
            raise TypeError("Array size must be constant")

        array_size = node.size_node.value
        element_size = self.get_type_size(node.var_type)
        total_size = array_size * element_size

        self.array_sizes[node.name] = array_size

        if self.current_function is None:
            # Глобальный массив (код остается без изменений)
            array_label = f"_arr_{node.name}"
            self.global_variables[node.name] = ("array", array_label, element_size)
            
            if node.initial_value and isinstance(node.initial_value, AST.StringLiteralNode):
                string_data = self._extract_string_data(node.initial_value.segments)
                bytes_data = ", ".join(str(ord(char)) for char in string_data)
                remaining = array_size - len(string_data) - 1
                if remaining > 0:
                    self.emit_data(f"{array_label}: db {bytes_data}, 0, times {remaining} db 0\n")
                else:
                    self.emit_data(f"{array_label}: db {bytes_data}, 0\n")
            else:
                if element_size == 1:
                    self.emit_data(f"{array_label}: times {array_size} db 0\n")
                elif element_size == 2:
                    self.emit_data(f"{array_label}: times {array_size} dw 0\n")
                else:
                    self.emit_data(f"{array_label}: times {array_size} dd 0\n")
        else:
            # УДАЛЕНО: Дублирующий вызов _initialize_local_array_with_string
            # Локальный массив уже инициализируется в visit_FunctionDeclarationNode
            pass
                
    def _initialize_local_array_with_string(self, array_node):
        """Улучшенная инициализация локального массива строкой"""
        string_data = self._extract_string_data(array_node.initial_value.segments)
        var_info = self.local_variables[array_node.name]
        array_offset = var_info[1]
        array_size = self.array_sizes[array_node.name]

        # Создаем строку в секции данных
        init_label = f"_var_str_init_{self.string_counter}"
        self.string_counter += 1
        
        bytes_data = ", ".join(str(ord(char)) for char in string_data)
        self.emit_data(f"{init_label}: db {bytes_data}, 0\n")

        # Эффективное копирование с помощью строковых инструкций
        self.emit(f"; --- Initialize array '{array_node.name}' from {init_label} ---\n")
        
        # Адрес назначения в DI
        if array_offset > 0:
            self.emit(f" lea di, [{self.base_reg}+{array_offset}]\n")
        else:
            self.emit(f" lea di, [{self.base_reg}{array_offset}]\n")
        
        # Адрес источника в SI
        self.emit(f" mov si, {init_label}\n")
        
        # Количество байт для копирования
        copy_length = min(len(string_data) + 1, array_size)  # +1 для нулевого терминатора
        self.emit(f" mov cx, {copy_length}\n")
        
        # Копирование строки
        self.emit(" cld ; Clear direction flag\n")
        self.emit(" rep movsb ; Copy string\n")

    def visit_AddressOfNode(self, node):
        """Обрабатывает взятие адреса с использованием LEA"""
        if isinstance(node.node_to_address, AST.VariableReferenceNode):
            var_name = node.node_to_address.name
            
            #print(f"DEBUG: Looking for variable '{var_name}'")
            #print(f"DEBUG: Local variables: {list(self.local_variables.keys())}")
            #print(f"DEBUG: Global variables: {list(self.global_variables.keys())}")
            
            if var_name in self.local_variables:
                var_type, offset, size = self.local_variables[var_name]
                if offset > 0:
                    self.emit(f"    lea {self.main_reg}, [{self.base_reg}+{offset}]\n")
                else:
                    self.emit(f"    lea {self.main_reg}, [{self.base_reg}{offset}]\n")
                    
            elif var_name in self.global_variables:
                var_type, label, size = self.global_variables[var_name]
                self.emit(f"    mov {self.main_reg}, {label}\n")
            else:
                raise NameError(f"Variable '{var_name}' not defined")
                
        elif isinstance(node.node_to_address, AST.ArrayAccessNode):
            # Адрес элемента массива
            array_node = node.node_to_address
            
            # Вычисляем индекс
            self.visit(array_node.index_node)
            self.emit(f"    push {self.main_reg} ; Save index\n")
            
            # Получаем базовый адрес массива
            if array_node.name in self.local_variables:
                var_type, offset, element_size = self.local_variables[array_node.name]
                self.emit(f"    mov {self.temp_reg}, {self.base_reg}\n")
                if offset > 0:
                    self.emit(f"    add {self.temp_reg}, {offset}\n")
                else:
                    self.emit(f"    sub {self.temp_reg}, {-offset}\n")
            elif array_node.name in self.global_variables:
                var_type, label, element_size = self.global_variables[array_node.name]
                self.emit(f"    mov {self.temp_reg}, {label}\n")
            
            # Вычисляем адрес элемента
            self.emit(f"    pop {self.main_reg} ; Restore index\n")
            if element_size > 1:
                if element_size == 2:
                    self.emit(f"    shl {self.main_reg}, 1\n")
                elif element_size == 4:
                    self.emit(f"    shl {self.main_reg}, 2\n")
                else:
                    self.emit(f"    mov {'cx' if self.target_bits == 16 else 'ecx'}, {element_size}\n")
                    self.emit(f"    imul {self.main_reg}, {'cx' if self.target_bits == 16 else 'ecx'}\n")
            
            self.emit(f"    add {self.main_reg}, {self.temp_reg} ; Address of element\n")
        else:
            raise NotImplementedError("Address-of operator not implemented for this node type")

    def visit_DereferenceNode(self, node):
        """Обрабатывает разыменование указателя (@ptr)"""
        # Вычисляем адрес
        self.visit(node.pointer_node)
        
        # Загружаем значение по адресу (предполагаем указатель на слово)
        self.emit(f"    mov {self.temp_reg}, {self.main_reg}\n")
        if self.target_bits == 16:
            self.emit(f"    mov {self.main_reg}, [{self.temp_reg}]\n")
        else:
            self.emit(f"    mov {self.main_reg}, dword [{self.temp_reg}]\n")

    def visit_AssignmentNode(self, node):
        """Генерирует присваивание с правильной адресацией для 16-бит"""
        
        # Вычисляем правую часть
        self.visit(node.expression)
        
        if isinstance(node.variable, AST.VariableReferenceNode):
            # Обычные переменные (без изменений)
            var_name = node.variable.name
            
            if var_name in self.local_variables:
                var_type, offset, size = self.local_variables[var_name]
                
                if size == 1:
                    if offset > 0:
                        self.emit(f" mov [{self.base_reg}+{offset}], al\n")
                    else:
                        self.emit(f" mov [{self.base_reg}{offset}], al\n")
                elif size == 2:
                    if offset > 0:
                        self.emit(f" mov [{self.base_reg}+{offset}], {self.main_reg}\n")
                    else:
                        self.emit(f" mov [{self.base_reg}{offset}], {self.main_reg}\n")
                else:  # size > 2
                    size_prefix = 'word' if self.target_bits == 16 else 'dword'
                    if offset > 0:
                        self.emit(f" mov {size_prefix} [{self.base_reg}+{offset}], {self.main_reg}\n")
                    else:
                        self.emit(f" mov {size_prefix} [{self.base_reg}{offset}], {self.main_reg}\n")
                        
            elif var_name in self.global_variables:
                var_type, label, size = self.global_variables[var_name]
                
                if size == 1:
                    self.emit(f" mov [{label}], al\n")
                elif size == 2:
                    self.emit(f" mov [{label}], {self.main_reg}\n")
                else:
                    size_prefix = 'word' if self.target_bits == 16 else 'dword'
                    self.emit(f" mov {size_prefix} [{label}], {self.main_reg}\n")
            else:
                raise NameError(f"Variable '{var_name}' not defined")
                
        elif isinstance(node.variable, AST.ArrayAccessNode):
            self.emit(f" push {self.main_reg} ; Save value\n")
            
            array_name = node.variable.name
            self.visit(node.variable.index_node)
            
            # Получаем информацию о массиве
            if array_name in self.local_variables:
                var_type, offset, element_size = self.local_variables[array_name]
                if var_type == 'char*':
                    element_size = 1
                # ИСПРАВЛЕНИЕ: Различаем указатели и массивы
                if var_type.endswith('*'):
                    if offset > 0:
                        self.emit(f" mov {self.temp_reg}, [{self.base_reg}+{offset}]\n")
                    else:
                        self.emit(f" mov {self.temp_reg}, [{self.base_reg}{offset}]\n")
                else:
                    if offset > 0:
                        self.emit(f" lea {self.temp_reg}, [{self.base_reg}+{offset}]\n")
                    else:
                        self.emit(f" lea {self.temp_reg}, [{self.base_reg}{offset}]\n")
                        
            elif array_name in self.global_variables:
                var_type, label, element_size = self.global_variables[array_name]
                
                if var_type.endswith('*'):
                    self.emit(f" mov {self.temp_reg}, [{label}]\n")
                else:
                    self.emit(f" mov {self.temp_reg}, {label}\n")
            else:
                raise NameError(f"Array '{array_name}' not defined")
            
            # Вычисляем смещение
            # ИСПРАВЛЕНИЕ: Для char (element_size=1) не умножаем
            if element_size > 1:
                if element_size == 2:
                    self.emit(f" shl {self.main_reg}, 1\n")
                elif element_size == 4:
                    self.emit(f" shl {self.main_reg}, 2\n")
                else:
                    self.emit(f" imul {self.main_reg}, {element_size}\n")
            
            # КЛЮЧЕВОЕ ИСПРАВЛЕНИЕ: Используем SI для индексации в 16-бит
            if self.target_bits == 16:
                self.emit(f" mov si, {self.main_reg}\n")
                self.emit(f" pop {self.main_reg} ; Restore value\n")
                
                # ИСПРАВЛЕНИЕ: Правильные операции для char
                if element_size == 1:
                    self.emit(f" mov [{self.temp_reg}+si], al\n")
                elif element_size == 2:
                    self.emit(f" mov word [{self.temp_reg}+si], {self.main_reg}\n")
                else:
                    self.emit(f" mov word [{self.temp_reg}+si], {self.main_reg}\n")
            else:
                # 32-битный режим
                self.emit(f" add {self.temp_reg}, {self.main_reg}\n")
                self.emit(f" pop {self.main_reg} ; Restore value\n")
                
                if element_size == 1:
                    self.emit(f" mov [{self.temp_reg}], al\n")
                elif element_size == 2:
                    self.emit(f" mov word [{self.temp_reg}], ax\n")
                else:
                    self.emit(f" mov dword [{self.temp_reg}], {self.main_reg}\n")
        
        elif isinstance(node.variable, AST.PropertyAccessNode):
            self._assign_to_struct_field(node.variable, self.main_reg)
            
        elif isinstance(node.variable, AST.StructArrayAccessNode):
            self.emit(f" push {self.main_reg} ; Save value\n")
            self._assign_to_struct_array_element(node.variable)
        
        elif isinstance(node.variable, AST.ArrayElementPropertyAccessNode):
            self.emit(f" push {self.main_reg} ; Save value\n")
            self._assign_to_array_element_property(node.variable)
        else:
            raise NotImplementedError(f"Assignment to {type(node.variable).__name__} not implemented")
        
    def _assign_to_array_element_property(self, node):
        """Присваивание к полю элемента массива: array[index].field = value"""
        
        # Вычисляем индекс
        self.visit(node.index_node)
        self.emit(f" push {self.main_reg} ; Save index\n")
        
        # Получаем информацию о массиве
        array_info = self.get_var_info(node.array_name)
        if not array_info:
            raise NameError(f"Array '{node.array_name}' not defined")
        
        array_type, array_location, element_size = array_info
        
        # ИСПРАВЛЕНО: Используем ТУ ЖЕ логику, что и в visit_ArrayElementPropertyAccessNode
        struct_type = None
        is_struct_array = False
        
        # Метод 1: Проверяем зарегистрированный тип массива
        if array_type.endswith('[]'):
            potential_struct_type = array_type[:-2]
            if potential_struct_type in self.struct_definitions:
                struct_type = potential_struct_type
                is_struct_array = True
        
        # Метод 2: Обработка указателей на структуры
        if not is_struct_array and array_type.endswith('*'):
            potential_struct_type = array_type[:-1]
            if potential_struct_type in self.struct_definitions:
                struct_type = potential_struct_type
                is_struct_array = True
        
        # Метод 3: Ищем через локальные объявления текущей функции
        if not is_struct_array and hasattr(self, '_temp_array_declarations'):
            for decl in self._temp_array_declarations:
                if decl.name == node.array_name:
                    candidate_type = decl.var_type
                    if candidate_type in self.struct_definitions:
                        struct_type = candidate_type
                        is_struct_array = True
                        break
        
        # Метод 4: КЛЮЧЕВОЕ ИСПРАВЛЕНИЕ - Обработка глобальных массивов структур
        if not is_struct_array and array_type == 'array':
            # Ищем структуры с подходящим размером
            exact_matches = []
            for struct_name, struct_def in self.struct_definitions.items():
                if struct_def['size'] == element_size:
                    exact_matches.append(struct_name)
            
            if len(exact_matches) == 1:
                struct_type = exact_matches[0]
                is_struct_array = True
            elif len(exact_matches) > 1:
                # Эвристика по имени массива
                array_name_upper = node.array_name.upper()
                best_match = None
                
                for candidate in exact_matches:
                    candidate_upper = candidate.upper()
                    if (candidate_upper in array_name_upper or 
                        array_name_upper.startswith(candidate_upper) or
                        candidate_upper.startswith(array_name_upper.split('_')[0]) or
                        array_name_upper.endswith(candidate_upper)):
                        best_match = candidate
                        break
                
                if best_match:
                    struct_type = best_match
                    is_struct_array = True
                else:
                    struct_type = exact_matches[0]
                    is_struct_array = True
            else:
                # Ищем приблизительные соответствия (±2 байта)
                approximate_matches = []
                for struct_name, struct_def in self.struct_definitions.items():
                    struct_size = struct_def['size']
                    if abs(struct_size - element_size) <= 2:
                        approximate_matches.append((struct_name, struct_size))
                
                if approximate_matches:
                    best_match = min(approximate_matches, key=lambda x: abs(x[1] - element_size))
                    struct_type = best_match[0]
                    is_struct_array = True
        
        if not is_struct_array or not struct_type or struct_type not in self.struct_definitions:
            raise TypeError(f"Cannot determine struct type for array '{node.array_name}'. Available: {list(self.struct_definitions.keys())}")
        
        struct_def = self.struct_definitions[struct_type]
        if node.field_name not in struct_def['fields']:
            raise NameError(f"Struct '{struct_type}' has no field '{node.field_name}'")
        
        field_info = struct_def['fields'][node.field_name]
        field_offset = field_info['offset']
        field_size = field_info['size']
        
        # Получаем базовый адрес массива
        if isinstance(array_location, int):  # Локальный массив
            if array_location > 0:
                self.emit(f" lea {self.temp_reg}, [{self.base_reg}+{array_location}]\n")
            else:
                self.emit(f" lea {self.temp_reg}, [{self.base_reg}{array_location}]\n")
        else:  # Глобальный массив
            self.emit(f" mov {self.temp_reg}, {array_location}\n")
        
        # Вычисляем адрес элемента
        self.emit(f" pop {self.main_reg} ; Restore index\n")
        
        struct_size = struct_def['size']
        if struct_size > 1:
            if struct_size == 2:
                self.emit(f" shl {self.main_reg}, 1\n")
            elif struct_size == 4:
                self.emit(f" shl {self.main_reg}, 2\n")
            elif struct_size == 8:
                self.emit(f" shl {self.main_reg}, 3\n")
            else:
                self.emit(f" mov {'cx' if self.target_bits == 16 else 'ecx'}, {struct_size}\n")
                self.emit(f" imul {self.main_reg}, {'cx' if self.target_bits == 16 else 'ecx'}\n")
        
        # ИСПРАВЛЕНО: Правильная адресация для 16-бит
        if self.target_bits == 16:
            self.emit(f" mov si, {self.main_reg}\n")
            self.emit(f" add {self.temp_reg}, si\n")
        else:
            self.emit(f" add {self.temp_reg}, {self.main_reg}\n")
        
        # Добавляем смещение поля
        if field_offset > 0:
            self.emit(f" add {self.temp_reg}, {field_offset}\n")
        
        # Восстанавливаем значение и сохраняем
        self.emit(f" pop {self.main_reg} ; Restore value\n")
        
        if field_size == 1:
            self.emit(f" mov [{self.temp_reg}], al\n")
        elif field_size == 2:
            self.emit(f" mov word [{self.temp_reg}], {self.main_reg}\n")
        else:
            size_prefix = 'word' if self.target_bits == 16 else 'dword'
            self.emit(f" mov {size_prefix} [{self.temp_reg}], {self.main_reg}\n")
            
    def _assign_to_struct_array_element(self, struct_array_node):
        """Присваивает значение элементу массива поля структуры"""
        # Вычисляем индекс
        self.visit(struct_array_node.index_node)
        self.emit(f" push {self.main_reg} ; Save index\n")

        # Получаем информацию о структуре
        struct_info = self.get_var_info(struct_array_node.struct_name)
        if not struct_info:
            raise NameError(f"Struct variable '{struct_array_node.struct_name}' not defined")

        struct_type, struct_location, _ = struct_info

        # ИСПРАВЛЕНИЕ: Обработка указателей на структуры
        is_pointer_to_struct = False
        actual_struct_type = struct_type
        
        if struct_type.endswith('*'):
            # Это указатель на структуру: "Assembly*"
            actual_struct_type = struct_type[:-1]  # Убираем '*' -> получаем "Assembly"
            is_pointer_to_struct = True

        if actual_struct_type not in self.struct_definitions:
            available_structs = list(self.struct_definitions.keys())
            raise TypeError(f"Variable '{struct_array_node.struct_name}' has type '{struct_type}' which is not a struct. Available: {available_structs}")

        struct_def = self.struct_definitions[actual_struct_type]

        if struct_array_node.field_name not in struct_def['fields']:
            raise NameError(f"Struct '{actual_struct_type}' has no field '{struct_array_node.field_name}'")

        field_info = struct_def['fields'][struct_array_node.field_name]
        field_offset = field_info['offset']

        # Проверяем, что поле действительно является массивом
        if 'array_size' not in field_info:
            raise TypeError(f"Field '{struct_array_node.field_name}' is not an array")

        if is_pointer_to_struct:
            # НОВОЕ: Присваивание через указатель на структуру
            # 1. Загружаем адрес структуры из указателя
            if isinstance(struct_location, int): # Локальная переменная-указатель
                if struct_location > 0:
                    self.emit(f" mov {self.temp_reg}, [{self.base_reg}+{struct_location}]\n")
                else:
                    self.emit(f" mov {self.temp_reg}, [{self.base_reg}{struct_location}]\n")
            else: # Глобальная переменная-указатель
                self.emit(f" mov {self.temp_reg}, [{struct_location}]\n")

            # 2. Добавляем смещение поля к адресу структуры
            if field_offset > 0:
                self.emit(f" add {self.temp_reg}, {field_offset}\n")
        else:
            # Прямой доступ к структуре (существующая логика)
            if isinstance(struct_location, int): # Локальная структура
                total_offset = struct_location + field_offset
                if total_offset > 0:
                    self.emit(f" lea {self.temp_reg}, [{self.base_reg}+{total_offset}]\n")
                else:
                    self.emit(f" lea {self.temp_reg}, [{self.base_reg}{total_offset}]\n")
            else: # Глобальная структура
                if field_offset > 0:
                    self.emit(f" lea {self.temp_reg}, [{struct_location}+{field_offset}]\n")
                else:
                    self.emit(f" mov {self.temp_reg}, {struct_location}\n")

        # Добавляем индекс к базовому адресу
        self.emit(f" pop {self.main_reg} ; Restore index\n")

        # Для массивов символов индекс = смещение в байтах
        element_type = field_info.get('element_type', 'char')
        element_size = self.get_type_size(element_type)
        
        if element_size > 1:
            if element_size == 2:
                self.emit(f" shl {self.main_reg}, 1 ; Multiply index by 2\n")
            elif element_size == 4:
                self.emit(f" shl {self.main_reg}, 2 ; Multiply index by 4\n")
            else:
                self.emit(f" imul {self.main_reg}, {element_size}\n")

        self.emit(f" add {self.temp_reg}, {self.main_reg} ; Calculate element address\n")

        # Восстанавливаем значение и сохраняем
        self.emit(f" pop {self.main_reg} ; Restore value\n")

        # Сохраняем значение в элемент массива
        if element_size == 1:
            self.emit(f" mov [{self.temp_reg}], al\n")
        elif element_size == 2:
            self.emit(f" mov word [{self.temp_reg}], {'ax' if self.target_bits == 16 else 'ax'}\n")
        else:
            size_prefix = 'word' if self.target_bits == 16 else 'dword'
            self.emit(f" mov {size_prefix} [{self.temp_reg}], {self.main_reg}\n")
                
    def _assign_to_struct_field(self, property_node, value_reg):
        """Присваивание значения полю структуры (включая через указатели и массивы)"""
        var_name = property_node.variable_name
        field_name = property_node.property_name
        
        var_info = self.get_var_info(var_name)
        if not var_info:
            raise NameError(f"Variable '{var_name}' not defined")
        
        var_type, location, _ = var_info
        
        # НОВОЕ: Проверяем, является ли это указателем на структуру
        is_pointer_to_struct = False
        struct_type_name = var_type
        
        if var_type.endswith('*'):
            struct_type_name = var_type[:-1]
            is_pointer_to_struct = True
        
        if struct_type_name not in self.struct_definitions:
            raise TypeError(f"Variable '{var_name}' is not a struct or pointer to struct")
        
        struct_def = self.struct_definitions[struct_type_name]
        if field_name not in struct_def['fields']:
            raise NameError(f"Struct '{struct_type_name}' has no field '{field_name}'")
        
        field_info = struct_def['fields'][field_name]
        field_offset = field_info['offset']
        field_size = field_info['size']
        
        if is_pointer_to_struct:
            # НОВОЕ: Присваивание через указатель
            # 1. Загружаем адрес структуры из указателя
            if isinstance(location, int):  # Локальная переменная-указатель
                if location > 0:
                    self.emit(f" mov {self.temp_reg}, [{self.base_reg}+{location}]\n")
                else:
                    self.emit(f" mov {self.temp_reg}, [{self.base_reg}{location}]\n")
            else:  # Глобальная переменная-указатель
                self.emit(f" mov {self.temp_reg}, [{location}]\n")
            
            # 2. Добавляем смещение поля
            if field_offset > 0:
                self.emit(f" add {self.temp_reg}, {field_offset}\n")
            
            # 3. Проверяем, является ли поле массивом
            if 'array_size' in field_info:
                # Для массивов копируем строку
                self.emit(f" mov di, {self.temp_reg}\n")
                self.emit(f" mov si, {value_reg}\n")
                array_size = field_info['array_size']
                self.emit(f" mov cx, {array_size}\n")
                self.emit(" cld\n")
                self.emit(" rep movsb\n")
            else:
                # Для обычных полей сохраняем значение
                if field_size == 1:
                    self.emit(f" mov [{self.temp_reg}], al\n")
                elif field_size == 2:
                    self.emit(f" mov word [{self.temp_reg}], {value_reg}\n")
                else:
                    size_prefix = 'word' if self.target_bits == 16 else 'dword'
                    self.emit(f" mov {size_prefix} [{self.temp_reg}], {value_reg}\n")
        else:
            # Прямой доступ к структурам (существующая логика)
            # ИСПРАВЛЕНО: Для массивов используем простое копирование как для обычных массивов
            if 'array_size' in field_info:
                # Вычисляем адрес поля массива
                if isinstance(location, int):  # Локальная структура
                    total_offset = location + field_offset
                    if total_offset > 0:
                        self.emit(f" lea di, [{self.base_reg}+{total_offset}]\n")
                    else:
                        self.emit(f" lea di, [{self.base_reg}{total_offset}]\n")
                else:  # Глобальная структура
                    if field_offset > 0:
                        self.emit(f" lea di, [{location}+{field_offset}]\n")
                    else:
                        self.emit(f" mov di, {location}\n")
                
                # Адрес источника уже в main_reg (строка)
                self.emit(f" mov si, {self.main_reg}\n")
                
                # Простое копирование как для обычных массивов
                array_size = field_info['array_size']
                self.emit(f" mov cx, {array_size}\n")
                self.emit(" cld\n")
                self.emit(" rep movsb\n")
                return
            
            # Обычное поле - сохраняем значение
            if isinstance(location, int):
                total_offset = location + field_offset
                if total_offset > 0:
                    addr = f"[{self.base_reg}+{total_offset}]"
                else:
                    addr = f"[{self.base_reg}{total_offset}]"
            else:
                if field_offset > 0:
                    addr = f"[{location}+{field_offset}]"
                else:
                    addr = f"[{location}]"
            
            if field_size == 1:
                self.emit(f" mov {addr}, al\n")
            elif field_size == 2:
                self.emit(f" mov word {addr}, {value_reg}\n")
            else:
                size_prefix = 'word' if self.target_bits == 16 else 'dword'
                self.emit(f" mov {size_prefix} {addr}, {value_reg}\n")
            
    def _initialize_struct_array_field_with_string(self, struct_name, field_name, struct_location, field_offset, field_info):
        """Инициализирует массив-поле структуры строкой"""
        # Получаем строку из последнего вычисленного значения (должно быть в строковом литерале)
        # Для простоты создаем временную строку
        temp_label = f"_temp_struct_str_{self.string_counter}"
        self.string_counter += 1
        
        # Адрес поля массива
        if isinstance(struct_location, int):  # Локальная структура
            total_offset = struct_location + field_offset
            if total_offset > 0:
                self.emit(f" lea di, [{self.base_reg}+{total_offset}]\n")
            else:
                self.emit(f" lea di, [{self.base_reg}{total_offset}]\n")
        else:  # Глобальная структура
            if field_offset > 0:
                self.emit(f" lea di, [{struct_location}+{field_offset}]\n")
            else:
                self.emit(f" mov di, {struct_location}\n")
        
        # Источник - строка уже в ax, это адрес строки
        self.emit(f" mov si, {self.main_reg} ; String address from previous computation\n")
        
        # Копируем строку
        array_size = field_info.get('array_size', field_info['size'])
        self.emit(f" mov cx, {array_size}\n")
        self.emit(" cld\n")
        
        copy_loop = self.get_label("struct_strcpy")
        copy_end = self.get_label("struct_strcpy_end")
        
        self.emit(f"{copy_loop}:\n")
        self.emit(" lodsb ; Load from [si] to al, increment si\n")
        self.emit(" stosb ; Store al to [di], increment di\n")
        self.emit(" test al, al ; Check for null terminator\n")
        self.emit(f" je {copy_end}\n")
        self.emit(" loop " + copy_loop + "\n")
        self.emit(f"{copy_end}:\n")
    
    def visit_NumberLiteralNode(self, node):
        """Загружает числовой литерал"""
        self.emit(f"    mov {self.main_reg}, {node.value}\n")

    def visit_StringLiteralNode(self, node):
        """Создаёт строковый литерал и возвращает его адрес"""
        label = f"_str_{self.string_counter}"
        self.string_counter += 1

        # ИСПРАВЛЕНО: Передаем node.segments вместо node
        string_data = self._extract_string_data(node.segments)
        bytes_data = ", ".join(str(ord(char)) for char in string_data)

        # Генерируем данные
        self.emit_data(f"{label}: db {bytes_data}, 0\n")

        # Загружаем адрес строки
        self.emit(f" mov {self.main_reg}, {label}\n")

    def visit_BinaryOperationNode(self, node):
        """Расширенная поддержка всех операций для NASM"""
        
        # ИСПРАВЛЕНО: Проверяем логические операторы ПЕРВЫМИ
        if node.operator in ('&&', '||'):
            self.visit_LogicalOperationNode(node)
            return
        
        # Вычисляем операнды (только для НЕ логических операторов)
        self.visit(node.right)
        self.emit(f" push {self.main_reg}\n")
        self.visit(node.left)
        self.emit(f" pop {self.temp_reg}\n")
        
        # Остальные операторы
        op = node.operator
        
        if op == '+':
            self.emit(f" add {self.main_reg}, {self.temp_reg}\n")
        elif op == '-':
            self.emit(f" sub {self.main_reg}, {self.temp_reg}\n")
        elif op == '*':
            if self.target_bits == 16:
                self.emit(f" imul {self.main_reg}, {self.temp_reg}\n")
            else:
                self.emit(f" imul {self.main_reg}, {self.temp_reg}\n")
        elif op == '/' or op == '//':
            # Деление для NASM
            if self.target_bits == 16:
                self.emit(f" xor dx, dx ; Clear upper bits\n")
                self.emit(f" idiv {self.temp_reg}\n")
            else:
                self.emit(f" cdq ; Sign extend EAX to EDX:EAX\n")
                self.emit(f" idiv {self.temp_reg}\n")
        elif op == '%':
            # Остаток от деления
            if self.target_bits == 16:
                self.emit(f" xor dx, dx\n")
                self.emit(f" idiv {self.temp_reg}\n")
                self.emit(f" mov {self.main_reg}, dx ; Remainder\n")
            else:
                self.emit(f" cdq\n")
                self.emit(f" idiv {self.temp_reg}\n")
                self.emit(f" mov {self.main_reg}, edx ; Remainder\n")
        elif op == '<<':
            if self.target_bits == 16:
                self.emit(f" mov cl, bl ; Use low byte of bx\n")
            else:
                self.emit(f" mov cl, ebx\n")
            self.emit(f" shl {self.main_reg}, cl\n")

        elif op == '>>':
            if self.target_bits == 16:
                self.emit(f" mov cl, bl ; Use low byte of bx\n")
            else:
                self.emit(f" mov cl, ebx\n")
            self.emit(f" sar {self.main_reg}, cl\n")
        elif op == '&':
            self.emit(f" and {self.main_reg}, {self.temp_reg}\n")
        elif op == '|':
            self.emit(f" or {self.main_reg}, {self.temp_reg}\n")
        elif op == '^':
            self.emit(f" xor {self.main_reg}, {self.temp_reg}\n")
        else:
            raise NotImplementedError(f"Operator {op} not implemented")

    def visit_FunctionCallNode(self, node):
        """Генерирует вызов функции"""
        # Помещаем аргументы на стек (в обратном порядке)
        for arg in reversed(node.args):
            self.visit(arg)
            self.emit(f"    push {self.main_reg}\n")
        
        # Вызов функции
        self.emit(f"    call {node.name}\n")
        
        # Очистка стека
        if node.args:
            stack_size = len(node.args) * (2 if self.target_bits == 16 else 4)
            self.emit(f"    add {self.stack_reg}, {stack_size}\n")

    def visit_ReturnNode(self, node):
        """Генерирует return"""
        if node.value_node:
            self.visit(node.value_node)
        self.emit(f"    jmp .{self.current_function}_end\n")

    def visit_WhileNode(self, node):
        """Генерирует цикл while"""
        start_label = self.get_label(".L_while_start")
        end_label = self.get_label(".L_while_end")
        
        self.emit(f"{start_label}:\n")
        self.visit(node.condition)
        self.emit(f"    cmp {self.main_reg}, 0\n")
        self.emit(f"    je {end_label}\n")
        
        for stmt in node.body:
            self.visit(stmt)
        
        self.emit(f"    jmp {start_label}\n")
        self.emit(f"{end_label}:\n")

    def get_type_size(self, type_name):
        """Возвращает размер типа для нужной архитектуры"""
        # ИСПРАВЛЕНО: Сначала проверяем, не является ли это структурой
        if type_name in self.struct_definitions:
            return self.struct_definitions[type_name]['size']
        
        # Проверяем, не является ли это массивом структуры (например "Inst[10]")
        if '[' in type_name:
            base_type = type_name.split('[')[0]
            if base_type in self.struct_definitions:
                return self.struct_definitions[base_type]['size']
        
        if self.target_bits == 16:
            sizes = {
                'char': 1, 'num16': 2, 'num32': 4, 'float': 4,
                'char*': 2, 'num16*': 2, 'num32*': 2, 'float*': 2
            }
        else:
            sizes = {
                'char': 1, 'num16': 2, 'num32': 4, 'float': 4,
                'char*': 4, 'num16*': 4, 'num32*': 4, 'float*': 4
            }
        
        return sizes.get(type_name, 2 if self.target_bits == 16 else 4)

    def find_local_declarations(self, statements):
        """Рекурсивно находит все локальные объявления переменных и массивов"""
        declarations = []
        
        for stmt in statements:
            # ОСНОВНЫЕ типы объявлений
            if isinstance(stmt, (AST.VariableDeclarationNode, AST.ArrayDeclarationNode)):
                declarations.append(stmt)
            
            # Рекурсивный поиск во вложенных структурах
            if hasattr(stmt, 'body') and isinstance(stmt.body, list):
                declarations.extend(self.find_local_declarations(stmt.body))
            if hasattr(stmt, 'if_body') and isinstance(stmt.if_body, list):
                declarations.extend(self.find_local_declarations(stmt.if_body))
            if hasattr(stmt, 'else_body') and isinstance(stmt.else_body, list):
                declarations.extend(self.find_local_declarations(stmt.else_body))
            if hasattr(stmt, 'cases'): # Для match statements
                for case in stmt.cases:
                    if hasattr(case, 'body'):
                        declarations.extend(self.find_local_declarations(case.body))
        
        # НОВОЕ: Сохраняем объявления для последующего использования
        self._temp_array_declarations = declarations
        
        return declarations

    def visit_NasmNode(self, node):
        """Обрабатывает многострочный nasm код"""
        self.emit("; === NASM inline assembly start ===\n")
        
        for part in node.assembly_parts:
            if isinstance(part, list):
                # Обрабатываем сегменты строки
                assembly_line = self._extract_string_data(part)
            else:
                assembly_line = part
            
            self.emit(f"    {assembly_line}\n")
        
        self.emit("; === NASM inline assembly end ===\n")
        
    def visit_NasmfNode(self, node):
        """Обрабатывает nasmf inline assembly (версии 1 и 2)"""
        # Определяем версию по наличию constraints
        if hasattr(node, 'output_constraints') and node.output_constraints:
            return self._visit_nasmf_v2(node)
        else:
            return self._visit_nasmf_v1(node)

    def _visit_nasmf_v1(self, node):
        """Упрощённая версия для 16-битного режима"""
        template = ""
        for part in node.assembly_parts:
            if isinstance(part, list):
                template += self._extract_string_data(part)
            else:
                template += part
            template += "\n"

        if node.args:
            # Сохраняем аргументы на стеке
            for i, arg in enumerate(node.args):
                self.visit(arg)
                self.emit(f" push {self.main_reg} ; Save nasmf arg {i} on stack\n")

            # Загружаем аргументы в регистры с помощью POP (в обратном порядке)
            available_regs = ['ax', 'bx', 'cx', 'dx']
            substitutions = {}
            
            # Извлекаем аргументы в обратном порядке (последний сохранённый первым)
            for i in range(min(len(node.args), len(available_regs))):
                reg = available_regs[len(node.args) - 1 - i]
                self.emit(f" pop {reg} ; Load nasmf arg {len(node.args) - 1 - i}\n")
                substitutions[len(node.args) - 1 - i] = reg

            # Подставляем аргументы
            for i, replacement in substitutions.items():
                template = template.replace(f"{{{i}}}", replacement)

            self.emit("; === NASMF v1 inline assembly start ===\n")
            self.emit(template)
            self.emit("; === NASMF v1 inline assembly end ===\n")
        else:
            self.emit("; === NASMF v1 inline assembly start ===\n")
            self.emit(template)
            self.emit("; === NASMF v1 inline assembly end ===\n")

    def _visit_nasmf_v2(self, node):
        """Обрабатывает новую версию nasmf с constraints в стиле GCC"""
        template = ""
        for part in node.assembly_parts:
            if isinstance(part, list):
                template += self._extract_string_data(part)
            else:
                template += part
            template += "\n"
        
        self.emit("; === NASMF v2 inline assembly start ===\n")
        
        # 1. Сохраняем clobbered регистры
        saved_regs = []
        for reg_item in node.clobber_list:
            # Проверяем, является ли reg_item списком или строкой
            if isinstance(reg_item, list):
                reg = self._extract_string_data(reg_item)
            else:
                reg = reg_item
                
            if reg != "memory":
                nasm_reg = self._convert_register_name(reg)
                if nasm_reg:
                    self.emit(f"    push {nasm_reg} ; Save clobbered register\n")
                    saved_regs.append(nasm_reg)
        
        # 2. Обрабатываем input constraints
        input_reg_map = {}
        for i, (constraint_str, variable_expr) in enumerate(node.input_constraints):
            # Обрабатываем constraint_str если это список
            if isinstance(constraint_str, list):
                constraint_str = self._extract_string_data(constraint_str)
                
            if constraint_str.lstrip('=').startswith('r'):  # register constraint
                self.visit(variable_expr)
                reg = self._allocate_register()  # Теперь без аргументов
                if reg != self.main_reg:
                    self.emit(f"    mov {reg}, {self.main_reg} ; Load input {i}\n")
                input_reg_map[i] = reg
        
        # 3. Подставляем input constraints в шаблон
        for i, reg in input_reg_map.items():
            template = template.replace(f"{{{i}}}", reg)
        
        # 4. Вставляем основной asm код
        self.emit(template)
        
        # 5. Обрабатываем output constraints
        for i, (constraint_str, variable_expr) in enumerate(node.output_constraints):
            if isinstance(constraint_str, list):
                constraint_str = self._extract_string_data(constraint_str)
                
            if constraint_str.startswith('=r'):
                reg = self._allocate_register()  # Без аргументов
                if isinstance(variable_expr, AST.VariableReferenceNode):
                    self._store_to_variable(reg, variable_expr.name)
        
        # 6. Восстанавливаем сохраненные регистры
        for reg in reversed(saved_regs):
            self.emit(f"    pop {reg} ; Restore clobbered register\n")
        
        self.emit("; === NASMF v2 inline assembly end ===\n")

    def _convert_register_name(self, reg_name):
        """Конвертирует имя регистра в NASM формат"""
        reg_map = {
            'eax': 'ax' if self.target_bits == 16 else 'eax',
            'ebx': 'bx' if self.target_bits == 16 else 'ebx',
            'ecx': 'cx' if self.target_bits == 16 else 'ecx',
            'edx': 'dx' if self.target_bits == 16 else 'edx',
            'esi': 'si' if self.target_bits == 16 else 'esi',
            'egi': 'di' if self.target_bits == 16 else 'edi',
            'esp': 'sp' if self.target_bits == 16 else 'esp',
            'ebp': 'bp' if self.target_bits == 16 else 'ebp'
        }
        return reg_map.get(reg_name, reg_name)


    def _parse_constraint(self, constraint_str):
        """Парсит строку constraint и возвращает информацию о типе"""
        constraint_info = {
            'is_output': constraint_str.startswith('='),
            'type': 'register',
            'modifier': None
        }
        
        clean_constraint = constraint_str.lstrip('=')
        
        if 'r' in clean_constraint:
            constraint_info['type'] = 'register'
        elif 'm' in clean_constraint:
            constraint_info['type'] = 'memory'
        elif 'i' in clean_constraint:
            constraint_info['type'] = 'immediate'
        
        return constraint_info

    def _allocate_register(self):
        """Выделяет регистр для constraints (упрощенная версия)"""
        # Простая стратегия - всегда используем основной регистр
        return self.main_reg

    def _store_to_variable(self, reg, var_name):
        """Сохраняет значение из регистра в переменную"""
        if var_name in self.local_variables:
            var_type, offset, size = self.local_variables[var_name]
            if offset > 0:
                if size == 1:
                    self.emit(f"    mov [{self.base_reg}+{offset}], al\n")
                else:
                    self.emit(f"    mov [{self.base_reg}+{offset}], {reg}\n")
            else:
                if size == 1:
                    self.emit(f"    mov [{self.base_reg}{offset}], al\n")
                else:
                    self.emit(f"    mov [{self.base_reg}{offset}], {reg}\n")
        elif var_name in self.global_variables:
            var_type, label, size = self.global_variables[var_name]
            if size == 1:
                self.emit(f"    mov [{label}], al\n")
            else:
                self.emit(f"    mov [{label}], {reg}\n")

    def _get_word_reg(self, reg):
        """Возвращает 16-битную версию регистра"""
        word_map = {'eax': 'ax', 'ebx': 'bx', 'ecx': 'cx', 'edx': 'dx'}
        return word_map.get(reg, reg)
    
    def _reassemble_string_from_segments(self, segments):
        """Собирает простую строку из сегментов, превращая байты в символы."""
        # Если нам пришла обычная строка, просто возвращаем ее
        if isinstance(segments, str):
            return segments

        # Если это список строк, объединяем их
        if isinstance(segments, list) and all(isinstance(seg, str) for seg in segments):
            return "".join(segments)

        # Если это список кортежей (is_string, data), обрабатываем как раньше
        if isinstance(segments, list):
            result_string = ""
            for item in segments:
                if isinstance(item, tuple) and len(item) == 2:
                    is_string, data = item
                    if is_string:
                        result_string += data
                    else:
                        try:
                            result_string += chr(data)
                        except ValueError:
                            result_string += '?'
                else:
                    # Если это не кортеж, просто добавляем как строку
                    result_string += str(item)
            return result_string

        # В остальных случаях просто возвращаем строковое представление
        return str(segments)
    
    def get_var_info(self, var_name):
        """Получает информацию о переменной (локальной или глобальной)"""
        if var_name in self.local_variables:
            return self.local_variables[var_name]
        elif var_name in self.global_variables:
            return self.global_variables[var_name]
        else:
            return None
    
    def visit_VariableDeclarationNode(self, node):
        """Обрабатывает объявление переменных в NASM (включая структуры)"""
        element_size = self.get_type_size(node.var_type)

        if self.current_function is None:
            # Глобальная переменная
            var_label = f"_var_{node.name}"
            self.global_variables[node.name] = (node.var_type, var_label, element_size)

            # ИСПРАВЛЕНО: Для структур используем правильный размер
            if node.var_type in self.struct_definitions:
                struct_size = self.struct_definitions[node.var_type]['size']
                self.emit_data(f"{var_label}: times {struct_size} db 0 ; struct {node.var_type}\n")
            else:
                # Для примитивных типов
                if element_size == 1:
                    self.emit_data(f"{var_label}: db 0\n")
                elif element_size == 2:
                    self.emit_data(f"{var_label}: dw 0\n")
                else:
                    self.emit_data(f"{var_label}: dd 0\n")
        else:
            # Локальная переменная уже зарегистрирована в visit_FunctionDeclarationNode
            pass

        # Обработка начального значения остается без изменений
        if node.initial_value:
            self.visit(node.initial_value)
            var_name = node.name
            if var_name in self.local_variables:
                var_type, offset, size = self.local_variables[var_name]
                if offset > 0:
                    if size == 1:
                        self.emit(f" mov [{self.base_reg}+{offset}], al\n")
                    else:
                        self.emit(f" mov [{self.base_reg}+{offset}], {self.main_reg}\n")
                else:
                    if size == 1:
                        self.emit(f" mov [{self.base_reg}{offset}], al\n")
                    else:
                        self.emit(f" mov [{self.base_reg}{offset}], {self.main_reg}\n")
            elif var_name in self.global_variables:
                var_type, label, size = self.global_variables[var_name]
                if size == 1:
                    self.emit(f" mov [{label}], al\n")
                else:
                    self.emit(f" mov [{label}], {self.main_reg}\n")
                    
    def visit_IfNode(self, node):
        """Генерирует код для конструкции if-else"""
        else_label = self.get_label(".L_else")
        endif_label = self.get_label(".L_endif")
        
        # Вычисляем условие
        self.visit(node.condition)
        self.emit(f"    cmp {self.main_reg}, 0\n")
        
        if node.else_body:
            self.emit(f"    je {else_label}\n")
        else:
            self.emit(f"    je {endif_label}\n")
        
        # Тело if
        for stmt in node.if_body:
            self.visit(stmt)
        
        if node.else_body:
            self.emit(f"    jmp {endif_label}\n")
            self.emit(f"{else_label}:\n")
            for stmt in node.else_body:
                self.visit(stmt)
        
        self.emit(f"{endif_label}:\n")

    def visit_ComparisonNode(self, node):
        """Генерирует код для операций сравнения"""
        # Вычисляем операнды
        self.visit(node.right)
        self.emit(f"    push {self.main_reg}\n")
        
        self.visit(node.left)
        self.emit(f"    pop {self.temp_reg}\n")
        
        # Сравниваем
        self.emit(f"    cmp {self.main_reg}, {self.temp_reg}\n")
        
        true_label = self.get_label(".L_comp_true")
        end_label = self.get_label(".L_comp_end")
        
        # Выбираем правильный прыжок
        jump_map = {
            '==': 'je', '!=': 'jne', '<': 'jl', 
            '>': 'jg', '<=': 'jle', '>=': 'jge'
        }
        
        jump_inst = jump_map.get(node.op, 'je')
        self.emit(f"    {jump_inst} {true_label}\n")
        
        # False
        self.emit(f"    mov {self.main_reg}, 0\n")
        self.emit(f"    jmp {end_label}\n")
        
        # True
        self.emit(f"{true_label}:\n")
        self.emit(f"    mov {self.main_reg}, 1\n")
        self.emit(f"{end_label}:\n")
        
    def visit_UnaryOpNode(self, node):
        """Обрабатывает унарные операции"""
        self.visit(node.node)
        
        if node.op.type == TokenType.MINUS:
            self.emit(f"    neg {self.main_reg}\n")
        elif node.op.type == TokenType.PLUS:
            # Унарный плюс ничего не делает
            pass
        
    def visit_CharLiteralNode(self, node):
        """Генерирует код для символьных литералов"""
        self.emit(f"    mov {self.main_reg}, {node.value}\n")
        
    def visit_FloatLiteralNode(self, node):
        """Генерирует код для float литералов (упрощенно)"""
        # Для упрощения трактуем как целое число
        int_value = int(node.value)
        self.emit(f"    mov {self.main_reg}, {int_value} ; Float {node.value} as int\n")
        
    def visit_StructDeclarationNode(self, node):
        """Обрабатывает объявление структуры с поддержкой массивов структур"""
        if node.name in self.struct_definitions:
            raise NameError(f"Struct '{node.name}' is already defined")

        current_offset = 0
        struct_fields = {}

        for field_info in node.fields:
            if len(field_info) == 3:  # Массив в структуре
                field_type, field_name, array_size = field_info
                
                # НОВОЕ: Поддержка массивов структур
                if field_type in self.struct_definitions:
                    # Это массив структур
                    element_size = self.struct_definitions[field_type]['size']
                else:
                    # Примитивный тип
                    element_size = self.get_type_size(field_type)
                
                total_field_size = element_size * array_size
                
                struct_fields[field_name] = {
                    'type': f"{field_type}[{array_size}]",
                    'offset': current_offset,
                    'size': total_field_size,
                    'array_size': array_size,
                    'element_type': field_type,
                    'element_size': element_size  # НОВОЕ: для структур
                }
            else:  # Обычное поле
                field_type, field_name = field_info
                
                # НОВОЕ: Поддержка полей-структур
                if field_type in self.struct_definitions:
                    field_size = self.struct_definitions[field_type]['size']
                else:
                    field_size = self.get_type_size(field_type)
                
                struct_fields[field_name] = {
                    'type': field_type,
                    'offset': current_offset,
                    'size': field_size
                }
            
            current_offset += struct_fields[field_name]['size']

        self.struct_definitions[node.name] = {
            'size': current_offset,
            'fields': struct_fields
        }

        self.emit(f"; Struct {node.name} defined: size={current_offset} bytes\n")
        
    def visit_PropertyAccessNode(self, node):
        """Обрабатывает доступ к полям структуры (включая через указатели)"""
        var_name = node.variable_name
        field_name = node.property_name
        
        if var_name in self.enum_definitions:
            enum_def = self.enum_definitions[var_name]
            if field_name in enum_def:
                value = enum_def[field_name]
                # Генерируем код, как для числового литерала
                self.emit(f" mov {self.main_reg}, {value} ; enum {var_name}.{field_name}\n")
                return
            else:
                raise NameError(f"Enum '{var_name}' has no member '{field_name}'")
        
        # Проверяем специальные свойства как .length
        if field_name == "length":
            if var_name not in self.array_sizes:
                # УЛУЧШЕНО: Используем error_handler для контекстной ошибки
                if hasattr(node, 'token') and node.token:
                    self.error_handler.raise_syntax_error(
                        f"Cannot get .length of '{var_name}', not a known array",
                        node.token
                    )
                else:
                    raise NameError(f"Cannot get .length of '{var_name}', not a known array")
            array_length = self.array_sizes[var_name]
            self.emit(f" mov {self.main_reg}, {array_length}\n")
            return
        
        # Получаем информацию о переменной
        var_info = self.get_var_info(var_name)
        if not var_info:
            print(f"DEBUG: Variable '{var_name}' not found in any scope!")
            # УЛУЧШЕНО: Более детальная ошибка
            if hasattr(node, 'token') and node.token:
                self.error_handler.raise_syntax_error(
                    f"Variable '{var_name}' not defined. Available variables: {list(self.local_variables.keys()) + list(self.global_variables.keys())}",
                    node.token,
                    suggestion=f"Check if variable '{var_name}' is declared in current scope"
                )
            else:
                raise NameError(f"Variable '{var_name}' not defined")
        
        var_type, location, _ = var_info
        
        if var_type.endswith('[]'):
            # Это массив структур - нужно сначала получить конкретный элемент
            # Для конструкции tokens[0].type это будет обработано в ArrayAccessNode + PropertyAccessNode
            # Но если это прямое обращение tokens.type, то это ошибка
            base_struct_type = var_type[:-2]  # Убираем '[]'
            raise TypeError(f"Cannot access field '{field_name}' of array '{var_name}'. Use array indexing first: {var_name}[index].{field_name}")
        
        # НОВОЕ: Проверяем, является ли это указателем на структуру
        is_pointer_to_struct = False
        struct_type_name = var_type
        
        if var_type.endswith('*'):
            # Это указатель - получаем базовый тип
            struct_type_name = var_type[:-1]  # Убираем '*'
            is_pointer_to_struct = True
        
        if struct_type_name not in self.struct_definitions:
            print(f"DEBUG: Type '{struct_type_name}' is not a defined struct")
            print(f"DEBUG: Trying to access field '{field_name}' of non-struct variable")
            
            # УЛУЧШЕНО: Используем error_handler с подробной информацией
            available_structs = list(self.struct_definitions.keys())
            error_msg = f"Variable '{var_name}' has type '{var_type}' which is not a struct"
            if available_structs:
                error_msg += f". Available struct types: {available_structs}"
            else:
                error_msg += ". No struct types are currently defined."
                
            if hasattr(node, 'token') and node.token:
                self.error_handler.raise_syntax_error(
                    error_msg,
                    node.token,
                    suggestion="Declare the struct type or check variable type"
                )
            else:
                raise TypeError(f"Variable '{var_name}' is not a struct or pointer to struct")
        
        struct_def = self.struct_definitions[struct_type_name]
        if field_name not in struct_def['fields']:
            raise NameError(f"Struct '{struct_type_name}' has no field '{field_name}'")
        
        field_info = struct_def['fields'][field_name]
        field_offset = field_info['offset']
        field_size = field_info['size']
        
        if is_pointer_to_struct:
            # НОВОЕ: Доступ через указатель
            # 1. Загружаем адрес структуры из указателя
            if isinstance(location, int):  # Локальная переменная-указатель
                if location > 0:
                    self.emit(f" mov {self.temp_reg}, [{self.base_reg}+{location}]\n")
                else:
                    self.emit(f" mov {self.temp_reg}, [{self.base_reg}{location}]\n")
            else:  # Глобальная переменная-указатель
                self.emit(f" mov {self.temp_reg}, [{location}]\n")
            
            # 2. Добавляем смещение поля
            if field_offset > 0:
                self.emit(f" add {self.temp_reg}, {field_offset}\n")
            
            # 3. Загружаем значение поля
            if 'array_size' in field_info:
                # Для массивов возвращаем адрес
                self.emit(f" mov {self.main_reg}, {self.temp_reg}\n")
            else:
                # Для обычных полей загружаем значение
                if field_size == 1:
                    self.emit(f" xor {self.main_reg}, {self.main_reg}\n")
                    self.emit(f" mov al, [{self.temp_reg}]\n")
                elif field_size == 2:
                    self.emit(f" mov {self.main_reg}, [{self.temp_reg}]\n")
                else:
                    size_prefix = 'word' if self.target_bits == 16 else 'dword'
                    self.emit(f" mov {self.main_reg}, {size_prefix} [{self.temp_reg}]\n")
        else:
            # Существующая логика для прямого доступа к структурам
            if 'array_size' in field_info:
                # Это массив - возвращаем его адрес
                if isinstance(location, int):  # Локальная структура
                    total_offset = location + field_offset
                    if total_offset > 0:
                        self.emit(f" lea {self.main_reg}, [{self.base_reg}+{total_offset}]\n")
                    else:
                        self.emit(f" lea {self.main_reg}, [{self.base_reg}{total_offset}]\n")
                else:  # Глобальная структура
                    if field_offset > 0:
                        self.emit(f" lea {self.main_reg}, [{location}+{field_offset}]\n")
                    else:
                        self.emit(f" mov {self.main_reg}, {location}\n")
            else:
                # Обычное поле - загружаем значение
                if isinstance(location, int):  # Локальная структура
                    total_offset = location + field_offset
                    if field_size == 1:
                        self.emit(f" xor {self.main_reg}, {self.main_reg}\n")
                        if total_offset > 0:
                            self.emit(f" mov al, [{self.base_reg}+{total_offset}]\n")
                        else:
                            self.emit(f" mov al, [{self.base_reg}{total_offset}]\n")
                    else:
                        if total_offset > 0:
                            self.emit(f" mov {self.main_reg}, [{self.base_reg}+{total_offset}]\n")
                        else:
                            self.emit(f" mov {self.main_reg}, [{self.base_reg}{total_offset}]\n")
                else:  # Глобальная структура
                    if field_size == 1:
                        self.emit(f" xor {self.main_reg}, {self.main_reg}\n")
                        if field_offset > 0:
                            self.emit(f" mov al, [{location}+{field_offset}]\n")
                        else:
                            self.emit(f" mov al, [{location}]\n")
                    else:
                        if field_offset > 0:
                            self.emit(f" mov {self.main_reg}, [{location}+{field_offset}]\n")
                        else:
                            self.emit(f" mov {self.main_reg}, [{location}]\n")
            
    def visit_MatchNode(self, node):
        """Генерирует код для конструкции match-case с правильной адресацией для 16-бит"""
        
        # Вычисляем выражение для сравнения один раз
        self.visit(node.expression_node)
        
        # ИСПРАВЛЕНО: Сохраняем в регистр вместо стека для 16-бит
        if self.target_bits == 16:
            # В 16-битном режиме используем DX для хранения значения match
            self.emit(f" mov dx, {self.main_reg} ; Save match expression to dx\n")
            match_value_reg = "dx"
        else:
            # В 32-битном режиме можем использовать стек
            self.emit(f" push {self.main_reg} ; Save match expression\n")
            match_value_reg = None
        
        match_end_label = self.get_label(".L_match_end")
        case_labels = []
        
        # Генерируем метки для всех case
        for i, case in enumerate(node.cases):
            case_labels.append(self.get_label(f".L_case_{i}"))
        
        # Генерируем проверки для всех case
        for i, case in enumerate(node.cases):
            if case.is_default:
                continue  # default обрабатываем отдельно
                
            # Вычисляем значение case
            self.visit(case.value_node)
            
            # Сравниваем с сохраненным значением
            if self.target_bits == 16:
                self.emit(f" cmp {match_value_reg}, {self.main_reg}\n")
            else:
                self.emit(f" mov {self.temp_reg}, [esp] ; Load match value from stack\n")
                self.emit(f" cmp {self.temp_reg}, {self.main_reg}\n")
                
            self.emit(f" je {case_labels[i]}\n")
        
        # Если ничего не подошло, ищем default или переходим к концу
        default_label = None
        for i, case in enumerate(node.cases):
            if case.is_default:
                default_label = case_labels[i]
                break
        
        if default_label:
            self.emit(f" jmp {default_label}\n")
        else:
            self.emit(f" jmp {match_end_label}\n")
        
        # Генерируем код для всех case
        for i, case in enumerate(node.cases):
            self.emit(f"{case_labels[i]}:\n")
            for stmt in case.body:
                self.visit(stmt)
            self.emit(f" jmp {match_end_label}\n")
        
        # Очищаем стек в 32-битном режиме
        if self.target_bits == 32:
            self.emit(f" add esp, 4 ; Clean match stack\n")
        
        self.emit(f"{match_end_label}:\n")
        
    def visit_StructArrayAccessNode(self, node):
        """
        ОБНОВЛЕНО: Корректно обрабатывает чтение из поля-массива структуры: struct.field[index]
        Пример: `val : my_struct.my_array[i]`
        """
        # --- 1. Вычисляем и сохраняем индекс ---
        self.visit(node.index_node)
        self.emit(f" push {self.main_reg} ; Save index\n")

        # --- 2. Получаем информацию о структуре и поле ---
        struct_info = self.get_var_info(node.struct_name)
        if not struct_info:
            raise NameError(f"Struct variable '{node.struct_name}' not defined")
        
        struct_type, struct_location, _ = struct_info
        
        is_pointer_to_struct = struct_type.endswith('*')
        struct_type_name = struct_type.replace('*', '')

        if struct_type_name not in self.struct_definitions:
            raise TypeError(f"Variable '{node.struct_name}' is not a known struct type.")
        
        struct_def = self.struct_definitions[struct_type_name]
        if node.field_name not in struct_def['fields']:
            raise NameError(f"Struct '{struct_type_name}' has no field named '{node.field_name}'")
        
        field_info = struct_def['fields'][node.field_name]
        field_offset = field_info['offset']
        
        if 'element_size' not in field_info:
            raise TypeError(f"Field '{node.field_name}' of struct '{struct_type_name}' is not an array.")
        element_size = field_info['element_size']

        # --- 3. Получаем базовый адрес МАССИВА (а не структуры) в temp_reg ---
        # Сначала получаем адрес самой структуры
        if is_pointer_to_struct:
            # Если это указатель, разыменовываем его, чтобы получить адрес
            if isinstance(struct_location, int): # Локальный указатель
                op_offset = f"{'' if struct_location < 0 else '+'}{struct_location}"
                self.emit(f" mov {self.temp_reg}, [{self.base_reg}{op_offset}]\n")
            else: # Глобальный указатель
                self.emit(f" mov {self.temp_reg}, [{struct_location}]\n")
        else:
            # Если это сама структура, берем ее адрес с помощью LEA
            if isinstance(struct_location, int): # Локальная структура
                op_offset = f"{'' if struct_location < 0 else '+'}{struct_location}"
                self.emit(f" lea {self.temp_reg}, [{self.base_reg}{op_offset}]\n")
            else: # Глобальная структура
                self.emit(f" mov {self.temp_reg}, {struct_location}\n")
        
        # КЛЮЧЕВОЙ ШАГ: Прибавляем смещение поля, чтобы получить адрес начала массива
        if field_offset > 0:
            self.emit(f" add {self.temp_reg}, {field_offset} ; Add field offset to get array base\n")
        
        # Теперь в self.temp_reg (bx/ebx) находится базовый адрес массива.

        # --- 4. Вычисляем итоговый адрес и загружаем значение ---
        self.emit(f" pop {self.main_reg} ; Restore index\n")

        # Умножаем индекс на размер элемента (пропускаем для char, где size=1)
        if element_size > 1:
            self.emit(f" imul {self.main_reg}, {element_size}\n")
                
        # Для 16-битного режима используем SI для адресации [base+index]
        if self.target_bits == 16:
            self.emit(f" mov si, {self.main_reg}\n")
            index_reg = "si"
        else: # 32-bit
            index_reg = self.main_reg
            
        # Загружаем значение, ИЗБЕГАЯ знакового расширения для char
        if element_size == 1:
            self.emit(f" xor {self.main_reg}, {self.main_reg} ; Zero-out register to avoid sign extension\n")
            self.emit(f" mov al, [{self.temp_reg}+{index_reg}]   ; Load byte\n")
        elif element_size == 2:
            self.emit(f" mov {self.main_reg}, word [{self.temp_reg}+{index_reg}]\n")
        elif element_size == 4:
            self.emit(f" mov {self.main_reg}, dword [{self.temp_reg}+{index_reg}]\n")

    def get_var_info(self, var_name):
        """Получает информацию о переменной (локальной или глобальной)"""
        if var_name in self.local_variables:
            return self.local_variables[var_name]
        elif var_name in self.global_variables:
            return self.global_variables[var_name]
        else:
            return None
        
    def visit_ArrayElementPropertyAccessNode(self, node):
        """Обрабатывает доступ к полю элемента массива структур"""

        # Вычисляем индекс
        self.visit(node.index_node)
        self.emit(f" push {self.main_reg} ; Save index\n")

        # Получаем информацию о массиве
        array_info = self.get_var_info(node.array_name)
        if not array_info:
            raise NameError(f"Array '{node.array_name}' not defined")

        array_type, array_location, element_size = array_info

        struct_type = None
        is_struct_array = False

        if array_type.endswith('[]'):
            t = array_type[:-2]
            if t in self.struct_definitions:
                struct_type = t
                is_struct_array = True
        if array_type.endswith('*'):
            t = array_type[:-1]
            if t in self.struct_definitions:
                struct_type = t
                is_struct_array = True
        if not is_struct_array and hasattr(self, '_temp_array_declarations'):
            for decl in self._temp_array_declarations:
                if decl.name == node.array_name and decl.var_type in self.struct_definitions:
                    struct_type = decl.var_type
                    is_struct_array = True
                    break
        if not is_struct_array and array_type == 'array':
            exact_matches = [n for n, d in self.struct_definitions.items() if d['size'] == element_size]
            if len(exact_matches) == 1:
                struct_type = exact_matches[0]
                is_struct_array = True
            elif len(exact_matches) > 1:
                upname = node.array_name.upper()
                match = next((c for c in exact_matches if c.upper() in upname
                            or upname.startswith(c.upper())
                            or c.upper().startswith(upname.split('_')[0])
                            or upname.endswith(c.upper())), None)
                struct_type = match or exact_matches[0]
                is_struct_array = True
            else:
                approx = [(n, d['size']) for n, d in self.struct_definitions.items()
                        if abs(d['size'] - element_size) <= 2]
                if approx:
                    struct_type = min(approx, key=lambda x: abs(x[1] - element_size))[0]
                    is_struct_array = True

        if not is_struct_array or struct_type not in self.struct_definitions:
            raise TypeError(f"Array '{node.array_name}' is not an array of structs "
                            f"or struct type '{struct_type}' not found. "
                            f"Available: {list(self.struct_definitions.keys())}")

        struct_def = self.struct_definitions[struct_type]
        if node.field_name not in struct_def['fields']:
            raise NameError(f"Struct '{struct_type}' has no field '{node.field_name}'. "
                            f"Available fields: {list(struct_def['fields'].keys())}")

        field_info = struct_def['fields'][node.field_name]
        field_offset = field_info['offset']
        field_size = field_info['size']

        # Адрес массива
        if isinstance(array_location, int):
            if array_location > 0:
                self.emit(f" lea {self.temp_reg}, [{self.base_reg}+{array_location}]\n")
            else:
                self.emit(f" lea {self.temp_reg}, [{self.base_reg}{array_location}]\n")
        else:
            self.emit(f" mov {self.temp_reg}, {array_location}\n")

        # Индекс * размер структуры
        self.emit(f" pop {self.main_reg} ; Restore index\n")
        struct_size = struct_def['size']
        if struct_size > 1:
            if struct_size == 2:
                self.emit(f" shl {self.main_reg}, 1\n")
            elif struct_size == 4:
                self.emit(f" shl {self.main_reg}, 2\n")
            elif struct_size == 8:
                self.emit(f" shl {self.main_reg}, 3\n")
            else:
                self.emit(f" mov {'cx' if self.target_bits == 16 else 'ecx'}, {struct_size}\n")
                self.emit(f" imul {self.main_reg}, {'cx' if self.target_bits == 16 else 'ecx'}\n")

        self.emit(f" add {self.temp_reg}, {self.main_reg}\n")
        if field_offset > 0:
            self.emit(f" add {self.temp_reg}, {field_offset}\n")

        # === Чтение значения поля ===
        if field_size == 1:
            self.emit(f" xor {self.main_reg}, {self.main_reg}\n")
            self.emit(f" mov al, [{self.temp_reg}]\n")
        elif field_size == 2:
            if self.target_bits == 16:
                self.emit(f" mov {self.main_reg}, word [{self.temp_reg}]\n")
            else:
                self.emit(f" xor {self.main_reg}, {self.main_reg}\n")
                self.emit(f" mov ax, word [{self.temp_reg}]\n")
        else:
            size_prefix = 'word' if self.target_bits == 16 else 'dword'
            self.emit(f" mov {self.main_reg}, {size_prefix} [{self.temp_reg}]\n")
            
    def visit_LogicalOperationNode(self, node):
        """Генерирует код для && и || с short-circuiting для NASM"""
        end_label = self.get_label(".L_logic_end")
        
        if node.operator == '&&':
            false_label = self.get_label(".L_logic_false")
            
            # Вычисляем левый операнд
            self.visit(node.left)
            self.emit(f" cmp {self.main_reg}, 0\n")
            self.emit(f" je {false_label}\n")
            
            # Если левый истинен, вычисляем правый
            self.visit(node.right)
            self.emit(f" cmp {self.main_reg}, 0\n")
            self.emit(f" je {false_label}\n")
            
            # Оба истинны
            self.emit(f" mov {self.main_reg}, 1\n")
            self.emit(f" jmp {end_label}\n")
            
            # Результат ложь
            self.emit(f"{false_label}:\n")
            self.emit(f" mov {self.main_reg}, 0\n")
            self.emit(f"{end_label}:\n")
            
        elif node.operator == '||':
            true_label = self.get_label(".L_logic_true")
            
            # Вычисляем левый операнд
            self.visit(node.left)
            self.emit(f" cmp {self.main_reg}, 0\n")
            self.emit(f" jne {true_label}\n")
            
            # Если левый ложен, вычисляем правый
            self.visit(node.right)
            self.emit(f" cmp {self.main_reg}, 0\n")
            self.emit(f" jne {true_label}\n")
            
            # Оба ложны
            self.emit(f" mov {self.main_reg}, 0\n")
            self.emit(f" jmp {end_label}\n")
            
            # Результат истина
            self.emit(f"{true_label}:\n")
            self.emit(f" mov {self.main_reg}, 1\n")
            self.emit(f"{end_label}:\n")
            
    def visit_EnumDeclarationNode(self, node):
        """Обрабатывает объявление enum и сохраняет его значения."""
        if node.name in self.enum_definitions:
            return

        self.enum_definitions[node.name] = {}
        for name, value in node.values:
            self.enum_definitions[node.name][name] = value
        print(f"DEBUG: Registered enum '{node.name}' with {len(node.values)} members.")

        
    
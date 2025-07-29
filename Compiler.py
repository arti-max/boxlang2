#!/usr/bin/python3
from lib.TokenType import TokenType
from lib import AST

class Compiler:
    def __init__(self):
        self.kasm_code = ""
        self.data_section = ""
        self.string_counter = 0
        
        # Форматы таблиц символов:
        # Переменные: { "имя": ("тип", местоположение) } где местоположение - смещение или метка
        # Массивы:    { "имя": ("array", местоположение, размер_элемента) }
        self.global_variables = {}
        self.scope_variables = {} 
        # <<< НОВОЕ: Хранилище для метаданных о структурах
        # Формат: { 'Player': {'size': 10, 'fields': {'x': {'offset': 0, 'type': 'num32'}, ...} } }
        self.struct_definitions = {}
        self.current_function_name = None
        self.next_local_offset = 0
        
        # Новое: система типов и проверок
        self.function_signatures = {}  # Хранит сигнатуры функций
        self.array_sizes = {}          # Хранит размеры массивов для проверки границ
        
        self.label_counter = 0
        self.kasmf_reg_idx = 0
        
        # Регистрируем встроенные функции
        self._register_builtin_functions()

    def _register_builtin_functions(self):
        """Регистрирует встроенные функции стандартной библиотеки"""
        self.function_signatures.update({
            'clear_screen': {
                'params': [],
                'return_type': None
            },
        })
        
    def _find_declarations_recursive(self, nodes):
        """Рекурсивно находит все узлы объявления переменных и массивов."""
        declarations = []
        for node in nodes:
            # Если узел сам является объявлением, добавляем его
            if isinstance(node, (AST.VariableDeclarationNode, AST.ArrayDeclarationNode)):
                declarations.append(node)
            
            # Рекурсивно ищем во вложенных блоках
            if hasattr(node, 'if_body'):  # Для IfNode
                declarations.extend(self._find_declarations_recursive(node.if_body))
            if hasattr(node, 'else_body') and node.else_body:
                declarations.extend(self._find_declarations_recursive(node.else_body))
            if hasattr(node, 'body'):  # Для ForNode и WhileNode
                declarations.extend(self._find_declarations_recursive(node.body))
            if hasattr(node, 'init_node'):  # Для инициализатора ForNode
                if isinstance(node.init_node, AST.VariableDeclarationNode):
                    declarations.append(node.init_node)
            if hasattr(node, 'cases'): # для MatchNode
                 for case in node.cases:
                    declarations.extend(self._find_declarations_recursive(case.body))
        return declarations
    
    def _get_field_address(self, var_node, field_name):
        """
        Вычисляет адрес поля структуры и помещает его в %ebx.
        var_node - это VariableReferenceNode.
        field_name - имя поля (строка).
        """
        var_name = var_node.name
        var_info = self.get_var_info(var_name)
        if not var_info:
            raise NameError(f"Variable '{var_name}' not defined.")

        var_type, location, _ = var_info
        if var_type not in self.struct_definitions:
            raise TypeError(f"Variable '{var_name}' is not a struct and has no fields.")
            
        struct_def = self.struct_definitions[var_type]
        if field_name not in struct_def['fields']:
            raise NameError(f"Struct '{var_type}' has no field named '{field_name}'.")
            
        field_info = struct_def['fields'][field_name]
        field_offset = field_info['offset']

        # Шаг 1: Получаем базовый адрес переменной-структуры в %ebx
        if isinstance(location, int): # Локальная переменная
            self.kasm_code += f"    mov %ebx %ebp\n"
            if location > 0: self.kasm_code += f"    add %ebx {location}\n"
            else: self.kasm_code += f"    sub %ebx {-location}\n"
        else: # Глобальная переменная
            self.kasm_code += f"    mov %ebx {location}\n"
            
        # Шаг 2: Добавляем смещение поля к базовому адресу
        if field_offset > 0:
            self.kasm_code += f"    add %ebx {field_offset} ; offset for field '{field_name}'\n"
            
    def _reassemble_string_from_segments(self, segments):
        """Собирает простую строку из сегментов, превращая байты в символы."""
        # ### <-- ИЗМЕНЕНИЕ: Добавляем проверку типа ###
        # Если нам пришла обычная строка, а не список сегментов, просто возвращаем ее.
        if isinstance(segments, str):
            return segments

        # Если это список, обрабатываем его как и раньше.
        result_string = ""
        for is_string, data in segments:
            if is_string:
                result_string += data
            else:
                try:
                    result_string += chr(data)
                except ValueError:
                    result_string += '?'
        return result_string

    def get_element_size(self, type_name):
        # Добавьте сюда тип указателя
        return {'num32': 4, 'num16': 2, 'char': 1, 'float': 4, 'char*': 4, 'num32*': 4, 'num16*': 4}.get(type_name, 4) # <<< ИЗМЕНЕНИЕ

    def register_function_signature(self, name, params, return_type=None, is_variadic=False):
        """Регистрирует сигнатуру функции для проверки типов"""
        self.function_signatures[name] = {
            'params': params,
            'return_type': return_type,
            'is_variadic': is_variadic
        }
            

    def check_function_call(self, name, args):
        """Проверяет соответствие аргументов сигнатуре функции"""
        if name not in self.function_signatures:
            # Для пользовательских функций, определенных в том же файле, разрешаем вызов
            return
            
        signature = self.function_signatures[name]
        expected_params = signature['params']
        is_variadic = signature.get('is_variadic', False) # <<< НОВОЕ

        if is_variadic:
            # Если функция вариативная, переданных аргументов должно быть
            # НЕ МЕНЬШЕ, чем обязательных параметров.
            if len(args) < len(expected_params):
                raise TypeError(f"Function '{name}' expects at least {len(expected_params)} arguments, but got {len(args)}")
        else:
            # Для обычных функций проверка остается строгой.
            if len(args) != len(expected_params):
                raise TypeError(f"Function '{name}' expects exactly {len(expected_params)} arguments, but got {len(args)}")
            
        # Проверяем типы для обязательных аргументов
        for i, (expected_type, param_name) in enumerate(expected_params):
            arg_type = self.infer_expression_type(args[i])
            if not self.types_compatible(arg_type, expected_type):
                raise TypeError(f"Function '{name}' parameter {i+1} ('{param_name}') expects {expected_type}, got {arg_type}")

    def infer_expression_type(self, expr_node):
        """Выводит тип выражения"""
        if isinstance(expr_node, AST.NumberLiteralNode):
            return 'num32'
        elif isinstance(expr_node, AST.CharLiteralNode):
            return 'char'
        elif isinstance(expr_node, AST.StringLiteralNode):
            return 'char*'
        elif isinstance(expr_node, AST.VariableReferenceNode):
            var_info = self.get_var_info(expr_node.name)
            if var_info:
                return var_info[0]
            return 'unknown'
        elif isinstance(expr_node, AST.ArrayAccessNode):
            var_info = self.get_var_info(expr_node.name)
            if var_info:
                if var_info[0] == 'array':
                    return self.get_array_element_type(expr_node.name)
                elif var_info[0].endswith('*'): # Доступ по индексу к указателю
                    return var_info[0].replace('*', '')
            return 'unknown'
        elif isinstance(expr_node, AST.AddressOfNode):
            base_type = self.infer_expression_type(expr_node.node_to_address)
            if base_type != 'unknown':
                return f"{base_type}*"
            return 'unknown'
        elif isinstance(expr_node, AST.BinaryOperationNode):
            return 'num32'
        elif isinstance(expr_node, AST.FunctionCallNode):
            if expr_node.name in self.function_signatures:
                return self.function_signatures[expr_node.name].get('return_type') or 'num32'
            return 'num32'
        
        # <<< НОВОЕ: Добавляем правило для PropertyAccessNode >>>
        elif isinstance(expr_node, AST.PropertyAccessNode):
            # На данный момент у нас есть только одно свойство - .length
            if expr_node.property_name == 'length':
                # .length всегда возвращает число.
                return 'num32'
            
        elif isinstance(expr_node, AST.DereferenceNode):
            pointer_type = self.infer_expression_type(expr_node.pointer_node)
            if pointer_type.endswith('*'):
                return pointer_type[:-1] # Превращаем 'char*' в 'char', 'num32*' в 'num32' и т.д.
            # Если пытаемся разыменовать не указатель, это ошибка, но пока вернем unknown
            return 'unknown'

        # Если ничего не подошло, мы не знаем тип
        return 'unknown'
    
    def visit_UnaryOpNode(self, node):
        """Генерирует код для унарных операций."""
        self.visit(node.node)  # Сначала вычисляем значение выражения, оно в %eax
        if node.op.type == TokenType.MINUS:
            # Эмулируем операцию neg (отрицание) через two's complement:
            # neg x  is equivalent to  not x + 1
            self.kasm_code += " not %eax\n"
            self.kasm_code += " inx %eax ; Emulated unary minus (negation)\n"
        # Унарный плюс ничего не делает, поэтому просто его игнорируем

    def types_compatible(self, actual_type, expected_type):
        """Проверяет совместимость типов с учетом низкоуровневых особенностей."""
        if actual_type == expected_type:
            return True

        # Числовые типы частично совместимы между собой
        numeric_types = ['num32', 'num16', 'char']
        if actual_type in numeric_types and expected_type in numeric_types:
            return True

        # ### <-- ИЗМЕНЕНИЕ НАЧАЛО: Разрешаем присваивать числа указателям и наоборот ###
        # Это необходимо для операций вроде `ptr : 0x4F0000`
        if actual_type == 'num32' and expected_type.endswith('*'):
            return True
        
        if actual_type.endswith('*') and expected_type == 'num32':
            return True
        # ### ИЗМЕНЕНИЕ КОНЕЦ ###

        # Упрощенная проверка совместимости указателей (любой указатель совместим с любым другим)
        if actual_type.endswith('*') and expected_type.endswith('*'):
            return True

        return False

    def get_array_element_type(self, array_name):
        """Возвращает тип элемента массива"""
        var_info = None
        if array_name in self.scope_variables:
            var_info = self.scope_variables[array_name]
        elif array_name in self.global_variables:
            var_info = self.global_variables[array_name]

        if var_info and var_info[0] == 'array':
            # var_info = ('array', location, element_size)
            element_size = var_info[2]
            size_to_type = {4: 'num32', 2: 'num16', 1: 'char'}
            return size_to_type.get(element_size, 'num32')
            
        return 'num32' # Или лучше вызывать ошибку, если массив не найден

    def check_array_bounds(self, array_name, index_node):
        """Проверяет границы массива во время компиляции (если возможно)"""
        if isinstance(index_node, AST.NumberLiteralNode):
            # Статическая проверка для числовых индексов
            index = index_node.value
            if index < 0:
                raise ValueError(f"Array index cannot be negative: {index}")
                
            # Проверяем верхнюю границу если размер массива известен
            if array_name in self.array_sizes:
                array_size = self.array_sizes[array_name]
                if index >= array_size:
                    raise ValueError(f"Array index {index} out of bounds for array '{array_name}' of size {array_size}")

    def visit(self, node):
        method_name = f'visit_{type(node).__name__}'
        visitor = getattr(self, method_name, self.generic_visit)
        return visitor(node)

    def generic_visit(self, node):
        # Пропускаем узлы, для которых нет специального обработчика
        if isinstance(node, AST.ASTNode):
            # Можно добавить предупреждение, если нужно
            print(f"Warning: No visitor for node type {type(node).__name__}")
            pass
        else:
            raise Exception(f'No visit method for {type(node).__name__}')
    
    def visit_ComparisonNode(self, node):
        """Генерирует код для всех операций сравнения, включая эмуляцию."""
        self.visit(node.right)
        self.kasm_code += " psh %eax\n"
        self.visit(node.left)
        self.kasm_code += " pop %ebx\n"
        self.kasm_code += " cmp %eax %ebx\n"

        true_label = f".L_comp_true_{self.label_counter}"
        end_label = f".L_comp_end_{self.label_counter}"
        self.label_counter += 1

        op = node.op
        jump_instruction = None

        # Простые случаи, поддерживаемые CPU напрямую
        simple_jumps = {'==': 'je', '!=': 'jne', '<': 'jl', '>': 'jg'}
        if op in simple_jumps:
            jump_instruction = simple_jumps[op]
            self.kasm_code += f" {jump_instruction} {true_label}\n"
        
        # Эмуляция 'больше или равно' (>=), что эквивалентно 'не меньше'
        elif op == '>=':
            # Прыгаем, если НЕ меньше. `jl` прыгает, если меньше. Значит, если `jl` не сработал, то a >= b.
            false_label = f".L_comp_false_{self.label_counter}"
            self.label_counter += 1
            self.kasm_code += f" jl {false_label}\n"
            self.kasm_code += f" jmp {true_label}\n"
            self.kasm_code += f"{false_label}:\n"

        # Эмуляция 'меньше или равно' (<=), что эквивалентно 'не больше'
        elif op == '<=':
            # Прыгаем, если НЕ больше.
            false_label = f".L_comp_false_{self.label_counter}"
            self.label_counter += 1
            self.kasm_code += f" jg {false_label}\n"
            self.kasm_code += f" jmp {true_label}\n"
            self.kasm_code += f"{false_label}:\n"
        
        else:
            raise NotImplementedError(f"Comparison operator {op} not implemented")

        # Общая часть для всех операторов
        self.kasm_code += " mov %eax 0 ; False\n"
        self.kasm_code += f" jmp {end_label}\n"
        self.kasm_code += f"{true_label}:\n"
        self.kasm_code += " mov %eax 1 ; True\n"
        self.kasm_code += f"{end_label}:\n"
        
    def visit_IfNode(self, node):
        """Генерирует код для конструкции if-else."""
        else_label = f".L_else_{self.label_counter}"
        endif_label = f".L_endif_{self.label_counter}"
        self.label_counter += 1

        # 1. Вычисляем условие. Результат (1 или 0) будет в %eax
        self.visit(node.condition)
        
        # 2. Сравниваем результат с нулем
        self.kasm_code += "        cmp %eax 0\n"
        
        # 3. Если условие ложно (== 0), переходим к блоку else или к концу
        if node.else_body:
            self.kasm_code += f"        je {else_label} ; Jump to else if condition is false\n"
        else:
            self.kasm_code += f"        je {endif_label} ; Jump to end if condition is false\n"

        # 4. Генерируем код для тела if (если условие истинно)
        self.kasm_code += "        ; --- if-body ---\n"
        for statement in node.if_body:
            self.visit(statement)
        self.kasm_code += f"        jmp {endif_label} ; End of if-body\n"

        # 5. Генерируем код для тела else (если оно есть)
        if node.else_body:
            self.kasm_code += f"{else_label}:\n"
            self.kasm_code += "        ; --- else-body ---\n"
            for statement in node.else_body:
                self.visit(statement)

        # 6. Метка конца конструкции
        self.kasm_code += f"{endif_label}:\n"

    def visit_FunctionDeclarationNode(self, node):
        self.current_function_name = node.name
        self.scope_variables.clear()
        self.array_sizes.clear() # Очищаем размеры массивов для новой функции

        # Регистрируем функцию для будущих проверок типов
        self.register_function_signature(node.name, node.params, is_variadic=node.is_variadic)
        
        # --- ШАГ 1: Обработка параметров функции ---
        # Параметры имеют положительное смещение от указателя базы стека (%ebp)
        param_offset = 8
        for param_type, param_name in node.params:
            self.scope_variables[param_name] = (param_type, param_offset)
            param_offset += 4

        # --- ШАГ 2: Рекурсивный сбор всех локальных переменных ---
        # Используем существующий, но неиспользуемый метод для поиска во вложенных блоках
        all_local_declarations = self._find_declarations_recursive(node.body)

        # --- ШАГ 3: Расчет общего размера стека для всех локальных переменных ---
        local_vars_size = 0
        for decl_node in all_local_declarations:
            if isinstance(decl_node, AST.VariableDeclarationNode):
                if decl_node.var_type in self.struct_definitions:
                    size = self.struct_definitions[decl_node.var_type]['size']
                else:
                    size = self.get_element_size(decl_node.var_type)
                local_vars_size += size
            elif isinstance(decl_node, AST.ArrayDeclarationNode):
                if not isinstance(decl_node.size_node, AST.NumberLiteralNode):
                    # На данный момент локальные массивы должны иметь постоянный размер
                    raise TypeError("Local array size must be a constant number")
                element_size = self.get_element_size(decl_node.var_type)
                array_size_bytes = decl_node.size_node.value * element_size
                local_vars_size += array_size_bytes
        
        # --- ШАГ 4: Генерация пролога функции ---
        self.kasm_code += f"\n{self.current_function_name}:\n"
        self.kasm_code += "    psh %ebp\n"
        self.kasm_code += "    mov %ebp %esp\n"
        
        # Этот "костыль" необходим из-за Big-Endian порядка в стековых операциях эмулятора
        #self.kasm_code += "    add %ebp 1\n"
        
        # Выделяем на стеке место сразу под ВСЕ локальные переменные
        if local_vars_size > 0:
            self.kasm_code += f"    sub %esp {local_vars_size} ; Allocate space for ALL local variables\n"

        # --- ШАГ 5: Регистрация всех локальных переменных в таблице символов ---
        # Теперь, когда память выделена, мы можем присвоить им смещения
        self.next_local_offset = 0
        for decl_node in all_local_declarations:
            if isinstance(decl_node, AST.VariableDeclarationNode):
                size = self.get_element_size(decl_node.var_type)
                self.next_local_offset -= size
                self.scope_variables[decl_node.name] = (decl_node.var_type, self.next_local_offset)
            
            elif isinstance(decl_node, AST.ArrayDeclarationNode):
                element_size = self.get_element_size(decl_node.var_type)
                array_size_value = decl_node.size_node.value
                array_size_bytes = array_size_value * element_size
                
                self.next_local_offset -= array_size_bytes
                self.scope_variables[decl_node.name] = ('array', self.next_local_offset, element_size)
                # Также сохраняем размер массива для `array.length`
                self.array_sizes[decl_node.name] = array_size_value

        # --- ШАГ 6: Генерация кода для тела функции ---
        has_return = any(isinstance(stmt, AST.ReturnNode) for stmt in node.body)
        
        for statement in node.body:
            self.visit(statement)

        # --- ШАГ 7: Генерация эпилога функции ---
        if self.current_function_name != '_start':
            self.kasm_code += f".L_ret_{self.current_function_name}:\n"
            if not has_return:
                self.kasm_code += "    mov %eax 0 ; Default return value\n"
            
            # Восстанавливаем стек и возвращаемся
            self.kasm_code += "    mov %esp %ebp\n"
            #self.kasm_code += "    sub %esp 1\n"
            self.kasm_code += "    pop %ebp\n"
            self.kasm_code += "    rts\n"
        else:
             # Для _start просто завершаем программу
             self.kasm_code += "    hlt ; Program end\n"
        
        self.current_function_name = None
        
    def visit_ReturnNode(self, node):
        self.visit(node.value_node)
        self.kasm_code += f"    jmp .L_ret_{self.current_function_name}\n"

    def visit_FunctionCallNode(self, node):
        self.check_function_call(node.name, node.args)

        # ### <-- ИЗМЕНЕНИЕ НАЧАЛО: Логика обработки аргументов переписана ###
        for arg_node in reversed(node.args):
            # Проверяем, является ли аргумент строковым литералом
            if isinstance(arg_node, AST.StringLiteralNode):
                # Если это строка, мы не можем просто вычислить ее значение.
                # Нам нужно получить ее метку в секции данных и загрузить адрес.
                
                # 1. Сначала "посещаем" узел, чтобы он добавил строку в .data
                #    и вернул нам свою метку.
                string_label = self.visit(arg_node) 
                
                # 2. Генерируем код для загрузки АДРЕСА этой метки в %eax
                self.kasm_code += f" mov %eax {string_label}\n"
            else:
                # Для всех остальных типов аргументов (числа, переменные и т.д.)
                # просто вычисляем их значение. Результат будет в %eax.
                self.visit(arg_node)
            
            # 3. Помещаем на стек то, что у нас получилось в %eax 
            #    (либо адрес строки, либо значение другого аргумента).
            self.kasm_code += " psh %eax\n"
        # ### ИЗМЕНЕНИЕ КОНЕЦ ###
        
        self.kasm_code += f" jsr {node.name}\n"
        
        # Очистка стека после вызова
        if node.args:
            num_args = len(node.args)
            # Для вариативных функций мы не можем надежно очистить стек здесь,
            # это должна делать сама вызываемая функция. Но для обычных - можем.
            if not self.function_signatures.get(node.name, {}).get('is_variadic', False):
                 self.kasm_code += f" add %esp {num_args * 4}\n"

    def visit_ArrayAccessNode(self, node):
        """Обрабатывает чтение значения из массива: `var = arr[i]`"""
        # Проверяем границы массива
        self.check_array_bounds(node.name, node.index_node)
        
        # 1. Вычисляем адрес элемента, он окажется в %ebx
        self.visit_array_address(node)
        
        # 2. Загружаем значение по этому адресу в %eax
        _, _, element_size = self.get_var_info(node.name)
        op = {4: 'ld', 2: 'lw', 1: 'lb'}.get(element_size, 'ld')
        if element_size != 4: self.kasm_code += "    mov %eax 0\n"
        self.kasm_code += f"    {op} %ebx %eax ; Load value from address\n"

    def visit_ArrayDeclarationNode(self, node):
        """
        Обрабатывает объявление массива.
        Если есть инициализатор (строка), генерирует код для копирования.
        """
        if node.initial_value:
            if not isinstance(node.initial_value, AST.StringLiteralNode):
                raise TypeError(f"Array '{node.name}' can only be initialized with a string literal.")

            segments = node.initial_value.segments
            array_size = self.array_sizes.get(node.name)
            
            # Подсчитываем реальную длину инициализатора
            initializer_len = 0
            for is_string, data in segments:
                initializer_len += len(data) if is_string else 1

            if array_size is not None and initializer_len > array_size:
                raise ValueError(f"Initializer is too long ({initializer_len} bytes) for array '{node.name}' of size {array_size}.")

            var_info = self.get_var_info(node.name)
            var_type, location, element_size = var_info

            # ### <-- ИЗМЕНЕНИЕ: Новая логика генерации для KASM-совместимости ###
            if isinstance(location, int): # Локальный массив
                # 1. Помещаем строку в data_section в нужном формате
                str_label = f"__str_init_{self.string_counter}"
                self.string_counter += 1
                
                data_line = ""
                for is_string, data in segments:
                    if is_string:
                        safe_str = data.replace('"', '""') # Экранирование кавычек для kasm
                        data_line += f'"{safe_str}" '
                    else:
                        data_line += f"${data:02X} "
                
                self.data_section += f'{str_label}: bytes {data_line} 0\n'

                # 2. Генерируем цикл копирования (memcpy)
                copy_loop_label = f".L_strcpy_{self.label_counter}"
                copy_end_label = f".L_strcpy_end_{self.label_counter}"
                self.label_counter += 1
                
                self.kasm_code += f" ; --- Initialize array '{node.name}' from {str_label} ---\n"
                # Адрес назначения (локальный массив) в %esi
                self.kasm_code += f" mov %esi %ebp\n"
                self.kasm_code += f" sub %esi {-location}\n"
                # Адрес источника (строка) в %egi
                self.kasm_code += f" mov %egi {str_label}\n"
                # Количество байт для копирования в %ecx
                self.kasm_code += f" mov %ecx {initializer_len}\n"
                
                # Цикл
                self.kasm_code += f"{copy_loop_label}:\n"
                self.kasm_code += " lb %egi %eax\n"  # Загрузить байт из источника
                self.kasm_code += " sb %esi %eax\n"  # Сохранить байт в назначение
                self.kasm_code += f" lp {copy_loop_label}\n" # Команда 'lp' сама декрементирует %ecx и прыгает, если он не 0

            else: # Глобальный массив (должен быть обработан при сборе глобальных переменных)
                 raise NotImplementedError("Initialization of global arrays is not fully implemented yet.")

    def visit_AssignmentNode(self, node):
        # Проверяем типы при присваивании
        if isinstance(node.variable, AST.VariableReferenceNode):
            var_info = self.get_var_info(node.variable.name)
            if var_info:
                var_type = var_info[0]
                expr_type = self.infer_expression_type(node.expression)
                if not self.types_compatible(expr_type, var_type):
                    print(f"Warning: Assigning {expr_type} to {var_type} variable '{node.variable.name}'")
        
        self.visit(node.expression)
        self.kasm_code += "    psh %eax ; Save expression result\n"
        if isinstance(node.variable, AST.PropertyAccessNode):
            # Это присваивание полю, например, 'p.x : 10'
            var_name = node.variable.variable_name
            field_name = node.variable.property_name

            # 1. Вычисляем значение правой части и сохраняем в стеке
            self.visit(node.expression)
            self.kasm_code += "    psh %eax ; Save expression result\n"

            # 2. Получаем адрес поля в %ebx
            self._get_field_address(AST.VariableReferenceNode(var_name), field_name)
            
            # 3. Извлекаем значение из стека в %eax
            self.kasm_code += "    pop %eax ; Restore expression result\n"
            
            # 4. Определяем размер и инструкцию для записи
            var_info = self.get_var_info(var_name)
            struct_type = var_info[0]
            field_info = self.struct_definitions[struct_type]['fields'][field_name]
            op = {4: 'sd', 2: 'sw', 1: 'sb'}.get(field_info['size'], 'sd')
            
            # 5. Записываем значение по адресу
            self.kasm_code += f"    {op} %ebx %eax ; Store value into field '{field_name}'\n"
        elif isinstance(node.variable, AST.VariableReferenceNode):
            self.kasm_code += "    pop %eax ; Восстанавливаем результат для записи\n"
            var_name = node.variable.name
            var_info = self.get_var_info(var_name)
            if not var_info: raise NameError(f"Variable {var_name} not defined")
            var_type, location, element_size = var_info
            op = {4: 'sd', 2: 'sw', 1: 'sb'}.get(element_size, 'sd')
            if isinstance(location, int):
                self.kasm_code += f"    mov %ebx %ebp\n"
                if location > 0: self.kasm_code += f"    add %ebx {location}\n" 
                else: self.kasm_code += f"    sub %ebx {-location}\n"
                self.kasm_code += f"    {op} %ebx %eax\n"
            else:
                self.kasm_code += f"    mov %ebx {location}\n"
                self.kasm_code += f"    {op} %ebx %eax\n"
        
        elif isinstance(node.variable, AST.ArrayAccessNode):
            # Проверяем границы массива при присваивании
            self.check_array_bounds(node.variable.name, node.variable.index_node)
            # visit_array_address вычисляет адрес и кладет его в %ebx
            self.visit_array_address(node.variable)
            self.kasm_code += "    pop %eax ; Восстанавливаем результат для записи\n"
            _, _, element_size = self.get_var_info(node.variable.name)
            op = {4: 'sd', 2: 'sw', 1: 'sb'}.get(element_size, 'sd')
            self.kasm_code += f"    {op} %ebx %eax ; Записываем значение по адресу\n"
            
        # <<< НАЧАЛО ИЗМЕНЕНИЯ
        elif isinstance(node.variable, AST.DereferenceNode):
            # Обрабатываем присваивание вида: @ptr : 123
            # Сначала вычисляем адрес, хранящийся в указателе
            self.visit(node.variable.pointer_node)
            self.kasm_code += "    mov %ebx %eax  ; %ebx = адрес для записи\n"
            self.kasm_code += "    pop %eax       ; %eax = значение для записи\n"

            # Определяем размер данных для записи
            pointer_type = self.infer_expression_type(node.variable.pointer_node)
            base_type = pointer_type.replace('*', '')
            element_size = self.get_element_size(base_type)
            op = {4: 'sd', 2: 'sw', 1: 'sb'}.get(element_size, 'sd')
            
            self.kasm_code += f"    {op} %ebx %eax ; Записываем значение по разыменованному указателю\n"
        # <<< КОНЕЦ ИЗМЕНЕНИЯ
        
        else: 
            raise TypeError("Invalid assignment target")

    def visit_VariableDeclarationNode(self, node):
        # Эта функция теперь просто "пропускается" во время генерации кода,
        # так как вся работа по выделению памяти и регистрации переменных
        # была сделана на предварительном проходе в visit_FunctionDeclarationNode.
        # Однако нам все еще нужно обработать возможное присваивание при объявлении.
        if node.initial_value:
            # Проверяем, что это не структура, т.к. их инициализация при объявлении запрещена
            if node.var_type in self.struct_definitions:
                # Эта ошибка должна была быть поймана парсером, но дублируем для надежности
                raise TypeError(f"Initialization of struct '{node.name}' at declaration is not supported.")
            
            var_ref = AST.VariableReferenceNode(node.name)
            self.visit(AST.AssignmentNode(var_ref, node.initial_value))

    def visit_VariableReferenceNode(self, node):
        var_info = self.get_var_info(node.name)
        if not var_info: raise NameError(f"Variable '{node.name}' not defined.")
        
        var_type, location, element_size = var_info
        
        if var_type == 'array':
            if isinstance(location, int):
                self.kasm_code += f"    mov %eax %ebp\n"
                if location > 0: self.kasm_code += f"    add %eax {location}\n"
                else: self.kasm_code += f"    sub %eax {-location}\n"
            else:
                self.kasm_code += f"    mov %eax {location}\n"
            return
            
        op = {4: 'ld', 2: 'lw', 1: 'lb'}.get(element_size, 'ld')

        if isinstance(location, int):
            self.kasm_code += f"    mov %ebx %ebp\n"
            if location > 0: self.kasm_code += f"    add %ebx {location}\n"
            else: self.kasm_code += f"    sub %ebx {-location}\n"
        else:
            self.kasm_code += f"    mov %ebx {location}\n"
            
        if element_size != 4: self.kasm_code += "    mov %eax 0\n"
        self.kasm_code += f"    {op} %ebx %eax\n"

    def visit_array_address(self, node):
        """
        Вычисляет адрес элемента 'arr[i]' или 'ptr[i]' и помещает его в %ebx.
        Эта версия полностью автономна и не использует стек.
        """
        var_info = self.get_var_info(node.name)
        if not var_info:
            raise NameError(f"Identifier '{node.name}' is not defined.")
        
        var_type = var_info[0]
        
        if var_type != 'array' and not var_type.endswith('*'):
            raise NameError(f"Identifier '{node.name}' is not an array or a pointer and cannot be indexed.")

        # --- НАЧАЛО НОВОЙ ЛОГИКИ ---

        # 1. Вычисляем индекс и сохраняем его в %eax
        self.visit(node.index_node)
        
        # 2. Определяем размер элемента
        if var_type == 'array':
            element_size = var_info[2]
        else: # Указатель
            base_type_name = var_type.replace('*', '')
            element_size = self.get_element_size(base_type_name)

        # 3. Вычисляем смещение (offset = index * element_size)
        self.kasm_code += "    psh %ebx       ; Сохраняем %ebx\n"
        self.kasm_code += f"    mov %ebx {element_size}\n"
        self.kasm_code += "    mul %eax %ebx  ; eax = offset\n"
        self.kasm_code += "    mov %e8 %eax   ; Сохраняем offset в %e8\n"
        self.kasm_code += "    pop %ebx       ; Восстанавливаем %ebx\n"

        # 4. Получаем базовый адрес
        if var_type == 'array':
            _, location, _ = var_info
            if isinstance(location, int): # Локальный массив
                self.kasm_code += f"    mov %ebx %ebp\n"
                self.kasm_code += f"    sub %ebx {-location}\n"
            else: # Глобальный массив
                self.kasm_code += f"    mov %ebx {location}\n"
        else: # Указатель (параметр функции)
            # Нужно прочитать значение самого указателя (адрес)
            self.visit(AST.VariableReferenceNode(node.name))
            self.kasm_code += "    mov %ebx %eax  ; %ebx = базовый адрес (значение указателя)\n"

        # 5. Складываем базовый адрес и смещение для получения итогового адреса
        self.kasm_code += "    add %ebx %e8   ; %ebx = base_address + offset\n"

    def get_var_info(self, name):
        if self.current_function_name and name in self.scope_variables:
            info = self.scope_variables[name]
            return (info[0], info[1], info[2]) if info[0] == 'array' else (info[0], info[1], self.get_element_size(info[0]))
        elif name in self.global_variables:
            info = self.global_variables[name]
            return (info[0], info[1], info[2]) if info[0] == 'array' else (info[0], info[1], self.get_element_size(info[0]))
        return None

    def visit_StringLiteralNode(self, node):
        # node.segments: [(True, 'abc'), (False, 0x0A), ...]
        label = f"__str_init_{self.string_counter}"
        self.string_counter += 1
        line = ''
        for is_string, data in node.segments:
            if is_string:
                # Экранируем кавычки внутри строки
                safe = data.replace('"', '\\"')
                line += f'"{safe}" '
            else:
                line += f"${data:02X} "
        line += '0' # Завершающий ноль для строк
        self.data_section += f'{label}: bytes {line}\n'
        return label
    
    def visit_NumberLiteralNode(self, node):
        self.kasm_code += f"    mov %eax {node.value}\n"
        
    def visit_CharLiteralNode(self, node):
        self.kasm_code += f"    mov %eax {node.value}\n"
    
    def visit_KasmNode(self, node):
        # ### <-- ИЗМЕНЕНИЕ: Исправляем обработку KASM ###
        # Теперь node.code_string это список сегментов. Собираем его.
        code_string = self._reassemble_string_from_segments(node.code_string)
        self.kasm_code += f" {code_string}\n"
        
    def visit_KasmfNode(self, node):
        """
        Генерирует код для kasmf, изолируя побочные эффекты
        вычисления аргументов с помощью стека.
        """
        temp_registers = [
            "%e8", "%e9", "%e10", "%e11", "%e12", "%e13", "%e14", "%e15",
            "%e16", "%e17", "%e18", "%e19", "%e20", "%e21", "%e22", "%e23",
            "%e24", "%e25", "%e26", "%e27", "%e28", "%e29", "%e30", "%e31"
        ]
        
        if len(node.args) > len(temp_registers):
            raise ValueError(f"Too many arguments for kasmf, max supported is {len(temp_registers)}")

        format_string = self._reassemble_string_from_segments(node.format_string)
        
        arg_reg_names = []
        for arg_node in node.args:
            # Вычисляем выражение аргумента, результат будет в %eax
            self.visit(arg_node)
            
            # Сохраняем результат в безопасный временный регистр
            reg_name = f"%e{8 + self.kasmf_reg_idx}"
            self.kasmf_reg_idx = (self.kasmf_reg_idx + 1) % 24 # Циклично используем регистры e8-e31
            self.kasm_code += f" mov {reg_name} %eax\n"
            arg_reg_names.append(reg_name)
            
        # Теперь .format() будет работать, так как format_string - это строка
        formatted_code = format_string.format(*arg_reg_names)
        self.kasm_code += f" {formatted_code}\n"
        self.kasmf_reg_idx = 0 # Сбрасываем счетчик регистров

    def visit_BinaryOperationNode(self, node):
        """Генерирует код для всех бинарных операций."""
        
        # ### ИЗМЕНЕНИЕ: Универсальная логика для арифметических операций ###
        
        # 1. Вычисляем правый операнд
        self.visit(node.right)
        # 2. Сохраняем его в стеке
        self.kasm_code += " psh %eax\n"
        # 3. Вычисляем левый операнд, он остается в %eax
        self.visit(node.left)
        # 4. Извлекаем правый операнд из стека в %ebx
        self.kasm_code += " pop %ebx\n"
        
        # 5. Выполняем операцию
        op = node.operator
        if node.operator in ('&&', '||'):
            self.visit_LogicalOperationNode(node)
            return
        if op == '+':
            self.kasm_code += " add %eax %ebx\n"
        elif op == '-':
            # В GovnoCore32 нет `sub reg, reg`, поэтому эмулируем: a - b => a + (-b)
            self.kasm_code += " not %ebx\n"
            self.kasm_code += " inx %ebx\n"
            self.kasm_code += " add %eax %ebx\n"
        elif op == '*':
            # Убираем проверку и предупреждение. Генерируем `mul reg, reg`.
            # Если kasm это поддерживает, все будет работать.
            self.kasm_code += " mul %eax %ebx\n"
        elif op == '/' or op == '//': # Поддержка и / и // для целочисленного деления
            self.kasm_code += " div %eax %ebx\n"
        elif op == '%':
            # `div` помещает остаток в %edx
            self.kasm_code += " div %eax %ebx\n"
            self.kasm_code += " mov %eax %edx ; Remainder is in EDX\n"
        elif op == '<<':
            self.kasm_code += " sal %eax %ebx\n"
        elif op == '>>':
            self.kasm_code += " sar %eax %ebx\n"
        elif op == '&':
            self.kasm_code += " and %eax %ebx\n"
        elif op == '|':
            self.kasm_code += " ora %eax %ebx\n"
        elif op == '^':
            self.kasm_code += " xor %eax %ebx\n"
        else:
            raise NotImplementedError(f"Binary operator {op} not implemented in compiler.")

    def visit_LogicalOperationNode(self, node):
        """Генерирует код для && и || с short-circuiting."""
        end_label = f".L_logic_end_{self.label_counter}"
        self.label_counter += 1

        if node.operator == '&&':
            false_label = f".L_logic_false_{self.label_counter}"
            self.label_counter += 1
            
            self.visit(node.left)
            self.kasm_code += " cmp %eax 0\n"
            self.kasm_code += f" je {false_label}\n"

            self.visit(node.right)
            self.kasm_code += " cmp %eax 0\n"
            self.kasm_code += f" je {false_label}\n"

            self.kasm_code += " mov %eax 1\n" # True
            self.kasm_code += f" jmp {end_label}\n"
            self.kasm_code += f"{false_label}:\n"
            self.kasm_code += " mov %eax 0\n" # False
            self.kasm_code += f"{end_label}:\n"

        elif node.operator == '||':
            true_label = f".L_logic_true_{self.label_counter}"
            self.label_counter += 1

            self.visit(node.left)
            self.kasm_code += " cmp %eax 0\n"
            self.kasm_code += f" jne {true_label}\n"

            self.visit(node.right)
            self.kasm_code += " cmp %eax 0\n"
            self.kasm_code += f" jne {true_label}\n"

            self.kasm_code += " mov %eax 0\n" # False
            self.kasm_code += f" jmp {end_label}\n"
            self.kasm_code += f"{true_label}:\n"
            self.kasm_code += " mov %eax 1\n" # True
            self.kasm_code += f"{end_label}:\n"

            
    def visit_MatchNode(self, node):
        """
        Генерирует код для конструкции match [...] (case... default...)
        ФИНАЛЬНАЯ ВЕРСИЯ: Использует перевычисление для надежности.
        """
        end_match_label = f".L_match_end_{self.label_counter}"
        self.label_counter += 1

        case_blocks = []
        default_block = None
        block_counter = 0

        # Разделяем case и default и генерируем для них уникальные метки
        for case_node in node.cases:
            label = f".L_block_body_{self.label_counter}_{block_counter}"
            if case_node.is_default:
                default_block = (case_node, label)
            else:
                case_blocks.append((case_node, label))
            block_counter += 1

        # 1. Генерируем код сравнения для каждого case
        for case_node, case_label in case_blocks:
            # a. Вычисляем значение case (например, 1, 2, 5) и сохраняем его на стеке
            self.visit(case_node.value_node)
            self.kasm_code += "        psh %eax ; Save case value\n"

            # b. Вычисляем значение match-выражения (например, x)
            self.visit(node.expression_node)
            self.kasm_code += "        mov %ebx %eax ; Move match expression value to EBX for comparison\n"

            # c. Восстанавливаем значение case из стека в EAX
            self.kasm_code += "        pop %eax ; Restore case value to EAX for comparison\n"
            
            # d. Сравниваем case (%eax) с match (%ebx)
            self.kasm_code += "        cmp %eax %ebx\n"
            self.kasm_code += f"        je {case_label}\n"

        # 2. Если ни один case не совпал, переходим к default или в конец
        if default_block:
            self.kasm_code += f"        jmp {default_block[1]}\n"
        else:
            self.kasm_code += f"        jmp {end_match_label}\n"

        # 3. Генерируем тела для всех case
        for case_node, case_label in case_blocks:
            self.kasm_code += f"{case_label}:\n"
            for stmt in case_node.body:
                self.visit(stmt)
            # В конце тела каждого case прыгаем в конец всей конструкции
            self.kasm_code += f"        jmp {end_match_label}\n"

        # 4. Генерируем тело для default, если оно есть
        if default_block:
            self.kasm_code += f"{default_block[1]}:\n"
            for stmt in default_block[0].body:
                self.visit(stmt)
            # Неявный переход к концу

        # 5. Финальная метка
        self.kasm_code += f"{end_match_label}:\n"

    def visit_CaseNode(self, node):
        # Этот метод не должен вызываться напрямую. Вся логика в visit_MatchNode.
        pass
    
    def visit_WhileNode(self, node):
        """Генерирует код для цикла 'while [condition] ( body )'."""
        start_label = f".L_while_start_{self.label_counter}"
        end_label = f".L_while_end_{self.label_counter}"
        self.label_counter += 1

        # 1. Метка начала цикла, к которой мы будем возвращаться
        self.kasm_code += f"{start_label}:\n"

        # 2. Вычисляем условие. Результат (1 для истины, 0 для лжи) окажется в %eax
        self.visit(node.condition)
        
        # 3. Сравниваем результат с нулем, чтобы проверить, истинно ли условие
        self.kasm_code += "        cmp %eax 0\n"
        
        # 4. Если условие ложно (результат равен 0), выходим из цикла
        self.kasm_code += f"        je {end_label} ; Jump to end if condition is false\n"

        # 5. Если условие было истинно, генерируем код для тела цикла
        self.kasm_code += "        ; --- while-body ---\n"
        for statement in node.body:
            self.visit(statement)

        # 6. В конце тела цикла делаем безусловный переход в начало для повторной проверки
        self.kasm_code += f"        jmp {start_label}\n"

        # 7. Метка конца цикла, куда мы переходим, когда условие становится ложным
        self.kasm_code += f"{end_label}:\n"
        
    def visit_AddressOfNode(self, node):
        """Генерирует код для взятия адреса (&var) и помещает его в %eax."""
        target_node = node.node_to_address
        
        if isinstance(target_node, AST.VariableReferenceNode):
            var_name = target_node.name
            var_info = self.get_var_info(var_name)
            if not var_info:
                raise NameError(f"Variable '{var_name}' not defined.")
            
            _, location, _ = var_info
            
            if isinstance(location, int): # Локальная переменная или параметр
                self.kasm_code += f"    mov %eax %ebp\n"
                if location > 0: # Параметр
                    self.kasm_code += f"    add %eax {location}\n" 
                else: # Локальная переменная
                    self.kasm_code += f"    sub %eax {-location}\n"
            else: # Глобальная переменная
                self.kasm_code += f"    mov %eax {location}\n"
        
        elif isinstance(target_node, AST.ArrayAccessNode):
            # visit_array_address уже вычисляет адрес и помещает его в %ebx
            self.visit_array_address(target_node)
            self.kasm_code += "    mov %eax %ebx\n"
        else:
            raise TypeError(f"Cannot take the address of a {type(target_node).__name__}")
        
    def visit_DereferenceNode(self, node):
        """Генерирует код для разыменования указателя (@ptr) и помещает значение в %eax."""
        # Сначала получаем адрес, который хранится в указателе. Он окажется в %eax.
        self.visit(node.pointer_node)
        self.kasm_code += "    mov %ebx %eax ; EBX теперь хранит адрес для чтения\n"
        
        # Определяем тип, чтобы знать, сколько байт читать
        pointer_type = self.infer_expression_type(node.pointer_node)
        base_type = pointer_type.replace('*', '')
        element_size = self.get_element_size(base_type)
        
        op = {4: 'ld', 2: 'lw', 1: 'lb'}.get(element_size, 'ld')

        # Очищаем %eax перед чтением, чтобы избежать мусора в старших байтах
        if element_size != 4:
            self.kasm_code += "    mov %eax 0\n"

        self.kasm_code += f"    {op} %ebx %eax ; Загружаем значение по адресу из %ebx\n"
        
    def visit_ForNode(self, node):
        # 1. Выполняем инициализацию один раз перед циклом
        if node.init_node:
            self.visit(node.init_node)

        start_label = f".L_for_start_{self.label_counter}"
        end_label = f".L_for_end_{self.label_counter}"
        self.label_counter += 1

        # 2. Метка начала цикла
        self.kasm_code += f"{start_label}:\n"

        # 3. Проверяем условие
        if node.condition_node:
            self.visit(node.condition_node)
            self.kasm_code += "        cmp %eax 0\n"
            self.kasm_code += f"        je {end_label}\n"

        # 4. Выполняем тело цикла
        for statement in node.body:
            self.visit(statement)

        # 5. Выполняем инкремент в конце каждой итерации
        if node.increment_node:
            self.visit(node.increment_node)

        # 6. Возвращаемся в начало для следующей проверки
        self.kasm_code += f"        jmp {start_label}\n"

        # 7. Метка конца цикла
        self.kasm_code += f"{end_label}:\n"
        
    def visit_PropertyAccessNode(self, node):
        var_name = node.variable_name
        prop_name = node.property_name

        # Проверяем, не является ли это доступом к полю структуры
        var_info = self.get_var_info(var_name)
        if var_info and var_info[0] in self.struct_definitions:
            # Это доступ к полю структуры, например, 'player.x'
            struct_type = var_info[0]
            struct_def = self.struct_definitions[struct_type]
            if prop_name not in struct_def['fields']:
                raise NameError(f"Struct '{struct_type}' has no field named '{prop_name}'.")
            
            field_info = struct_def['fields'][prop_name]
            field_size = field_info['size']

            # 1. Вычисляем адрес поля и кладем его в %ebx
            self._get_field_address(AST.VariableReferenceNode(var_name), prop_name)
            
            # 2. Загружаем значение по этому адресу в %eax
            op = {4: 'ld', 2: 'lw', 1: 'lb'}.get(field_size, 'ld')
            if field_size != 4: self.kasm_code += "    mov %eax 0\n"
            self.kasm_code += f"    {op} %ebx %eax ; Load value of field '{prop_name}'\n"
            
            return # Завершаем выполнение
        
        # Если это не структура, то это, возможно, array.length
        if prop_name == "length":
            if var_name not in self.array_sizes:
                raise NameError(f"Cannot get .length of '{var_name}', as it is not a known array or struct.")
            
            array_length = self.array_sizes[var_name]
            self.kasm_code += f"    mov %eax {array_length} ; .length of {var_name}\n"
        else:
            raise NameError(f"Unknown property '{prop_name}' for variable '{var_name}'.")
        
    def visit_StructDeclarationNode(self, node):
        """Собирает метаданные о структуре: её размер и смещения полей."""
        if node.name in self.struct_definitions:
            raise NameError(f"Struct '{node.name}' is already defined.")

        current_offset = 0
        struct_fields = {}
        
        for field_type, field_name in node.fields:
            if field_name in struct_fields:
                raise NameError(f"Duplicate field name '{field_name}' in struct '{node.name}'.")
            
            field_size = self.get_element_size(field_type)
            
            struct_fields[field_name] = {
                'type': field_type,
                'offset': current_offset,
                'size': field_size
            }
            current_offset += field_size
            
        self.struct_definitions[node.name] = {
            'size': current_offset,
            'fields': struct_fields
        }

    def compile(self, ast_root, std_lib_code=""):
        declarations = ast_root.statements
        init_code = ""

        # --- ШАГ 1: ПРЕДВАРИТЕЛЬНЫЙ ПРОХОД ПО СТРУКТУРАМ ---
        # Сначала мы должны найти и обработать все объявления 'struct'.
        # Это необходимо, чтобы компилятор знал о существовании пользовательских типов
        # до того, как начнет обрабатывать переменные или функции, которые их используют.
        struct_declarations = [n for n in declarations if isinstance(n, AST.StructDeclarationNode)]
        for struct_node in struct_declarations:
            self.visit(struct_node)

        # --- ШАГ 2: РАЗДЕЛЕНИЕ ОСТАЛЬНЫХ ДЕКЛАРАЦИЙ ---
        # Теперь, когда структуры определены, мы можем разделить оставшиеся
        # объявления верхнего уровня на функции и глобальные переменные.
        functions = [n for n in declarations if isinstance(n, AST.FunctionDeclarationNode)]
        global_vars = [n for n in declarations if isinstance(n, (AST.VariableDeclarationNode, AST.ArrayDeclarationNode))]

        # --- ШАГ 3: ОБРАБОТКА ГЛОБАЛЬНЫХ ПЕРЕМЕННЫХ И МАССИВОВ ---
        # Проходим по всем глобальным переменным и выделяем для них место в секции данных.
        for node in global_vars:
            var_label = f"__var_{node.name}"
            
            # Определяем размер переменной. Он может быть базовым (num32) или размером структуры.
            if node.var_type in self.struct_definitions:
                elem_size = self.struct_definitions[node.var_type]['size']
            else:
                elem_size = self.get_element_size(node.var_type)
            
            if isinstance(node, AST.ArrayDeclarationNode):
                if not isinstance(node.size_node, AST.NumberLiteralNode):
                    raise TypeError("Global array size must be a constant number")
                total_size = node.size_node.value * elem_size
                self.global_variables[node.name] = ('array', var_label, elem_size)
                self.data_section += f"{var_label}: reserve {total_size} bytes\n"
                self.array_sizes[node.name] = node.size_node.value
            
            else: # Обычная переменная (включая экземпляры структур)
                self.global_variables[node.name] = (node.var_type, var_label)
                self.data_section += f"{var_label}: reserve {elem_size} bytes\n"
                if node.initial_value:
                    # Если есть инициализатор, генерируем код для него.
                    # Этот код будет вставлен в начало функции _start.
                    temp_compiler = Compiler()
                    temp_compiler.global_variables = self.global_variables
                    assignment_node = AST.AssignmentNode(AST.VariableReferenceNode(node.name), node.initial_value)
                    temp_compiler.visit(assignment_node)
                    init_code += temp_compiler.kasm_code
        
        # --- ШАГ 4: ВНЕДРЕНИЕ КОДА ИНИЦИАЛИЗАЦИИ В _start ---
        # Если были глобальные переменные с инициализаторами,
        # вставляем сгенерированный код в начало функции _start.
        has_start = False
        for func in functions:
            if func.name == '_start':
                has_start = True
                if init_code:
                    # Оборачиваем код в KasmNode и вставляем в самое начало тела функции
                    func.body.insert(0, AST.KasmNode(init_code))
                break
        if not has_start and init_code:
            raise SyntaxError("Global variable initializers require a '_start' function.")

        # --- ШАГ 5: КОМПИЛЯЦИЯ ВСЕХ ФУНКЦИЙ ---
        # Теперь, когда вся глобальная информация собрана, компилируем каждую функцию.
        for func_node in functions:
            self.visit(func_node)
        
        # --- ШАГ 6: СБОРКА ИТОГОВОГО ФАЙЛА ---
        # Собираем все части вместе: переход на _start, код библиотек,
        # скомпилированный код функций и секция данных.
        final_code = "jmp _start\n\n"
        final_code += std_lib_code + "\n"
        final_code += self.kasm_code
        if self.data_section:
            final_code += "\n; === Data Section ===\n" + self.data_section
            
        return final_code

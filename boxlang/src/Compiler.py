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
        self.current_function_name = None
        self.next_local_offset = 0
        
        # Новое: система типов и проверок
        self.function_signatures = {}  # Хранит сигнатуры функций
        self.array_sizes = {}          # Хранит размеры массивов для проверки границ
        
        # Регистрируем встроенные функции
        self._register_builtin_functions()

    def _register_builtin_functions(self):
        """Регистрирует встроенные функции стандартной библиотеки"""
        self.function_signatures.update({
            'print': {
                'params': [('char*', 'str')],  # Указатель на строку
                'return_type': None
            },
            'clear_screen': {
                'params': [],
                'return_type': None
            },
            'print_num': {
                'params': [('num32', 'number')],
                'return_type': None
            }
        })

    def get_element_size(self, type_name):
        return {'num32': 4, 'num16': 2, 'char': 1, 'float': 4, 'char*': 4}.get(type_name, 4)

    def register_function_signature(self, name, params, return_type=None):
        """Регистрирует сигнатуру функции для проверки типов"""
        self.function_signatures[name] = {
            'params': params,  # [(type, name), ...]
            'return_type': return_type
        }

    def check_function_call(self, name, args):
        """Проверяет соответствие аргументов сигнатуре функции"""
        if name not in self.function_signatures:
            # Для пользовательских функций разрешаем вызов
            return
            
        signature = self.function_signatures[name]
        expected_params = signature['params']
        
        if len(args) != len(expected_params):
            raise TypeError(f"Function '{name}' expects {len(expected_params)} arguments, got {len(args)}")
            
        # Проверяем типы аргументов
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
            if var_info and var_info[0] == 'array':
                # Возвращаем тип элемента массива
                array_type = self.get_array_element_type(expr_node.name)
                return array_type
            return 'unknown'
        elif isinstance(expr_node, AST.BinaryOperationNode):
            return 'num32'  # Арифметические операции возвращают num32
        elif isinstance(expr_node, AST.FunctionCallNode):
            if expr_node.name in self.function_signatures:
                return self.function_signatures[expr_node.name]['return_type'] or 'num32'
            return 'num32'  # По умолчанию для пользовательских функций
        return 'unknown'

    def types_compatible(self, actual_type, expected_type):
        """Проверяет совместимость типов"""
        if actual_type == expected_type:
            return True
        
        # Числовые типы частично совместимы
        numeric_types = ['num32', 'num16', 'char']
        if actual_type in numeric_types and expected_type in numeric_types:
            return True
            
        # Строки и массивы символов
        if actual_type == 'char*' and expected_type == 'char*':
            return True
            
        return False

    def get_array_element_type(self, array_name):
        """Возвращает тип элемента массива"""
        # Из имени переменной убираем префикс array_ если он есть
        if array_name in self.scope_variables:
            var_info = self.scope_variables[array_name]
            if var_info[0] == 'array':
                # Нужно сохранить тип элемента массива
                # Пока возвращаем на основе размера элемента
                element_size = var_info[2]
                size_to_type = {4: 'num32', 2: 'num16', 1: 'char'}
                return size_to_type.get(element_size, 'num32')
        return 'num32'

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
        raise Exception(f'No visit_{type(node).__name__} method for {type(node).__name__}')

    def visit_FunctionDeclarationNode(self, node):
        self.current_function_name = node.name
        self.scope_variables.clear()
        
        # Регистрируем функцию для проверки типов
        self.register_function_signature(node.name, node.params)
        
        # Обработка параметров функции (положительные смещения от ebp)
        param_offset = 8
        for param_type, param_name in node.params:
            self.scope_variables[param_name] = (param_type, param_offset)
            param_offset += 4

        # Предварительный проход для вычисления размера стека под локальные переменные
        self.next_local_offset = 0
        local_vars_size = 0
        for stmt in node.body:
            if isinstance(stmt, AST.VariableDeclarationNode):
                size = self.get_element_size(stmt.var_type)
                local_vars_size += size
                self.next_local_offset -= size
                self.scope_variables[stmt.name] = (stmt.var_type, self.next_local_offset)
            elif isinstance(stmt, AST.ArrayDeclarationNode):
                if not isinstance(stmt.size_node, AST.NumberLiteralNode):
                    raise TypeError("Array size must be a constant number for local arrays")
                element_size = self.get_element_size(stmt.var_type)
                array_size_bytes = stmt.size_node.value * element_size
                local_vars_size += array_size_bytes
                self.next_local_offset -= array_size_bytes
                self.scope_variables[stmt.name] = ('array', self.next_local_offset, element_size)
                # Сохраняем размер массива для проверки границ
                self.array_sizes[stmt.name] = stmt.size_node.value
        
        self.kasm_code += f"\n{self.current_function_name}:\n"
        
        if self.current_function_name != '_start':
            self.kasm_code += "    psh %ebp\n"
            self.kasm_code += "    mov %ebp %esp\n"
            
        self.kasm_code += "    add %ebp 1\n"
        
        if local_vars_size > 0:
            self.kasm_code += f"    sub %esp {local_vars_size} ; Allocate space for local variables and arrays\n"

        has_return = any(isinstance(stmt, AST.ReturnNode) for stmt in node.body)
        
        for statement in node.body:
            self.visit(statement)

        # Генерация эпилога
        if self.current_function_name != '_start':
            self.kasm_code += f".L_ret_{self.current_function_name}:\n"
            if not has_return:
                self.kasm_code += "    mov %eax 0 ; Default return value\n"
            
            self.kasm_code += "    mov %esp %ebp\n"
            self.kasm_code += "    sub %esp 1\n"
            self.kasm_code += "    pop %ebp\n"
            self.kasm_code += "    rts\n"
        else:
             self.kasm_code += "    hlt ; Program end\n"
        
        self.current_function_name = None
        
    def visit_ReturnNode(self, node):
        self.visit(node.value_node)
        self.kasm_code += f"    jmp .L_ret_{self.current_function_name}\n"

    def visit_FunctionCallNode(self, node):
        # Проверяем типы аргументов
        self.check_function_call(node.name, node.args)
        
        for arg_node in reversed(node.args):
            self.visit(arg_node)
            self.kasm_code += "    psh %eax\n"
        
        self.kasm_code += f"    jsr {node.name}\n"
        if node.args:
            self.kasm_code += f"    add %esp {len(node.args) * 4}\n"

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
        # Сохраняем размер массива для проверки границ
        if isinstance(node.size_node, AST.NumberLiteralNode):
            self.array_sizes[node.name] = node.size_node.value
        pass

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
        if isinstance(node.variable, AST.ArrayAccessNode):
            # Проверяем границы массива при присваивании
            self.check_array_bounds(node.variable.name, node.variable.index_node)
            
            self.visit_array_address(node.variable)
            self.kasm_code += "    pop %eax ; Restore expression result\n"
            _, _, element_size = self.get_var_info(node.variable.name)
            op = {4: 'sd', 2: 'sw', 1: 'sb'}.get(element_size, 'sd')
            self.kasm_code += f"    {op} %ebx %eax ; Store value at address\n"
        elif isinstance(node.variable, AST.VariableReferenceNode):
            self.kasm_code += "    pop %eax ; Restore expression result\n"
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
        else: raise TypeError("Invalid assignment target")

    def visit_VariableDeclarationNode(self, node):
        if node.initial_value:
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
        """Вычисляет адрес элемента массива и помещает его в %ebx."""
        var_info = self.get_var_info(node.name)
        if not var_info or var_info[0] != 'array':
            raise NameError(f"Identifier '{node.name}' is not an array.")
        
        _, location, element_size = var_info

        self.visit(node.index_node)
        self.kasm_code += "    psh %eax ; Save index\n"
        self.kasm_code += f"    mov %ebx {element_size}\n"
        self.kasm_code += "    mul %eax %ebx ; eax = index * size\n"
        self.kasm_code += "    mov %e8 %eax ; Save final offset to e8\n"

        if isinstance(location, int):
            self.kasm_code += f"    mov %ebx %ebp\n"
            if location > 0:
                self.kasm_code += f"    add %ebx {location} ; ebx = base address (param array)\n"
            else:
                self.kasm_code += f"    sub %ebx {-location} ; ebx = base address of local array\n"
        else:
            self.kasm_code += f"    mov %ebx {location} ; ebx = base address of global array\n"

        self.kasm_code += "    add %ebx %e8 ; ebx = base_address + offset\n"
        self.kasm_code += "    pop %eax ; Restore index (and clean stack)\n"

    def get_var_info(self, name):
        if self.current_function_name and name in self.scope_variables:
            info = self.scope_variables[name]
            return (info[0], info[1], info[2]) if info[0] == 'array' else (info[0], info[1], self.get_element_size(info[0]))
        elif name in self.global_variables:
            info = self.global_variables[name]
            return (info[0], info[1], info[2]) if info[0] == 'array' else (info[0], info[1], self.get_element_size(info[0]))
        return None

    def visit_StringLiteralNode(self, node):
        str_label = f"__str_{self.string_counter}"
        self.string_counter += 1
        self.data_section += f'{str_label}: bytes "{node.value}" 0\n'
        self.kasm_code += f"    mov %eax {str_label}\n"
    
    def visit_NumberLiteralNode(self, node):
        self.kasm_code += f"    mov %eax {node.value}\n"
        
    def visit_CharLiteralNode(self, node):
        self.kasm_code += f"    mov %eax {node.value}\n"
    
    def visit_KasmNode(self, node):
        self.kasm_code += f"    {node.code_string}\n"

    def visit_BinaryOperationNode(self, node):
        self.visit(node.left)
        self.kasm_code += "    psh %eax\n"
        self.visit(node.right)
        self.kasm_code += "    mov %ebx %eax\n"
        self.kasm_code += "    pop %eax\n"
        op_map = {'+': 'add', '-': 'sub', '*': 'mul', '/': 'div'}
        if node.operator in op_map:
            self.kasm_code += f"    {op_map[node.operator]} %eax %ebx\n"

    def compile(self, ast_root, std_lib_code=""):
        init_code = ""
        declarations = ast_root.statements
        functions = [n for n in declarations if isinstance(n, AST.FunctionDeclarationNode)]
        
        # Обработка глобальных переменных и массивов
        for node in declarations:
            if isinstance(node, (AST.VariableDeclarationNode, AST.ArrayDeclarationNode)):
                var_label = f"__var_{node.name}"
                elem_size = self.get_element_size(node.var_type)
                
                if isinstance(node, AST.ArrayDeclarationNode):
                    if not isinstance(node.size_node, AST.NumberLiteralNode):
                        raise TypeError("Global array size must be a constant number")
                    total_size = node.size_node.value * elem_size
                    self.global_variables[node.name] = ('array', var_label, elem_size)
                    self.data_section += f"{var_label}: reserve {total_size} bytes\n"
                    # Сохраняем размер глобального массива
                    self.array_sizes[node.name] = node.size_node.value
                
                else:
                    self.global_variables[node.name] = (node.var_type, var_label)
                    self.data_section += f"{var_label}: reserve {elem_size} bytes\n"
                    if node.initial_value:
                        temp_compiler = Compiler()
                        temp_compiler.global_variables = self.global_variables
                        assignment_node = AST.AssignmentNode(AST.VariableReferenceNode(node.name), node.initial_value)
                        temp_compiler.visit(assignment_node)
                        init_code += temp_compiler.kasm_code
        
        # Внедрение кода инициализации в функцию _start
        has_start = False
        for func in functions:
            if func.name == '_start':
                has_start = True
                if init_code:
                    func.body.insert(0, AST.KasmNode(init_code))
                break
        if not has_start and init_code:
            raise SyntaxError("Global variable initializers require a '_start' function.")

        # Генерация кода для всех функций
        for func_node in functions:
            self.visit(func_node)
        
        final_code = "jmp _start\n\n"
        final_code += std_lib_code + "\n"
        final_code += self.kasm_code
        if self.data_section:
            final_code += "\n; === Data Section ===\n" + self.data_section
            
        return final_code

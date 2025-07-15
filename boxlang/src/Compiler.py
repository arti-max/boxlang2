# boxlang/src/Compiler.py

from lib import AST

class Compiler:
    def __init__(self):
        self.kasm_code = ""
        self.data_section = ""
        self.string_counter = 0
        
        self.global_variables = {}
        # Формат: { "имя": (смещение_от_ebp, "тип_данных") }
        self.scope_variables = {} 
        self.current_function_name = None
        self.next_local_offset = 0

    def visit(self, node):
        method_name = f'visit_{type(node).__name__}'
        visitor = getattr(self, method_name, self.generic_visit)
        return visitor(node)

    def generic_visit(self, node):
        raise Exception(f'No visit_{type(node).__name__} method for {type(node).__name__}')

    def visit_FunctionDeclarationNode(self, node):
        self.current_function_name = node.name
        self.scope_variables.clear()
        
        param_offset = 8
        for param_type, param_name in node.params:
            self.scope_variables[param_name] = (param_offset, param_type)
            param_offset += 4

        self.next_local_offset = 0
        local_vars_size = 0
        for stmt in node.body:
            if isinstance(stmt, AST.VariableDeclarationNode):
                size = {'num32': 4, 'num16': 2, 'char': 1}.get(stmt.var_type, 4)
                local_vars_size += size
                self.next_local_offset -= size
                self.scope_variables[stmt.name] = (self.next_local_offset, stmt.var_type)
        
        self.kasm_code += f"\n{self.current_function_name}:\n"
        
        if self.current_function_name != '_start':
            self.kasm_code += "    psh %ebp\n"
            self.kasm_code += "    mov %ebp %esp\n"
        
        if local_vars_size > 0:
            self.kasm_code += f"    sub %esp {local_vars_size} ; Выделяем место для локальных переменных\n"

        for statement in node.body:
            self.visit(statement)

        if self.current_function_name == '_start':
            self.kasm_code += "    hlt ; Завершение программы\n"
        else:
            # Всегда генерируем эпилог, даже для пустых функций
            self.kasm_code += f".L_ret_{self.current_function_name}:\n"
            self.kasm_code += "    mov %esp %ebp\n"
            self.kasm_code += "    pop %ebp\n"
            self.kasm_code += "    rts\n"
        
        self.current_function_name = None

    def visit_FunctionCallNode(self, node):
        for arg_node in reversed(node.args):
            self.visit(arg_node)
            self.kasm_code += "    psh %eax\n"
        
        if node.name == "print":
             # Аргумент для print должен быть в %esi
             self.kasm_code += "    pop %esi\n"
             self.kasm_code += f"    jsr {node.name}\n"
             # Очищаем стек, если были другие (лишние) аргументы
             if len(node.args) > 1:
                  self.kasm_code += f"    add %esp {(len(node.args)-1) * 4}\n"
        else:
            self.kasm_code += f"    jsr {node.name}\n"
            if node.args:
                self.kasm_code += f"    add %esp {len(node.args) * 4}\n"

    def visit_VariableDeclarationNode(self, node):
        if node.initial_value:
            self.visit(AST.AssignmentNode(node.name, node.initial_value))

    def visit_AssignmentNode(self, node):
        self.visit(node.expression)
        
        # Защищаем %eax, так как вычисление адреса может его испортить
        self.kasm_code += "    mov %e8 %eax\n"

        if self.current_function_name and node.variable_name in self.scope_variables:
            offset, var_type = self.scope_variables[node.variable_name]
            op = {'num32': 'sd', 'num16': 'sw', 'char': 'sb'}.get(var_type, 'sd')
            self.kasm_code += "    mov %ebx %ebp\n"
            if offset > 0: self.kasm_code += f"    add %ebx {offset}\n"
            else: self.kasm_code += f"    sub %ebx {-offset}\n"
            self.kasm_code += "    mov %eax %e8\n" # Восстанавливаем значение
            self.kasm_code += f"    {op} %ebx %eax\n" # sd addr_reg, data_reg
        elif node.variable_name in self.global_variables:
            var_type, var_label = self.global_variables[node.variable_name]
            op = {'num32': 'sd', 'num16': 'sw', 'char': 'sb'}.get(var_type, 'sd')
            self.kasm_code += f"    mov %ebx {var_label}\n"
            self.kasm_code += "    mov %eax %e8\n" # Восстанавливаем значение
            self.kasm_code += f"    {op} %ebx %eax\n" # sd addr_reg, data_reg
        else: raise NameError(f"Переменная {node.variable_name} не определена")

    def visit_VariableReferenceNode(self, node):
        op_map = {'num32': 'ld', 'num16': 'lw', 'char': 'lb'}
        
        # Локальная область (включая параметры)
        if self.current_function_name and node.name in self.scope_variables:
            offset, var_type = self.scope_variables[node.name]
            op = op_map.get(var_type, 'ld')
            self.kasm_code += "    mov %ebx %ebp\n"
            if offset > 0: self.kasm_code += f"    add %ebx {offset}\n"
            else: self.kasm_code += f"    sub %ebx {-offset}\n"
            if var_type != 'num32': self.kasm_code += "    mov %eax 0\n"
            # ИСПРАВЛЕНИЕ: ld <addr_reg>, <dest_reg>
            self.kasm_code += f"    {op} %ebx %eax\n"
        # Глобальная область
        elif node.name in self.global_variables:
            var_type, var_label = self.global_variables[node.name]
            op = op_map.get(var_type, 'ld')
            self.kasm_code += f"    mov %ebx {var_label}\n"
            if var_type != 'num32': self.kasm_code += "    mov %eax 0\n"
            # ИСПРАВЛЕНИЕ: ld <addr_reg>, <dest_reg>
            self.kasm_code += f"    {op} %ebx %eax\n"
        else: raise NameError(f"Переменная {node.name} не определена")
            
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
        # 1. Вычисляем левый операнд, сохраняем в %e8
        self.visit(node.left)
        self.kasm_code += "    mov %e8 %eax\n"
        # 2. Вычисляем правый операнд, он остается в %eax
        self.visit(node.right)
        # 3. Перемещаем правый операнд в %ebx
        self.kasm_code += "    mov %ebx %eax\n"
        # 4. Восстанавливаем левый операнд из %e8 в %eax
        self.kasm_code += "    mov %eax %e8\n"
        
        # 5. Выполняем операцию: eax = eax + ebx (left + right)
        op_map = {'+': 'add', '-': 'sub', '*': 'mul', '/': 'div'}
        if node.operator in op_map:
            self.kasm_code += f"    {op_map[node.operator]} %eax %ebx\n"

    def compile(self, ast_root, std_lib_code=""):
        # Изолированный компилятор для генерации кода инициализации
        init_code_compiler = Compiler() 
        init_code = ""
        
        global_vars = [n for n in ast_root.statements if isinstance(n, AST.VariableDeclarationNode)]
        functions = [n for n in ast_root.statements if isinstance(n, AST.FunctionDeclarationNode)]
        
        # Обработка глобальных переменных
        for var_node in global_vars:
            var_label = f"__var_{var_node.name}"
            self.global_variables[var_node.name] = (var_node.var_type, var_label)
            size = {'num32': 4, 'num16': 2, 'char': 1}.get(var_node.var_type, 4)
            self.data_section += f"{var_label}: reserve {size} bytes\n"
            if var_node.initial_value:
                # Генерируем код для присваивания значения
                init_code_compiler.visit(var_node.initial_value)
                op = {'num32': 'sd', 'num16': 'sw', 'char': 'sb'}.get(var_node.var_type, 'sd')
                init_code_compiler.kasm_code += "    mov %e8 %eax\n" # Защита
                init_code_compiler.kasm_code += f"    mov %ebx {var_label}\n"
                init_code_compiler.kasm_code += "    mov %eax %e8\n" # Восстановление
                init_code_compiler.kasm_code += f"    {op} %ebx %eax\n"
        
        init_code = init_code_compiler.kasm_code

        # Вставляем код инициализации в начало тела функции _start
        for func in functions:
            if func.name == '_start':
                # Создаем узел для кода инициализации
                init_node = AST.KasmNode(init_code) if init_code else None
                if init_node:
                    func.body.insert(0, init_node)
                break

        # Генерируем код функций
        for func_node in functions:
            self.visit(func_node)
        
        # Собираем итоговый файл
        final_code = "jmp _start\n\n"
        final_code += std_lib_code + "\n"
        final_code += self.kasm_code
        if self.data_section:
            final_code += "\n; === Data Section ===\n" + self.data_section
            
        return final_code

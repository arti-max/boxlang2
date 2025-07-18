from lib.TokenType import TokenType
from lib import AST

class Parser:
    def __init__(self, lexer, error_handler):
        self.lexer = lexer
        self.error_handler = error_handler
        self.current_token = self.lexer.get_next_token()

    def eat(self, token_type):
        if self.current_token.type == token_type:
            self.current_token = self.lexer.get_next_token()
        else:
            self.error_handler.raise_syntax_error(
                f"Expected token {token_type.name}, but got {self.current_token.type.name}",
                self.current_token
            )

    def parse_block(self):
        """Парсит блок инструкций, заключенный в скобки (...) или {...}."""
        statements = []
        # Тело может содержать любые валидные инструкции
        end_tokens = [TokenType.PAREN_CLOSE, TokenType.CURLY_CLOSE, TokenType.EOF]
        
        while self.current_token.type not in end_tokens:
            statements.append(self.parse_statement())
            
        return statements
    
    def parse_type(self):
        """
        Парсит объявление типа и, возможно, следующий за ним '*' для указателей.
        Возвращает строку типа, например 'num32' или 'num32*'.
        """
        base_type_tokens = [TokenType.NUM32, TokenType.NUM16, TokenType.CHAR, TokenType.FLOAT]
        
        if self.current_token.type not in base_type_tokens:
             self.error_handler.raise_syntax_error("Expected a data type (e.g., num32, char)", self.current_token)

        base_type_name = self.current_token.value
        self.eat(self.current_token.type)
        
        # Проверяем, является ли это указателем
        if self.current_token.type == TokenType.MULTIPLY:
            self.eat(TokenType.MULTIPLY)
            # Возвращаем строку 'тип*'
            return f"{base_type_name}*"
        
        return base_type_name
    
    def parse_unary(self):
        """Парсит унарные операторы (&, @)."""
        token = self.current_token
        if token.type == TokenType.AMPERSAND:
            self.eat(TokenType.AMPERSAND)
            # Узел, адрес которого мы берем. Рекурсивно вызываем parse_unary,
            # чтобы обработать, например, &@ptr.
            node = self.parse_unary()
            # Проверяем, что адрес берется от допустимого объекта (l-value).
            if not isinstance(node, (AST.VariableReferenceNode, AST.ArrayAccessNode, AST.DereferenceNode)):
                self.error_handler.raise_syntax_error(
                    "Operator '&' can only be applied to a variable, array element, or a dereferenced pointer.", token
                )
            return AST.AddressOfNode(node)
            
        elif token.type == TokenType.AT:
            self.eat(TokenType.AT)
            # Рекурсивный вызов для поддержки вложенного разыменования, например, @@ptr.
            node = self.parse_unary()
            return AST.DereferenceNode(node)
            
        # Если унарного оператора нет, парсим базовый элемент (число, переменную, скобки).
        return self.parse_term()

    def parse_statement(self):
        """Парсит одну инструкцию."""
        token_type = self.current_token.type

        # Сначала проверяем на ключевые слова, начинающие инструкцию
        if token_type == TokenType.KASM:
            return self.parse_kasm_statement()
        if token_type == TokenType.KASMF:
            return self.parse_kasmf_statement()
        if token_type == TokenType.FOR:
            return self.parse_for_statement()
        if token_type == TokenType.IF:
            return self.parse_if_statement()
        if token_type == TokenType.MATCH:
            return self.parse_match_statement()
        if token_type == TokenType.WHILE:
            return self.parse_while_statement()
        if token_type == TokenType.RET:
            return self.parse_return_statement()

        # --- НОВАЯ УЛУЧШЕННАЯ ЛОГИКА ---
        # Определяем, является ли это объявлением переменной.
        # Это объявление, если оно начинается со встроенного типа (num32 и т.д.)
        # ИЛИ если это идентификатор, за которым следует другой идентификатор ("Player p1").
        is_declaration = token_type in [TokenType.NUM32, TokenType.NUM16, TokenType.CHAR, TokenType.FLOAT]
        if not is_declaration and token_type == TokenType.IDENT:
            # Заглядываем на один токен вперед, не "съедая" его
            if self.lexer.peek().type == TokenType.IDENT:
                is_declaration = True
        
        if is_declaration:
            return self.parse_variable_or_array_declaration()
        
        # Если это не объявление, то это должна быть инструкция на основе выражения:
        # присваивание или вызов функции.
        
        # Парсим левую часть как полноценное выражение.
        # Это может быть 'my_var', 'my_array[0]', '@my_ptr' или вызов функции.
        left_node = self.parse_expression()

        # Если после выражения идет ':', значит, это присваивание.
        if self.current_token.type == TokenType.COLON:
            self.eat(TokenType.COLON)
            
            # Проверяем, что левая часть является допустимой целью (l-value)
            if not isinstance(left_node, (AST.VariableReferenceNode, AST.ArrayAccessNode, AST.DereferenceNode, AST.PropertyAccessNode)):
                self.error_handler.raise_syntax_error(
                    "Invalid assignment target.", self.current_token
                )
            
            right_expression = self.parse_expression()
            return AST.AssignmentNode(left_node, right_expression)
        
        # Если это не присваивание, то это должно быть выражение, имеющее смысл само по себе,
        # например, вызов функции. Такие выражения, как 'a + b', бессмысленны как отдельная инструкция.
        if not isinstance(left_node, AST.FunctionCallNode):
            self.error_handler.raise_syntax_error(
                "This statement has no effect. Only function calls or assignments are allowed here.", 
                self.current_token
            )
            
        return left_node

    def parse_if_statement(self):
        """Парсит конструкцию 'if [condition] ( if_body ) else ( else_body )'."""
        self.eat(TokenType.IF)
        
        self.eat(TokenType.BRACKET_OPEN)
        condition_node = self.parse_expression()
        self.eat(TokenType.BRACKET_CLOSE)
        
        self.eat(TokenType.PAREN_OPEN)
        if_body = self.parse_block()
        self.eat(TokenType.PAREN_CLOSE)
        
        else_body = None
        if self.current_token.type == TokenType.ELSE:
            self.eat(TokenType.ELSE)
            self.eat(TokenType.PAREN_OPEN)
            else_body = self.parse_block()
            self.eat(TokenType.PAREN_CLOSE)
            
        # ИСПРАВЛЕНО: была опечатка 'condition' вместо 'condition_node'
        return AST.IfNode(condition_node, if_body, else_body)
    
    def parse_match_statement(self):
        """Парсит конструкцию 'match [expr] ( case... default... )'."""
        self.eat(TokenType.MATCH)
        
        self.eat(TokenType.BRACKET_OPEN)
        expression_node = self.parse_expression()
        self.eat(TokenType.BRACKET_CLOSE)
        
        self.eat(TokenType.PAREN_OPEN)
        
        cases = []
        has_default = False
        
        # Парсим все блоки case и default внутри (...)
        while self.current_token.type in [TokenType.CASE, TokenType.DEFAULT]:
            if self.current_token.type == TokenType.CASE:
                self.eat(TokenType.CASE)
                
                self.eat(TokenType.BRACKET_OPEN)
                # В case пока поддерживаем только литералы (числа, символы)
                value_node = self.parse_term() 
                if not isinstance(value_node, (AST.NumberLiteralNode, AST.CharLiteralNode)):
                    self.error_handler.raise_syntax_error(
                        "Case value must be a number or char literal.", self.current_token
                    )
                self.eat(TokenType.BRACKET_CLOSE)
                
                self.eat(TokenType.PAREN_OPEN)
                body = self.parse_block()
                self.eat(TokenType.PAREN_CLOSE)
                
                cases.append(AST.CaseNode(value_node, body, is_default=False))

            elif self.current_token.type == TokenType.DEFAULT:
                if has_default:
                    self.error_handler.raise_syntax_error(
                        "Multiple default blocks in one match statement.", self.current_token
                    )
                has_default = True
                
                self.eat(TokenType.DEFAULT)
                
                self.eat(TokenType.PAREN_OPEN)
                body = self.parse_block()
                self.eat(TokenType.PAREN_CLOSE)
                
                cases.append(AST.CaseNode(None, body, is_default=True))
        
        self.eat(TokenType.PAREN_CLOSE)
        
        return AST.MatchNode(expression_node, cases)
    
    def parse_while_statement(self):
        """Парсит конструкцию 'while [condition] ( body )'."""
        self.eat(TokenType.WHILE)
        
        self.eat(TokenType.BRACKET_OPEN)
        condition_node = self.parse_expression()
        self.eat(TokenType.BRACKET_CLOSE)
        
        self.eat(TokenType.PAREN_OPEN)
        body = self.parse_block()
        self.eat(TokenType.PAREN_CLOSE)
        
        return AST.WhileNode(condition_node, body)

    # --- Иерархия парсинга выражений с учетом приоритета ---
    # Этот блок кода заменяет старые методы parse_expression и parse_term

    def parse_expression(self):
        """Высший уровень выражения. Начинаем со сравнения."""
        return self.parse_comparison()

    def parse_comparison(self):
        """Парсит операции сравнения: a == b, a < b, и т.д."""
        node = self.parse_additive()
        op_types = [TokenType.EQ_EQ, TokenType.NOT_EQ, TokenType.LT, TokenType.GT, TokenType.LTE, TokenType.GTE]
        
        if self.current_token.type in op_types:
            op = self.current_token
            self.eat(op.type)
            right = self.parse_additive()
            node = AST.ComparisonNode(left=node, op=op.value, right=right)
            
        return node

    def parse_additive(self):
        """Парсит сложение и вычитание."""
        node = self.parse_multiplicative()
        while self.current_token.type in (TokenType.PLUS, TokenType.MINUS):
            op_token = self.current_token
            self.eat(op_token.type)
            right = self.parse_multiplicative()
            node = AST.BinaryOperationNode(left=node, operator=op_token.value, right=right)
        return node

    def parse_multiplicative(self):
        """Парсит умножение и деление."""
        node = self.parse_unary()  # <<< ИЗМЕНЕНИЕ
        while self.current_token.type in (TokenType.MULTIPLY, TokenType.DIVIDE):
            op_token = self.current_token
            self.eat(op_token.type)
            right = self.parse_unary() # <<< ИЗМЕНЕНИЕ
            node = AST.BinaryOperationNode(left=node, operator=op_token.value, right=right)
        return node

    def parse_term(self):
        """Парсит самые базовые элементы: числа, переменные, вызовы функций и скобки."""
        token = self.current_token
        if token.type == TokenType.NUMBER:
            self.eat(TokenType.NUMBER)
            return AST.NumberLiteralNode(token.value)
        elif token.type == TokenType.CHAR_LIT:
            self.eat(TokenType.CHAR_LIT)
            return AST.CharLiteralNode(token.value)
        elif token.type == TokenType.STRING:
            self.eat(TokenType.STRING)
            return AST.StringLiteralNode(token.value)
        elif token.type == TokenType.IDENT:
            return self.parse_variable_or_array_access()
        elif token.type == TokenType.OPEN:
            return self.parse_function_call()
        elif token.type == TokenType.PAREN_OPEN:
            self.eat(TokenType.PAREN_OPEN)
            node = self.parse_expression()
            self.eat(TokenType.PAREN_CLOSE)
            return node
        
        self.error_handler.raise_syntax_error(
            f"Unexpected token in expression: {token.type.name}", token
        )
        
    # --- Конец иерархии парсинга выражений ---

    def parse_assignment(self):
        """Парсит 'var : expr' или 'arr[idx] : expr'."""
        left_node = self.parse_variable_or_array_access()
        self.eat(TokenType.COLON)
        expression = self.parse_expression()
        return AST.AssignmentNode(left_node, expression)

    def parse_variable_or_array_access(self):
        """Парсит 'var', 'arr[idx]' или 'arr.length'."""
        var_name_token = self.current_token
        self.eat(TokenType.IDENT)
        
        if self.current_token.type == TokenType.BRACKET_OPEN:
            # Доступ к элементу массива: arr[idx]
            self.eat(TokenType.BRACKET_OPEN)
            index_node = self.parse_expression()
            self.eat(TokenType.BRACKET_CLOSE)
            return AST.ArrayAccessNode(var_name_token.value, index_node)
        
        elif self.current_token.type == TokenType.DOT:
            # Доступ к свойству: arr.length
            self.eat(TokenType.DOT)
            property_name_token = self.current_token
            self.eat(TokenType.IDENT)
            return AST.PropertyAccessNode(var_name_token.value, property_name_token.value)
        
        else:
            # Обычная ссылка на переменную
            return AST.VariableReferenceNode(var_name_token.value)
            
    def parse_variable_or_array_declaration(self):
        """Парсит 'num32 x', 'num32* p', 'num32 arr[10]' и 'Player p'."""
        
        # Тип теперь может быть не только ключевым словом (num32),
        # но и идентификатором (имя структуры, например, Player)
        if self.current_token.type in [TokenType.NUM32, TokenType.NUM16, TokenType.CHAR, TokenType.FLOAT]:
             var_type_value = self.parse_type()
        elif self.current_token.type == TokenType.IDENT:
            # Это объявление переменной типа структуры, например 'Player p'
            var_type_value = self.current_token.value
            self.eat(TokenType.IDENT)
        else:
            self.error_handler.raise_syntax_error(
                "Expected a data type or a struct name.", self.current_token
            )

        var_name = self.current_token
        self.eat(TokenType.IDENT)
        
        if self.current_token.type == TokenType.BRACKET_OPEN:
            # Массивы структур пока не поддерживаем, но основа заложена
            self.eat(TokenType.BRACKET_OPEN)
            size_node = self.parse_expression()
            self.eat(TokenType.BRACKET_CLOSE)
            return AST.ArrayDeclarationNode(var_type_value, var_name.value, size_node)
        
        # --- ИСПРАВЛЕНИЕ НАЧАЛО ---
        # Возвращаем старую, правильную логику. Парсер должен просто
        # разбирать синтаксис, а не проверять правила.
        initial_value = None
        if self.current_token.type == TokenType.COLON:
            self.eat(TokenType.COLON)
            initial_value = self.parse_expression()
        # --- ИСПРАВЛЕНИЕ КОНЕЦ ---
        
        return AST.VariableDeclarationNode(var_type_value, var_name.value, initial_value)

    def parse_function_call(self):
        """Парсит 'open func[arg1, arg2]'."""
        self.eat(TokenType.OPEN)
        name_token = self.current_token
        self.eat(TokenType.IDENT)
        
        self.eat(TokenType.BRACKET_OPEN)
        args = []
        if self.current_token.type != TokenType.BRACKET_CLOSE:
            args.append(self.parse_expression())
            while self.current_token.type == TokenType.COMMA:
                self.eat(TokenType.COMMA)
                args.append(self.parse_expression())
        
        self.eat(TokenType.BRACKET_CLOSE)
        return AST.FunctionCallNode(name_token.value, args)

    def parse_return_statement(self):
        self.eat(TokenType.RET)
        value_node = self.parse_expression()
        return AST.ReturnNode(value_node)

    def parse_param_list(self):
        params = []
        self.eat(TokenType.BRACKET_OPEN)
        
        if self.current_token.type != TokenType.BRACKET_CLOSE:
            while True:
                # --- ИЗМЕНЕНИЕ НАЧАЛО ---
                # Используем наш вспомогательный метод parse_type, чтобы 
                # корректно обработать типы 'num32' и 'num32*'.
                param_type_value = self.parse_type()
                
                param_name = self.current_token
                self.eat(TokenType.IDENT)
                
                # Сохраняем полное имя типа ('num32*') и имя параметра.
                params.append((param_type_value, param_name.value))
                # --- ИЗМЕНЕНИЕ КОНЕЦ ---

                if self.current_token.type != TokenType.COMMA:
                    break
                self.eat(TokenType.COMMA)
        
        self.eat(TokenType.BRACKET_CLOSE)
        return params
        
    def parse_function_declaration(self):
        """Парсит 'box name[params] ( body )'."""
        self.eat(TokenType.BOX)
        name = self.current_token
        self.eat(TokenType.IDENT)
        params = self.parse_param_list()
        
        self.eat(TokenType.PAREN_OPEN)
        body = self.parse_block()
        self.eat(TokenType.PAREN_CLOSE)
        
        return AST.FunctionDeclarationNode(name.value, params, body)
    
    def parse_kasm_statement(self):
        """Парсит 'kasm["..."]'."""
        self.eat(TokenType.KASM)
        self.eat(TokenType.BRACKET_OPEN)
        
        string_token = self.current_token
        if string_token.type != TokenType.STRING:
            self.error_handler.raise_syntax_error("Expected a string literal inside kasm.", string_token)
        self.eat(TokenType.STRING)
        
        self.eat(TokenType.BRACKET_CLOSE)
        return AST.KasmNode(string_token.value)

    def parse_kasmf_statement(self):
        """Парсит 'kasmf["...", arg1, arg2]'."""
        self.eat(TokenType.KASMF)
        self.eat(TokenType.BRACKET_OPEN)
        
        format_string_token = self.current_token
        if format_string_token.type != TokenType.STRING:
            self.error_handler.raise_syntax_error("Expected a format string literal inside kasmf.", format_string_token)
        self.eat(TokenType.STRING)
        
        args = []
        if self.current_token.type == TokenType.COMMA:
            self.eat(TokenType.COMMA)
            # Парсим список выражений-аргументов
            args.append(self.parse_expression())
            while self.current_token.type == TokenType.COMMA:
                self.eat(TokenType.COMMA)
                args.append(self.parse_expression())

        self.eat(TokenType.BRACKET_CLOSE)
        return AST.KasmfNode(format_string_token.value, args)
    
    def parse_for_statement(self):
        """Парсит конструкцию for [init; condition; increment] ( body )"""
        self.eat(TokenType.FOR)
        self.eat(TokenType.BRACKET_OPEN)

        # Часть 1: Инициализация (может быть объявлением или присваиванием)
        if self.current_token.type in [TokenType.NUM32, TokenType.NUM16, TokenType.CHAR]:
            init_node = self.parse_variable_or_array_declaration()
        else:
            init_node = self.parse_statement() # Используем parse_statement для присваивания
        
        self.eat(TokenType.SEMICOLON)

        # Часть 2: Условие
        condition_node = self.parse_expression()
        self.eat(TokenType.SEMICOLON)

        # Часть 3: Инкремент (это просто выражение, скорее всего присваивание)
        increment_node = self.parse_statement()

        self.eat(TokenType.BRACKET_CLOSE)
        
        self.eat(TokenType.PAREN_OPEN)
        body = self.parse_block()
        self.eat(TokenType.PAREN_CLOSE)

        return AST.ForNode(init_node, condition_node, increment_node, body)
    
    def parse_struct_declaration(self):
        """Парсит 'struct Name ( field_type field_name ... )'."""
        self.eat(TokenType.STRUCT)
        name_token = self.current_token
        self.eat(TokenType.IDENT)
        
        self.eat(TokenType.PAREN_OPEN)
        
        fields = []
        # Парсим поля, пока не встретим закрывающую скобку
        while self.current_token.type != TokenType.PAREN_CLOSE:
            field_type = self.parse_type()
            field_name = self.current_token.value
            self.eat(TokenType.IDENT)
            fields.append((field_type, field_name))
            
        self.eat(TokenType.PAREN_CLOSE)
        
        return AST.StructDeclarationNode(name_token.value, fields)


    def parse(self):
        """Главный метод парсера."""
        declarations = []
        while self.current_token.type != TokenType.EOF:
            token_type = self.current_token.type
            if token_type == TokenType.BOX:
                declarations.append(self.parse_function_declaration())
            # --- ИЗМЕНЕНИЕ НАЧАЛО ---
            elif token_type == TokenType.STRUCT:
                declarations.append(self.parse_struct_declaration())
            # Теперь объявление переменной может начинаться с IDENT (имя структуры)
            elif token_type in [TokenType.NUM32, TokenType.NUM16, TokenType.CHAR, TokenType.FLOAT, TokenType.IDENT]:
                declarations.append(self.parse_variable_or_array_declaration())
            # --- ИЗМЕНЕНИЕ КОНЕЦ ---
            else:
                self.error_handler.raise_syntax_error(
                    "Unexpected top-level token. Expected a function, struct, or variable declaration.",
                    self.current_token
                )
        return AST.ProgramNode(declarations)

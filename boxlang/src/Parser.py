from lib.TokenType import TokenType
from lib import AST

class Parser:
    def __init__(self, lexer, error_handler):
        self.lexer = lexer
        self.error_handler = error_handler
        self.current_token = self.lexer.get_next_token()

    def eat(self, token_type):
        """
        Consumes the current token if it matches the expected type.
        If not, it triggers a syntax error.
        """
        if self.current_token.type == token_type:
            self.current_token = self.lexer.get_next_token()
        else:
            self.error_handler.raise_syntax_error(
                f"Expected token {token_type.name}, but got {self.current_token.type.name}",
                self.current_token
            )

    def parse_statement(self):
        token_type = self.current_token.type

        # Вызов функции или присваивание (которое может включать вызов функции)
        # теперь обрабатываются как выражения.
        if token_type in [TokenType.OPEN, TokenType.IDENT, TokenType.NUMBER, TokenType.CHAR_LIT]:
            # Если строка начинается с того, что может быть выражением, парсим его.
            # Это может быть `open func[]` или `var : ...`
            return self.parse_expression_statement()

        elif token_type in [TokenType.NUM32, TokenType.NUM24, TokenType.NUM16, TokenType.CHAR, TokenType.FLOAT]:
            return self.parse_variable_or_array_declaration()
        
        elif token_type == TokenType.RET:
            return self.parse_return_statement()
        
        self.error_handler.raise_syntax_error(
            "Unexpected token at the beginning of a statement.", self.current_token,
            "A statement can start with a data type (e.g., num32), 'open', 'ret', or a variable name."
        )
        
    def parse_return_statement(self):
        self.eat(TokenType.RET)
        value_node = self.parse_expression()
        return AST.ReturnNode(value_node)
    
    # НОВОЕ: Обрабатывает выражения, которые используются как инструкции
    def parse_expression_statement(self):
        # Это может быть `a : 10` или просто `open func[]`.
        # Для простоты, мы будем парсить это как присваивание,
        # но нужно изменить parse_assignment, чтобы он был более гибким.
        
        # Заглядываем вперед, чтобы понять, это присваивание или вызов-инструкция
        # Проверим, есть ли ':' после идентификатора или доступа к массиву.
        
        # Это сложная логика, вернемся к более простому подходу
        # Statement -> open_call | assignment | declaration | return
        
        if self.current_token.type == TokenType.OPEN:
            return self.parse_function_call()
        elif self.current_token.type == TokenType.IDENT:
            return self.parse_assignment()
        
        # Это покрывает случай, когда выражение не является ни вызовом, ни присваиванием.
        self.error_handler.raise_syntax_error("Invalid statement.", self.current_token)

    def parse_variable_or_array_declaration(self):
        """Parses both 'num32 x' and 'num32 arr[10]'."""
        var_type = self.current_token
        self.eat(var_type.type)
        
        var_name = self.current_token
        self.eat(TokenType.IDENT)
        
        if self.current_token.type == TokenType.BRACKET_OPEN:
            # This is an array declaration
            self.eat(TokenType.BRACKET_OPEN)
            size_node = self.parse_expression()
            self.eat(TokenType.BRACKET_CLOSE)
            return AST.ArrayDeclarationNode(var_type.value, var_name.value, size_node)
        
        # This is a simple variable declaration
        initial_value = None
        if self.current_token.type == TokenType.COLON:
            self.eat(TokenType.COLON)
            initial_value = self.parse_expression()
        
        return AST.VariableDeclarationNode(var_type.value, var_name.value, initial_value)
    
    def parse_assignment(self):
        """Parses 'var : expr' or 'arr[idx] : expr'."""
        left_node = self.parse_variable_or_array_access()
        self.eat(TokenType.COLON)
        expression = self.parse_expression()
        return AST.AssignmentNode(left_node, expression)
        
    def parse_expression(self):
        """Parses arithmetic expressions with +, -, *, /."""
        left = self.parse_term()
        
        while self.current_token.type in [TokenType.PLUS, TokenType.MINUS, TokenType.MULTIPLY, TokenType.DIVIDE]:
            operator = self.current_token.value
            self.eat(self.current_token.type)
            right = self.parse_term()
            left = AST.BinaryOperationNode(left, operator, right)
        
        return left
    
    def parse_term(self):
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
        # <<< ИЗМЕНЕНИЕ: вызов функции теперь является частью выражения
        elif token.type == TokenType.OPEN:
            return self.parse_function_call()
        
        self.error_handler.raise_syntax_error(
            f"Unexpected token in expression: {token.type.name}", token,
            "Expected a number, a variable, an array access (arr[0]), or a function call (open func[...])."
        )

    def parse_variable_or_array_access(self):
        """Parses 'var' or 'arr[idx]'."""
        var_name = self.current_token
        self.eat(TokenType.IDENT)
        
        if self.current_token.type == TokenType.BRACKET_OPEN:
            self.eat(TokenType.BRACKET_OPEN)
            index_node = self.parse_expression()
            self.eat(TokenType.BRACKET_CLOSE)
            return AST.ArrayAccessNode(var_name.value, index_node)
        else:
            return AST.VariableReferenceNode(var_name.value)

    def parse_function_call(self):
        """Parses 'open func[arg1, arg2]'."""
        self.eat(TokenType.OPEN)
        name_token = self.current_token
        self.eat(TokenType.IDENT)
        
        # Special handling for kasm/kasmf
        if name_token.value in ['kasm', 'kasmf']:
            self.eat(TokenType.BRACKET_OPEN)
            if name_token.value == 'kasm':
                code_str = self.current_token.value
                self.eat(TokenType.STRING)
                self.eat(TokenType.BRACKET_CLOSE)
                return AST.KasmNode(code_str)
            else: # kasmf
                format_str = self.current_token.value
                self.eat(TokenType.STRING)
                args = []
                while self.current_token.type == TokenType.COMMA:
                    self.eat(TokenType.COMMA)
                    args.append(self.parse_expression())
                self.eat(TokenType.BRACKET_CLOSE)
                return AST.KasmfNode(format_str, args)

        # Generic argument parsing for regular functions
        self.eat(TokenType.BRACKET_OPEN)
        args = []
        if self.current_token.type != TokenType.BRACKET_CLOSE:
            args.append(self.parse_expression())
            while self.current_token.type == TokenType.COMMA:
                self.eat(TokenType.COMMA)
                args.append(self.parse_expression())
        
        self.eat(TokenType.BRACKET_CLOSE)
        return AST.FunctionCallNode(name_token.value, args)
    
    def parse_param_list(self):
        params = []
        self.eat(TokenType.BRACKET_OPEN)
        
        if self.current_token.type != TokenType.BRACKET_CLOSE:
            while True:
                param_type = self.current_token
                if param_type.type not in [TokenType.NUM32, TokenType.NUM16, TokenType.NUM24, TokenType.CHAR, TokenType.FLOAT]:
                     self.error_handler.raise_syntax_error("Expected a data type (e.g., num32, char)", param_type)
                self.eat(param_type.type)
                
                param_name = self.current_token
                self.eat(TokenType.IDENT)
                params.append((param_type.value, param_name.value))

                if self.current_token.type != TokenType.COMMA:
                    break
                self.eat(TokenType.COMMA)
        
        self.eat(TokenType.BRACKET_CLOSE)
        return params
    
    def parse_function_declaration(self):
        """Parses a full function: 'box name[params] ( body )'."""
        self.eat(TokenType.BOX)
        name = self.current_token
        self.eat(TokenType.IDENT)
        params = self.parse_param_list()
        self.eat(TokenType.PAREN_OPEN)
        body = []
        while self.current_token.type != TokenType.PAREN_CLOSE and self.current_token.type != TokenType.EOF:
            # Переключаемся на более общую логику парсинга инструкций
            if self.current_token.type in [TokenType.NUM32, TokenType.NUM16, TokenType.CHAR, TokenType.FLOAT]:
                 body.append(self.parse_variable_or_array_declaration())
            elif self.current_token.type == TokenType.IDENT:
                 body.append(self.parse_assignment())
            elif self.current_token.type == TokenType.OPEN:
                 body.append(self.parse_function_call())
            elif self.current_token.type == TokenType.RET:
                 body.append(self.parse_return_statement())
            else:
                 self.error_handler.raise_syntax_error("Invalid statement inside function body.", self.current_token)

        self.eat(TokenType.PAREN_CLOSE)
        return AST.FunctionDeclarationNode(name.value, params, body)

    def parse(self):
        """
        Main parser method. Parses the entire sequence of top-level declarations.
        """
        declarations = []
        while self.current_token.type != TokenType.EOF:
            token_type = self.current_token.type
            if token_type == TokenType.BOX:
                declarations.append(self.parse_function_declaration())
            elif token_type in [TokenType.NUM32, TokenType.NUM24, TokenType.NUM16, TokenType.CHAR, TokenType.FLOAT]:
                declarations.append(self.parse_variable_or_array_declaration())
            else:
                self.error_handler.raise_syntax_error(
                    "Unexpected top-level token.", self.current_token,
                    "A program can only consist of global variable declarations and function definitions ('box ...')."
                )
        return AST.ProgramNode(declarations)

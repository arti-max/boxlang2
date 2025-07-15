# boxlang/src/Parser.py

from lib.TokenType import TokenType
from lib import AST

class Parser:
    def __init__(self, lexer):
        self.lexer = lexer
        self.current_token = self.lexer.get_next_token()

    def eat(self, token_type):
        if self.current_token.type == token_type:
            self.current_token = self.lexer.get_next_token()
        else:
            raise Exception(f"Syntax Error: expected {token_type}, got {self.current_token.type}")

    def parse_statement(self):
        if self.current_token.type == TokenType.OPEN:
            return self.parse_function_call()
        elif self.current_token.type in [TokenType.NUM32, TokenType.NUM24, TokenType.NUM16, TokenType.CHAR, TokenType.FLOAT]:
            return self.parse_variable_declaration()
        elif self.current_token.type == TokenType.IDENT:
            # Это может быть присваивание переменной
            return self.parse_assignment()
        elif self.current_token.type == TokenType.RET:
            self.eat(TokenType.RET)
            value_node = self.parse_expression()
            return AST.ReturnNode(value_node)
        return None
    
    def parse_variable_declaration(self):
        var_type = self.current_token.value
        self.eat(self.current_token.type)
        
        var_name = self.current_token.value
        self.eat(TokenType.IDENT)
        
        initial_value = None
        if self.current_token.type == TokenType.COLON:  # :
            self.eat(TokenType.COLON)
            initial_value = self.parse_expression()
        
        return AST.VariableDeclarationNode(var_type, var_name, initial_value)
    
    def parse_assignment(self):
        var_name = self.current_token.value
        self.eat(TokenType.IDENT)
        self.eat(TokenType.COLON)  # :
        expression = self.parse_expression()
        return AST.AssignmentNode(var_name, expression)
    
    def parse_expression(self):
        # Простой парсер выражений (левоассоциативный)
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
        elif token.type == TokenType.STRING: # <-- ДОБАВЛЕН ЭТОТ БЛОК
            self.eat(TokenType.STRING)
            return AST.StringLiteralNode(token.value)
        elif token.type == TokenType.IDENT:
            self.eat(TokenType.IDENT)
            return AST.VariableReferenceNode(token.value)
        # Если встретился неизвестный токен в выражении
        raise Exception(f"Syntax Error: Неожиданный токен в выражении: {token.type}")

    def parse_function_call(self):
        self.eat(TokenType.OPEN)
        name = self.current_token.value
        self.eat(TokenType.IDENT)
        self.eat(TokenType.BRACKET_OPEN)
        
        # Обработка kasm/kasmf
        if name == 'kasm':
            code_str = self.current_token.value
            self.eat(TokenType.STRING)
            self.eat(TokenType.BRACKET_CLOSE)
            return AST.KasmNode(code_str)
        if name == 'kasmf':
            format_str = self.current_token.value
            self.eat(TokenType.STRING)
            args = []
            while self.current_token.type == TokenType.COMMA:
                self.eat(TokenType.COMMA)
                args.append(self.parse_expression())
            self.eat(TokenType.BRACKET_CLOSE)
            return AST.KasmfNode(format_str, args)

        # Универсальная обработка аргументов для обычных функций
        args = []
        if self.current_token.type != TokenType.BRACKET_CLOSE:
            args.append(self.parse_expression())
            while self.current_token.type == TokenType.COMMA:
                self.eat(TokenType.COMMA)
                args.append(self.parse_expression())
        
        self.eat(TokenType.BRACKET_CLOSE)
        return AST.FunctionCallNode(name, args)
    
    def parse_param_list(self):
        """Парсит список параметров вида [num32 arg1, char arg2]"""
        params = []
        self.eat(TokenType.BRACKET_OPEN)
        if self.current_token.type != TokenType.BRACKET_CLOSE:
            while True:
                param_type = self.current_token.value
                self.eat(self.current_token.type) # num32, char, etc.
                param_name = self.current_token.value
                self.eat(TokenType.IDENT)
                params.append((param_type, param_name))
                if self.current_token.type == TokenType.COMMA:
                    self.eat(TokenType.COMMA)
                else:
                    break
        self.eat(TokenType.BRACKET_CLOSE)
        return params
    
    def parse_function_declaration(self):
        self.eat(TokenType.BOX)
        name = self.current_token.value
        self.eat(TokenType.IDENT)
        
        params = self.parse_param_list()
        
        self.eat(TokenType.PAREN_OPEN)
        body = []
        while self.current_token.type != TokenType.PAREN_CLOSE:
            stmt = self.parse_statement()
            if stmt:
                body.append(stmt)
        self.eat(TokenType.PAREN_CLOSE)
        return AST.FunctionDeclarationNode(name, params, body)

    def parse(self):
        """
        Главный метод парсера. Обрабатывает последовательность
        глобальных переменных и объявлений функций.
        """
        declarations = []
        while self.current_token.type != TokenType.EOF:
            # Если видим ключевое слово 'box', парсим объявление функции
            if self.current_token.type == TokenType.BOX:
                declarations.append(self.parse_function_declaration())
            # Если видим тип данных, парсим объявление переменной
            elif self.current_token.type in [TokenType.NUM32, TokenType.NUM24, TokenType.NUM16, TokenType.CHAR, TokenType.FLOAT]:
                declarations.append(self.parse_variable_declaration())
            # Если что-то другое - это синтаксическая ошибка
            else:
                raise Exception(f"Syntax Error: Неожиданный токен верхнего уровня: {self.current_token.type}")
        
        return AST.ProgramNode(declarations)

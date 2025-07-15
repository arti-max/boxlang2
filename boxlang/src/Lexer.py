from lib.Token import Token
from lib.TokenType import TokenType

class Lexer:
    def __init__(self, text):
        self.text = text
        self.pos = 0
        self.line = 1
        self.column = 1
        self.current_char = self.text[0] if text else None
        
        self.keywords = {
            'box': TokenType.BOX,
            'open': TokenType.OPEN,
            'char': TokenType.CHAR,
            'num16': TokenType.NUM16,
            'num32': TokenType.NUM32,
            'num24': TokenType.NUM24,
            'float': TokenType.FLOAT,
            'ret': TokenType.RET
        }

    def advance(self):
        if self.current_char == '\n':
            self.line += 1
            self.column = 0

        self.pos += 1
        if self.pos > len(self.text) - 1:
            self.current_char = None
        else:
            self.current_char = self.text[self.pos]
            self.column += 1

    def skip_whitespace(self):
        while self.current_char is not None and self.current_char.isspace():
            self.advance()
    
    def skip_comment(self):
        # Предположим, комментарии начинаются с `##`
        if self.current_char == '#':
            self.advance()
            if self.current_char == '#':
                while self.current_char is not None and self.current_char != '\n':
                    self.advance()
                self.advance() # Пропустить символ новой строки

    def number(self):
        result = ''
        while self.current_char is not None and self.current_char.isdigit():
            result += self.current_char
            self.advance()
        return Token(TokenType.NUMBER, int(result), self.line, self.column)

    def string(self):
        result = ''
        self.advance() # Пропустить открывающую кавычку
        while self.current_char is not None and self.current_char != '"':
            result += self.current_char
            self.advance()
        self.advance() # Пропустить закрывающую кавычку
        return Token(TokenType.STRING, result, self.line, self.column)

    def identifier(self):
        result = ''
        while self.current_char is not None and (self.current_char.isalnum() or self.current_char == '_'):
            result += self.current_char
            self.advance()
        
        token_type = self.keywords.get(result, TokenType.IDENT)
        return Token(token_type, result, self.line, self.column)
    
    def char_literal(self):
        self.advance()  # Пропустить открывающую кавычку
        if self.current_char is None:
            raise Exception("Unterminated character literal")
        
        char_value = self.current_char
        self.advance()
        
        if self.current_char != "'":
            raise Exception("Unterminated character literal")
        
        self.advance()  # Пропустить закрывающую кавычку
        return Token(TokenType.CHAR_LIT, ord(char_value), self.line, self.column)

    def get_next_token(self):
        while self.current_char is not None:
            if self.current_char.isspace():
                self.skip_whitespace()
                continue
            
            if self.current_char == '#':
                self.skip_comment()
                continue

            if self.current_char.isalpha() or self.current_char == '_':
                return self.identifier()
            
            if self.current_char.isdigit():
                return self.number()

            if self.current_char == '"':
                return self.string()
            
            if self.current_char == "'":
                return self.char_literal()
            
            # Обработка односимвольных токенов (убрать "'": TokenType.CHAR_LIT)
            single_chars = {
                '[': TokenType.BRACKET_OPEN, ']': TokenType.BRACKET_CLOSE,
                '(': TokenType.PAREN_OPEN, ')': TokenType.PAREN_CLOSE,
                '{': TokenType.CURLY_OPEN, '}': TokenType.CURLY_CLOSE,
                '<': TokenType.ANGLE_OPEN, '>': TokenType.ANGLE_CLOSE,
                ':': TokenType.COLON, '=': TokenType.EQ, '@': TokenType.AT,
                '+': TokenType.PLUS, '-': TokenType.MINUS,
                '*': TokenType.MULTIPLY, '/': TokenType.DIVIDE,
            }
            # Убрали "'": TokenType.CHAR_LIT
            
            if self.current_char in single_chars:
                token_type = single_chars[self.current_char]
                char = self.current_char
                self.advance()
                return Token(token_type, char, self.line, self.column)

            if self.current_char == '@':
                self.advance()
                ident = self.identifier()
                if ident.value == "incl":
                    return Token(TokenType.IDENT, "@incl", self.line, self.column)

            self.advance()

        return Token(TokenType.EOF, None, self.line, self.column)

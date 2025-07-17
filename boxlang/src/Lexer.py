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
            'box': TokenType.BOX, 'open': TokenType.OPEN, 'char': TokenType.CHAR,
            'num16': TokenType.NUM16, 'num32': TokenType.NUM32, 'num24': TokenType.NUM24,
            'float': TokenType.FLOAT, 'ret': TokenType.RET,
            'if': TokenType.IF, 'else': TokenType.ELSE,
            'match': TokenType.MATCH, 'case': TokenType.CASE, 'default': TokenType.DEFAULT,
            'while': TokenType.WHILE,
            'kasm': TokenType.KASM, 'kasmf': TokenType.KASMF,
        }
        
        # Сразу токенизируем весь код
        self.tokens = self._tokenize()
        self.token_index = 0

    def advance(self, count=1):
        for _ in range(count):
            if self.current_char == '\n':
                self.line += 1
                self.column = 0
            
            self.pos += 1
            if self.pos > len(self.text) - 1:
                self.current_char = None
            else:
                self.current_char = self.text[self.pos]
                self.column += 1

    def make_token(self, ttype, value):
        return Token(ttype, value, self.line, self.column)

    def skip_whitespace(self):
        while self.current_char is not None and self.current_char.isspace():
            self.advance()
    
    def skip_comment(self):
        if self.current_char == '#' and self.text[self.pos + 1] == '#':
            while self.current_char is not None and self.current_char != '\n':
                self.advance()

    def number(self):
        result = ''
        start_col = self.column
        while self.current_char is not None and self.current_char.isdigit():
            result += self.current_char
            self.advance()
        return Token(TokenType.NUMBER, int(result), self.line, start_col)

    def string(self):
        result = ''
        start_col = self.column
        self.advance() # "
        while self.current_char is not None and self.current_char != '"':
            result += self.current_char
            self.advance()
        self.advance() # "
        return Token(TokenType.STRING, result, self.line, start_col)

    def identifier(self):
        result = ''
        start_col = self.column
        while self.current_char is not None and (self.current_char.isalnum() or self.current_char == '_'):
            result += self.current_char
            self.advance()
        
        token_type = self.keywords.get(result, TokenType.IDENT)
        return Token(token_type, result, self.line, start_col)
    
    def char_literal(self):
        start_col = self.column
        self.advance() # '
        if self.current_char is None: raise Exception("Unterminated char literal")
        char_value = self.current_char
        self.advance()
        if self.current_char != "'": raise Exception("Unterminated char literal, expected closing '")
        self.advance() # '
        return Token(TokenType.CHAR_LIT, ord(char_value), self.line, start_col)
    
    def hex_or_binary_number(self):
        """Парсит шестнадцатеричное (0x) или двоичное (0b) число."""
        start_col = self.column
        line = self.line
        
        self.advance() # Пропускаем '0'
        
        base = 10
        allowed_chars = "0123456789"
        
        if self.current_char in 'xX':
            base = 16
            allowed_chars = "0123456789abcdefABCDEF"
            self.advance() # Пропускаем 'x' или 'X'
        elif self.current_char in 'bB':
            base = 2
            allowed_chars = "01"
            self.advance() # Пропускаем 'b' или 'B'
        
        result_str = ''
        while self.current_char is not None and self.current_char in allowed_chars:
            result_str += self.current_char
            self.advance()
            
        if not result_str:
            # Это была просто цифра 0, а не префикс
            return Token(TokenType.NUMBER, 0, line, start_col)

        # Конвертируем строку в число с указанием системы счисления
        value = int(result_str, base)
        return Token(TokenType.NUMBER, value, line, start_col)

    def _tokenize(self):
        tokens = []
        
        while self.current_char is not None:
            if self.current_char.isspace():
                self.skip_whitespace()
                continue
            
            if self.current_char == '#':
                self.skip_comment()
                continue

            if self.current_char.isalpha() or self.current_char == '_':
                tokens.append(self.identifier())
                continue
            
            if self.current_char == '0' and self.peek_char() in 'xXbB':
                tokens.append(self.hex_or_binary_number())
                continue
            
            if self.current_char.isdigit():
                tokens.append(self.number())
                continue

            if self.current_char == '"':
                tokens.append(self.string())
                continue
            
            if self.current_char == "'":
                tokens.append(self.char_literal())
                continue

            # === ИСПРАВЛЕННАЯ ЛОГИКА ОБРАБОТКИ ОПЕРАТОРОВ ===
            
            char = self.current_char
            peek = self.peek_char()

            if char == '=' and peek == '=':
                tokens.append(self.make_token(TokenType.EQ_EQ, '=='))
                self.advance(2)
                continue
            
            if char == '!' and peek == '=':
                tokens.append(self.make_token(TokenType.NOT_EQ, '!='))
                self.advance(2)
                continue
            
            if char == '<':
                if peek == '=':
                    tokens.append(self.make_token(TokenType.LTE, '<='))
                    self.advance(2)
                else:
                    tokens.append(self.make_token(TokenType.LT, '<'))
                    self.advance()
                continue
            
            if char == '>':
                if peek == '=':
                    tokens.append(self.make_token(TokenType.GTE, '>='))
                    self.advance(2)
                else:
                    tokens.append(self.make_token(TokenType.GT, '>'))
                    self.advance()
                continue

            # Карта для остальных однозначных токенов
            single_char_map = {
                '+': TokenType.PLUS, '-': TokenType.MINUS, '*': TokenType.MULTIPLY, '/': TokenType.DIVIDE,
                ':': TokenType.COLON,
                '[': TokenType.BRACKET_OPEN, ']': TokenType.BRACKET_CLOSE,
                '(': TokenType.PAREN_OPEN, ')': TokenType.PAREN_CLOSE,
                '{': TokenType.CURLY_OPEN, '}': TokenType.CURLY_CLOSE,
                ',': TokenType.COMMA, '@': TokenType.AT, '&': TokenType.AMPERSAND
            }

            if char in single_char_map:
                tokens.append(self.make_token(single_char_map[char], char))
                self.advance()
                continue
            
            # ==============================================================
            
            # Если мы дошли сюда, символ действительно неизвестен
            raise Exception(f"Unknown character: '{self.current_char}' at {self.line}:{self.column}")

        tokens.append(self.make_token(TokenType.EOF, None))
        return tokens

    def get_next_token(self):
        """Возвращает текущий токен и переходит к следующему."""
        token = self.tokens[self.token_index]
        if self.token_index < len(self.tokens) - 1:
            self.token_index += 1
        return token
    
    def peek_char(self):
        """'Подсматривает' следующий символ, не сдвигая указатель."""
        peek_pos = self.pos + 1
        if peek_pos > len(self.text) - 1:
            return None
        return self.text[peek_pos]
    
    def peek(self):
        """'Подсматривает' следующий токен, не сдвигая указатель."""
        return self.tokens[self.token_index]

#!/usr/bin/python3
from lib.Token import Token
from lib.TokenType import TokenType

class Lexer:
    def __init__(self, source_lines):
        self.source_lines = source_lines
        self.text = "".join([line[2] for line in source_lines])
        self.line_map = self._create_line_map() # Карта для определения файла/строки
        self.pos = 0
        self.line = 1
        self.column = 1
        self.current_char = self.text[0] if self.text else None
        
        self.keywords = {
            'box': TokenType.BOX, 'open': TokenType.OPEN, 'char': TokenType.CHAR,
            'num16': TokenType.NUM16, 'num32': TokenType.NUM32, 'num24': TokenType.NUM24,
            'float': TokenType.FLOAT, 'ret': TokenType.RET,
            'if': TokenType.IF, 'else': TokenType.ELSE,
            'match': TokenType.MATCH, 'case': TokenType.CASE, 'default': TokenType.DEFAULT,
            'while': TokenType.WHILE,
            'kasm': TokenType.KASM, 'kasmf': TokenType.KASMF,
            'for': TokenType.FOR,
            'struct': TokenType.STRUCT,
            'break': TokenType.BREAK,
            'continue': TokenType.CONTINUE,
        }
        
        # Сразу токенизируем весь код
        self.tokens = self._tokenize()
        self.token_index = 0
        
    def _create_line_map(self):
        # Создает карту глобальных номеров строк к (файлу, локальному номеру)
        line_map = {}
        global_line_num = 1
        for filename, original_line_num, line_content in self.source_lines:
            line_map[global_line_num] = (filename, original_line_num)
            # Если строка содержит несколько \n, нужно это учесть, но для простоты опустим
            global_line_num += line_content.count('\n')
        return line_map
    
    def _get_source_pos(self, global_line, global_col):
        # Находит правильный файл и строку по глобальной позиции
        # Это упрощенная версия. Для точности нужно итерировать до нужной строки.
        filename, start_line = self.line_map.get(global_line, ("unknown", global_line))
        return filename, start_line, global_col
    
    

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
        # Получаем глобальную позицию
        global_line = self.text.count('\n', 0, self.pos) + 1
        last_newline = self.text.rfind('\n', 0, self.pos)
        global_column = self.pos - last_newline if last_newline != -1 else self.pos + 1
        
        # Находим реальный файл и строку
        filename, line, column = self._get_source_pos(global_line, global_column)

        return Token(ttype, value, line, column, filename)

    def skip_whitespace(self):
        while self.current_char is not None and self.current_char.isspace():
            self.advance()
    
    def skip_comment(self):
        if self.current_char == '#' and self.text[self.pos + 1] == '#':
            while self.current_char is not None and self.current_char != '\n':
                self.advance()

    def number(self):
        """Парсит как целые, так и float-числа."""
        result = ''
        start_col = self.column
        line = self.line

        while self.current_char is not None and self.current_char.isdigit():
            result += self.current_char
            self.advance()

        # Проверяем на наличие десятичной точки
        if self.current_char == '.':
            result += '.'
            self.advance()
            while self.current_char is not None and self.current_char.isdigit():
                result += self.current_char
                self.advance()
            # Это float
            return self.make_token(TokenType.FLOAT_LIT, float(result))
        else:
            # Это целое число
            return self.make_token(TokenType.NUMBER, int(result))

    def string(self):
        segments = []
        curr_str = ''
        start_col = self.column
        self.advance()  # Пропускаем открывающую кавычку "

        while self.current_char is not None and self.current_char != '"':
            if self.current_char == '\\':
                self.advance()
                if self.current_char == 'x':
                    # Заканчиваем прошлый кусок строки
                    if curr_str:
                        segments.append((True, curr_str))
                        curr_str = ''
                    # Считываем две hex-цифры
                    self.advance()
                    h1 = self.current_char
                    self.advance()
                    h2 = self.current_char
                    self.advance()
                    byte = int(h1 + h2, 16)
                    segments.append((False, byte))
                else:
                    # Стандартные escape (\n, \t, \r, \\ и т.д.)
                    esc = self.current_char
                    self.advance()
                    mapping = {'n': 10, 'r': 13, 't': 9, '0': 0, '\\': ord('\\'), '"': ord('"')}
                    if esc in mapping:
                        if curr_str:
                            segments.append((True, curr_str))
                            curr_str = ''
                        segments.append((False, mapping[esc]))
                    else:
                        curr_str += '\\' + esc
            else:
                curr_str += self.current_char
                self.advance()
        if curr_str:
            segments.append((True, curr_str))
        self.advance()  # Закрывающая "
        return self.make_token(TokenType.STRING, segments)

    def identifier(self):
        result = ''
        start_col = self.column
        while self.current_char is not None and (self.current_char.isalnum() or self.current_char == '_'):
            result += self.current_char
            self.advance()
        
        token_type = self.keywords.get(result, TokenType.IDENT)
        return self.make_token(token_type, result)
    
    def char_literal(self):
        start_col = self.column
        self.advance() # '
        if self.current_char is None: raise Exception("Unterminated char literal")
        char_value = self.current_char
        self.advance()
        if self.current_char != "'": raise Exception("Unterminated char literal, expected closing '")
        self.advance() # '
        return self.make_token(TokenType.CHAR_LIT, ord(char_value))
    
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
        return self.make_token(TokenType.NUMBER, value)

    def _tokenize(self):
        tokens = []
        while self.current_char is not None:
            
            # --- Пропуск пробелов, комментариев и т.д. ---
            if self.current_char.isspace():
                self.skip_whitespace()
                continue
            if self.current_char == '#' and self.text[self.pos + 1] == '#':
                self.skip_comment()
                continue
            if self.current_char == '.' and self.peek_char() == '.' and self.text[self.pos + 2] == '.':
                tokens.append(self.make_token(TokenType.ELLIPSIS, '...'))
                self.advance(3)
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

            # --- Логика для операторов ---
            char = self.current_char
            peek = self.peek_char()

            # Многосимвольные операторы
            if char == '/' and peek == '/':
                tokens.append(self.make_token(TokenType.FLOOR_DIV, '//'))
                self.advance(2); continue
            if char == '&' and peek == '&':
                tokens.append(self.make_token(TokenType.LOGICAL_AND, '&&'))
                self.advance(2); continue
            if char == '|' and peek == '|':
                tokens.append(self.make_token(TokenType.LOGICAL_OR, '||'))
                self.advance(2); continue
            if char == '=' and peek == '=':
                tokens.append(self.make_token(TokenType.EQ_EQ, '=='))
                self.advance(2); continue
            if char == '!' and peek == '=':
                tokens.append(self.make_token(TokenType.NOT_EQ, '!='))
                self.advance(2); continue
            if char == '<' and peek == '<':
                tokens.append(self.make_token(TokenType.LSHIFT, '<<'))
                self.advance(2); continue
            if char == '>' and peek == '>':
                tokens.append(self.make_token(TokenType.RSHIFT, '>>'))
                self.advance(2); continue
            if char == '<' and peek == '=':
                tokens.append(self.make_token(TokenType.LTE, '<='))
                self.advance(2); continue
            if char == '>' and peek == '=':
                tokens.append(self.make_token(TokenType.GTE, '>='))
                self.advance(2); continue
            
            # Односимвольные операторы
            single_char_map = {
                '+': TokenType.PLUS, '-': TokenType.MINUS, '*': TokenType.MULTIPLY, '/': TokenType.DIVIDE,
                ':': TokenType.COLON, ';': TokenType.SEMICOLON,
                '[': TokenType.BRACKET_OPEN, ']': TokenType.BRACKET_CLOSE,
                '(': TokenType.PAREN_OPEN, ')': TokenType.PAREN_CLOSE,
                '{': TokenType.CURLY_OPEN, '}': TokenType.CURLY_CLOSE,
                ',': TokenType.COMMA, '@': TokenType.AT,
                '.': TokenType.DOT, '%': TokenType.MODULO,
                '<': TokenType.LT, '>': TokenType.GT,
                # ### ИЗМЕНЕНО: '&' теперь всегда токенизируется как AMPERSAND ###
                '&': TokenType.AMPERSAND, 
                '|': TokenType.BIT_OR, '^': TokenType.BIT_XOR
            }

            if char in single_char_map:
                tokens.append(self.make_token(single_char_map[char], char))
                self.advance()
                continue
            
            raise Exception(f"Unknown character: '{self.current_char}' at {self.line}:{self.column}")

        tokens.append(self.make_token(TokenType.EOF, None))
        return tokens
    
    def get_next_token(self):
        """Возвращает текущий токен и переходит к следующему."""
        token = self.tokens[self.token_index]
        if self.token_index < len(self.tokens) - 1:
            self.token_index += 1
        return token
    
    def peek_char(self, offset=1):
        """'Подсматривает' символ со смещением, не сдвигая указатель."""
        peek_pos = self.pos + offset
        if peek_pos > len(self.text) - 1:
            return None
        return self.text[peek_pos]
    
    def handle_escape_sequence(self):
        """Обрабатывает символ после '\' и возвращает соответствующий символ."""
        self.advance() # Пропускаем '\'
        char = self.current_char
        self.advance() # Пропускаем символ после '\'

        if char == 'n': return '\n'
        if char == 't': return '\t'
        if char == 'r': return '\r'
        if char == '"': return '"'
        if char == "'": return "'"
        if char == '\\': return '\\'
        if char == 'x': # Обработка HEX-кода \xHH
            hex_code = self.current_char + self.peek_char(0)
            if all(c in '0123456789abcdefABCDEF' for c in hex_code):
                self.advance(2) # Пропускаем два HEX-символа
                return chr(int(hex_code, 16))
            else:
                raise Exception(f"Invalid hex escape sequence: \\x{hex_code}")
        
        # Если последовательность неизвестна, просто возвращаем ее как есть
        return '\\' + char
    
    def peek(self):
        """'Подсматривает' следующий токен, не сдвигая указатель."""
        return self.tokens[self.token_index]

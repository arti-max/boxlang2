# src/ErrorHandler.py

import sys

class CompilerError(Exception):
    """Пользовательское исключение для контролируемого завершения работы компилятора."""
    pass

class ErrorHandler:
    def __init__(self, filename=""):
        # Теперь мы не храним исходный код здесь, только имя основного файла как запасной вариант.
        self.filename = filename

    def raise_syntax_error(self, message, token, suggestion=None):
        """
        Форматирует и отображает сообщение о синтаксической ошибке, затем вызывает исключение.
        """
        # Получаем актуальную информацию из токена, который содержит правильное имя файла и строку.
        filename = token.filename
        line_num = token.line
        col_num = token.column

        line_content = ""
        # Пытаемся прочитать нужную строку из исходного файла
        try:
            with open(filename, 'r', encoding='utf-8') as f:
                # Читаем все строки и берем нужную
                source_lines = f.readlines()
                if 0 < line_num <= len(source_lines):
                    line_content = source_lines[line_num - 1].strip('\n')
                else:
                    line_content = f"<Не удалось прочитать строку {line_num}>"
        except (IOError, IndexError):
            line_content = f"<Не удалось открыть или прочитать файл '{filename}'>"
        
        # Ограничиваем номер столбца, чтобы он не выходил за пределы длины строки
        col_num = min(col_num, len(line_content) + 1)

        # Собираем сообщение об ошибке
        error_message = f"\n[Compilation Error] Syntax Error:\n"
        error_message += f"  File: {filename}, Line: {line_num}, Column: {col_num}\n\n"
        error_message += f"    {line_content}\n"
        # Указатель на ошибку
        error_message += "    " + " " * (col_num -1) + "^\n" 
        error_message += f"  Message: {message}\n"

        if token.value is not None:
            error_message += f"  Found token: {token.type.name} ('{token.value}')\n"
        else:
            error_message += f"  Found token: {token.type.name}\n"

        if suggestion:
            error_message += f"\n  Suggestion: {suggestion}\n"

        # Вызываем пользовательское исключение, которое будет поймано в main.py
        raise CompilerError(error_message)


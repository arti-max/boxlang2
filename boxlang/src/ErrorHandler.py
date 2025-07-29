#!/usr/bin/python3
import sys

class CompilerError(Exception):
    """Custom exception for controlled compiler termination."""
    pass

class ErrorHandler:
    def __init__(self, source_code, filename="<source>"):
        self.source_lines = source_code.split('\n')
        self.filename = filename

    def raise_syntax_error(self, message, token, suggestion=None):
        """
        Formats and displays a syntax error message, then raises an exception.
        """
        line_num = token.line
        # Ensure column does not go out of bounds of the actual line length
        col_num = min(token.column, len(self.source_lines[line_num - 1]) + 1)

        line = self.source_lines[line_num - 1]
        
        # Build the error message
        error_message = f"\n[Compilation Error] Syntax Error:\n"
        error_message += f"    File: {self.filename}, Line: {line_num}, Column: {col_num}\n\n"
        error_message += f"    {line}\n"
        error_message += "    " + " " * (col_num - 1) + "^\n"
        error_message += f"    Message: {message}\n"
        
        if token.value is not None:
            error_message += f"    Found token: {token.type.name} ('{token.value}')\n"
        else:
            error_message += f"    Found token: {token.type.name}\n"

        if suggestion:
            error_message += f"\n    Suggestion: {suggestion}\n"
        
        # Raise the custom exception to be caught by main.py
        raise CompilerError(error_message)


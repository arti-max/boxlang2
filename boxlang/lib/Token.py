

class Token:
    def __init__(self, ttype, value, line, column, filename):
        self.type = ttype
        self.value = value
        self.line = line
        self.column = column
        self.filename = filename
        
    def __repr__(self):
        return f"Token({self.type.name}, {repr(self.value)}, L{self.line}:C{self.column} in '{self.filename}')"
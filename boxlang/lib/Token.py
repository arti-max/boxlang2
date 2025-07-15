

class Token:
    def __init__(self, ttype, value, line, column):
        self.type = ttype
        self.value = value
        self.line = line
        self.column = column
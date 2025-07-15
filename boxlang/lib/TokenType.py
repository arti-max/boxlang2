from enum import Enum, auto


class TokenType(Enum):
    # base
    BOX = auto()            # box
    OPEN = auto()           # open
    STRING = auto()         # "a"
    CHAR_LIT = auto()       # 'A'
    NUMBER = auto()         # 123
    HEX = auto()            # $AF
    IDENT = auto()          # name
    KASM = auto()           # kasm["mov %eax 1"]
    KASMF = auto()          # kasmf["mov %eax {}", var]
    RET = auto()            # ret
    # datatypes
    CHAR = auto()   
    NUM16 = auto()
    NUM24 = auto()
    NUM32 = auto()
    FLOAT = auto()
    ASSIGN = auto()           # :
    PLUS = auto()             # +
    MINUS = auto()            # -
    MULTIPLY = auto()         # *
    DIVIDE = auto()           # /
    # symbols
    BRACKET_OPEN = auto()   # [
    BRACKET_CLOSE = auto()  # ]
    PAREN_OPEN = auto()     # (
    PAREN_CLOSE = auto()    # )
    CURLY_OPEN = auto()     # {
    CURLY_CLOSE = auto()    # }
    ANGLE_OPEN = auto()     # <
    ANGLE_CLOSE = auto()    # >
    COLON = auto()          # :
    PERCENT = auto()        # %
    COMMA = auto()          # ,
    AT = auto()             # @
    DOT = auto()            # .
    ARROW = auto()          # ->
    EQ = auto()             # =
    # other
    EOF = auto()            # End Of File
    
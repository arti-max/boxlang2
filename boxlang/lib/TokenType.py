from enum import Enum, auto

class TokenType(Enum):
    # base
    BOX = auto()         # box
    OPEN = auto()        # open
    STRING = auto()      # "a"
    CHAR_LIT = auto()    # 'A'
    NUMBER = auto()      # 123
    HEX = auto()         # $AF
    IDENT = auto()       # name
    KASM = auto()        # kasm["mov %eax 1"]
    KASMF = auto()       # kasmf["mov %eax {}", var]
    RET = auto()         # ret
    IF = auto()          # if
    ELSE = auto()        # else
    MATCH = auto()       # match
    CASE = auto()        # case
    DEFAULT = auto()     # default
    WHILE = auto()       # while
    FOR = auto()         # for
    STRUCT = auto()      # struct

    # datatypes
    CHAR = auto()
    NUM16 = auto()
    NUM24 = auto()
    NUM32 = auto()
    FLOAT = auto()

    # operators
    ASSIGN = auto()      # :
    PLUS = auto()        # +
    MINUS = auto()       # -
    MULTIPLY = auto()    # *
    DIVIDE = auto()      # /
    EQ_EQ = auto()       # ==
    NOT_EQ = auto()      # !=
    LT = auto()          # <
    GT = auto()          # >
    LTE = auto()         # <=
    GTE = auto()         # >=
    AMPERSAND = auto()   # & (взятие адреса)
    MODULO = auto()        # %
    FLOOR_DIV = auto()     # //
    LSHIFT = auto()        # <<
    RSHIFT = auto()        # >>
    BIT_OR = auto()        # |
    BIT_XOR = auto()       # ^
    LOGICAL_AND = auto()   # &&
    LOGICAL_OR = auto()    # ||

    # symbols
    BRACKET_OPEN = auto()  # [
    BRACKET_CLOSE = auto() # ]
    PAREN_OPEN = auto()    # (
    PAREN_CLOSE = auto()   # )
    CURLY_OPEN = auto()    # {
    CURLY_CLOSE = auto()   # }
    ANGLE_OPEN = auto()    # <
    ANGLE_CLOSE = auto()   # >
    COLON = auto()         # :
    COMMA = auto()         # ,
    AT = auto()            # @ (разыменование)
    DOT = auto()           # .
    ARROW = auto()         # ->
    EQ = auto()            # =
    SEMICOLON = auto()     # ;
    ELLIPSIS = auto()      # ...

    # other
    EOF = auto()           # End Of File

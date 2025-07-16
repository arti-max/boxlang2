class ASTNode:
    pass

class ProgramNode(ASTNode):
    def __init__(self, statements):
        self.statements = statements

class FunctionCallNode(ASTNode):
    def __init__(self, name, args):
        self.name = name
        self.args = args

class StringLiteralNode(ASTNode):
    def __init__(self, value):
        self.value = value

class NumberLiteralNode(ASTNode):
    def __init__(self, value):
        self.value = value

class VariableDeclarationNode(ASTNode):
    def __init__(self, var_type, name, initial_value=None):
        self.var_type = var_type
        self.name = name
        self.initial_value = initial_value

# <<< НОВОЕ: Узел для объявления массива
class ArrayDeclarationNode(ASTNode):
    def __init__(self, var_type, name, size_node):
        self.var_type = var_type
        self.name = name
        self.size_node = size_node # Узел с размером массива (пока NumberLiteralNode)

# <<< НОВОЕ: Узел для доступа к элементу массива
class ArrayAccessNode(ASTNode):
    def __init__(self, name, index_node):
        self.name = name
        self.index_node = index_node # Узел-выражение для индекса

class AssignmentNode(ASTNode):
    def __init__(self, variable, expression): # <<< ИЗМЕНЕНО: variable может быть IDENT или ArrayAccessNode
        self.variable = variable
        self.expression = expression

class VariableReferenceNode(ASTNode):
    def __init__(self, name):
        self.name = name

class BinaryOperationNode(ASTNode):
    def __init__(self, left, operator, right):
        self.left = left
        self.operator = operator
        self.right = right
        
class CharLiteralNode(ASTNode):
    def __init__(self, value):
        self.value = value
        
class FunctionDeclarationNode(ASTNode):
    def __init__(self, name, params, body):
        self.name = name
        self.params = params
        self.body = body

class ReturnNode(ASTNode):
    def __init__(self, value_node):
        self.value_node = value_node

class KasmNode(ASTNode):
    def __init__(self, code_string):
        self.code_string = code_string

class KasmfNode(ASTNode):
    def __init__(self, format_string, args):
        self.format_string = format_string
        self.args = args

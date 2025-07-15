# boxlang/lib/AST.py

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
        self.var_type = var_type  # 'num32', 'char', etc.
        self.name = name
        self.initial_value = initial_value

class AssignmentNode(ASTNode):
    def __init__(self, variable_name, expression):
        self.variable_name = variable_name
        self.expression = expression

class VariableReferenceNode(ASTNode):
    def __init__(self, name):
        self.name = name

class BinaryOperationNode(ASTNode):
    def __init__(self, left, operator, right):
        self.left = left
        self.operator = operator  # '+', '-', '*', '/'
        self.right = right
        
class CharLiteralNode(ASTNode):
    def __init__(self, value):
        self.value = value  # ASCII-код символа
        
class FunctionDeclarationNode(ASTNode):
    def __init__(self, name, params, body):
        self.name = name
        self.params = params  # Список из кортежей (тип, имя)
        self.body = body      # Список узлов-инструкций

class ReturnNode(ASTNode):
    def __init__(self, value_node):
        self.value_node = value_node # Узел выражения для возврата

class KasmNode(ASTNode):
    def __init__(self, code_string):
        self.code_string = code_string

class KasmfNode(ASTNode):
    def __init__(self, format_string, args):
        self.format_string = format_string
        self.args = args
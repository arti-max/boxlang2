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
        
class ComparisonNode(ASTNode):
    """Узел для операций сравнения, например, a == b."""
    def __init__(self, left, op, right):
        self.left = left
        self.op = op
        self.right = right

class IfNode(ASTNode):
    """Узел для конструкции if-else."""
    def __init__(self, condition, if_body, else_body=None):
        self.condition = condition
        self.if_body = if_body
        self.else_body = else_body

class CaseNode(ASTNode):
    """
    Узел для одного случая в конструкции match.
    Например: case [5] (...) или default (...).
    """
    def __init__(self, value_node, body, is_default=False):
        self.value_node = value_node  # Узел со значением (например, NumberLiteralNode) или None для default
        self.body = body              # Список инструкций в теле case
        self.is_default = is_default  # Флаг, является ли этот case блоком default
        
class MatchNode(ASTNode):
    """
    Узел для всей конструкции match-case.
    """
    def __init__(self, expression_node, cases):
        self.expression_node = expression_node # Узел с выражением, которое проверяется
        self.cases = cases                     # Список узлов CaseNode
        
class WhileNode(ASTNode):
    """Узел для цикла while."""
    def __init__(self, condition, body):
        self.condition = condition
        self.body = body
        
class PointerTypeNode(ASTNode):
    """
    Узел, представляющий тип-указатель, например, 'num32*'.
    Хранит только базовый тип, на который он указывает.
    """
    def __init__(self, base_type_name):
        self.base_type_name = base_type_name # Строка с именем базового типа ('num32', 'char', и т.д.)

class AddressOfNode(ASTNode):
    """
    Узел для операции взятия адреса (&var).
    """
    def __init__(self, node_to_address):
        # Узел переменной (VariableReferenceNode) или элемента массива (ArrayAccessNode)
        self.node_to_address = node_to_address

class DereferenceNode(ASTNode):
    """
    Узел для операции разыменования (@ptr).
    Может быть как в левой (присваивание), так и в правой части выражения.
    """
    def __init__(self, pointer_node):
        self.pointer_node = pointer_node # Узел-выражение, который должен вычисляться в адрес
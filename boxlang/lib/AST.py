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
    def __init__(self, segments):
        # segments: список [(True, "abc"), (False, 0x0A), ...]
        self.segments = segments

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
    # ### <-- ИЗМЕНЕНИЕ: Добавили initial_value, как в VariableDeclarationNode
    def __init__(self, var_type, name, size_node, initial_value=None):
        self.var_type = var_type
        self.name = name
        self.size_node = size_node
        self.initial_value = initial_value

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
    def __init__(self, left, operator, right, op_token):
        self.left = left
        self.operator = operator
        self.right = right
        self.op_token = op_token
        
class CharLiteralNode(ASTNode):
    def __init__(self, value):
        self.value = value
        
class FunctionDeclarationNode(ASTNode):
    def __init__(self, name, params, body, is_variadic=False):
        self.name = name
        self.params = params
        self.body = body
        self.is_variadic = is_variadic

class ReturnNode(ASTNode):
    def __init__(self, value_node):
        self.value_node = value_node

class KasmNode(ASTNode):
    def __init__(self, code_string):
        self.code_string = code_string

class ComparisonNode(ASTNode):
    """Узел для операций сравнения, например, a == b."""
    def __init__(self, left, op, right, op_token):
        self.left = left
        self.op = op
        self.right = right
        self.op_token = op_token

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
        
class ForNode(ASTNode):
    def __init__(self, init_node, condition_node, increment_node, body):
        self.init_node = init_node
        self.condition_node = condition_node
        self.increment_node = increment_node
        self.body = body

class PropertyAccessNode(ASTNode):
    def __init__(self, variable_name, property_name):
        self.variable_name = variable_name
        self.property_name = property_name
        
class StructDeclarationNode(ASTNode):
    """
    Узел для объявления структуры, например:
    struct Vec3 (num32 x, num32 y)
    """
    def __init__(self, name, fields):
        self.name = name      # Имя структуры (строка, "Vec3")
        self.fields = fields  # Список полей [(тип, имя), ...]
        
class UnaryOpNode(ASTNode):
    """Узел для унарных операций (например, -5)"""
    def __init__(self, op, node):
        self.token = self.op = op
        self.node = node
        
class FloatLiteralNode(ASTNode):
    def __init__(self, value):
        self.value = value
        
class BreakNode(ASTNode):
    """Узел для оператора break."""
    pass

class ContinueNode(ASTNode):
    """Узел для оператора continue."""
    pass

class KasmfNode(ASTNode):
    """Узел для inline assembly (kasmf v1 и v2)"""
    def __init__(self, assembly_parts, output_constraints=None, input_constraints=None, clobber_list=None, args=None):
        self.assembly_parts = assembly_parts
        self.output_constraints = output_constraints or []
        self.input_constraints = input_constraints or []
        self.clobber_list = clobber_list or []
        self.args = args or []  # Для v1
        
class MultilineKasmNode(ASTNode):
    """Узел для многострочного kasm"""
    def __init__(self, assembly_parts):
        self.assembly_parts = assembly_parts

class NasmNode(ASTNode):
    """Узел для многострочного nasm"""
    def __init__(self, assembly_parts):
        self.assembly_parts = assembly_parts

class NasmfNode(ASTNode):
    """Узел для inline assembly nasm (nasmf v1 и v2)"""
    def __init__(self, assembly_parts, output_constraints=None, input_constraints=None, clobber_list=None, args=None):
        self.assembly_parts = assembly_parts
        self.output_constraints = output_constraints or []
        self.input_constraints = input_constraints or []
        self.clobber_list = clobber_list or []
        self.args = args or []  # Для v1

class StructArrayAccessNode(ASTNode):
    """Узел для доступа к элементу массива поля структуры: struct.field[index]"""
    def __init__(self, struct_name, field_name, index_node):
        self.struct_name = struct_name
        self.field_name = field_name
        self.index_node = index_node

class ArrayElementPropertyAccessNode(ASTNode):
    """Узел для доступа к полю элемента массива: array[index].field"""
    def __init__(self, array_name, index_node, field_name):
        self.array_name = array_name
        self.index_node = index_node
        self.field_name = field_name
        
class CompoundStatementNode(ASTNode):
    """Узел для составных операций, разделенных точкой с запятой"""
    def __init__(self, statements):
        self.statements = statements  # Список операций
        
class EnumDeclarationNode(ASTNode):
    """
    Узел для объявления enum, например:
    enum Color (RED : 1, GREEN : 2, BLUE : 3)
    """
    def __init__(self, name, values):
        self.name = name  # Имя enum (строка, "Color")
        self.values = values  # Список значений [(имя, значение), ...]

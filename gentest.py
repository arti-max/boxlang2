REG8_ENCODING = {
    'AL': 0, 'CL': 1, 'DL': 2, 'BL': 3, 'AH': 4, 'CH': 5, 'DH': 6, 'BH': 7
}
REG16_ENCODING = {
    'AX': 0, 'CX': 1, 'DX': 2, 'BX': 3, 'SP': 4, 'BP': 5, 'SI': 6, 'DI': 7
}

# Таблица основных операций — [octal base, hex base] 
# (P — тип инструкции для группы 0P0…0P3 из документа: 0—ADD, 1—OR, 2—ADC, 3—SBB, 4—AND, 5—SUB, 6—XOR, 7—CMP)
OPCODES = {
    'MOV': {
        '8': 0x8A,  # mov Rb, Eb — 212 octal
        '16': 0x8B, # mov Rw, Ew — 213 octal
    },
    'ADD': {
        '8': 0x00,  # add Eb, Rb — 000 octal
        '16': 0x01, # add Ew, Rw — 001 octal
    },
    'SUB': {
        '8': 0x28,  # sub Eb, Rb — 050 octal
        '16': 0x29, # sub Ew, Rw — 051 octal
    },
    'AND': {
        '8': 0x20,  # and Eb, Rb — 040 octal
        '16': 0x21, # and Ew, Rw — 041 octal
    },
    'OR': {
        '8': 0x08,  # or Eb, Rb — 010 octal
        '16': 0x09, # or Ew, Rw — 011 octal
    },
    'XOR': {
        '8': 0x30,  # xor Eb, Rb — 060 octal
        '16': 0x31, # xor Ew, Rw — 061 octal
    },
    'CMP': {
        '8': 0x38,  # cmp Eb, Rb — 070 octal
        '16': 0x39, # cmp Ew, Rw — 071 octal
    },
    # Можно добавить другие по шаблону
}

def gen_instruction(mnemonic: str, reg1: str, reg2: str) -> bytes:
    mnem = mnemonic.upper()
    reg1_up = reg1.upper()
    reg2_up = reg2.upper()

    if reg1_up in REG8_ENCODING and reg2_up in REG8_ENCODING:
        size = '8'
        reg_field1 = REG8_ENCODING[reg1_up]
        reg_field2 = REG8_ENCODING[reg2_up]
    elif reg1_up in REG16_ENCODING and reg2_up in REG16_ENCODING:
        size = '16'
        reg_field1 = REG16_ENCODING[reg1_up]
        reg_field2 = REG16_ENCODING[reg2_up]
    else:
        raise ValueError(f"Неподдерживаемые или несоответствующие типы регистров: {reg1}, {reg2}")

    if mnem not in OPCODES or size not in OPCODES[mnem]:
        raise ValueError(f"Не поддерживается такая инструкция: {mnemonic} {reg1},{reg2}")

    opcode = OPCODES[mnem][size]
    mod = 0b11  # регистр-регистр

    if mnem == "MOV":
        # MOV: reg_field1 = REG (назначение), reg_field2 = RM (источник)
        modrm = (mod << 6) | (reg_field1 << 3) | reg_field2
    else:
        # Остальные: reg_field2 = REG (второй операнд), reg_field1 = RM (первый операнд)
        modrm = (mod << 6) | (reg_field2 << 3) | reg_field1

    return bytes([opcode, modrm])


# Пример использования
if __name__ == "__main__":
    print("MOV AX, BX:", gen_instruction("MOV", "AX", "BX").hex())    # 8bc3
    print("MOV AL, BL:", gen_instruction("MOV", "AL", "BL").hex())    # 8ac3
    print("ADD AX, DX:", gen_instruction("ADD", "AX", "DX").hex())    # 01c2
    print("SUB BX, CX:", gen_instruction("SUB", "BX", "CX").hex())    # 29cb
    print("AND SI, DI:", gen_instruction("AND", "SI", "DI").hex())    # 21f7
    print("OR AL, AH:", gen_instruction("OR", "AL", "AH").hex())      # 08e0
    print("CMP BP, SP:", gen_instruction("CMP", "BP", "SP").hex())    # 397c
    print("XOR DL, DH:", gen_instruction("XOR", "DL", "DH").hex())    # 30f6

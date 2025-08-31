#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

// --- Упрощенные структуры ---
typedef struct {
    char mnemonic[4];
    uint8_t op8_reg_rm;
    uint8_t op16_reg_rm;
    uint8_t op8_rm_reg;
    uint8_t op16_rm_reg;
    uint8_t op8_imm;
    uint8_t op16_imm;
    uint8_t modrm_ext;
} InstInfo;

// --- Глобальные таблицы ---
InstInfo INSTRUCTION_TABLE[32];

// --- Простые функции сравнения строк ---
int strcmp_2(char* s1, char* s2) {
    return (s1[0] == s2[0]) && (s1[1] == s2[1]);
}

int strcmp_3(char* s1, char* s2) {
    return (s1[0] == s2[0]) && (s1[1] == s2[1]) && (s1[2] == s2[2]);
}

// --- Инициализация таблицы инструкций ---
void init_instruction_table() {
    // MOV
    INSTRUCTION_TABLE[0].mnemonic[0] = 'M';
    INSTRUCTION_TABLE[0].mnemonic[1] = 'O';
    INSTRUCTION_TABLE[0].mnemonic[2] = 'V';
    INSTRUCTION_TABLE[0].mnemonic[3] = '\0';
    INSTRUCTION_TABLE[0].op8_reg_rm = 0x8A;
    INSTRUCTION_TABLE[0].op16_reg_rm = 0x8B;
    INSTRUCTION_TABLE[0].op8_rm_reg = 0x88;
    INSTRUCTION_TABLE[0].op16_rm_reg = 0x89;
    INSTRUCTION_TABLE[0].op8_imm = 0xB0;
    INSTRUCTION_TABLE[0].op16_imm = 0xB8;
    INSTRUCTION_TABLE[0].modrm_ext = 0;
    
    // ADD
    INSTRUCTION_TABLE[1].mnemonic[0] = 'A';
    INSTRUCTION_TABLE[1].mnemonic[1] = 'D';
    INSTRUCTION_TABLE[1].mnemonic[2] = 'D';
    INSTRUCTION_TABLE[1].mnemonic[3] = '\0';
    INSTRUCTION_TABLE[1].op8_reg_rm = 0x02;
    INSTRUCTION_TABLE[1].op16_reg_rm = 0x03;
    INSTRUCTION_TABLE[1].op8_rm_reg = 0x00;
    INSTRUCTION_TABLE[1].op16_rm_reg = 0x01;
    INSTRUCTION_TABLE[1].op8_imm = 0x04;
    INSTRUCTION_TABLE[1].op16_imm = 0x05;
    INSTRUCTION_TABLE[1].modrm_ext = 0;
    
    // SUB
    INSTRUCTION_TABLE[2].mnemonic[0] = 'S';
    INSTRUCTION_TABLE[2].mnemonic[1] = 'U';
    INSTRUCTION_TABLE[2].mnemonic[2] = 'B';
    INSTRUCTION_TABLE[2].mnemonic[3] = '\0';
    INSTRUCTION_TABLE[2].op8_reg_rm = 0x2A;
    INSTRUCTION_TABLE[2].op16_reg_rm = 0x2B;
    INSTRUCTION_TABLE[2].op8_rm_reg = 0x28;
    INSTRUCTION_TABLE[2].op16_rm_reg = 0x29;
    INSTRUCTION_TABLE[2].op8_imm = 0x2C;
    INSTRUCTION_TABLE[2].op16_imm = 0x2D;
    INSTRUCTION_TABLE[2].modrm_ext = 5;
}

// --- Простые проверки типов операндов ---
int is_register_16(char* operand) {
    return strcmp_2(operand, "AX") || strcmp_2(operand, "BX") || 
           strcmp_2(operand, "CX") || strcmp_2(operand, "DX") ||
           strcmp_2(operand, "SI") || strcmp_2(operand, "DI") ||
           strcmp_2(operand, "SP") || strcmp_2(operand, "BP");
}

int is_register_8(char* operand) {
    return strcmp_2(operand, "AL") || strcmp_2(operand, "BL") ||
           strcmp_2(operand, "CL") || strcmp_2(operand, "DL") ||
           strcmp_2(operand, "AH") || strcmp_2(operand, "BH") ||
           strcmp_2(operand, "CH") || strcmp_2(operand, "DH");
}

int is_immediate(char* operand) {
    return (operand[0] >= '0' && operand[0] <= '9') || 
           (operand[0] == '0' && operand[1] == 'x');
}

uint8_t get_register_code_16(char* reg) {
    if (strcmp_2(reg, "AX")) return 0;
    if (strcmp_2(reg, "CX")) return 1;
    if (strcmp_2(reg, "DX")) return 2;
    if (strcmp_2(reg, "BX")) return 3;
    if (strcmp_2(reg, "SP")) return 4;
    if (strcmp_2(reg, "BP")) return 5;
    if (strcmp_2(reg, "SI")) return 6;
    if (strcmp_2(reg, "DI")) return 7;
    return 0;
}

uint8_t get_register_code_8(char* reg) {
    if (strcmp_2(reg, "AL")) return 0;
    if (strcmp_2(reg, "CL")) return 1;
    if (strcmp_2(reg, "DL")) return 2;
    if (strcmp_2(reg, "BL")) return 3;
    if (strcmp_2(reg, "AH")) return 4;
    if (strcmp_2(reg, "CH")) return 5;
    if (strcmp_2(reg, "DH")) return 6;
    if (strcmp_2(reg, "BH")) return 7;
    return 0;
}

uint16_t parse_immediate(char* operand) {
    if (operand[0] == '0' && operand[1] == 'x') {
        return (uint16_t)strtol(operand, NULL, 16);
    }
    return (uint16_t)atoi(operand);
}

// --- Простые функции генерации ---

// reg16 + reg16
int gen_reg16_reg16(char* mnemonic, char* dst, char* src, uint8_t* out) {
    if (!is_register_16(dst) || !is_register_16(src)) return -1;
    
    uint8_t d = get_register_code_16(dst);
    uint8_t s = get_register_code_16(src);
    
    if (strcmp_3(mnemonic, "MOV")) {
        out[0] = 0x8B; // MOV reg16, r/m16
        out[1] = 0xC0 | (d << 3) | s;
        return 2;
    }
    else if (strcmp_3(mnemonic, "ADD")) {
        out[0] = 0x01; // ADD r/m16, reg16
        out[1] = 0xC0 | (s << 3) | d;
        return 2;
    }
    else if (strcmp_3(mnemonic, "SUB")) {
        out[0] = 0x29; // SUB r/m16, reg16
        out[1] = 0xC0 | (s << 3) | d;
        return 2;
    }
    return -1;
}

// reg8 + reg8
int gen_reg8_reg8(char* mnemonic, char* dst, char* src, uint8_t* out) {
    if (!is_register_8(dst) || !is_register_8(src)) return -1;
    
    uint8_t d = get_register_code_8(dst);
    uint8_t s = get_register_code_8(src);
    
    if (strcmp_3(mnemonic, "MOV")) {
        out[0] = 0x8A; // MOV reg8, r/m8
        out[1] = 0xC0 | (d << 3) | s;
        return 2;
    }
    else if (strcmp_3(mnemonic, "ADD")) {
        out[0] = 0x00; // ADD r/m8, reg8
        out[1] = 0xC0 | (s << 3) | d;
        return 2;
    }
    else if (strcmp_3(mnemonic, "SUB")) {
        out[0] = 0x28; // SUB r/m8, reg8
        out[1] = 0xC0 | (s << 3) | d;
        return 2;
    }
    return -1;
}

// reg16 + immediate
int gen_reg16_imm(char* mnemonic, char* dst, char* src, uint8_t* out) {
    if (!is_register_16(dst) || !is_immediate(src)) return -1;
    
    uint8_t reg_code = get_register_code_16(dst);
    uint16_t imm = parse_immediate(src);
    
    if (strcmp_3(mnemonic, "MOV")) {
        out[0] = 0xB8 + reg_code; // MOV reg16, imm16
        out[1] = imm & 0xFF;
        out[2] = (imm >> 8) & 0xFF;
        return 3;
    }
    else if (strcmp_3(mnemonic, "ADD")) {
        if (strcmp_2(dst, "AX")) {
            out[0] = 0x05; // ADD AX, imm16
            out[1] = imm & 0xFF;
            out[2] = (imm >> 8) & 0xFF;
            return 3;
        } else {
            out[0] = 0x81; // ADD r/m16, imm16
            out[1] = 0xC0 | reg_code;
            out[2] = imm & 0xFF;
            out[3] = (imm >> 8) & 0xFF;
            return 4;
        }
    }
    else if (strcmp_3(mnemonic, "SUB")) {
        if (strcmp_2(dst, "AX")) {
            out[0] = 0x2D; // SUB AX, imm16
            out[1] = imm & 0xFF;
            out[2] = (imm >> 8) & 0xFF;
            return 3;
        } else {
            out[0] = 0x81; // SUB r/m16, imm16
            out[1] = 0xC0 | (5 << 3) | reg_code;
            out[2] = imm & 0xFF;
            out[3] = (imm >> 8) & 0xFF;
            return 4;
        }
    }
    return -1;
}

// reg8 + immediate
int gen_reg8_imm(char* mnemonic, char* dst, char* src, uint8_t* out) {
    if (!is_register_8(dst) || !is_immediate(src)) return -1;
    
    uint8_t reg_code = get_register_code_8(dst);
    uint16_t imm = parse_immediate(src);
    
    if (imm > 255) return -1; // Слишком большое значение для 8-бит
    
    if (strcmp_3(mnemonic, "MOV")) {
        out[0] = 0xB0 + reg_code; // MOV reg8, imm8
        out[1] = (uint8_t)imm;
        return 2;
    }
    return -1;
}

// --- Главная функция генерации ---
int generate_instruction(char* mnemonic, char* dst, char* src, uint8_t* out) {
    // Пробуем разные комбинации
    int result;
    
    // reg16 + reg16
    if (is_register_16(dst) && is_register_16(src)) {
        result = gen_reg16_reg16(mnemonic, dst, src, out);
        if (result > 0) return result;
    }
    
    // reg8 + reg8
    if (is_register_8(dst) && is_register_8(src)) {
        result = gen_reg8_reg8(mnemonic, dst, src, out);
        if (result > 0) return result;
    }
    
    // reg16 + immediate
    if (is_register_16(dst) && is_immediate(src)) {
        result = gen_reg16_imm(mnemonic, dst, src, out);
        if (result > 0) return result;
    }
    
    // reg8 + immediate
    if (is_register_8(dst) && is_immediate(src)) {
        result = gen_reg8_imm(mnemonic, dst, src, out);
        if (result > 0) return result;
    }
    
    return -1; // Неподдерживаемая комбинация
}

// --- Вспомогательная функция для вывода ---
void print_instruction(char* name, uint8_t* buf, int len) {
    printf("%-15s", name);
    for(int i = 0; i < len; i++) {
        printf("%02X", buf[i]);
        if (i < len - 1) printf(" ");
    }
    printf("\n");
}

// --- Тесты ---
int main() {
    init_instruction_table();
    
    uint8_t buf[8];
    int len;
    
    printf("=== 16-bit Register Operations ===\n");
    len = generate_instruction("MOV", "AX", "BX", buf);
    print_instruction("MOV AX, BX:", buf, len);
    
    len = generate_instruction("ADD", "AX", "CX", buf);
    print_instruction("ADD AX, CX:", buf, len);
    
    len = generate_instruction("SUB", "BX", "DX", buf);
    print_instruction("SUB BX, DX:", buf, len);
    
    printf("\n=== 8-bit Register Operations ===\n");
    len = generate_instruction("MOV", "AL", "BL", buf);
    print_instruction("MOV AL, BL:", buf, len);
    
    len = generate_instruction("ADD", "AH", "CH", buf);
    print_instruction("ADD AH, CH:", buf, len);
    
    len = generate_instruction("SUB", "DL", "CL", buf);
    print_instruction("SUB DL, CL:", buf, len);
    
    printf("\n=== Immediate Operations ===\n");
    len = generate_instruction("MOV", "AX", "1234", buf);
    print_instruction("MOV AX, 1234:", buf, len);
    
    len = generate_instruction("MOV", "AL", "66", buf);
    print_instruction("MOV AL, 66:", buf, len);
    
    len = generate_instruction("ADD", "AX", "100", buf);
    print_instruction("ADD AX, 100:", buf, len);
    
    len = generate_instruction("SUB", "CX", "50", buf);
    print_instruction("SUB CX, 50:", buf, len);
    
    return 0;
}

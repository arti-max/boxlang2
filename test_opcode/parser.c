#include <string.h>
#include <ctype.h>
#include <stdlib.h>
#include "asm.h"

// Вспомогательные функции для строк
int strcmp_2(const char* a, const char* b) {
    return strcmp(a, b) == 0;
}

int strcmp_3(const char* a, const char* b, const char* c) {
    return strcmp(a, b) == 0 || strcmp(a, c) == 0;
}

// Парсинг регистра
int parse_reg(const char* name, Operand* op) {
    // 16-битные регистры
    if (strcmp_2(name, "AX")) { op->type = OP_REG16; op->reg_code = 0; return 1; }
    if (strcmp_2(name, "CX")) { op->type = OP_REG16; op->reg_code = 1; return 1; }
    if (strcmp_2(name, "DX")) { op->type = OP_REG16; op->reg_code = 2; return 1; }
    if (strcmp_2(name, "BX")) { op->type = OP_REG16; op->reg_code = 3; return 1; }
    if (strcmp_2(name, "SP")) { op->type = OP_REG16; op->reg_code = 4; return 1; }
    if (strcmp_2(name, "BP")) { op->type = OP_REG16; op->reg_code = 5; return 1; }
    if (strcmp_2(name, "SI")) { op->type = OP_REG16; op->reg_code = 6; return 1; }
    if (strcmp_2(name, "DI")) { op->type = OP_REG16; op->reg_code = 7; return 1; }
    
    // 8-битные регистры
    if (strcmp_2(name, "AL")) { op->type = OP_REG8; op->reg_code = 0; return 1; }
    if (strcmp_2(name, "CL")) { op->type = OP_REG8; op->reg_code = 1; return 1; }
    if (strcmp_2(name, "DL")) { op->type = OP_REG8; op->reg_code = 2; return 1; }
    if (strcmp_2(name, "BL")) { op->type = OP_REG8; op->reg_code = 3; return 1; }
    if (strcmp_2(name, "AH")) { op->type = OP_REG8; op->reg_code = 4; return 1; }
    if (strcmp_2(name, "CH")) { op->type = OP_REG8; op->reg_code = 5; return 1; }
    if (strcmp_2(name, "DH")) { op->type = OP_REG8; op->reg_code = 6; return 1; }
    if (strcmp_2(name, "BH")) { op->type = OP_REG8; op->reg_code = 7; return 1; }
    
    return 0; // Не найден
}

// Парсинг числа
int parse_number(const char* str, Operand* op) {
    if (isdigit(*str) || (*str == '0' && str[1] == 'x')) {
        op->type = OP_IMM;
        if (*str == '0' && str[1] == 'x') {
            op->imm_value = (uint16_t)strtol(str, NULL, 16);
        } else {
            op->imm_value = (uint16_t)atoi(str);
        }
        return 1;
    }
    return 0;
}

// Парсинг операнда
int parse_operand(const char* str, Operand* op) {
    // Убираем пробелы
    while (isspace(*str)) str++;
    
    // Копируем имя
    strncpy(op->name, str, sizeof(op->name) - 1);
    op->name[sizeof(op->name) - 1] = '\0';
    
    // Пробуем регистр
    if (parse_reg(str, op)) return 1;
    
    // Пробуем число  
    if (parse_number(str, op)) return 1;
    
    op->type = OP_NONE;
    return 0;
}

// Главная функция парсинга
int parse_instruction(const char* line, Instruction* inst) {
    // Инициализация
    memset(inst, 0, sizeof(Instruction));
    inst->dst.type = OP_NONE;
    inst->src.type = OP_NONE;
    
    // Парсим строку: "MOV AX, BX"
    const char* ptr = line;
    char token[32];
    int i = 0;
    
    // Пропускаем пробелы
    while (*ptr && isspace(*ptr)) ptr++;
    
    // Читаем мнемонику
    i = 0;
    while (*ptr && !isspace(*ptr) && i < 7) {
        token[i++] = toupper(*ptr++);
    }
    token[i] = '\0';
    strcpy(inst->mnemonic, token);
    
    // Пропускаем пробелы
    while (*ptr && isspace(*ptr)) ptr++;
    
    if (!*ptr) return 1; // Только мнемоника
    
    // Читаем первый операнд
    i = 0;
    while (*ptr && *ptr != ',' && !isspace(*ptr) && i < 31) {
        token[i++] = *ptr++;
    }
    token[i] = '\0';
    
    if (!parse_operand(token, &inst->dst)) return 0;
    
    // Ищем запятую
    while (*ptr && (*ptr == ',' || isspace(*ptr))) ptr++;
    
    if (!*ptr) return 1; // Один операнд
    
    // Читаем второй операнд
    i = 0;
    while (*ptr && !isspace(*ptr) && i < 31) {
        token[i++] = *ptr++;
    }
    token[i] = '\0';
    
    if (!parse_operand(token, &inst->src)) return 0;
    
    return 1;
}

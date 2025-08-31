#ifndef ASM_H
#define ASM_H

#include <stdint.h>

// Типы операндов
typedef enum {
    OP_NONE,
    OP_REG16,
    OP_REG8,
    OP_IMM
} OpType;

// Операнд
typedef struct {
    OpType type;
    uint8_t reg_code;     // Для регистров
    uint16_t imm_value;   // Для чисел
    char name[8];         // Имя для отладки
} Operand;

// Инструкция
typedef struct {
    char mnemonic[8];
    Operand dst;
    Operand src;
} Instruction;

// Функции
int parse_instruction(const char* line, Instruction* inst);
int generate_code(const Instruction* inst, uint8_t* output);

// Вспомогательные функции для строк
int strcmp_2(const char* a, const char* b);
int strcmp_3(const char* a, const char* b, const char* c);

#endif

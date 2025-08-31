#include "asm.h"
#include <string.h>

int generate_code(const Instruction* inst, uint8_t* output) {
    
    // === MOV ИНСТРУКЦИИ ===
    if (strcmp_2(inst->mnemonic, "MOV")) {
        
        // MOV reg16, reg16
        if (inst->dst.type == OP_REG16 && inst->src.type == OP_REG16) {
            output[0] = 0x89; // MOV r/m16, reg16 (ИСПРАВЛЕНО!)
            output[1] = 0xC0 | (inst->src.reg_code << 3) | inst->dst.reg_code;
            return 2;
        }
        
        // MOV reg8, reg8  
        if (inst->dst.type == OP_REG8 && inst->src.type == OP_REG8) {
            output[0] = 0x88; // MOV r/m8, reg8
            output[1] = 0xC0 | (inst->src.reg_code << 3) | inst->dst.reg_code;
            return 2;
        }
        
        // MOV reg16, imm16
        if (inst->dst.type == OP_REG16 && inst->src.type == OP_IMM) {
            output[0] = 0xB8 + inst->dst.reg_code;
            output[1] = inst->src.imm_value & 0xFF;
            output[2] = (inst->src.imm_value >> 8) & 0xFF;
            return 3;
        }
        
        // MOV reg8, imm8
        if (inst->dst.type == OP_REG8 && inst->src.type == OP_IMM) {
            if (inst->src.imm_value > 255) return -1;
            output[0] = 0xB0 + inst->dst.reg_code;
            output[1] = (uint8_t)inst->src.imm_value;
            return 2;
        }
        
        return -1; // Неподдерживаемая форма MOV
    }
    
    // === ADD ИНСТРУКЦИИ ===
    if (strcmp_2(inst->mnemonic, "ADD")) {
        
        // ADD reg16, reg16
        if (inst->dst.type == OP_REG16 && inst->src.type == OP_REG16) {
            output[0] = 0x01; // ADD r/m16, reg16
            output[1] = 0xC0 | (inst->src.reg_code << 3) | inst->dst.reg_code;
            return 2;
        }
        
        // ADD reg8, reg8
        if (inst->dst.type == OP_REG8 && inst->src.type == OP_REG8) {
            output[0] = 0x00; // ADD r/m8, reg8
            output[1] = 0xC0 | (inst->src.reg_code << 3) | inst->dst.reg_code;
            return 2;
        }
        
        // ADD AX, imm16 (короткая форма)
        if (inst->dst.type == OP_REG16 && inst->dst.reg_code == 0 && inst->src.type == OP_IMM) {
            output[0] = 0x05;
            output[1] = inst->src.imm_value & 0xFF;
            output[2] = (inst->src.imm_value >> 8) & 0xFF;
            return 3;
        }
        
        return -1;
    }
    
    // === SUB ИНСТРУКЦИИ ===
    if (strcmp_2(inst->mnemonic, "SUB")) {
        
        // SUB reg16, reg16
        if (inst->dst.type == OP_REG16 && inst->src.type == OP_REG16) {
            output[0] = 0x29; // SUB r/m16, reg16
            output[1] = 0xC0 | (inst->src.reg_code << 3) | inst->dst.reg_code;
            return 2;
        }

        // SUB reg8, reg8
        if (inst->dst.type == OP_REG8 && inst->src.type == OP_REG8) {
            output[0] = 0x28; // SUB r/m8, reg8
            output[1] = 0xC0 | (inst->src.reg_code << 3) | inst->dst.reg_code;
            return 2;
        }
        
        // SUB AX, imm16 (короткая форма)
        if (inst->dst.type == OP_REG16 && inst->dst.reg_code == 0 && inst->src.type == OP_IMM) {
            output[0] = 0x2D;
            output[1] = inst->src.imm_value & 0xFF;
            output[2] = (inst->src.imm_value >> 8) & 0xFF;
            return 3;
        }
        
        return -1;
    }
    
    return -1; // Неизвестная инструкция
}

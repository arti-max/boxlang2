#include <stdio.h>
#include "asm.h"

void print_hex(const uint8_t* code, int len) {
    for (int i = 0; i < len; i++) {
        printf("%02X ", code[i]);
    }
    printf("\n");
}

int main() {
    const char* tests[] = {
        "MOV AX, BX",    // Должно быть: 89 D8
        "ADD CX, DX",    // Должно быть: 01 D1  
        "MOV AX, 1234",  // Должно быть: B8 D2 04
        "SUB AL, BL"     // Должно быть: 28 D8
    };
    
    for (int i = 0; i < 4; i++) {
        Instruction inst;
        uint8_t code[8];
        
        printf("=== %s ===\n", tests[i]);
        
        if (parse_instruction(tests[i], &inst)) {
            printf("Parsed: %s %s, %s\n", 
                   inst.mnemonic, inst.dst.name, inst.src.name);
            
            int len = generate_code(&inst, code);
            if (len > 0) {
                printf("Code: ");
                print_hex(code, len);
            } else {
                printf("Generation failed!\n");
            }
        } else {
            printf("Parse failed!\n");
        }
        printf("\n");
    }
    
    return 0;
}

jmp start ; 030000

; --- Данные ---
hello_msg:
    bytes "Hello from bootloader!" 0


; --- Основной код ---
start:
    ; Очищаем регистры общего назначения для чистого старта
    xor %eax %eax
    xor %ebx %ebx
    xor %ecx %ecx
    xor %edx %edx
    xor %esi %esi
    xor %egi %egi

    mov %esi hello_msg
    psh %esi
    int $72
    int $11

    trap
    hlt
    
    jmp $0A0000



; ============= LIBRARIES =====================

bytes $AA $55

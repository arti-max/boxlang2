jmp _start

; stdio.asm - Basic I/O functions for BoxLang
; Contains: exit, trapf, and utility functions

; void exit(num32 code)
; Terminates program with exit code
; Parameters: [ebp+8] = exit code
exit:
    psh %ebp
    mov %ebp %esp
    add %ebp 1
    
    ; Get exit code from stack
    mov %ebx %ebp
    add %ebx 8
    ld %ebx %eax
    
    ; Exit with code
    hlt
    
    mov %esp %ebp
    sub %esp 1
    pop %ebp
    rts

; void trapf()
; Debugging trap function
trapf:
    psh %ebp
    mov %ebp %esp
    add %ebp 1
    
    trap
    
    mov %esp %ebp
    sub %esp 1
    pop %ebp
    rts


; void VIDEO_FLUSH()
; Debugging trap function
VIDEO_FLUSH:
    psh %ebp
    mov %ebp %esp
    add %ebp 1
    
    int $11
    
    mov %esp %ebp
    sub %esp 1
    pop %ebp
    rts



_start:
    add %ebp 1
        mov %eax 42
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_lol
    sw %ebx %eax

    jsr play_sound
    jsr trapf
    hlt ; Program end

play_sound:
    psh %ebp
    mov %ebp %esp
    add %ebp 1
    sub %esp 12 ; Allocate space for local variables and arrays
    mov %eax 440
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 4
    sd %ebx %eax
    mov %eax 15
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 8
    sd %ebx %eax
    mov %eax 169095690
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 12
    sd %ebx %eax
    psh %eax
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    mov %e8 %eax
    pop %eax
    mov %esi %e8
    psh %eax
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
    mov %e9 %eax
    pop %eax
    mov %eax %e9
    psh %eax
    mov %ebx %ebp
    sub %ebx 12
    ld %ebx %eax
    mov %e10 %eax
    pop %eax
    mov %edx %e10
    jsr trapf
    int $23
.L_ret_play_sound:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    sub %esp 1
    pop %ebp
    rts

popa:
    psh %ebp
    mov %ebp %esp
    add %ebp 1
.L_ret_popa:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    sub %esp 1
    pop %ebp
    rts

; === Data Section ===
__var_lol: reserve 2 bytes

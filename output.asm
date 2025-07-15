jmp _start

; stdio.asm - Standard input/output library for BoxLang

; void print(string str_addr)
; in: %esi - string addr
print:
    int $91  ; GovnBIOs interrupt
    rts      ; return from subroutine

; void exit(int code)
; in: %eax - exit code
exit:
    hlt      ; stop cpu
    rts      ; na vskaiy sluchai

trapf:
    trap
    rts


_start:
        mov %eax 2
    mov %e8 %eax
    mov %ebx __var_test
    mov %eax %e8
    sd %ebx %eax
    mov %eax 14
    mov %e8 %eax
    mov %ebx __var_test3
    mov %eax %e8
    sw %ebx %eax
    mov %eax 65
    mov %e8 %eax
    mov %ebx __var_chartest
    mov %eax %e8
    sb %ebx %eax
    mov %eax 1
    mov %e8 %eax
    mov %ebx __var_n1
    mov %eax %e8
    sw %ebx %eax
    mov %eax 1
    mov %e8 %eax
    mov %ebx __var_n2
    mov %eax %e8
    sw %ebx %eax
    mov %eax 1
    mov %e8 %eax
    mov %ebx __var_n3
    mov %eax %e8
    sw %ebx %eax

    mov %eax __str_0
    psh %eax
    jsr some_func
    add %esp 4
    mov %ebx __var_n1
    mov %eax 0
    lw %ebx %eax
    mov %e8 %eax
    mov %ebx __var_n2
    mov %eax 0
    lw %ebx %eax
    mov %ebx %eax
    mov %eax %e8
    add %eax %ebx
    mov %e8 %eax
    mov %ebx __var_n3
    mov %eax 0
    lw %ebx %eax
    mov %ebx %eax
    mov %eax %e8
    add %eax %ebx
    mov %e8 %eax
    mov %ebx __var_test
    mov %eax %e8
    sd %ebx %eax
    jsr trapf
    mov %eax 0
    psh %eax
    jsr exit
    add %esp 4
    hlt ; Завершение программы

test:
    psh %ebp
    mov %ebp %esp
    sub %esp 4 ; Выделяем место для локальных переменных
    mov %eax 0
    mov %e8 %eax
    mov %ebx %ebp
    sub %ebx 4
    mov %eax %e8
    sd %ebx %eax
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    mov %e8 %eax
    mov %ebx %ebp
    add %ebx 8
    ld %ebx %eax
    mov %ebx %eax
    mov %eax %e8
    add %eax %ebx
    mov %e8 %eax
    mov %ebx %ebp
    sub %ebx 4
    mov %eax %e8
    sd %ebx %eax
.L_ret_test:
    mov %esp %ebp
    pop %ebp
    rts

some_func:
    psh %ebp
    mov %ebp %esp
    sub %esp 4 ; Выделяем место для локальных переменных
    mov %eax 0
    mov %e8 %eax
    mov %ebx %ebp
    sub %ebx 4
    mov %eax %e8
    sd %ebx %eax
.L_ret_some_func:
    mov %esp %ebp
    pop %ebp
    rts

; === Data Section ===
__var_test: reserve 4 bytes
__var_test3: reserve 2 bytes
__var_chartest: reserve 1 bytes
__var_n1: reserve 2 bytes
__var_n2: reserve 2 bytes
__var_n3: reserve 2 bytes
__str_0: bytes "hello" 0

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
        mov %eax 42
    mov %e8 %eax
    mov %ebx __var_lol
    mov %eax %e8
    sw %ebx %eax

    mov %e8 1990
    jsr trapf
    mov %eax 0
    psh %eax
    jsr exit
    add %esp 4
    hlt ; Завершение программы

popa:
    psh %ebp
    mov %ebp %esp
.L_ret_popa:
    mov %esp %ebp
    pop %ebp
    rts

; === Data Section ===
__var_lol: reserve 2 bytes

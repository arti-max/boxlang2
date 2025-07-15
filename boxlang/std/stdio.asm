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
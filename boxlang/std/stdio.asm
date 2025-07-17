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

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



add_two_nums:
    psh %ebp
    mov %ebp %esp
    add %ebp 1
    mov %ebx %ebp
    add %ebx 8
    ld %ebx %eax
    psh %eax
    mov %ebx %ebp
    add %ebx 12
    ld %ebx %eax
    mov %ebx %eax
    pop %eax
    add %eax %ebx
    jmp .L_ret_add_two_nums
.L_ret_add_two_nums:
    mov %esp %ebp
    sub %esp 1
    pop %ebp
    rts

_start:
    add %ebp 1
    sub %esp 4 ; Allocate space for local variables and arrays
        mov %eax 3
    psh %eax ; Save expression result
    pop %eax ; Restore expression result
    mov %ebx __var_final_result
    sd %ebx %eax
    mov %eax 1
    psh %eax ; Save expression result
    pop %eax ; Restore expression result
    mov %ebx __var_func_result
    sd %ebx %eax
    mov %eax 2
    psh %eax ; Save expression result
    pop %eax ; Restore expression result
    mov %ebx __var_copy_var
    sd %ebx %eax

    mov %eax __str_0
    psh %eax
    jsr for_easy_find_data_sec
    add %esp 4
    mov %eax 11
    psh %eax ; Save expression result
    pop %eax ; Restore expression result
    mov %ebx %ebp
    sub %ebx 4
    sd %ebx %eax
    mov %eax 25
    psh %eax
    mov %eax 10
    psh %eax
    jsr add_two_nums
    add %esp 8
    psh %eax ; Save expression result
    pop %eax ; Restore expression result
    mov %ebx __var_func_result
    sd %ebx %eax
    jsr trapf
    mov %eax 25
    psh %eax
    mov %eax 10
    psh %eax
    jsr add_two_nums
    add %esp 8
    psh %eax ; Save expression result
    pop %eax ; Restore expression result
    mov %ebx %ebp
    sub %ebx 4
    sd %ebx %eax
    mov %ebx __var_func_result
    ld %ebx %eax
    psh %eax ; Save expression result
    pop %eax ; Restore expression result
    mov %ebx __var_copy_var
    sd %ebx %eax
    jsr trapf
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    psh %eax
    mov %eax 2
    mov %ebx %eax
    pop %eax
    mul %eax %ebx
    psh %eax
    mov %eax 3
    psh %eax
    mov %eax 100
    psh %eax
    jsr add_two_nums
    add %esp 8
    mov %ebx %eax
    pop %eax
    add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Restore expression result
    mov %ebx __var_final_result
    sd %ebx %eax
    jsr trapf
    hlt ; Program end

for_easy_find_data_sec:
    psh %ebp
    mov %ebp %esp
    add %ebp 1
    sub %esp 4 ; Allocate space for local variables and arrays
    mov %eax 12
    psh %eax ; Save expression result
    pop %eax ; Restore expression result
    mov %ebx %ebp
    sub %ebx 4
    sd %ebx %eax
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    psh %eax ; Save expression result
    pop %eax ; Restore expression result
    mov %ebx __var_test
    sd %ebx %eax
.L_ret_for_easy_find_data_sec:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    sub %esp 1
    pop %ebp
    rts

; === Data Section ===
__var_final_result: reserve 4 bytes
__var_func_result: reserve 4 bytes
__var_copy_var: reserve 4 bytes
__var_test: reserve 4 bytes
__str_0: bytes "hello" 0

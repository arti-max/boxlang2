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
    sub %esp 12 ; Allocate space for local variables and arrays
        mov %eax 100
    psh %eax ; Save expression result
    pop %eax ; Restore expression result
    mov %ebx __var_global_var
    sd %ebx %eax
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Restore expression result
    mov %ebx __var_result
    sd %ebx %eax

    mov %eax __str_0
    psh %eax
    jsr hlo
    add %esp 4
    jsr trapf
    mov %eax 10
    psh %eax ; Save expression result
    mov %eax 0
    psh %eax ; Save index
    mov %ebx 4
    mul %eax %ebx ; eax = index * size
    mov %e8 %eax ; Save final offset to e8
    mov %ebx __var_global_arr ; ebx = base address of global array
    add %ebx %e8 ; ebx = base_address + offset
    pop %eax ; Restore index (and clean stack)
    pop %eax ; Restore expression result
    sd %ebx %eax ; Store value at address
    mov %eax 20
    psh %eax ; Save expression result
    mov %eax 1
    psh %eax ; Save index
    mov %ebx 4
    mul %eax %ebx ; eax = index * size
    mov %e8 %eax ; Save final offset to e8
    mov %ebx __var_global_arr ; ebx = base address of global array
    add %ebx %e8 ; ebx = base_address + offset
    pop %eax ; Restore index (and clean stack)
    pop %eax ; Restore expression result
    sd %ebx %eax ; Store value at address
    mov %eax 50
    psh %eax ; Save expression result
    mov %eax 4
    psh %eax ; Save index
    mov %ebx 4
    mul %eax %ebx ; eax = index * size
    mov %e8 %eax ; Save final offset to e8
    mov %ebx __var_global_arr ; ebx = base address of global array
    add %ebx %e8 ; ebx = base_address + offset
    pop %eax ; Restore index (and clean stack)
    pop %eax ; Restore expression result
    sd %ebx %eax ; Store value at address
    jsr trapf
    mov %eax 111
    psh %eax ; Save expression result
    mov %eax 0
    psh %eax ; Save index
    mov %ebx 4
    mul %eax %ebx ; eax = index * size
    mov %e8 %eax ; Save final offset to e8
    mov %ebx %ebp
    sub %ebx 12 ; ebx = base address of local array
    add %ebx %e8 ; ebx = base_address + offset
    pop %eax ; Restore index (and clean stack)
    pop %eax ; Restore expression result
    sd %ebx %eax ; Store value at address
    mov %eax 333
    psh %eax ; Save expression result
    mov %eax 2
    psh %eax ; Save index
    mov %ebx 4
    mul %eax %ebx ; eax = index * size
    mov %e8 %eax ; Save final offset to e8
    mov %ebx %ebp
    sub %ebx 12 ; ebx = base address of local array
    add %ebx %e8 ; ebx = base_address + offset
    pop %eax ; Restore index (and clean stack)
    pop %eax ; Restore expression result
    sd %ebx %eax ; Store value at address
    jsr trapf
    mov %eax 1
    psh %eax ; Save index
    mov %ebx 4
    mul %eax %ebx ; eax = index * size
    mov %e8 %eax ; Save final offset to e8
    mov %ebx __var_global_arr ; ebx = base address of global array
    add %ebx %e8 ; ebx = base_address + offset
    pop %eax ; Restore index (and clean stack)
    ld %ebx %eax ; Load value from address
    psh %eax
    mov %eax 2
    psh %eax ; Save index
    mov %ebx 4
    mul %eax %ebx ; eax = index * size
    mov %e8 %eax ; Save final offset to e8
    mov %ebx %ebp
    sub %ebx 12 ; ebx = base address of local array
    add %ebx %e8 ; ebx = base_address + offset
    pop %eax ; Restore index (and clean stack)
    ld %ebx %eax ; Load value from address
    mov %ebx %eax
    pop %eax
    add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Restore expression result
    mov %ebx __var_result
    sd %ebx %eax
    jsr trapf
    hlt ; Program end

hlo:
    psh %ebp
    mov %ebp %esp
.L_ret_hlo:
    mov %esp %ebp
    pop %ebp
    rts

; === Data Section ===
__var_global_arr: reserve 20 bytes
__var_global_var: reserve 4 bytes
__var_result: reserve 4 bytes
__str_0: bytes "hello" 0

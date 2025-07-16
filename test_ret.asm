jmp _start

; stdio.asm - Standard input/output library for BoxLang
; Direct video memory access without BIOS dependency

; Video memory layout:
; Address: $4F0000 - $4F2580 (4800 characters * 2 bytes each)
; Format: [character][attribute] for each position
; Screen: 80 columns x 60 rows


; void exit(int code)
; in: %eax - exit code
exit:
    hlt      ; stop cpu
    rts      ; na vskaiy sluchai

trapf:
    trap
    rts


; Current cursor position (global variables)
cursor_x: reserve 4 bytes
cursor_y: reserve 4 bytes

; void print(char* str)
; Prints a null-terminated string to screen at current cursor position
; Parameters: %eax = string address
print:
    psh %ebp
    mov %ebp %esp
    add %ebp 1
    psh %ebx
    psh %ecx
    psh %edx
    psh %esi
    
    mov %ebx %eax      ; %ebx = string pointer
    
.print_loop:
    lb %ebx %eax       ; Load character
    cmp %eax 0         ; Check for null terminator
    je .print_end
    
    cmp %eax 10        ; Check for newline (\n)
    je .print_newline
    
    jsr .print_char    ; Print the character
    jmp .print_loop
    
.print_newline:
    mov %eax 0
    mov %ebx cursor_x
    sd %ebx %eax
    
    mov %ebx cursor_y
    ld %ebx %eax
    add %eax 1
    cmp %eax 60        ; Check screen height
    jl .newline_ok
    mov %eax 0         ; Wrap to top
.newline_ok:
    mov %ebx cursor_y
    sd %ebx %eax
    jmp .print_loop
    
.print_end:
    pop %esi
    pop %edx
    pop %ecx
    pop %ebx
    mov %esp %ebp
    sub %esp 1
    pop %ebp
    rts

; Internal function to print a single character
; %eax = character to print
.print_char:
    psh %eax
    
    ; Calculate video memory address
    mov %ebx cursor_y
    ld %ebx %ecx       ; %ecx = y
    mov %edx 80
    mul %ecx %edx      ; %ecx = y * 80
    mov %ebx cursor_x
    ld %ebx %edx       ; %edx = x
    add %ecx %edx      ; %ecx = y * 80 + x
    add %ecx %ecx      ; %ecx = (y * 80 + x) * 2 (2 bytes per char)
    add %ecx $4F0000   ; %ecx = video memory address
    
    ; Store character
    pop %eax
    sb %ecx %eax
    
    ; Store attribute (white on black = 0x07)
    add %ecx 1
    mov %eax 7
    sb %ecx %eax
    
    ; Advance cursor
    mov %ebx cursor_x
    ld %ebx %eax
    add %eax 1
    cmp %eax 80
    jl .char_no_wrap
    
    ; Wrap to next line
    mov %eax 0
    mov %ebx cursor_x
    sd %ebx %eax
    mov %ebx cursor_y
    ld %ebx %eax
    add %eax 1
    cmp %eax 60
    jl .char_wrap_ok
    mov %eax 0
.char_wrap_ok:
    mov %ebx cursor_y
    sd %ebx %eax
    rts
    
.char_no_wrap:
    mov %ebx cursor_x
    sd %ebx %eax
    rts

; void clear_screen()
; Clears the entire screen
clear_screen:
    psh %ebp
    mov %ebp %esp
    add %ebp 1
    psh %eax
    psh %ebx
    psh %ecx
    
    mov %ebx $4F0000   ; Start of video memory
    
.clear_loop:
    mov %ecx 0
    sb %ebx %ecx       ; Clear character (space)
    add %ebx 1
    mov %ecx 7
    sb %ebx %ecx       ; Set attribute (white on black)
    add %ebx 1
    cmp %ebx $4F2580   ; End of video memory
    jl .clear_loop
    
    ; Reset cursor position
    mov %eax 0
    mov %ebx cursor_x
    sd %ebx %eax
    mov %ebx cursor_y
    sd %ebx %eax
    
    pop %ecx
    pop %ebx
    pop %eax
    mov %esp %ebp
    sub %esp 1
    pop %ebp
    rts

; void print_num(num32 number)
; Prints a 32-bit number in decimal format
; Parameters: %eax = number to print
print_num:
    psh %ebp
    mov %ebp %esp
    add %ebp 1
    psh %ebx
    psh %ecx
    psh %edx
    psh %esi
    
    ; Handle negative numbers
    cmp %eax 0
    jg .print_num_positive
    je .print_num_zero
    
    ; Print minus sign
    psh %eax
    mov %eax 45  ; '-'
    jsr .print_char
    pop %eax
    
    ; Make number positive
    mov %ebx 0
    sub %ebx %eax
    mov %eax %ebx
    
.print_num_positive:
    mov %ebx 0          ; Digit counter
    mov %esi %esp       ; Remember stack position
    
    ; Extract digits (in reverse order)
.extract_digits:
    mov %edx 0
    mov %ecx 10
    div %eax %ecx       ; %eax = quotient, %edx = remainder
    add %edx 48         ; Convert to ASCII
    psh %edx            ; Push digit onto stack
    add %ebx 1          ; Increment digit counter
    cmp %eax 0
    jne .extract_digits
    
    ; Print digits
.print_digits:
    cmp %ebx 0
    je .print_num_done
    pop %eax
    jsr .print_char
    sub %ebx 1
    jmp .print_digits
    
.print_num_zero:
    mov %eax 48         ; '0'
    jsr .print_char
    
.print_num_done:
    pop %esi
    pop %edx
    pop %ecx
    pop %ebx
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

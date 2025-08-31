jmp _start



_start:
    psh %ebp
    mov %ebp %esp
    sub %esp 8 ; Allocate space for ALL local variables
 
; --- BEGIN Global Variable Initialization ---
    mov %eax 31775
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_COLOR
    sw %ebx %eax
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_index
    sd %ebx %eax
; --- END Global Initialization ---

    mov %eax 1
 psh %eax
    mov %ebx __var_COLOR
    mov %eax 0
    lw %ebx %eax
 psh %eax
 jsr set_color_to_table
 add %esp 8
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 4
    sd %ebx %eax
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 8
    sd %ebx %eax
.L_while_start_0:
    mov %eax 100000
 psh %eax
    mov %ebx __var_index
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_true_2
 mov %eax 0 ; False
 jmp .L_comp_end_2
.L_comp_true_2:
 mov %eax 1 ; True
.L_comp_end_2:
 cmp %eax 0
 je .L_while_end_0 ; Jump to end if condition is false
 ; --- while-body ---
    mov %eax 1
 psh %eax
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
 psh %eax
 jsr draw_pixel
 add %esp 12
    mov %eax 1
 psh %eax
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
 pop %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 4
    sd %ebx %eax
    mov %eax 1
 psh %eax
    mov %ebx __var_index
    ld %ebx %eax
 pop %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_index
    sd %ebx %eax
 jmp .L_while_start_0
.L_while_end_0:
 jsr VIDEO_FLUSH
 int $00
    hlt ; Program end

get_coordinate:
    psh %ebp
    mov %ebp %esp
    sub %esp 8 ; Allocate space for ALL local variables
    mov %eax 640
 psh %eax
    mov %ebx %ebp
    add %ebx 12
    ld %ebx %eax
 pop %ebx
 mul %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 4
    sd %ebx %eax
    mov %ebx %ebp
    add %ebx 8
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
 pop %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 8
    sd %ebx %eax
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
    jmp .L_ret_get_coordinate
.L_ret_get_coordinate:
    mov %esp %ebp
    pop %ebp
    rts

set_color_to_table:
    psh %ebp
    mov %ebp %esp
    sub %esp 8 ; Allocate space for ALL local variables
    mov %eax 2
 psh %eax
    mov %ebx %ebp
    add %ebx 12
    ld %ebx %eax
 pop %ebx
 mul %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 4
    sd %ebx %eax
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
 psh %eax
    mov %eax 4849664
 pop %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 8
    sd %ebx %eax
    mov %ebx %ebp
    add %ebx 8
    mov %eax 0
    lw %ebx %eax
    psh %eax ; Save expression result
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
    mov %ebx %eax  ; %ebx = адрес для записи
    pop %eax       ; %eax = значение для записи
    sw %ebx %eax ; Записываем значение по разыменованному указателю
.L_ret_set_color_to_table:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

draw_pixel:
    psh %ebp
    mov %ebp %esp
    sub %esp 4 ; Allocate space for ALL local variables
    mov %ebx %ebp
    add %ebx 12
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    add %ebx 8
    ld %ebx %eax
 psh %eax
 jsr get_coordinate
 add %esp 8
 psh %eax
    mov %eax 4194304
 pop %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 4
    sd %ebx %eax
    mov %ebx %ebp
    add %ebx 16
    mov %eax 0
    lb %ebx %eax
    psh %eax ; Save expression result
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    mov %ebx %eax  ; %ebx = адрес для записи
    pop %eax       ; %eax = значение для записи
    sb %ebx %eax ; Записываем значение по разыменованному указателю
.L_ret_draw_pixel:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

init_graphics_mode:
    psh %ebp
    mov %ebp %esp
    sub %esp 4 ; Allocate space for ALL local variables
    mov %eax 4849408
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 4
    sd %ebx %eax
    mov %eax 1
    psh %eax ; Save expression result
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    mov %ebx %eax  ; %ebx = адрес для записи
    pop %eax       ; %eax = значение для записи
    sb %ebx %eax ; Записываем значение по разыменованному указателю
.L_ret_init_graphics_mode:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

; === Data Section ===
__var_COLOR: reserve 2 bytes
__var_index: reserve 4 bytes

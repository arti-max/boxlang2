jmp _start



_start:
    psh %ebp
    mov %ebp %esp
 
; --- BEGIN Global Variable Initialization ---
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_text_ptr
    sd %ebx %eax
    mov %eax 4849408
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_videomode_ptr
    sd %ebx %eax
    mov %eax 4849664
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_color_ptr
    sd %ebx %eax
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_buffer_length
    sd %ebx %eax
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_auto_flush
    sb %ebx %eax
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_cursor_x
    sb %ebx %eax
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_cursor_y
    sb %ebx %eax
    mov %eax 15
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var__current_character_color
    sb %ebx %eax
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var__current_background_color
    sb %ebx %eax
    mov %eax 80
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_text_screen_width
    sb %ebx %eax
    mov %eax 60
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_text_screen_height
    sb %ebx %eax
; --- END Global Initialization ---

    hlt ; Program end

printf:
    psh %ebp
    mov %ebp %esp
    sub %esp 17 ; Allocate space for ALL local variables
    mov %ebx %ebp
    add %ebx 8
    ld %ebx %eax
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 4
    sd %ebx %eax
    mov %eax 4
 psh %eax
    mov %eax %ebp
    add %eax 8
 pop %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 8
    sd %ebx %eax
.L_while_start_0:
    mov %eax 0
 psh %eax
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov %eax 0
    lb %ebx %eax ; Загружаем значение по адресу из %ebx
 pop %ebx
 cmp %eax %ebx
 jne .L_comp_true_2
 mov %eax 0 ; False
 jmp .L_comp_end_2
.L_comp_true_2:
 mov %eax 1 ; True
.L_comp_end_2:
 cmp %eax 0
 je .L_while_end_0 ; Jump to end if condition is false
 ; --- while-body ---
    mov %eax 37
 psh %eax
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov %eax 0
    lb %ebx %eax ; Загружаем значение по адресу из %ebx
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_5
 mov %eax 0 ; False
 jmp .L_comp_end_5
.L_comp_true_5:
 mov %eax 1 ; True
.L_comp_end_5:
        cmp %eax 0
        je .L_else_3 ; Jump to else if condition is false
        ; --- if-body ---
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
    mov %eax 105
        psh %eax ; Save case value
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov %eax 0
    lb %ebx %eax ; Загружаем значение по адресу из %ebx
        mov %ebx %eax ; Move match expression value to EBX for comparison
        pop %eax ; Restore case value to EAX for comparison
        cmp %eax %ebx
        je .L_block_body_7_0
    mov %eax 115
        psh %eax ; Save case value
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov %eax 0
    lb %ebx %eax ; Загружаем значение по адресу из %ebx
        mov %ebx %eax ; Move match expression value to EBX for comparison
        pop %eax ; Restore case value to EAX for comparison
        cmp %eax %ebx
        je .L_block_body_7_1
    mov %eax 99
        psh %eax ; Save case value
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov %eax 0
    lb %ebx %eax ; Загружаем значение по адресу из %ebx
        mov %ebx %eax ; Move match expression value to EBX for comparison
        pop %eax ; Restore case value to EAX for comparison
        cmp %eax %ebx
        je .L_block_body_7_2
        jmp .L_block_body_7_3
.L_block_body_7_0:
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
    mov %ebx %eax ; EBX теперь хранит адрес для чтения
    ld %ebx %eax ; Загружаем значение по адресу из %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 12
    sd %ebx %eax
    mov %ebx %ebp
    sub %ebx 12
    ld %ebx %eax
 psh %eax
 jsr print_num
 add %esp 4
    mov %eax 4
 psh %eax
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
 pop %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 8
    sd %ebx %eax
        jmp .L_match_end_6
.L_block_body_7_1:
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
    mov %ebx %eax ; EBX теперь хранит адрес для чтения
    ld %ebx %eax ; Загружаем значение по адресу из %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 16
    sd %ebx %eax
    mov %ebx %ebp
    sub %ebx 16
    ld %ebx %eax
 psh %eax
 jsr print
 add %esp 4
    mov %eax 4
 psh %eax
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
 pop %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 8
    sd %ebx %eax
        jmp .L_match_end_6
.L_block_body_7_2:
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
    mov %ebx %eax ; EBX теперь хранит адрес для чтения
    ld %ebx %eax ; Загружаем значение по адресу из %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 17
    sb %ebx %eax
    mov %ebx %ebp
    sub %ebx 17
    mov %eax 0
    lb %ebx %eax
 psh %eax
 jsr print_char
 add %esp 4
    mov %eax 4
 psh %eax
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
 pop %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 8
    sd %ebx %eax
        jmp .L_match_end_6
.L_block_body_7_3:
    mov %eax 37
 psh %eax
 jsr print_char
 add %esp 4
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov %eax 0
    lb %ebx %eax ; Загружаем значение по адресу из %ebx
 psh %eax
 jsr print_char
 add %esp 4
.L_match_end_6:
        jmp .L_endif_3 ; End of if-body
.L_else_3:
        ; --- else-body ---
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov %eax 0
    lb %ebx %eax ; Загружаем значение по адресу из %ebx
 psh %eax
 jsr print_char
 add %esp 4
.L_endif_3:
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
 jmp .L_while_start_0
.L_while_end_0:
.L_ret_printf:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

init_text_mode:
    psh %ebp
    mov %ebp %esp
    mov %eax 2
    psh %eax ; Save expression result
    mov %ebx __var_videomode_ptr
    ld %ebx %eax
    mov %ebx %eax  ; %ebx = адрес для записи
    pop %eax       ; %eax = значение для записи
    sb %ebx %eax ; Записываем значение по разыменованному указателю
    mov %eax 5177344
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_text_ptr
    sd %ebx %eax
    mov %eax 9600
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_buffer_length
    sd %ebx %eax
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_cursor_x
    sb %ebx %eax
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_cursor_y
    sb %ebx %eax
    mov %eax 0
 psh %eax
    mov %eax 0
 psh %eax
 jsr set_cursor_pos
 add %esp 8
 jsr init_vga_colors
 jsr init_standard_colors
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var__current_background_color
    sb %ebx %eax
    mov %eax 15
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var__current_character_color
    sb %ebx %eax
.L_ret_init_text_mode:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

init_text_mode_beta:
    psh %ebp
    mov %ebp %esp
    mov %eax 3
    psh %eax ; Save expression result
    mov %ebx __var_videomode_ptr
    ld %ebx %eax
    mov %ebx %eax  ; %ebx = адрес для записи
    pop %eax       ; %eax = значение для записи
    sb %ebx %eax ; Записываем значение по разыменованному указателю
    mov %eax 5177344
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_text_ptr
    sd %ebx %eax
    mov %eax 9600
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_buffer_length
    sd %ebx %eax
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_cursor_x
    sb %ebx %eax
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_cursor_y
    sb %ebx %eax
    mov %eax 0
 psh %eax
    mov %eax 0
 psh %eax
 jsr set_cursor_pos
 add %esp 8
 jsr init_vga_colors
 jsr init_standard_colors
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var__current_background_color
    sb %ebx %eax
    mov %eax 15
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var__current_character_color
    sb %ebx %eax
.L_ret_init_text_mode_beta:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

set_auto_flush:
    psh %ebp
    mov %ebp %esp
    mov %ebx %ebp
    add %ebx 8
    mov %eax 0
    lb %ebx %eax
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_auto_flush
    sb %ebx %eax
.L_ret_set_auto_flush:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

init_cga_mode:
    psh %ebp
    mov %ebp %esp
    mov %eax 0
    psh %eax ; Save expression result
    mov %ebx __var_videomode_ptr
    ld %ebx %eax
    mov %ebx %eax  ; %ebx = адрес для записи
    pop %eax       ; %eax = значение для записи
    sb %ebx %eax ; Записываем значение по разыменованному указателю
    mov %eax 307200
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_buffer_length
    sd %ebx %eax
.L_ret_init_cga_mode:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

init_graphics_mode:
    psh %ebp
    mov %ebp %esp
    mov %eax 1
    psh %eax ; Save expression result
    mov %ebx __var_videomode_ptr
    ld %ebx %eax
    mov %ebx %eax  ; %ebx = адрес для записи
    pop %eax       ; %eax = значение для записи
    sb %ebx %eax ; Записываем значение по разыменованному указателю
    mov %eax 307200
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_buffer_length
    sd %ebx %eax
.L_ret_init_graphics_mode:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

init_standard_colors:
    psh %ebp
    mov %ebp %esp
    sub %esp 4 ; Allocate space for ALL local variables
    mov %eax 4849664
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 4
    sd %ebx %eax
    mov %eax 0
    psh %eax ; Save expression result
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    mov %ebx %eax  ; %ebx = адрес для записи
    pop %eax       ; %eax = значение для записи
    sw %ebx %eax ; Записываем значение по разыменованному указателю
    mov %eax 2
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
    mov %eax 21504
    psh %eax ; Save expression result
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    mov %ebx %eax  ; %ebx = адрес для записи
    pop %eax       ; %eax = значение для записи
    sw %ebx %eax ; Записываем значение по разыменованному указателю
    mov %eax 2
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
    mov %eax 672
    psh %eax ; Save expression result
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    mov %ebx %eax  ; %ebx = адрес для записи
    pop %eax       ; %eax = значение для записи
    sw %ebx %eax ; Записываем значение по разыменованному указателю
    mov %eax 2
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
    mov %eax 22176
    psh %eax ; Save expression result
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    mov %ebx %eax  ; %ebx = адрес для записи
    pop %eax       ; %eax = значение для записи
    sw %ebx %eax ; Записываем значение по разыменованному указателю
    mov %eax 2
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
    mov %eax 21
    psh %eax ; Save expression result
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    mov %ebx %eax  ; %ebx = адрес для записи
    pop %eax       ; %eax = значение для записи
    sw %ebx %eax ; Записываем значение по разыменованному указателю
    mov %eax 2
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
    mov %eax 21525
    psh %eax ; Save expression result
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    mov %ebx %eax  ; %ebx = адрес для записи
    pop %eax       ; %eax = значение для записи
    sw %ebx %eax ; Записываем значение по разыменованному указателю
    mov %eax 2
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
    mov %eax 693
    psh %eax ; Save expression result
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    mov %ebx %eax  ; %ebx = адрес для записи
    pop %eax       ; %eax = значение для записи
    sw %ebx %eax ; Записываем значение по разыменованному указателю
    mov %eax 2
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
    mov %eax 22197
    psh %eax ; Save expression result
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    mov %ebx %eax  ; %ebx = адрес для записи
    pop %eax       ; %eax = значение для записи
    sw %ebx %eax ; Записываем значение по разыменованному указателю
    mov %eax 2
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
    mov %eax 10570
    psh %eax ; Save expression result
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    mov %ebx %eax  ; %ebx = адрес для записи
    pop %eax       ; %eax = значение для записи
    sw %ebx %eax ; Записываем значение по разыменованному указателю
    mov %eax 2
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
    mov %eax 32074
    psh %eax ; Save expression result
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    mov %ebx %eax  ; %ebx = адрес для записи
    pop %eax       ; %eax = значение для записи
    sw %ebx %eax ; Записываем значение по разыменованному указателю
    mov %eax 2
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
    mov %eax 11242
    psh %eax ; Save expression result
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    mov %ebx %eax  ; %ebx = адрес для записи
    pop %eax       ; %eax = значение для записи
    sw %ebx %eax ; Записываем значение по разыменованному указателю
    mov %eax 2
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
    mov %eax 32746
    psh %eax ; Save expression result
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    mov %ebx %eax  ; %ebx = адрес для записи
    pop %eax       ; %eax = значение для записи
    sw %ebx %eax ; Записываем значение по разыменованному указателю
    mov %eax 2
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
    mov %eax 10591
    psh %eax ; Save expression result
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    mov %ebx %eax  ; %ebx = адрес для записи
    pop %eax       ; %eax = значение для записи
    sw %ebx %eax ; Записываем значение по разыменованному указателю
    mov %eax 2
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
    mov %eax 32095
    psh %eax ; Save expression result
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    mov %ebx %eax  ; %ebx = адрес для записи
    pop %eax       ; %eax = значение для записи
    sw %ebx %eax ; Записываем значение по разыменованному указателю
    mov %eax 2
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
    mov %eax 11263
    psh %eax ; Save expression result
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    mov %ebx %eax  ; %ebx = адрес для записи
    pop %eax       ; %eax = значение для записи
    sw %ebx %eax ; Записываем значение по разыменованному указателю
    mov %eax 2
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
    mov %eax 32767
    psh %eax ; Save expression result
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    mov %ebx %eax  ; %ebx = адрес для записи
    pop %eax       ; %eax = значение для записи
    sw %ebx %eax ; Записываем значение по разыменованному указателю
.L_ret_init_standard_colors:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

screen_flush:
    psh %ebp
    mov %ebp %esp
 int $11
.L_ret_screen_flush:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

clear_screen:
    psh %ebp
    mov %ebp %esp
    sub %esp 8 ; Allocate space for ALL local variables
    mov %eax 2
 psh %eax
    mov %ebx __var_videomode_ptr
    ld %ebx %eax
    mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov %eax 0
    lb %ebx %eax ; Загружаем значение по адресу из %ebx
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_9
 mov %eax 0 ; False
 jmp .L_comp_end_9
.L_comp_true_9:
 mov %eax 1 ; True
.L_comp_end_9:
        cmp %eax 0
        je .L_endif_7 ; Jump to end if condition is false
        ; --- if-body ---
    mov %eax 5177344
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_text_ptr
    sd %ebx %eax
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 8
    sd %ebx %eax
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 8
    sd %ebx %eax
.L_for_start_10:
    mov %ebx __var_buffer_length
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_true_12
 mov %eax 0 ; False
 jmp .L_comp_end_12
.L_comp_true_12:
 mov %eax 1 ; True
.L_comp_end_12:
 cmp %eax 0
 je .L_for_end_10
    mov %eax 32
    psh %eax ; Save expression result
    mov %ebx __var_text_ptr
    ld %ebx %eax
    mov %ebx %eax  ; %ebx = адрес для записи
    pop %eax       ; %eax = значение для записи
    sb %ebx %eax ; Записываем значение по разыменованному указателю
    mov %eax 1
 psh %eax
    mov %ebx __var_text_ptr
    ld %ebx %eax
 pop %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_text_ptr
    sd %ebx %eax
    mov %eax 4
 psh %eax
    mov %ebx __var__current_background_color
    mov %eax 0
    lb %ebx %eax
 pop %ebx
    mov %ebx __var__current_background_color
    mov %eax 0
    lb %ebx %eax
 sal %eax 4
    psh %eax ; Save expression result
    mov %ebx __var_text_ptr
    ld %ebx %eax
    mov %ebx %eax  ; %ebx = адрес для записи
    pop %eax       ; %eax = значение для записи
    sb %ebx %eax ; Записываем значение по разыменованному указателю
    mov %eax 1
 psh %eax
    mov %ebx __var_text_ptr
    ld %ebx %eax
 pop %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_text_ptr
    sd %ebx %eax
.L_for_inc_10:
    mov %eax 2
 psh %eax
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
 pop %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 8
    sd %ebx %eax
 jmp .L_for_start_10
.L_for_end_10:
    mov %eax 1
 psh %eax
    mov %ebx __var_auto_flush
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_15
 mov %eax 0 ; False
 jmp .L_comp_end_15
.L_comp_true_15:
 mov %eax 1 ; True
.L_comp_end_15:
        cmp %eax 0
        je .L_endif_13 ; Jump to end if condition is false
        ; --- if-body ---
 jsr screen_flush
        jmp .L_endif_13 ; End of if-body
.L_endif_13:
    mov %eax 5177344
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_text_ptr
    sd %ebx %eax
        jmp .L_endif_7 ; End of if-body
.L_endif_7:
.L_ret_clear_screen:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

get_cursor_address:
    psh %ebp
    mov %ebp %esp
    sub %esp 12 ; Allocate space for ALL local variables
    mov %ebx %ebp
    add %ebx 8
    mov %eax 0
    lb %ebx %eax
 psh %eax
    mov %ebx __var_text_screen_width
    mov %eax 0
    lb %ebx %eax
 psh %eax
    mov %ebx %ebp
    add %ebx 12
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 mul %eax %ebx
 pop %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 4
    sd %ebx %eax
    mov %eax 2
 psh %eax
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
 pop %ebx
 mul %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 8
    sd %ebx %eax
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
 psh %eax
    mov %eax 5177344
 pop %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 12
    sd %ebx %eax
    mov %ebx %ebp
    sub %ebx 12
    ld %ebx %eax
    jmp .L_ret_get_cursor_address
.L_ret_get_cursor_address:
    mov %esp %ebp
    pop %ebp
    rts

set_cursor_pos:
    psh %ebp
    mov %ebp %esp
    sub %esp 4 ; Allocate space for ALL local variables
    mov %ebx %ebp
    add %ebx 8
    mov %eax 0
    lb %ebx %eax
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_cursor_x
    sb %ebx %eax
    mov %ebx %ebp
    add %ebx 12
    mov %eax 0
    lb %ebx %eax
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_cursor_y
    sb %ebx %eax
    mov %ebx %ebp
    add %ebx 12
    mov %eax 0
    lb %ebx %eax
 psh %eax
    mov %ebx %ebp
    add %ebx 8
    mov %eax 0
    lb %ebx %eax
 psh %eax
 jsr get_cursor_address
 add %esp 8
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 4
    sd %ebx %eax
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_text_ptr
    sd %ebx %eax
.L_ret_set_cursor_pos:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

get_cursor_x:
    psh %ebp
    mov %ebp %esp
    mov %ebx __var_cursor_x
    mov %eax 0
    lb %ebx %eax
    jmp .L_ret_get_cursor_x
.L_ret_get_cursor_x:
    mov %esp %ebp
    pop %ebp
    rts

get_cursor_y:
    psh %ebp
    mov %ebp %esp
    mov %ebx __var_cursor_y
    mov %eax 0
    lb %ebx %eax
    jmp .L_ret_get_cursor_y
.L_ret_get_cursor_y:
    mov %esp %ebp
    pop %ebp
    rts

update_cursor:
    psh %ebp
    mov %ebp %esp
    mov %ebx __var_text_screen_width
    mov %eax 0
    lb %ebx %eax
 psh %eax
    mov %ebx __var_cursor_x
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jg .L_comp_true_18
 mov %eax 0 ; False
 jmp .L_comp_end_18
.L_comp_true_18:
 mov %eax 1 ; True
.L_comp_end_18:
        cmp %eax 0
        je .L_endif_16 ; Jump to end if condition is false
        ; --- if-body ---
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_cursor_x
    sb %ebx %eax
    mov %eax 1
 psh %eax
    mov %ebx __var_cursor_y
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_cursor_y
    sb %ebx %eax
        jmp .L_endif_16 ; End of if-body
.L_endif_16:
    mov %ebx __var_text_screen_height
    mov %eax 0
    lb %ebx %eax
 psh %eax
    mov %ebx __var_cursor_y
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jg .L_comp_true_21
 mov %eax 0 ; False
 jmp .L_comp_end_21
.L_comp_true_21:
 mov %eax 1 ; True
.L_comp_end_21:
        cmp %eax 0
        je .L_endif_19 ; Jump to end if condition is false
        ; --- if-body ---
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_cursor_y
    sb %ebx %eax
        jmp .L_endif_19 ; End of if-body
.L_endif_19:
    mov %ebx __var_cursor_y
    mov %eax 0
    lb %ebx %eax
 psh %eax
    mov %ebx __var_cursor_x
    mov %eax 0
    lb %ebx %eax
 psh %eax
 jsr set_cursor_pos
 add %esp 8
.L_ret_update_cursor:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

print_newline:
    psh %ebp
    mov %ebp %esp
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_cursor_x
    sb %ebx %eax
    mov %eax 1
 psh %eax
    mov %ebx __var_cursor_y
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_cursor_y
    sb %ebx %eax
 jsr update_cursor
.L_ret_print_newline:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

set_character_color:
    psh %ebp
    mov %ebp %esp
    mov %ebx %ebp
    add %ebx 8
    mov %eax 0
    lb %ebx %eax
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var__current_character_color
    sb %ebx %eax
.L_ret_set_character_color:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

set_background_color:
    psh %ebp
    mov %ebp %esp
    mov %ebx %ebp
    add %ebx 8
    mov %eax 0
    lb %ebx %eax
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var__current_background_color
    sb %ebx %eax
.L_ret_set_background_color:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

combine_colors:
    psh %ebp
    mov %ebp %esp
    mov %ebx __var__current_character_color
    mov %eax 0
    lb %ebx %eax
 psh %eax
    mov %eax 4
 psh %eax
    mov %ebx __var__current_background_color
    mov %eax 0
    lb %ebx %eax
 pop %ebx
    mov %ebx __var__current_background_color
    mov %eax 0
    lb %ebx %eax
 sal %eax 4
 pop %ebx
 add %eax %ebx
    jmp .L_ret_combine_colors
.L_ret_combine_colors:
    mov %esp %ebp
    pop %ebp
    rts

print_char:
    psh %ebp
    mov %ebp %esp
    mov %eax 10
 psh %eax
    mov %ebx %ebp
    add %ebx 8
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_24
 mov %eax 0 ; False
 jmp .L_comp_end_24
.L_comp_true_24:
 mov %eax 1 ; True
.L_comp_end_24:
        cmp %eax 0
        je .L_else_22 ; Jump to else if condition is false
        ; --- if-body ---
 jsr print_newline
        jmp .L_endif_22 ; End of if-body
.L_else_22:
        ; --- else-body ---
    mov %ebx %ebp
    add %ebx 8
    mov %eax 0
    lb %ebx %eax
    psh %eax ; Save expression result
    mov %ebx __var_text_ptr
    ld %ebx %eax
    mov %ebx %eax  ; %ebx = адрес для записи
    pop %eax       ; %eax = значение для записи
    sb %ebx %eax ; Записываем значение по разыменованному указателю
    mov %eax 1
 psh %eax
    mov %ebx __var_text_ptr
    ld %ebx %eax
 pop %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_text_ptr
    sd %ebx %eax
 jsr combine_colors
    psh %eax ; Save expression result
    mov %ebx __var_text_ptr
    ld %ebx %eax
    mov %ebx %eax  ; %ebx = адрес для записи
    pop %eax       ; %eax = значение для записи
    sb %ebx %eax ; Записываем значение по разыменованному указателю
    mov %eax 1
 psh %eax
    mov %ebx __var_text_ptr
    ld %ebx %eax
 pop %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_text_ptr
    sd %ebx %eax
    mov %eax 1
 psh %eax
    mov %ebx __var_cursor_x
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_cursor_x
    sb %ebx %eax
 jsr update_cursor
.L_endif_22:
    mov %eax 1
 psh %eax
    mov %ebx __var_auto_flush
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_27
 mov %eax 0 ; False
 jmp .L_comp_end_27
.L_comp_true_27:
 mov %eax 1 ; True
.L_comp_end_27:
        cmp %eax 0
        je .L_endif_25 ; Jump to end if condition is false
        ; --- if-body ---
 jsr screen_flush
        jmp .L_endif_25 ; End of if-body
.L_endif_25:
.L_ret_print_char:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

print:
    psh %ebp
    mov %ebp %esp
.L_while_start_28:
    mov %eax 0
 psh %eax
    mov %ebx %ebp
    add %ebx 8
    ld %ebx %eax
    mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov %eax 0
    lb %ebx %eax ; Загружаем значение по адресу из %ebx
 pop %ebx
 cmp %eax %ebx
 jne .L_comp_true_30
 mov %eax 0 ; False
 jmp .L_comp_end_30
.L_comp_true_30:
 mov %eax 1 ; True
.L_comp_end_30:
 cmp %eax 0
 je .L_while_end_28 ; Jump to end if condition is false
 ; --- while-body ---
    mov %ebx %ebp
    add %ebx 8
    ld %ebx %eax
    mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov %eax 0
    lb %ebx %eax ; Загружаем значение по адресу из %ebx
 psh %eax
 jsr print_char
 add %esp 4
    mov %eax 1
 psh %eax
    mov %ebx %ebp
    add %ebx 8
    ld %ebx %eax
 pop %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    add %ebx 8
    sd %ebx %eax
 jmp .L_while_start_28
.L_while_end_28:
.L_ret_print:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

print_num:
    psh %ebp
    mov %ebp %esp
    sub %esp 263 ; Allocate space for ALL local variables
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 258
    sw %ebx %eax
    mov %eax 0
 psh %eax
    mov %ebx %ebp
    add %ebx 8
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_33
 mov %eax 0 ; False
 jmp .L_comp_end_33
.L_comp_true_33:
 mov %eax 1 ; True
.L_comp_end_33:
        cmp %eax 0
        je .L_endif_31 ; Jump to end if condition is false
        ; --- if-body ---
    mov %eax 48
 psh %eax
 jsr print_char
 add %esp 4
    mov %eax 0
    jmp .L_ret_print_num
        jmp .L_endif_31 ; End of if-body
.L_endif_31:
    mov %eax 0
 psh %eax
    mov %ebx %ebp
    add %ebx 8
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_true_36
 mov %eax 0 ; False
 jmp .L_comp_end_36
.L_comp_true_36:
 mov %eax 1 ; True
.L_comp_end_36:
        cmp %eax 0
        je .L_endif_34 ; Jump to end if condition is false
        ; --- if-body ---
    mov %eax 45
 psh %eax
 jsr print_char
 add %esp 4
    mov %eax 1
 not %eax
 inx %eax
 psh %eax
    mov %ebx %ebp
    add %ebx 8
    ld %ebx %eax
 pop %ebx
 mul %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    add %ebx 8
    sd %ebx %eax
        jmp .L_endif_34 ; End of if-body
.L_endif_34:
.L_while_start_37:
    mov %eax 0
 psh %eax
    mov %ebx %ebp
    add %ebx 8
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jne .L_comp_true_39
 mov %eax 0 ; False
 jmp .L_comp_end_39
.L_comp_true_39:
 mov %eax 1 ; True
.L_comp_end_39:
 cmp %eax 0
 je .L_while_end_37 ; Jump to end if condition is false
 ; --- while-body ---
    mov %eax 10
 psh %eax
    mov %ebx %ebp
    add %ebx 8
    ld %ebx %eax
 pop %ebx
 div %eax %ebx
 mov %eax %edx ; Remainder is in EDX
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 262
    sd %ebx %eax
    mov %eax 48
 psh %eax
    mov %ebx %ebp
    sub %ebx 262
    ld %ebx %eax
 pop %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 263
    sb %ebx %eax
    mov %eax 10
 psh %eax
    mov %ebx %ebp
    add %ebx 8
    ld %ebx %eax
 pop %ebx
 div %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    add %ebx 8
    sd %ebx %eax
    mov %ebx %ebp
    sub %ebx 263
    mov %eax 0
    lb %ebx %eax
    psh %eax ; Save expression result
    mov %ebx %ebp
    sub %ebx 258
    mov %eax 0
    lw %ebx %eax
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 1
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx %ebp
    sub %ebx 256
    add %ebx %e8   ; %ebx = base_address + offset
    pop %eax ; Восстанавливаем результат для записи
    sb %ebx %eax ; Записываем значение по адресу
    mov %eax 1
 psh %eax
    mov %ebx %ebp
    sub %ebx 258
    mov %eax 0
    lw %ebx %eax
 pop %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 258
    sw %ebx %eax
 jmp .L_while_start_37
.L_while_end_37:
.L_while_start_40:
    mov %eax 0
 psh %eax
    mov %ebx %ebp
    sub %ebx 258
    mov %eax 0
    lw %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jne .L_comp_true_42
 mov %eax 0 ; False
 jmp .L_comp_end_42
.L_comp_true_42:
 mov %eax 1 ; True
.L_comp_end_42:
 cmp %eax 0
 je .L_while_end_40 ; Jump to end if condition is false
 ; --- while-body ---
    mov %eax 1
 psh %eax
    mov %ebx %ebp
    sub %ebx 258
    mov %eax 0
    lw %ebx %eax
 pop %ebx
 not %ebx
 inx %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 258
    sw %ebx %eax
    mov %ebx %ebp
    sub %ebx 258
    mov %eax 0
    lw %ebx %eax
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 1
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx %ebp
    sub %ebx 256
    add %ebx %e8   ; %ebx = base_address + offset
    mov %eax 0
    lb %ebx %eax ; Load value from address
 psh %eax
 jsr print_char
 add %esp 4
 jmp .L_while_start_40
.L_while_end_40:
.L_ret_print_num:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

; === Data Section ===
__var_text_ptr: reserve 4 bytes
__var_videomode_ptr: reserve 4 bytes
__var_color_ptr: reserve 4 bytes
__var_buffer_length: reserve 4 bytes
__var_auto_flush: reserve 1 bytes
__var_cursor_x: reserve 1 bytes
__var_cursor_y: reserve 1 bytes
__var__current_character_color: reserve 1 bytes
__var__current_background_color: reserve 1 bytes
__var_text_screen_width: reserve 1 bytes
__var_text_screen_height: reserve 1 bytes

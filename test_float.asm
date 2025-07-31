jmp _start



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
 jsr init_standard_colors
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
 jsr init_standard_colors
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
 je .L_comp_true_2
 mov %eax 0 ; False
 jmp .L_comp_end_2
.L_comp_true_2:
 mov %eax 1 ; True
.L_comp_end_2:
        cmp %eax 0
        je .L_endif_0 ; Jump to end if condition is false
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
.L_for_start_3:
    mov %ebx __var_buffer_length
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_true_5
 mov %eax 0 ; False
 jmp .L_comp_end_5
.L_comp_true_5:
 mov %eax 1 ; True
.L_comp_end_5:
        cmp %eax 0
        je .L_for_end_3
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
        jmp .L_for_start_3
.L_for_end_3:
    mov %eax 1
 psh %eax
    mov %ebx __var_auto_flush
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_8
 mov %eax 0 ; False
 jmp .L_comp_end_8
.L_comp_true_8:
 mov %eax 1 ; True
.L_comp_end_8:
        cmp %eax 0
        je .L_endif_6 ; Jump to end if condition is false
        ; --- if-body ---
 jsr screen_flush
        jmp .L_endif_6 ; End of if-body
.L_endif_6:
    mov %eax 5177344
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_text_ptr
    sd %ebx %eax
        jmp .L_endif_0 ; End of if-body
.L_endif_0:
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
 jg .L_comp_true_11
 mov %eax 0 ; False
 jmp .L_comp_end_11
.L_comp_true_11:
 mov %eax 1 ; True
.L_comp_end_11:
        cmp %eax 0
        je .L_endif_9 ; Jump to end if condition is false
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
        jmp .L_endif_9 ; End of if-body
.L_endif_9:
    mov %ebx __var_text_screen_height
    mov %eax 0
    lb %ebx %eax
 psh %eax
    mov %ebx __var_cursor_y
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jg .L_comp_true_14
 mov %eax 0 ; False
 jmp .L_comp_end_14
.L_comp_true_14:
 mov %eax 1 ; True
.L_comp_end_14:
        cmp %eax 0
        je .L_endif_12 ; Jump to end if condition is false
        ; --- if-body ---
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_cursor_y
    sb %ebx %eax
        jmp .L_endif_12 ; End of if-body
.L_endif_12:
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
 je .L_comp_true_17
 mov %eax 0 ; False
 jmp .L_comp_end_17
.L_comp_true_17:
 mov %eax 1 ; True
.L_comp_end_17:
        cmp %eax 0
        je .L_else_15 ; Jump to else if condition is false
        ; --- if-body ---
 jsr print_newline
        jmp .L_endif_15 ; End of if-body
.L_else_15:
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
    mov %ebx __var__current_character_color
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
.L_endif_15:
    mov %eax 1
 psh %eax
    mov %ebx __var_auto_flush
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_20
 mov %eax 0 ; False
 jmp .L_comp_end_20
.L_comp_true_20:
 mov %eax 1 ; True
.L_comp_end_20:
        cmp %eax 0
        je .L_endif_18 ; Jump to end if condition is false
        ; --- if-body ---
 jsr screen_flush
        jmp .L_endif_18 ; End of if-body
.L_endif_18:
.L_ret_print_char:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

print:
    psh %ebp
    mov %ebp %esp
.L_while_start_21:
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
 jne .L_comp_true_23
 mov %eax 0 ; False
 jmp .L_comp_end_23
.L_comp_true_23:
 mov %eax 1 ; True
.L_comp_end_23:
        cmp %eax 0
        je .L_while_end_21 ; Jump to end if condition is false
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
        jmp .L_while_start_21
.L_while_end_21:
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
 je .L_comp_true_26
 mov %eax 0 ; False
 jmp .L_comp_end_26
.L_comp_true_26:
 mov %eax 1 ; True
.L_comp_end_26:
        cmp %eax 0
        je .L_endif_24 ; Jump to end if condition is false
        ; --- if-body ---
    mov %eax 48
 psh %eax
 jsr print_char
 add %esp 4
    mov %eax 0
    jmp .L_ret_print_num
        jmp .L_endif_24 ; End of if-body
.L_endif_24:
    mov %eax 0
 psh %eax
    mov %ebx %ebp
    add %ebx 8
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_true_29
 mov %eax 0 ; False
 jmp .L_comp_end_29
.L_comp_true_29:
 mov %eax 1 ; True
.L_comp_end_29:
        cmp %eax 0
        je .L_endif_27 ; Jump to end if condition is false
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
        jmp .L_endif_27 ; End of if-body
.L_endif_27:
.L_while_start_30:
    mov %eax 0
 psh %eax
    mov %ebx %ebp
    add %ebx 8
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jne .L_comp_true_32
 mov %eax 0 ; False
 jmp .L_comp_end_32
.L_comp_true_32:
 mov %eax 1 ; True
.L_comp_end_32:
        cmp %eax 0
        je .L_while_end_30 ; Jump to end if condition is false
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
        jmp .L_while_start_30
.L_while_end_30:
.L_while_start_33:
    mov %eax 0
 psh %eax
    mov %ebx %ebp
    sub %ebx 258
    mov %eax 0
    lw %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jne .L_comp_true_35
 mov %eax 0 ; False
 jmp .L_comp_end_35
.L_comp_true_35:
 mov %eax 1 ; True
.L_comp_end_35:
        cmp %eax 0
        je .L_while_end_33 ; Jump to end if condition is false
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
        jmp .L_while_start_33
.L_while_end_33:
.L_ret_print_num:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

print_float:
    psh %ebp
    mov %ebp %esp
    sub %esp 12 ; Allocate space for ALL local variables
 mov %ebx __var_float_0
 ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    add %ebx 8
    ld %ebx %eax
 pop %ebx
 subf32 %eax %ebx ; Emulate float comparison
 and %eax $80000000
 cmp %eax $80000000
 je __comp_true_37
 mov %eax 0 ; False
 jmp __comp_end_37
__comp_true_37:
 mov %eax 1 ; True
__comp_end_37:
        cmp %eax 0
        je .L_endif_36 ; Jump to end if condition is false
        ; --- if-body ---
    mov %eax 45
 psh %eax
 jsr print_char
 add %esp 4
 mov %ebx __var_float_1
 ld %ebx %eax
 negf32 %eax ; Negate float value by flipping the sign bit
 psh %eax
    mov %ebx %ebp
    add %ebx 8
    ld %ebx %eax
 pop %ebx
 mulf32 %eax %ebx ; Float operation
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    add %ebx 8
    sd %ebx %eax
        jmp .L_endif_36 ; End of if-body
.L_endif_36:
    mov %ebx %ebp
    add %ebx 8
    ld %ebx %eax
 cfi %eax ; Convert float in EAX to integer
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 4
    sd %ebx %eax
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
 psh %eax
 jsr print_num
 add %esp 4
    mov %eax 46
 psh %eax
 jsr print_char
 add %esp 4
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
 cif %eax ; Convert integer in EAX to float
 psh %eax
    mov %ebx %ebp
    add %ebx 8
    ld %ebx %eax
 pop %ebx
 subf32 %eax %ebx ; Float operation
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 8
    sd %ebx %eax
 mov %ebx __var_float_2
 ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
 pop %ebx
 mulf32 %eax %ebx ; Float operation
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 8
    sd %ebx %eax
 mov %ebx __var_float_3
 ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
 pop %ebx
 addf32 %eax %ebx ; Float operation
 cfi %eax ; Convert float in EAX to integer
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
.L_ret_print_float:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

exit:
    psh %ebp
    mov %ebp %esp
 hlt
.L_ret_exit:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

trapf:
    psh %ebp
    mov %ebp %esp
 trap
.L_ret_trapf:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

rand:
    psh %ebp
    mov %ebp %esp
    sub %esp 4 ; Allocate space for ALL local variables
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 4
    sd %ebx %eax
 int $21
    mov %eax %ebp
    sub %eax 4
 mov %e8 %eax
 sd %e8 %edx
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    jmp .L_ret_rand
.L_ret_rand:
    mov %esp %ebp
    pop %ebp
    rts

randrange:
    psh %ebp
    mov %ebp %esp
    sub %esp 4 ; Allocate space for ALL local variables
 jsr rand
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
 div %eax %ebx
 mov %eax %edx ; Remainder is in EDX
    jmp .L_ret_randrange
.L_ret_randrange:
    mov %esp %ebp
    pop %ebp
    rts

sum_n32:
    psh %ebp
    mov %ebp %esp
    sub %esp 8 ; Allocate space for ALL local variables
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
.L_for_start_38:
    mov %ebx %ebp
    add %ebx 12
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_true_40
 mov %eax 0 ; False
 jmp .L_comp_end_40
.L_comp_true_40:
 mov %eax 1 ; True
.L_comp_end_40:
        cmp %eax 0
        je .L_for_end_38
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 4
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx %ebp
    add %ebx 8
    ld %ebx %eax
    mov %ebx %eax  ; %ebx = базовый адрес (значение указателя)
    add %ebx %e8   ; %ebx = base_address + offset
    ld %ebx %eax ; Load value from address
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
        jmp .L_for_start_38
.L_for_end_38:
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    jmp .L_ret_sum_n32
.L_ret_sum_n32:
    mov %esp %ebp
    pop %ebp
    rts

sum_n16:
    psh %ebp
    mov %ebp %esp
    sub %esp 8 ; Allocate space for ALL local variables
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
.L_for_start_41:
    mov %ebx %ebp
    add %ebx 12
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_true_43
 mov %eax 0 ; False
 jmp .L_comp_end_43
.L_comp_true_43:
 mov %eax 1 ; True
.L_comp_end_43:
        cmp %eax 0
        je .L_for_end_41
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 2
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx %ebp
    add %ebx 8
    ld %ebx %eax
    mov %ebx %eax  ; %ebx = базовый адрес (значение указателя)
    add %ebx %e8   ; %ebx = base_address + offset
    ld %ebx %eax ; Load value from address
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
        jmp .L_for_start_41
.L_for_end_41:
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    jmp .L_ret_sum_n16
.L_ret_sum_n16:
    mov %esp %ebp
    pop %ebp
    rts

sum_char:
    psh %ebp
    mov %ebp %esp
    sub %esp 8 ; Allocate space for ALL local variables
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
.L_for_start_44:
    mov %ebx %ebp
    add %ebx 12
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_true_46
 mov %eax 0 ; False
 jmp .L_comp_end_46
.L_comp_true_46:
 mov %eax 1 ; True
.L_comp_end_46:
        cmp %eax 0
        je .L_for_end_44
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 1
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx %ebp
    add %ebx 8
    ld %ebx %eax
    mov %ebx %eax  ; %ebx = базовый адрес (значение указателя)
    add %ebx %e8   ; %ebx = base_address + offset
    ld %ebx %eax ; Load value from address
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
        jmp .L_for_start_44
.L_for_end_44:
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    jmp .L_ret_sum_char
.L_ret_sum_char:
    mov %esp %ebp
    pop %ebp
    rts

printf:
    psh %ebp
    mov %ebp %esp
    sub %esp 21 ; Allocate space for ALL local variables
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
.L_while_start_47:
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
 jne .L_comp_true_49
 mov %eax 0 ; False
 jmp .L_comp_end_49
.L_comp_true_49:
 mov %eax 1 ; True
.L_comp_end_49:
        cmp %eax 0
        je .L_while_end_47 ; Jump to end if condition is false
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
 je .L_comp_true_52
 mov %eax 0 ; False
 jmp .L_comp_end_52
.L_comp_true_52:
 mov %eax 1 ; True
.L_comp_end_52:
        cmp %eax 0
        je .L_else_50 ; Jump to else if condition is false
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
        je .L_block_body_54_0
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
        je .L_block_body_54_1
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
        je .L_block_body_54_2
    mov %eax 102
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
        je .L_block_body_54_3
        jmp .L_block_body_54_4
.L_block_body_54_0:
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
        jmp .L_match_end_53
.L_block_body_54_1:
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
        jmp .L_match_end_53
.L_block_body_54_2:
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
        jmp .L_match_end_53
.L_block_body_54_3:
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
    mov %ebx %eax ; EBX теперь хранит адрес для чтения
    ld %ebx %eax ; Загружаем значение по адресу из %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 21
    sd %ebx %eax
    mov %ebx %ebp
    sub %ebx 21
    ld %ebx %eax
 psh %eax
 jsr print_float
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
        jmp .L_match_end_53
.L_block_body_54_4:
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
.L_match_end_53:
        jmp .L_endif_50 ; End of if-body
.L_else_50:
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
.L_endif_50:
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
        jmp .L_while_start_47
.L_while_end_47:
.L_ret_printf:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

sleep:
    psh %ebp
    mov %ebp %esp
    mov %ebx %ebp
    add %ebx 8
    ld %ebx %eax
 mov %e8 %eax
 mov %edx %e8
 int $22
.L_ret_sleep:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

getkey:
    psh %ebp
    mov %ebp %esp
    sub %esp 8 ; Allocate space for ALL local variables
    mov %eax 4718597
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 4
    sd %ebx %eax
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 5
    sb %ebx %eax
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 6
    sb %ebx %eax
.L_while_start_54:
    mov %eax 0
 psh %eax
    mov %ebx %ebp
    sub %ebx 6
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_56
 mov %eax 0 ; False
 jmp .L_comp_end_56
.L_comp_true_56:
 mov %eax 1 ; True
.L_comp_end_56:
        cmp %eax 0
        je .L_while_end_54 ; Jump to end if condition is false
        ; --- while-body ---
    mov %eax 10
 psh %eax
 jsr sleep
 add %esp 4
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 8
    sw %ebx %eax
.L_for_start_57:
    mov %eax 6
 psh %eax
    mov %ebx %ebp
    sub %ebx 8
    mov %eax 0
    lw %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_true_59
 mov %eax 0 ; False
 jmp .L_comp_end_59
.L_comp_true_59:
 mov %eax 1 ; True
.L_comp_end_59:
        cmp %eax 0
        je .L_for_end_57
    mov %ebx %ebp
    sub %ebx 8
    mov %eax 0
    lw %ebx %eax
 psh %eax
    mov %eax 4718597
 pop %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 4
    sd %ebx %eax
    mov %eax 225
 psh %eax
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov %eax 0
    lb %ebx %eax ; Загружаем значение по адресу из %ebx
 pop %ebx
 cmp %eax %ebx
 jne .L_comp_true_62
 mov %eax 0 ; False
 jmp .L_comp_end_62
.L_comp_true_62:
 mov %eax 1 ; True
.L_comp_end_62:
        cmp %eax 0
        je .L_endif_60 ; Jump to end if condition is false
        ; --- if-body ---
    mov %eax 229
 psh %eax
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov %eax 0
    lb %ebx %eax ; Загружаем значение по адресу из %ebx
 pop %ebx
 cmp %eax %ebx
 jne .L_comp_true_65
 mov %eax 0 ; False
 jmp .L_comp_end_65
.L_comp_true_65:
 mov %eax 1 ; True
.L_comp_end_65:
        cmp %eax 0
        je .L_endif_63 ; Jump to end if condition is false
        ; --- if-body ---
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
 jne .L_comp_true_68
 mov %eax 0 ; False
 jmp .L_comp_end_68
.L_comp_true_68:
 mov %eax 1 ; True
.L_comp_end_68:
        cmp %eax 0
        je .L_endif_66 ; Jump to end if condition is false
        ; --- if-body ---
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov %eax 0
    lb %ebx %eax ; Загружаем значение по адресу из %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 5
    sb %ebx %eax
    mov %eax 1
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 6
    sb %ebx %eax
        jmp .L_endif_66 ; End of if-body
.L_endif_66:
        jmp .L_endif_63 ; End of if-body
.L_endif_63:
        jmp .L_endif_60 ; End of if-body
.L_endif_60:
    mov %eax 1
 psh %eax
    mov %ebx %ebp
    sub %ebx 8
    mov %eax 0
    lw %ebx %eax
 pop %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 8
    sw %ebx %eax
        jmp .L_for_start_57
.L_for_end_57:
        jmp .L_while_start_54
.L_while_end_54:
    mov %ebx %ebp
    sub %ebx 5
    mov %eax 0
    lb %ebx %eax
    jmp .L_ret_getkey
.L_ret_getkey:
    mov %esp %ebp
    pop %ebp
    rts

is_shift_pressed:
    psh %ebp
    mov %ebp %esp
    sub %esp 6 ; Allocate space for ALL local variables
    mov %eax 4718597
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 4
    sd %ebx %eax
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 6
    sw %ebx %eax
.L_for_start_69:
    mov %eax 6
 psh %eax
    mov %ebx %ebp
    sub %ebx 6
    mov %eax 0
    lw %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_true_71
 mov %eax 0 ; False
 jmp .L_comp_end_71
.L_comp_true_71:
 mov %eax 1 ; True
.L_comp_end_71:
        cmp %eax 0
        je .L_for_end_69
    mov %ebx %ebp
    sub %ebx 6
    mov %eax 0
    lw %ebx %eax
 psh %eax
    mov %eax 4718597
 pop %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 4
    sd %ebx %eax
    mov %eax 225
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
        je .L_block_body_73_0
    mov %eax 229
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
        je .L_block_body_73_1
        jmp .L_match_end_72
.L_block_body_73_0:
    mov %eax 1
    jmp .L_ret_is_shift_pressed
        jmp .L_match_end_72
.L_block_body_73_1:
    mov %eax 1
    jmp .L_ret_is_shift_pressed
        jmp .L_match_end_72
.L_match_end_72:
    mov %eax 1
 psh %eax
    mov %ebx %ebp
    sub %ebx 6
    mov %eax 0
    lw %ebx %eax
 pop %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 6
    sw %ebx %eax
        jmp .L_for_start_69
.L_for_end_69:
    mov %eax 0
    jmp .L_ret_is_shift_pressed
.L_ret_is_shift_pressed:
    mov %esp %ebp
    pop %ebp
    rts

key_in_buffer:
    psh %ebp
    mov %ebp %esp
    sub %esp 7 ; Allocate space for ALL local variables
    mov %eax 4718597
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 4
    sd %ebx %eax
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 5
    sb %ebx %eax
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 7
    sw %ebx %eax
.L_for_start_73:
    mov %eax 6
 psh %eax
    mov %ebx %ebp
    sub %ebx 7
    mov %eax 0
    lw %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_true_75
 mov %eax 0 ; False
 jmp .L_comp_end_75
.L_comp_true_75:
 mov %eax 1 ; True
.L_comp_end_75:
        cmp %eax 0
        je .L_for_end_73
    mov %ebx %ebp
    sub %ebx 7
    mov %eax 0
    lw %ebx %eax
 psh %eax
    mov %eax 4718597
 pop %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 4
    sd %ebx %eax
    mov %ebx %ebp
    add %ebx 8
    mov %eax 0
    lb %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov %eax 0
    lb %ebx %eax ; Загружаем значение по адресу из %ebx
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_78
 mov %eax 0 ; False
 jmp .L_comp_end_78
.L_comp_true_78:
 mov %eax 1 ; True
.L_comp_end_78:
        cmp %eax 0
        je .L_endif_76 ; Jump to end if condition is false
        ; --- if-body ---
    mov %eax 1
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 5
    sb %ebx %eax
        jmp .L_endif_76 ; End of if-body
.L_endif_76:
    mov %eax 1
 psh %eax
    mov %ebx %ebp
    sub %ebx 7
    mov %eax 0
    lw %ebx %eax
 pop %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 7
    sw %ebx %eax
        jmp .L_for_start_73
.L_for_end_73:
    mov %ebx %ebp
    sub %ebx 5
    mov %eax 0
    lb %ebx %eax
    jmp .L_ret_key_in_buffer
.L_ret_key_in_buffer:
    mov %esp %ebp
    pop %ebp
    rts

char_to_scancode:
    psh %ebp
    mov %ebp %esp
    sub %esp 151 ; Allocate space for ALL local variables
 ; --- Initialize array 'layout_chars' from __str_init_0 ---
 mov %esi %ebp
 sub %esi 57
 mov %egi __str_init_0
 mov %ecx 54
.L_strcpy_79:
 lb %egi %eax
 sb %esi %eax
 lp .L_strcpy_79
 ; --- Initialize array 'shifted_chars' from __str_init_1 ---
 mov %esi %ebp
 sub %esi 114
 mov %egi __str_init_1
 mov %ecx 54
.L_strcpy_80:
 lb %egi %eax
 sb %esi %eax
 lp .L_strcpy_80
 ; --- Initialize array 'extra' from __str_init_2 ---
 mov %esi %ebp
 sub %esi 140
 mov %egi __str_init_2
 mov %ecx 26
.L_strcpy_81:
 lb %egi %eax
 sb %esi %eax
 lp .L_strcpy_81
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 141
    sb %ebx %eax
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 142
    sb %ebx %eax
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 150
    sd %ebx %eax
.L_for_start_82:
    mov %eax 57 ; .length of layout_chars
 psh %eax
    mov %ebx %ebp
    sub %ebx 150
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_true_84
 mov %eax 0 ; False
 jmp .L_comp_end_84
.L_comp_true_84:
 mov %eax 1 ; True
.L_comp_end_84:
        cmp %eax 0
        je .L_for_end_82
    mov %ebx %ebp
    sub %ebx 150
    ld %ebx %eax
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 1
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx %ebp
    sub %ebx 57
    add %ebx %e8   ; %ebx = base_address + offset
    mov %eax 0
    lb %ebx %eax ; Load value from address
 psh %eax
    mov %ebx %ebp
    add %ebx 8
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_87
 mov %eax 0 ; False
 jmp .L_comp_end_87
.L_comp_true_87:
 mov %eax 1 ; True
.L_comp_end_87:
        cmp %eax 0
        je .L_endif_85 ; Jump to end if condition is false
        ; --- if-body ---
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 141
    sb %ebx %eax
    mov %ebx %ebp
    sub %ebx 150
    ld %ebx %eax
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 142
    sb %ebx %eax
        jmp .L_endif_85 ; End of if-body
.L_endif_85:
    mov %eax 1
 psh %eax
    mov %ebx %ebp
    sub %ebx 150
    ld %ebx %eax
 pop %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 150
    sd %ebx %eax
        jmp .L_for_start_82
.L_for_end_82:
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 150
    sd %ebx %eax
.L_for_start_88:
    mov %eax 26 ; .length of extra
 psh %eax
    mov %ebx %ebp
    sub %ebx 150
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_true_90
 mov %eax 0 ; False
 jmp .L_comp_end_90
.L_comp_true_90:
 mov %eax 1 ; True
.L_comp_end_90:
        cmp %eax 0
        je .L_for_end_88
    mov %ebx %ebp
    sub %ebx 150
    ld %ebx %eax
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 1
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx %ebp
    sub %ebx 140
    add %ebx %e8   ; %ebx = base_address + offset
    mov %eax 0
    lb %ebx %eax ; Load value from address
 psh %eax
    mov %ebx %ebp
    add %ebx 8
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_93
 mov %eax 0 ; False
 jmp .L_comp_end_93
.L_comp_true_93:
 mov %eax 1 ; True
.L_comp_end_93:
        cmp %eax 0
        je .L_endif_91 ; Jump to end if condition is false
        ; --- if-body ---
    mov %eax 1
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 141
    sb %ebx %eax
    mov %ebx %ebp
    sub %ebx 150
    ld %ebx %eax
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 142
    sb %ebx %eax
        jmp .L_endif_91 ; End of if-body
.L_endif_91:
    mov %eax 1
 psh %eax
    mov %ebx %ebp
    sub %ebx 150
    ld %ebx %eax
 pop %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 150
    sd %ebx %eax
        jmp .L_for_start_88
.L_for_end_88:
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 151
    sb %ebx %eax
    mov %eax 0
 psh %eax
    mov %ebx %ebp
    sub %ebx 141
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_96
 mov %eax 0 ; False
 jmp .L_comp_end_96
.L_comp_true_96:
 mov %eax 1 ; True
.L_comp_end_96:
        cmp %eax 0
        je .L_else_94 ; Jump to else if condition is false
        ; --- if-body ---
    mov %eax 4
 psh %eax
    mov %ebx %ebp
    sub %ebx 142
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 151
    sb %ebx %eax
        jmp .L_endif_94 ; End of if-body
.L_else_94:
        ; --- else-body ---
    mov %eax 57
 psh %eax
    mov %ebx %ebp
    sub %ebx 142
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 151
    sb %ebx %eax
.L_endif_94:
    mov %ebx %ebp
    sub %ebx 151
    mov %eax 0
    lb %ebx %eax
    jmp .L_ret_char_to_scancode
.L_ret_char_to_scancode:
    mov %esp %ebp
    pop %ebp
    rts

getchar:
    psh %ebp
    mov %ebp %esp
    sub %esp 145 ; Allocate space for ALL local variables
 jsr getkey
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 1
    sb %ebx %eax
    mov %eax 63
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 2
    sb %ebx %eax
 ; --- Initialize array 'layout_chars' from __str_init_3 ---
 mov %esi %ebp
 sub %esi 59
 mov %egi __str_init_3
 mov %ecx 54
.L_strcpy_97:
 lb %egi %eax
 sb %esi %eax
 lp .L_strcpy_97
 ; --- Initialize array 'shifted_chars' from __str_init_4 ---
 mov %esi %ebp
 sub %esi 116
 mov %egi __str_init_4
 mov %ecx 54
.L_strcpy_98:
 lb %egi %eax
 sb %esi %eax
 lp .L_strcpy_98
 ; --- Initialize array 'extra' from __str_init_5 ---
 mov %esi %ebp
 sub %esi 142
 mov %egi __str_init_5
 mov %ecx 26
.L_strcpy_99:
 lb %egi %eax
 sb %esi %eax
 lp .L_strcpy_99
    mov %eax 57
 psh %eax
    mov %ebx %ebp
    sub %ebx 1
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_true_102
 mov %eax 0 ; False
 jmp .L_comp_end_102
.L_comp_true_102:
 mov %eax 1 ; True
.L_comp_end_102:
        cmp %eax 0
        je .L_else_100 ; Jump to else if condition is false
        ; --- if-body ---
    mov %eax 4
 psh %eax
    mov %ebx %ebp
    sub %ebx 1
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 not %ebx
 inx %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 145
    sb %ebx %eax
 jsr is_shift_pressed
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 144
    sb %ebx %eax
    mov %eax 1
 psh %eax
    mov %ebx %ebp
    sub %ebx 144
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_105
 mov %eax 0 ; False
 jmp .L_comp_end_105
.L_comp_true_105:
 mov %eax 1 ; True
.L_comp_end_105:
        cmp %eax 0
        je .L_else_103 ; Jump to else if condition is false
        ; --- if-body ---
    mov %ebx %ebp
    sub %ebx 145
    mov %eax 0
    lb %ebx %eax
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 1
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx %ebp
    sub %ebx 116
    add %ebx %e8   ; %ebx = base_address + offset
    mov %eax 0
    lb %ebx %eax ; Load value from address
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 2
    sb %ebx %eax
        jmp .L_endif_103 ; End of if-body
.L_else_103:
        ; --- else-body ---
    mov %ebx %ebp
    sub %ebx 145
    mov %eax 0
    lb %ebx %eax
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 1
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx %ebp
    sub %ebx 59
    add %ebx %e8   ; %ebx = base_address + offset
    mov %eax 0
    lb %ebx %eax ; Load value from address
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 2
    sb %ebx %eax
.L_endif_103:
        jmp .L_endif_100 ; End of if-body
.L_else_100:
        ; --- else-body ---
    mov %eax 57
 psh %eax
    mov %ebx %ebp
    sub %ebx 1
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 not %ebx
 inx %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 145
    sb %ebx %eax
    mov %ebx %ebp
    sub %ebx 145
    mov %eax 0
    lb %ebx %eax
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 1
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx %ebp
    sub %ebx 142
    add %ebx %e8   ; %ebx = base_address + offset
    mov %eax 0
    lb %ebx %eax ; Load value from address
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 2
    sb %ebx %eax
.L_endif_100:
    mov %ebx %ebp
    sub %ebx 2
    mov %eax 0
    lb %ebx %eax
    jmp .L_ret_getchar
.L_ret_getchar:
    mov %esp %ebp
    pop %ebp
    rts

confirm_exit:
    psh %ebp
    mov %ebp %esp
 jsr init_text_mode
 mov %eax __str_init_6
 psh %eax
 jsr printf
 jsr screen_flush
 jsr getkey
 jsr exit
.L_ret_confirm_exit:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

_start:
    psh %ebp
    mov %ebp %esp
    sub %esp 52 ; Allocate space for ALL local variables
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
    mov %eax 7
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var__current_character_color
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

 jsr init_text_mode
    mov %eax 0
 psh %eax
 jsr clear_screen
 add %esp 4
 mov %eax __str_init_7
 psh %eax
 jsr printf
 mov %eax __str_init_8
 psh %eax
 jsr printf
 mov %ebx __var_float_4
 ld %ebx %eax
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 4
    sd %ebx %eax
 mov %ebx __var_float_5
 ld %ebx %eax
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 8
    sd %ebx %eax
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
 pop %ebx
 addf32 %eax %ebx ; Float operation
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 12
    sd %ebx %eax
    mov %ebx %ebp
    sub %ebx 12
    ld %ebx %eax
 cfi %eax ; Convert float in EAX to integer
 psh %eax
 mov %eax __str_init_9
 psh %eax
 jsr printf
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
 pop %ebx
 subf32 %eax %ebx ; Float operation
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 16
    sd %ebx %eax
    mov %ebx %ebp
    sub %ebx 16
    ld %ebx %eax
 cfi %eax ; Convert float in EAX to integer
 psh %eax
 mov %eax __str_init_10
 psh %eax
 jsr printf
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
 pop %ebx
 mulf32 %eax %ebx ; Float operation
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 20
    sd %ebx %eax
    mov %ebx %ebp
    sub %ebx 20
    ld %ebx %eax
 cfi %eax ; Convert float in EAX to integer
 psh %eax
 mov %eax __str_init_11
 psh %eax
 jsr printf
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
 psh %eax
 mov %ebx __var_float_6
 ld %ebx %eax
 pop %ebx
 divf32 %eax %ebx ; Float operation
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 24
    sd %ebx %eax
    mov %ebx %ebp
    sub %ebx 24
    ld %ebx %eax
 cfi %eax ; Convert float in EAX to integer
 psh %eax
 mov %eax __str_init_12
 psh %eax
 jsr printf
 mov %eax __str_init_13
 psh %eax
 jsr printf
 mov %ebx __var_float_7
 ld %ebx %eax
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 28
    sd %ebx %eax
 mov %ebx __var_float_8
 ld %ebx %eax
 negf32 %eax ; Negate float value by flipping the sign bit
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 32
    sd %ebx %eax
 mov %ebx __var_float_9
 ld %ebx %eax
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 36
    sd %ebx %eax
    mov %ebx %ebp
    sub %ebx 32
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 28
    ld %ebx %eax
 pop %ebx
 subf32 %eax %ebx ; Emulate float comparison
 mov %ecx %eax
 cmp %ecx 0
 je __comp_false_108
 and %ecx $80000000
 cmp %ecx $80000000
 je __comp_false_108
 jmp __comp_true_107
__comp_false_108:
 mov %eax 0 ; False
 jmp __comp_end_107
__comp_true_107:
 mov %eax 1 ; True
__comp_end_107:
        cmp %eax 0
        je .L_else_106 ; Jump to else if condition is false
        ; --- if-body ---
 mov %eax __str_init_14
 psh %eax
 jsr printf
        jmp .L_endif_106 ; End of if-body
.L_else_106:
        ; --- else-body ---
 mov %eax __str_init_15
 psh %eax
 jsr printf
.L_endif_106:
    mov %ebx %ebp
    sub %ebx 28
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 32
    ld %ebx %eax
 pop %ebx
 subf32 %eax %ebx ; Emulate float comparison
 and %eax $80000000
 cmp %eax $80000000
 je __comp_true_110
 mov %eax 0 ; False
 jmp __comp_end_110
__comp_true_110:
 mov %eax 1 ; True
__comp_end_110:
        cmp %eax 0
        je .L_else_109 ; Jump to else if condition is false
        ; --- if-body ---
 mov %eax __str_init_16
 psh %eax
 jsr printf
        jmp .L_endif_109 ; End of if-body
.L_else_109:
        ; --- else-body ---
 mov %eax __str_init_17
 psh %eax
 jsr printf
.L_endif_109:
    mov %ebx %ebp
    sub %ebx 36
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 28
    ld %ebx %eax
 pop %ebx
 subf32 %eax %ebx ; Emulate float comparison
 cmp %eax 0
 je __comp_true_112
 mov %eax 0 ; False
 jmp __comp_end_112
__comp_true_112:
 mov %eax 1 ; True
__comp_end_112:
        cmp %eax 0
        je .L_else_111 ; Jump to else if condition is false
        ; --- if-body ---
 mov %eax __str_init_18
 psh %eax
 jsr printf
        jmp .L_endif_111 ; End of if-body
.L_else_111:
        ; --- else-body ---
 mov %eax __str_init_19
 psh %eax
 jsr printf
.L_endif_111:
    mov %ebx %ebp
    sub %ebx 32
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 28
    ld %ebx %eax
 pop %ebx
 subf32 %eax %ebx ; Emulate float comparison
 cmp %eax 0
 jne __comp_true_114
 mov %eax 0 ; False
 jmp __comp_end_114
__comp_true_114:
 mov %eax 1 ; True
__comp_end_114:
        cmp %eax 0
        je .L_else_113 ; Jump to else if condition is false
        ; --- if-body ---
 mov %eax __str_init_20
 psh %eax
 jsr printf
        jmp .L_endif_113 ; End of if-body
.L_else_113:
        ; --- else-body ---
 mov %eax __str_init_21
 psh %eax
 jsr printf
.L_endif_113:
    mov %ebx %ebp
    sub %ebx 28
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 36
    ld %ebx %eax
 pop %ebx
 subf32 %eax %ebx ; Emulate float comparison
 mov %ecx %eax
 cmp %ecx 0
 je __comp_true_116
 and %ecx $80000000
 cmp %ecx $80000000
 je __comp_true_116
 mov %eax 0 ; False
 jmp __comp_end_116
__comp_true_116:
 mov %eax 1 ; True
__comp_end_116:
        cmp %eax 0
        je .L_else_115 ; Jump to else if condition is false
        ; --- if-body ---
 mov %eax __str_init_22
 psh %eax
 jsr printf
        jmp .L_endif_115 ; End of if-body
.L_else_115:
        ; --- else-body ---
 mov %eax __str_init_23
 psh %eax
 jsr printf
.L_endif_115:
    mov %ebx %ebp
    sub %ebx 36
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 28
    ld %ebx %eax
 pop %ebx
 subf32 %eax %ebx ; Emulate float comparison
 mov %ecx %eax
 and %ecx $80000000
 cmp %ecx $80000000
 je __comp_false_119
 jmp __comp_true_118
__comp_false_119:
 mov %eax 0 ; False
 jmp __comp_end_118
__comp_true_118:
 mov %eax 1 ; True
__comp_end_118:
        cmp %eax 0
        je .L_else_117 ; Jump to else if condition is false
        ; --- if-body ---
 mov %eax __str_init_24
 psh %eax
 jsr printf
        jmp .L_endif_117 ; End of if-body
.L_else_117:
        ; --- else-body ---
 mov %eax __str_init_25
 psh %eax
 jsr printf
.L_endif_117:
 mov %eax __str_init_26
 psh %eax
 jsr printf
    mov %eax 20
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 40
    sd %ebx %eax
 mov %ebx __var_float_10
 ld %ebx %eax
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 44
    sd %ebx %eax
    mov %ebx %ebp
    sub %ebx 44
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 40
    ld %ebx %eax
 cif %eax ; Convert integer in EAX to float
 pop %ebx
 addf32 %eax %ebx ; Float operation
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 48
    sd %ebx %eax
    mov %ebx %ebp
    sub %ebx 48
    ld %ebx %eax
 psh %eax
 mov %eax __str_init_27
 psh %eax
 jsr printf
    mov %ebx %ebp
    sub %ebx 44
    ld %ebx %eax
 cfi %eax ; Convert float in EAX to integer
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 52
    sd %ebx %eax
    mov %ebx %ebp
    sub %ebx 52
    ld %ebx %eax
 psh %eax
 mov %eax __str_init_28
 psh %eax
 jsr printf
 mov %eax __str_init_29
 psh %eax
 jsr printf
 mov %eax __str_init_30
 psh %eax
 jsr printf
 mov %eax __str_init_31
 psh %eax
 jsr printf
 jsr screen_flush
 jsr trapf
    hlt ; Program end

; === Data Section ===
__var_text_ptr: reserve 4 bytes
__var_videomode_ptr: reserve 4 bytes
__var_color_ptr: reserve 4 bytes
__var_buffer_length: reserve 4 bytes
__var_auto_flush: reserve 1 bytes
__var_cursor_x: reserve 1 bytes
__var_cursor_y: reserve 1 bytes
__var__current_character_color: reserve 1 bytes
__var_text_screen_width: reserve 1 bytes
__var_text_screen_height: reserve 1 bytes
__var_float_0:
 bytes 0 0 0 0 ; Float value: 0.0
__var_float_1:
 bytes 0 0 128 63 ; Float value: 1.0
__var_float_2:
 bytes 0 80 195 71 ; Float value: 100000.0
__var_float_3:
 bytes 0 0 0 63 ; Float value: 0.5
__str_init_0: bytes "abcdefghijklmnopqrstuvwxyz1234567890" $0A $1B $7F $09 " -=[]" $5C "`';'`,./"  0
__str_init_1: bytes "ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%^&*()" $0A $1B $7F $09 " _+{}|~:" $5C $22 "~<>?"  0
__str_init_2: bytes $13 $E0 $E1 $E2 $E3 $E4 $E5 $E6 $E7 $E8 $E9 $EA $EB $14 $17 $12 $07 $C3 $C2 $FE $B4 $C1 $10 $11 $1F $1E  0
__str_init_3: bytes "abcdefghijklmnopqrstuvwxyz1234567890" $0A $1B $7F $09 " -=[]" $5C "`';'`,./"  0
__str_init_4: bytes "ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%^&*()" $0A $1B $7F $09 " _+{}|~:" $5C $22 "~<>?"  0
__str_init_5: bytes $13 $E0 $E1 $E2 $E3 $E4 $E5 $E6 $E7 $E8 $E9 $EA $EB $14 $17 $12 $07 $C3 $C2 $FE $B4 $C1 $10 $11 $1F $1E  0
__str_init_6: bytes "Press any key to exit from this program..." 0
__str_init_7: bytes "--- Float Feature Test Suite ---" $0A $0A 0
__str_init_8: bytes "1. Arithmetic Operations:" $0A 0
__var_float_4:
 bytes 0 0 96 64 ; Float value: 3.5
__var_float_5:
 bytes 0 0 0 64 ; Float value: 2.0
__str_init_9: bytes "  3.5 + 2.0 = %i (int part)" $0A 0
__str_init_10: bytes "  3.5 - 2.0 = %i (int part)" $0A 0
__str_init_11: bytes "  3.5 * 2.0 = %i (int part)" $0A 0
__var_float_6:
 bytes 0 0 160 64 ; Float value: 5.0
__str_init_12: bytes "  5.0 / 2.0 = %i (int part)" $0A 0
__str_init_13: bytes $0A "2. Comparison Operations:" $0A 0
__var_float_7:
 bytes 0 0 40 65 ; Float value: 10.5
__var_float_8:
 bytes 0 0 40 65 ; Float value: 10.5
__var_float_9:
 bytes 0 0 40 65 ; Float value: 10.5
__str_init_14: bytes "  10.5 > -10.5 : OK" $0A 0
__str_init_15: bytes "  10.5 > -10.5 : FAIL" $0A 0
__str_init_16: bytes "  -10.5 < 10.5 : OK" $0A 0
__str_init_17: bytes "  -10.5 < 10.5 : FAIL" $0A 0
__str_init_18: bytes "  10.5 == 10.5 : OK" $0A 0
__str_init_19: bytes "  10.5 == 10.5 : FAIL" $0A 0
__str_init_20: bytes "  10.5 != -10.5 : OK" $0A 0
__str_init_21: bytes "  10.5 != -10.5 : FAIL" $0A 0
__str_init_22: bytes "  10.5 <= 10.5 : OK" $0A 0
__str_init_23: bytes "  10.5 <= 10.5 : FAIL" $0A 0
__str_init_24: bytes "  10.5 >= 10.5 : OK" $0A 0
__str_init_25: bytes "  10.5 >= 10.5 : FAIL" $0A 0
__str_init_26: bytes $0A "3. Type Conversion Operations:" $0A 0
__var_float_10:
 bytes 195 245 72 64 ; Float value: 3.14
__str_init_27: bytes "  to_float(20) + 3.14 = 23.14 (Check: %f)" $0A 0
__str_init_28: bytes "  to_int(3.14) = %i" $0A 0
__str_init_29: bytes $0A "4. Testing for compilation error (should fail if uncommented):" $0A 0
__str_init_30: bytes "  (Test code is commented out to allow compilation)" $0A 0
__str_init_31: bytes $0A "--- All tests completed ---" $0A 0

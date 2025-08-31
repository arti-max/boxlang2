jmp _start



init_vga_colors:
    psh %ebp
    mov %ebp %esp
    mov %eax 0
    psh %eax ; Save expression result
    mov %eax 0
    psh %eax ; Save expression result
    mov %ebx __var_VGA_COLORS
    pop %eax ; Restore expression result
    sb %ebx %eax ; Store value into field 'BLACK'
    mov %eax 1
    psh %eax ; Save expression result
    mov %eax 1
    psh %eax ; Save expression result
    mov %ebx __var_VGA_COLORS
    add %ebx 4 ; offset for field 'RED'
    pop %eax ; Restore expression result
    sb %ebx %eax ; Store value into field 'RED'
    mov %eax 2
    psh %eax ; Save expression result
    mov %eax 2
    psh %eax ; Save expression result
    mov %ebx __var_VGA_COLORS
    add %ebx 2 ; offset for field 'GREEN'
    pop %eax ; Restore expression result
    sb %ebx %eax ; Store value into field 'GREEN'
    mov %eax 3
    psh %eax ; Save expression result
    mov %eax 3
    psh %eax ; Save expression result
    mov %ebx __var_VGA_COLORS
    add %ebx 5 ; offset for field 'BROWN'
    pop %eax ; Restore expression result
    sb %ebx %eax ; Store value into field 'BROWN'
    mov %eax 4
    psh %eax ; Save expression result
    mov %eax 4
    psh %eax ; Save expression result
    mov %ebx __var_VGA_COLORS
    add %ebx 1 ; offset for field 'BLUE'
    pop %eax ; Restore expression result
    sb %ebx %eax ; Store value into field 'BLUE'
    mov %eax 5
    psh %eax ; Save expression result
    mov %eax 5
    psh %eax ; Save expression result
    mov %ebx __var_VGA_COLORS
    add %ebx 12 ; offset for field 'MAGENTA'
    pop %eax ; Restore expression result
    sb %ebx %eax ; Store value into field 'MAGENTA'
    mov %eax 6
    psh %eax ; Save expression result
    mov %eax 6
    psh %eax ; Save expression result
    mov %ebx __var_VGA_COLORS
    add %ebx 3 ; offset for field 'CYAN'
    pop %eax ; Restore expression result
    sb %ebx %eax ; Store value into field 'CYAN'
    mov %eax 7
    psh %eax ; Save expression result
    mov %eax 7
    psh %eax ; Save expression result
    mov %ebx __var_VGA_COLORS
    add %ebx 6 ; offset for field 'LIGHT_GRAY'
    pop %eax ; Restore expression result
    sb %ebx %eax ; Store value into field 'LIGHT_GRAY'
    mov %eax 8
    psh %eax ; Save expression result
    mov %eax 8
    psh %eax ; Save expression result
    mov %ebx __var_VGA_COLORS
    add %ebx 7 ; offset for field 'DARK_GRAY'
    pop %eax ; Restore expression result
    sb %ebx %eax ; Store value into field 'DARK_GRAY'
    mov %eax 9
    psh %eax ; Save expression result
    mov %eax 9
    psh %eax ; Save expression result
    mov %ebx __var_VGA_COLORS
    add %ebx 11 ; offset for field 'LIGHT_RED'
    pop %eax ; Restore expression result
    sb %ebx %eax ; Store value into field 'LIGHT_RED'
    mov %eax 10
    psh %eax ; Save expression result
    mov %eax 10
    psh %eax ; Save expression result
    mov %ebx __var_VGA_COLORS
    add %ebx 9 ; offset for field 'LIGHT_GREEN'
    pop %eax ; Restore expression result
    sb %ebx %eax ; Store value into field 'LIGHT_GREEN'
    mov %eax 11
    psh %eax ; Save expression result
    mov %eax 11
    psh %eax ; Save expression result
    mov %ebx __var_VGA_COLORS
    add %ebx 14 ; offset for field 'YELLOW'
    pop %eax ; Restore expression result
    sb %ebx %eax ; Store value into field 'YELLOW'
    mov %eax 12
    psh %eax ; Save expression result
    mov %eax 12
    psh %eax ; Save expression result
    mov %ebx __var_VGA_COLORS
    add %ebx 8 ; offset for field 'LIGHT_BLUE'
    pop %eax ; Restore expression result
    sb %ebx %eax ; Store value into field 'LIGHT_BLUE'
    mov %eax 13
    psh %eax ; Save expression result
    mov %eax 13
    psh %eax ; Save expression result
    mov %ebx __var_VGA_COLORS
    add %ebx 13 ; offset for field 'PINK'
    pop %eax ; Restore expression result
    sb %ebx %eax ; Store value into field 'PINK'
    mov %eax 14
    psh %eax ; Save expression result
    mov %eax 14
    psh %eax ; Save expression result
    mov %ebx __var_VGA_COLORS
    add %ebx 10 ; offset for field 'LIGHT_CYAN'
    pop %eax ; Restore expression result
    sb %ebx %eax ; Store value into field 'LIGHT_CYAN'
    mov %eax 15
    psh %eax ; Save expression result
    mov %eax 15
    psh %eax ; Save expression result
    mov %ebx __var_VGA_COLORS
    add %ebx 15 ; offset for field 'WHITE'
    pop %eax ; Restore expression result
    sb %ebx %eax ; Store value into field 'WHITE'
.L_ret_init_vga_colors:
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
    mov %ebx __var_VGA_COLORS
    mov %eax 0
    lb %ebx %eax ; Load value of field 'BLACK'
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var__current_background_color
    sb %ebx %eax
    mov %ebx __var_VGA_COLORS
    add %ebx 15 ; offset for field 'WHITE'
    mov %eax 0
    lb %ebx %eax ; Load value of field 'WHITE'
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
    mov %ebx __var_VGA_COLORS
    mov %eax 0
    lb %ebx %eax ; Load value of field 'BLACK'
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var__current_background_color
    sb %ebx %eax
    mov %ebx __var_VGA_COLORS
    add %ebx 15 ; offset for field 'WHITE'
    mov %eax 0
    lb %ebx %eax ; Load value of field 'WHITE'
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
 je .L_comp_true_13
 mov %eax 0 ; False
 jmp .L_comp_end_13
.L_comp_true_13:
 mov %eax 1 ; True
.L_comp_end_13:
        cmp %eax 0
        je .L_endif_11 ; Jump to end if condition is false
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
.L_for_start_14:
    mov %ebx __var_buffer_length
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_true_16
 mov %eax 0 ; False
 jmp .L_comp_end_16
.L_comp_true_16:
 mov %eax 1 ; True
.L_comp_end_16:
 cmp %eax 0
 je .L_for_end_14
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
.L_for_inc_14:
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
 jmp .L_for_start_14
.L_for_end_14:
    mov %eax 1
 psh %eax
    mov %ebx __var_auto_flush
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_19
 mov %eax 0 ; False
 jmp .L_comp_end_19
.L_comp_true_19:
 mov %eax 1 ; True
.L_comp_end_19:
        cmp %eax 0
        je .L_endif_17 ; Jump to end if condition is false
        ; --- if-body ---
 jsr screen_flush
        jmp .L_endif_17 ; End of if-body
.L_endif_17:
    mov %eax 5177344
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_text_ptr
    sd %ebx %eax
        jmp .L_endif_11 ; End of if-body
.L_endif_11:
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
 jg .L_comp_true_22
 mov %eax 0 ; False
 jmp .L_comp_end_22
.L_comp_true_22:
 mov %eax 1 ; True
.L_comp_end_22:
        cmp %eax 0
        je .L_endif_20 ; Jump to end if condition is false
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
        jmp .L_endif_20 ; End of if-body
.L_endif_20:
    mov %ebx __var_text_screen_height
    mov %eax 0
    lb %ebx %eax
 psh %eax
    mov %ebx __var_cursor_y
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jg .L_comp_true_25
 mov %eax 0 ; False
 jmp .L_comp_end_25
.L_comp_true_25:
 mov %eax 1 ; True
.L_comp_end_25:
        cmp %eax 0
        je .L_endif_23 ; Jump to end if condition is false
        ; --- if-body ---
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_cursor_y
    sb %ebx %eax
        jmp .L_endif_23 ; End of if-body
.L_endif_23:
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
 je .L_comp_true_28
 mov %eax 0 ; False
 jmp .L_comp_end_28
.L_comp_true_28:
 mov %eax 1 ; True
.L_comp_end_28:
        cmp %eax 0
        je .L_else_26 ; Jump to else if condition is false
        ; --- if-body ---
 jsr print_newline
        jmp .L_endif_26 ; End of if-body
.L_else_26:
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
.L_endif_26:
    mov %eax 1
 psh %eax
    mov %ebx __var_auto_flush
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_31
 mov %eax 0 ; False
 jmp .L_comp_end_31
.L_comp_true_31:
 mov %eax 1 ; True
.L_comp_end_31:
        cmp %eax 0
        je .L_endif_29 ; Jump to end if condition is false
        ; --- if-body ---
 jsr screen_flush
        jmp .L_endif_29 ; End of if-body
.L_endif_29:
.L_ret_print_char:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

print:
    psh %ebp
    mov %ebp %esp
.L_while_start_32:
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
 jne .L_comp_true_34
 mov %eax 0 ; False
 jmp .L_comp_end_34
.L_comp_true_34:
 mov %eax 1 ; True
.L_comp_end_34:
 cmp %eax 0
 je .L_while_end_32 ; Jump to end if condition is false
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
 jmp .L_while_start_32
.L_while_end_32:
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
 je .L_comp_true_37
 mov %eax 0 ; False
 jmp .L_comp_end_37
.L_comp_true_37:
 mov %eax 1 ; True
.L_comp_end_37:
        cmp %eax 0
        je .L_endif_35 ; Jump to end if condition is false
        ; --- if-body ---
    mov %eax 48
 psh %eax
 jsr print_char
 add %esp 4
    mov %eax 0
    jmp .L_ret_print_num
        jmp .L_endif_35 ; End of if-body
.L_endif_35:
    mov %eax 0
 psh %eax
    mov %ebx %ebp
    add %ebx 8
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
        je .L_endif_38 ; Jump to end if condition is false
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
        jmp .L_endif_38 ; End of if-body
.L_endif_38:
.L_while_start_41:
    mov %eax 0
 psh %eax
    mov %ebx %ebp
    add %ebx 8
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jne .L_comp_true_43
 mov %eax 0 ; False
 jmp .L_comp_end_43
.L_comp_true_43:
 mov %eax 1 ; True
.L_comp_end_43:
 cmp %eax 0
 je .L_while_end_41 ; Jump to end if condition is false
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
 jmp .L_while_start_41
.L_while_end_41:
.L_while_start_44:
    mov %eax 0
 psh %eax
    mov %ebx %ebp
    sub %ebx 258
    mov %eax 0
    lw %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jne .L_comp_true_46
 mov %eax 0 ; False
 jmp .L_comp_end_46
.L_comp_true_46:
 mov %eax 1 ; True
.L_comp_end_46:
 cmp %eax 0
 je .L_while_end_44 ; Jump to end if condition is false
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
 jmp .L_while_start_44
.L_while_end_44:
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
 je __comp_true_48
 mov %eax 0 ; False
 jmp __comp_end_48
__comp_true_48:
 mov %eax 1 ; True
__comp_end_48:
        cmp %eax 0
        je .L_endif_47 ; Jump to end if condition is false
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
        jmp .L_endif_47 ; End of if-body
.L_endif_47:
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
 psh %eax ; Save kasmf argument
 pop %eax ; Restore kasmf argument
sd %eax %edx
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
.L_for_start_49:
    mov %ebx %ebp
    add %ebx 12
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_true_51
 mov %eax 0 ; False
 jmp .L_comp_end_51
.L_comp_true_51:
 mov %eax 1 ; True
.L_comp_end_51:
 cmp %eax 0
 je .L_for_end_49
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
.L_for_inc_49:
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
 jmp .L_for_start_49
.L_for_end_49:
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
.L_for_start_52:
    mov %ebx %ebp
    add %ebx 12
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_true_54
 mov %eax 0 ; False
 jmp .L_comp_end_54
.L_comp_true_54:
 mov %eax 1 ; True
.L_comp_end_54:
 cmp %eax 0
 je .L_for_end_52
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
.L_for_inc_52:
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
 jmp .L_for_start_52
.L_for_end_52:
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
.L_for_start_55:
    mov %ebx %ebp
    add %ebx 12
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_true_57
 mov %eax 0 ; False
 jmp .L_comp_end_57
.L_comp_true_57:
 mov %eax 1 ; True
.L_comp_end_57:
 cmp %eax 0
 je .L_for_end_55
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
.L_for_inc_55:
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
 jmp .L_for_start_55
.L_for_end_55:
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
.L_while_start_58:
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
 jne .L_comp_true_60
 mov %eax 0 ; False
 jmp .L_comp_end_60
.L_comp_true_60:
 mov %eax 1 ; True
.L_comp_end_60:
 cmp %eax 0
 je .L_while_end_58 ; Jump to end if condition is false
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
 je .L_comp_true_63
 mov %eax 0 ; False
 jmp .L_comp_end_63
.L_comp_true_63:
 mov %eax 1 ; True
.L_comp_end_63:
        cmp %eax 0
        je .L_else_61 ; Jump to else if condition is false
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
        je .L_block_body_65_0
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
        je .L_block_body_65_1
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
        je .L_block_body_65_2
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
        je .L_block_body_65_3
        jmp .L_block_body_65_4
.L_block_body_65_0:
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
        jmp .L_match_end_64
.L_block_body_65_1:
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
        jmp .L_match_end_64
.L_block_body_65_2:
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
        jmp .L_match_end_64
.L_block_body_65_3:
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
        jmp .L_match_end_64
.L_block_body_65_4:
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
.L_match_end_64:
        jmp .L_endif_61 ; End of if-body
.L_else_61:
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
.L_endif_61:
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
 jmp .L_while_start_58
.L_while_end_58:
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
 psh %eax ; Save kasmf argument
 pop %eax ; Restore kasmf argument
mov %edx %eax
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
.L_while_start_65:
    mov %eax 0
 psh %eax
    mov %ebx %ebp
    sub %ebx 6
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_67
 mov %eax 0 ; False
 jmp .L_comp_end_67
.L_comp_true_67:
 mov %eax 1 ; True
.L_comp_end_67:
 cmp %eax 0
 je .L_while_end_65 ; Jump to end if condition is false
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
.L_for_start_68:
    mov %eax 6
 psh %eax
    mov %ebx %ebp
    sub %ebx 8
    mov %eax 0
    lw %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_true_70
 mov %eax 0 ; False
 jmp .L_comp_end_70
.L_comp_true_70:
 mov %eax 1 ; True
.L_comp_end_70:
 cmp %eax 0
 je .L_for_end_68
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
 jne .L_comp_true_73
 mov %eax 0 ; False
 jmp .L_comp_end_73
.L_comp_true_73:
 mov %eax 1 ; True
.L_comp_end_73:
        cmp %eax 0
        je .L_endif_71 ; Jump to end if condition is false
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
 jne .L_comp_true_76
 mov %eax 0 ; False
 jmp .L_comp_end_76
.L_comp_true_76:
 mov %eax 1 ; True
.L_comp_end_76:
        cmp %eax 0
        je .L_endif_74 ; Jump to end if condition is false
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
 jne .L_comp_true_79
 mov %eax 0 ; False
 jmp .L_comp_end_79
.L_comp_true_79:
 mov %eax 1 ; True
.L_comp_end_79:
        cmp %eax 0
        je .L_endif_77 ; Jump to end if condition is false
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
        jmp .L_endif_77 ; End of if-body
.L_endif_77:
        jmp .L_endif_74 ; End of if-body
.L_endif_74:
        jmp .L_endif_71 ; End of if-body
.L_endif_71:
.L_for_inc_68:
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
 jmp .L_for_start_68
.L_for_end_68:
 jmp .L_while_start_65
.L_while_end_65:
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
.L_for_start_80:
    mov %eax 6
 psh %eax
    mov %ebx %ebp
    sub %ebx 6
    mov %eax 0
    lw %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_true_82
 mov %eax 0 ; False
 jmp .L_comp_end_82
.L_comp_true_82:
 mov %eax 1 ; True
.L_comp_end_82:
 cmp %eax 0
 je .L_for_end_80
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
        je .L_block_body_84_0
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
        je .L_block_body_84_1
        jmp .L_match_end_83
.L_block_body_84_0:
    mov %eax 1
    jmp .L_ret_is_shift_pressed
        jmp .L_match_end_83
.L_block_body_84_1:
    mov %eax 1
    jmp .L_ret_is_shift_pressed
        jmp .L_match_end_83
.L_match_end_83:
.L_for_inc_80:
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
 jmp .L_for_start_80
.L_for_end_80:
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
.L_for_start_84:
    mov %eax 6
 psh %eax
    mov %ebx %ebp
    sub %ebx 7
    mov %eax 0
    lw %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_true_86
 mov %eax 0 ; False
 jmp .L_comp_end_86
.L_comp_true_86:
 mov %eax 1 ; True
.L_comp_end_86:
 cmp %eax 0
 je .L_for_end_84
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
 je .L_comp_true_89
 mov %eax 0 ; False
 jmp .L_comp_end_89
.L_comp_true_89:
 mov %eax 1 ; True
.L_comp_end_89:
        cmp %eax 0
        je .L_endif_87 ; Jump to end if condition is false
        ; --- if-body ---
    mov %eax 1
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 5
    sb %ebx %eax
        jmp .L_endif_87 ; End of if-body
.L_endif_87:
.L_for_inc_84:
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
 jmp .L_for_start_84
.L_for_end_84:
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
 ; --- Initialize array 'layout_chars' from __str_init_11 ---
 mov %esi %ebp
 sub %esi 57
 mov %egi __str_init_11
 mov %ecx 54
.L_strcpy_90:
 lb %egi %eax
 sb %esi %eax
 lp .L_strcpy_90
 ; --- Initialize array 'shifted_chars' from __str_init_12 ---
 mov %esi %ebp
 sub %esi 114
 mov %egi __str_init_12
 mov %ecx 54
.L_strcpy_91:
 lb %egi %eax
 sb %esi %eax
 lp .L_strcpy_91
 ; --- Initialize array 'extra' from __str_init_13 ---
 mov %esi %ebp
 sub %esi 140
 mov %egi __str_init_13
 mov %ecx 26
.L_strcpy_92:
 lb %egi %eax
 sb %esi %eax
 lp .L_strcpy_92
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
.L_for_start_93:
    mov %eax 57 ; .length of layout_chars
 psh %eax
    mov %ebx %ebp
    sub %ebx 150
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_true_95
 mov %eax 0 ; False
 jmp .L_comp_end_95
.L_comp_true_95:
 mov %eax 1 ; True
.L_comp_end_95:
 cmp %eax 0
 je .L_for_end_93
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
 je .L_comp_true_98
 mov %eax 0 ; False
 jmp .L_comp_end_98
.L_comp_true_98:
 mov %eax 1 ; True
.L_comp_end_98:
        cmp %eax 0
        je .L_endif_96 ; Jump to end if condition is false
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
        jmp .L_endif_96 ; End of if-body
.L_endif_96:
.L_for_inc_93:
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
 jmp .L_for_start_93
.L_for_end_93:
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 150
    sd %ebx %eax
.L_for_start_99:
    mov %eax 26 ; .length of extra
 psh %eax
    mov %ebx %ebp
    sub %ebx 150
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_true_101
 mov %eax 0 ; False
 jmp .L_comp_end_101
.L_comp_true_101:
 mov %eax 1 ; True
.L_comp_end_101:
 cmp %eax 0
 je .L_for_end_99
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
 je .L_comp_true_104
 mov %eax 0 ; False
 jmp .L_comp_end_104
.L_comp_true_104:
 mov %eax 1 ; True
.L_comp_end_104:
        cmp %eax 0
        je .L_endif_102 ; Jump to end if condition is false
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
        jmp .L_endif_102 ; End of if-body
.L_endif_102:
.L_for_inc_99:
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
 jmp .L_for_start_99
.L_for_end_99:
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
 je .L_comp_true_107
 mov %eax 0 ; False
 jmp .L_comp_end_107
.L_comp_true_107:
 mov %eax 1 ; True
.L_comp_end_107:
        cmp %eax 0
        je .L_else_105 ; Jump to else if condition is false
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
        jmp .L_endif_105 ; End of if-body
.L_else_105:
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
.L_endif_105:
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
 ; --- Initialize array 'layout_chars' from __str_init_14 ---
 mov %esi %ebp
 sub %esi 59
 mov %egi __str_init_14
 mov %ecx 54
.L_strcpy_108:
 lb %egi %eax
 sb %esi %eax
 lp .L_strcpy_108
 ; --- Initialize array 'shifted_chars' from __str_init_15 ---
 mov %esi %ebp
 sub %esi 116
 mov %egi __str_init_15
 mov %ecx 54
.L_strcpy_109:
 lb %egi %eax
 sb %esi %eax
 lp .L_strcpy_109
 ; --- Initialize array 'extra' from __str_init_16 ---
 mov %esi %ebp
 sub %esi 142
 mov %egi __str_init_16
 mov %ecx 26
.L_strcpy_110:
 lb %egi %eax
 sb %esi %eax
 lp .L_strcpy_110
    mov %eax 57
 psh %eax
    mov %ebx %ebp
    sub %ebx 1
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_true_113
 mov %eax 0 ; False
 jmp .L_comp_end_113
.L_comp_true_113:
 mov %eax 1 ; True
.L_comp_end_113:
        cmp %eax 0
        je .L_else_111 ; Jump to else if condition is false
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
 je .L_comp_true_116
 mov %eax 0 ; False
 jmp .L_comp_end_116
.L_comp_true_116:
 mov %eax 1 ; True
.L_comp_end_116:
        cmp %eax 0
        je .L_else_114 ; Jump to else if condition is false
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
        jmp .L_endif_114 ; End of if-body
.L_else_114:
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
.L_endif_114:
        jmp .L_endif_111 ; End of if-body
.L_else_111:
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
.L_endif_111:
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
    mov %eax 0
 psh %eax
    mov %ebx %ebp
    add %ebx 8
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_119
 mov %eax 0 ; False
 jmp .L_comp_end_119
.L_comp_true_119:
 mov %eax 1 ; True
.L_comp_end_119:
        cmp %eax 0
        je .L_endif_117 ; Jump to end if condition is false
        ; --- if-body ---
 jsr init_text_mode
        jmp .L_endif_117 ; End of if-body
.L_endif_117:
 mov %eax __str_init_17
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

strlen:
    psh %ebp
    mov %ebp %esp
    sub %esp 4 ; Allocate space for ALL local variables
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 4
    sd %ebx %eax
.L_while_start_120:
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
 jne .L_comp_true_122
 mov %eax 0 ; False
 jmp .L_comp_end_122
.L_comp_true_122:
 mov %eax 1 ; True
.L_comp_end_122:
 cmp %eax 0
 je .L_while_end_120 ; Jump to end if condition is false
 ; --- while-body ---
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
 jmp .L_while_start_120
.L_while_end_120:
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    jmp .L_ret_strlen
.L_ret_strlen:
    mov %esp %ebp
    pop %ebp
    rts

strcmp:
    psh %ebp
    mov %ebp %esp
.L_while_start_123:
    mov %ebx %ebp
    add %ebx 12
    ld %ebx %eax
    mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov %eax 0
    lb %ebx %eax ; Загружаем значение по адресу из %ebx
 psh %eax
    mov %ebx %ebp
    add %ebx 8
    ld %ebx %eax
    mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov %eax 0
    lb %ebx %eax ; Загружаем значение по адресу из %ebx
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_125
 mov %eax 0 ; False
 jmp .L_comp_end_125
.L_comp_true_125:
 mov %eax 1 ; True
.L_comp_end_125:
 cmp %eax 0
 je .L_while_end_123 ; Jump to end if condition is false
 ; --- while-body ---
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
 je .L_comp_true_128
 mov %eax 0 ; False
 jmp .L_comp_end_128
.L_comp_true_128:
 mov %eax 1 ; True
.L_comp_end_128:
        cmp %eax 0
        je .L_endif_126 ; Jump to end if condition is false
        ; --- if-body ---
    mov %eax 0
    jmp .L_ret_strcmp
        jmp .L_endif_126 ; End of if-body
.L_endif_126:
 jmp .L_while_start_123
.L_while_end_123:
    mov %eax 1
    jmp .L_ret_strcmp
.L_ret_strcmp:
    mov %esp %ebp
    pop %ebp
    rts

strcpy:
    psh %ebp
    mov %ebp %esp
.L_ret_strcpy:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

_itoa:
    psh %ebp
    mov %ebp %esp
    sub %esp 28 ; Allocate space for ALL local variables
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 16
    sd %ebx %eax
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 20
    sd %ebx %eax
    mov %eax 0
 psh %eax
    mov %ebx %ebp
    add %ebx 8
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_131
 mov %eax 0 ; False
 jmp .L_comp_end_131
.L_comp_true_131:
 mov %eax 1 ; True
.L_comp_end_131:
        cmp %eax 0
        je .L_endif_129 ; Jump to end if condition is false
        ; --- if-body ---
    mov %eax 48
    psh %eax ; Save expression result
    mov %eax 0
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 1
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx %ebp
    add %ebx 12
    ld %ebx %eax
    mov %ebx %eax  ; %ebx = базовый адрес (значение указателя)
    add %ebx %e8   ; %ebx = base_address + offset
    pop %eax ; Восстанавливаем результат для записи
    sd %ebx %eax ; Записываем значение по адресу
    mov %eax 0
    psh %eax ; Save expression result
    mov %eax 1
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 1
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx %ebp
    add %ebx 12
    ld %ebx %eax
    mov %ebx %eax  ; %ebx = базовый адрес (значение указателя)
    add %ebx %e8   ; %ebx = base_address + offset
    pop %eax ; Восстанавливаем результат для записи
    sd %ebx %eax ; Записываем значение по адресу
    mov %eax 1
    jmp .L_ret__itoa
        jmp .L_endif_129 ; End of if-body
.L_endif_129:
    mov %eax 0
 psh %eax
    mov %ebx %ebp
    add %ebx 8
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_true_134
 mov %eax 0 ; False
 jmp .L_comp_end_134
.L_comp_true_134:
 mov %eax 1 ; True
.L_comp_end_134:
        cmp %eax 0
        je .L_endif_132 ; Jump to end if condition is false
        ; --- if-body ---
    mov %eax 1
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 20
    sd %ebx %eax
    mov %ebx %ebp
    add %ebx 8
    ld %ebx %eax
 not %eax
 inx %eax
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    add %ebx 8
    sd %ebx %eax
        jmp .L_endif_132 ; End of if-body
.L_endif_132:
.L_while_start_135:
    mov %eax 0
 psh %eax
    mov %ebx %ebp
    add %ebx 8
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jne .L_comp_true_137
 mov %eax 0 ; False
 jmp .L_comp_end_137
.L_comp_true_137:
 mov %eax 1 ; True
.L_comp_end_137:
 cmp %eax 0
 je .L_while_end_135 ; Jump to end if condition is false
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
    sub %ebx 24
    sd %ebx %eax
    mov %ebx %ebp
    sub %ebx 24
    ld %ebx %eax
 psh %eax
    mov %eax 48
 pop %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    mov %ebx %ebp
    sub %ebx 16
    ld %ebx %eax
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 1
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx %ebp
    sub %ebx 12
    add %ebx %e8   ; %ebx = base_address + offset
    pop %eax ; Восстанавливаем результат для записи
    sb %ebx %eax ; Записываем значение по адресу
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
    mov %eax 1
 psh %eax
    mov %ebx %ebp
    sub %ebx 16
    ld %ebx %eax
 pop %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 16
    sd %ebx %eax
 jmp .L_while_start_135
.L_while_end_135:
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 28
    sd %ebx %eax
    mov %eax 1
 psh %eax
    mov %ebx %ebp
    sub %ebx 20
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_140
 mov %eax 0 ; False
 jmp .L_comp_end_140
.L_comp_true_140:
 mov %eax 1 ; True
.L_comp_end_140:
        cmp %eax 0
        je .L_endif_138 ; Jump to end if condition is false
        ; --- if-body ---
    mov %eax 45
    psh %eax ; Save expression result
    mov %ebx %ebp
    sub %ebx 28
    ld %ebx %eax
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 1
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx %ebp
    add %ebx 12
    ld %ebx %eax
    mov %ebx %eax  ; %ebx = базовый адрес (значение указателя)
    add %ebx %e8   ; %ebx = base_address + offset
    pop %eax ; Восстанавливаем результат для записи
    sd %ebx %eax ; Записываем значение по адресу
    mov %eax 1
 psh %eax
    mov %ebx %ebp
    sub %ebx 28
    ld %ebx %eax
 pop %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 28
    sd %ebx %eax
        jmp .L_endif_138 ; End of if-body
.L_endif_138:
.L_while_start_141:
    mov %eax 0
 psh %eax
    mov %ebx %ebp
    sub %ebx 16
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jg .L_comp_true_143
 mov %eax 0 ; False
 jmp .L_comp_end_143
.L_comp_true_143:
 mov %eax 1 ; True
.L_comp_end_143:
 cmp %eax 0
 je .L_while_end_141 ; Jump to end if condition is false
 ; --- while-body ---
    mov %eax 1
 psh %eax
    mov %ebx %ebp
    sub %ebx 16
    ld %ebx %eax
 pop %ebx
 not %ebx
 inx %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 16
    sd %ebx %eax
    mov %ebx %ebp
    sub %ebx 16
    ld %ebx %eax
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 1
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx %ebp
    sub %ebx 12
    add %ebx %e8   ; %ebx = base_address + offset
    mov %eax 0
    lb %ebx %eax ; Load value from address
    psh %eax ; Save expression result
    mov %ebx %ebp
    sub %ebx 28
    ld %ebx %eax
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 1
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx %ebp
    add %ebx 12
    ld %ebx %eax
    mov %ebx %eax  ; %ebx = базовый адрес (значение указателя)
    add %ebx %e8   ; %ebx = base_address + offset
    pop %eax ; Восстанавливаем результат для записи
    sd %ebx %eax ; Записываем значение по адресу
    mov %eax 1
 psh %eax
    mov %ebx %ebp
    sub %ebx 28
    ld %ebx %eax
 pop %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 28
    sd %ebx %eax
 jmp .L_while_start_141
.L_while_end_141:
    mov %eax 0
    psh %eax ; Save expression result
    mov %ebx %ebp
    sub %ebx 28
    ld %ebx %eax
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 1
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx %ebp
    add %ebx 12
    ld %ebx %eax
    mov %ebx %eax  ; %ebx = базовый адрес (значение указателя)
    add %ebx %e8   ; %ebx = base_address + offset
    pop %eax ; Восстанавливаем результат для записи
    sd %ebx %eax ; Записываем значение по адресу
    mov %ebx %ebp
    sub %ebx 28
    ld %ebx %eax
    jmp .L_ret__itoa
.L_ret__itoa:
    mov %esp %ebp
    pop %ebp
    rts

sprintf:
    psh %ebp
    mov %ebp %esp
    sub %esp 24 ; Allocate space for ALL local variables
    mov %ebx %ebp
    add %ebx 12
    ld %ebx %eax
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 4
    sd %ebx %eax
    mov %ebx %ebp
    add %ebx 8
    ld %ebx %eax
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 8
    sd %ebx %eax
    mov %eax 4
 psh %eax
    mov %eax %ebp
    add %eax 12
 pop %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 12
    sd %ebx %eax
.L_while_start_144:
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
 jne .L_comp_true_146
 mov %eax 0 ; False
 jmp .L_comp_end_146
.L_comp_true_146:
 mov %eax 1 ; True
.L_comp_end_146:
 cmp %eax 0
 je .L_while_end_144 ; Jump to end if condition is false
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
 je .L_comp_true_149
 mov %eax 0 ; False
 jmp .L_comp_end_149
.L_comp_true_149:
 mov %eax 1 ; True
.L_comp_end_149:
        cmp %eax 0
        je .L_else_147 ; Jump to else if condition is false
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
        je .L_block_body_151_0
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
        je .L_block_body_151_1
        jmp .L_block_body_151_2
.L_block_body_151_0:
    mov %ebx %ebp
    sub %ebx 12
    ld %ebx %eax
    mov %ebx %eax ; EBX теперь хранит адрес для чтения
    ld %ebx %eax ; Загружаем значение по адресу из %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 16
    sd %ebx %eax
.L_while_start_151:
    mov %eax 0
 psh %eax
    mov %ebx %ebp
    sub %ebx 16
    ld %ebx %eax
    mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov %eax 0
    lb %ebx %eax ; Загружаем значение по адресу из %ebx
 pop %ebx
 cmp %eax %ebx
 jne .L_comp_true_153
 mov %eax 0 ; False
 jmp .L_comp_end_153
.L_comp_true_153:
 mov %eax 1 ; True
.L_comp_end_153:
 cmp %eax 0
 je .L_while_end_151 ; Jump to end if condition is false
 ; --- while-body ---
    mov %ebx %ebp
    sub %ebx 16
    ld %ebx %eax
    mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov %eax 0
    lb %ebx %eax ; Загружаем значение по адресу из %ebx
    psh %eax ; Save expression result
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
    mov %ebx %eax  ; %ebx = адрес для записи
    pop %eax       ; %eax = значение для записи
    sb %ebx %eax ; Записываем значение по разыменованному указателю
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
    mov %eax 1
 psh %eax
    mov %ebx %ebp
    sub %ebx 16
    ld %ebx %eax
 pop %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 16
    sd %ebx %eax
 jmp .L_while_start_151
.L_while_end_151:
    mov %eax 4
 psh %eax
    mov %ebx %ebp
    sub %ebx 12
    ld %ebx %eax
 pop %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 12
    sd %ebx %eax
        jmp .L_match_end_150
.L_block_body_151_1:
    mov %ebx %ebp
    sub %ebx 12
    ld %ebx %eax
    mov %ebx %eax ; EBX теперь хранит адрес для чтения
    ld %ebx %eax ; Загружаем значение по адресу из %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 20
    sd %ebx %eax
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 20
    ld %ebx %eax
 psh %eax
 jsr _itoa
 add %esp 8
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 24
    sd %ebx %eax
    mov %ebx %ebp
    sub %ebx 24
    ld %ebx %eax
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
    mov %eax 4
 psh %eax
    mov %ebx %ebp
    sub %ebx 12
    ld %ebx %eax
 pop %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 12
    sd %ebx %eax
        jmp .L_match_end_150
.L_block_body_151_2:
    mov %eax 37
    psh %eax ; Save expression result
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
    mov %ebx %eax  ; %ebx = адрес для записи
    pop %eax       ; %eax = значение для записи
    sb %ebx %eax ; Записываем значение по разыменованному указателю
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
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov %eax 0
    lb %ebx %eax ; Загружаем значение по адресу из %ebx
    psh %eax ; Save expression result
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
    mov %ebx %eax  ; %ebx = адрес для записи
    pop %eax       ; %eax = значение для записи
    sb %ebx %eax ; Записываем значение по разыменованному указателю
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
.L_match_end_150:
        jmp .L_endif_147 ; End of if-body
.L_else_147:
        ; --- else-body ---
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov %eax 0
    lb %ebx %eax ; Загружаем значение по адресу из %ebx
    psh %eax ; Save expression result
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
    mov %ebx %eax  ; %ebx = адрес для записи
    pop %eax       ; %eax = значение для записи
    sb %ebx %eax ; Записываем значение по разыменованному указателю
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
.L_endif_147:
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
 jmp .L_while_start_144
.L_while_end_144:
    mov %eax 0
    psh %eax ; Save expression result
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
    mov %ebx %eax  ; %ebx = адрес для записи
    pop %eax       ; %eax = значение для записи
    sb %ebx %eax ; Записываем значение по разыменованному указателю
.L_ret_sprintf:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

_start:
    psh %ebp
    mov %ebp %esp
    sub %esp 1 ; Allocate space for ALL local variables
 
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
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_is_exit
    sb %ebx %eax
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_current_view
    sb %ebx %eax
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_main_menu_selection
    sb %ebx %eax
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_boot_menu_selection
    sb %ebx %eax
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_settings_menu_selection
    sb %ebx %eax
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_theme_menu_selection
    sb %ebx %eax
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_default_boot_disk
    sd %ebx %eax
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_color_theme
    sd %ebx %eax
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_HEADER_BG
    sb %ebx %eax
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_HEADER_FG
    sb %ebx %eax
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_MAIN_BG
    sb %ebx %eax
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_MAIN_FG
    sb %ebx %eax
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_SELECT_BG
    sb %ebx %eax
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_SELECT_FG
    sb %ebx %eax
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_HIGHLIGHT_FG
    sb %ebx %eax

;  Initializing global array 'main_item_1'
 mov %esi __var_main_item_1
 mov %egi __str_init_global_0
 mov %ecx 18
.L_memcpy_g_0:
 lb %egi %eax
 sb %esi %eax
 lp .L_memcpy_g_0

;  Initializing global array 'main_item_2'
 mov %esi __var_main_item_2
 mov %egi __str_init_global_1
 mov %ecx 18
.L_memcpy_g_1:
 lb %egi %eax
 sb %esi %eax
 lp .L_memcpy_g_1

;  Initializing global array 'main_item_3'
 mov %esi __var_main_item_3
 mov %egi __str_init_global_2
 mov %ecx 13
.L_memcpy_g_2:
 lb %egi %eax
 sb %esi %eax
 lp .L_memcpy_g_2

;  Initializing global array 'main_item_4'
 mov %esi __var_main_item_4
 mov %egi __str_init_global_3
 mov %ecx 13
.L_memcpy_g_3:
 lb %egi %eax
 sb %esi %eax
 lp .L_memcpy_g_3

;  Initializing global array 'main_item_5'
 mov %esi __var_main_item_5
 mov %egi __str_init_global_4
 mov %ecx 11
.L_memcpy_g_4:
 lb %egi %eax
 sb %esi %eax
 lp .L_memcpy_g_4
    mov %eax 5
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_MAIN_MENU_COUNT
    sb %ebx %eax

;  Initializing global array 'settings_item_1'
 mov %esi __var_settings_item_1
 mov %egi __str_init_global_5
 mov %ecx 18
.L_memcpy_g_5:
 lb %egi %eax
 sb %esi %eax
 lp .L_memcpy_g_5

;  Initializing global array 'settings_item_2'
 mov %esi __var_settings_item_2
 mov %egi __str_init_global_6
 mov %ecx 23
.L_memcpy_g_6:
 lb %egi %eax
 sb %esi %eax
 lp .L_memcpy_g_6

;  Initializing global array 'settings_item_3'
 mov %esi __var_settings_item_3
 mov %egi __str_init_global_7
 mov %ecx 19
.L_memcpy_g_7:
 lb %egi %eax
 sb %esi %eax
 lp .L_memcpy_g_7
    mov %eax 3
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_SETTINGS_MENU_COUNT
    sb %ebx %eax

;  Initializing global array 'theme_item_1'
 mov %esi __var_theme_item_1
 mov %egi __str_init_global_8
 mov %ecx 12
.L_memcpy_g_8:
 lb %egi %eax
 sb %esi %eax
 lp .L_memcpy_g_8

;  Initializing global array 'theme_item_2'
 mov %esi __var_theme_item_2
 mov %egi __str_init_global_9
 mov %ecx 12
.L_memcpy_g_9:
 lb %egi %eax
 sb %esi %eax
 lp .L_memcpy_g_9

;  Initializing global array 'theme_item_3'
 mov %esi __var_theme_item_3
 mov %egi __str_init_global_10
 mov %ecx 16
.L_memcpy_g_10:
 lb %egi %eax
 sb %esi %eax
 lp .L_memcpy_g_10
    mov %eax 3
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_THEME_MENU_COUNT
    sb %ebx %eax
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_bootable_disk_count
    sb %ebx %eax
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_VIEW_MAIN
    sb %ebx %eax
    mov %eax 1
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_VIEW_BOOT
    sb %ebx %eax
    mov %eax 2
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_VIEW_SYSINFO
    sb %ebx %eax
    mov %eax 3
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_VIEW_RAMCHECK
    sb %ebx %eax
    mov %eax 4
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_VIEW_SETTINGS
    sb %ebx %eax
    mov %eax 5
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_VIEW_THEME
    sb %ebx %eax
    mov %eax 6
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_VIEW_PASSWORD_SETUP
    sb %ebx %eax
; --- END Global Initialization ---

 jsr init_text_mode
    mov %eax 82
    psh %eax ; Save expression result
    mov %eax 82
    psh %eax ; Save expression result
    mov %ebx __var_SC
    pop %eax ; Restore expression result
    sb %ebx %eax ; Store value into field 'ARROW_UP'
    mov %eax 81
    psh %eax ; Save expression result
    mov %eax 81
    psh %eax ; Save expression result
    mov %ebx __var_SC
    add %ebx 1 ; offset for field 'ARROW_DOWN'
    pop %eax ; Restore expression result
    sb %ebx %eax ; Store value into field 'ARROW_DOWN'
    mov %eax 41
    psh %eax ; Save expression result
    mov %eax 41
    psh %eax ; Save expression result
    mov %ebx __var_SC
    add %ebx 2 ; offset for field 'ESC'
    pop %eax ; Restore expression result
    sb %ebx %eax ; Store value into field 'ESC'
    mov %eax 40
    psh %eax ; Save expression result
    mov %eax 40
    psh %eax ; Save expression result
    mov %ebx __var_SC
    add %ebx 3 ; offset for field 'ENTER'
    pop %eax ; Restore expression result
    sb %ebx %eax ; Store value into field 'ENTER'
    mov %eax 14
    psh %eax ; Save expression result
    mov %eax 14
    psh %eax ; Save expression result
    mov %ebx __var_SC
    add %ebx 4 ; offset for field 'BACKSPACE'
    pop %eax ; Restore expression result
    sb %ebx %eax ; Store value into field 'BACKSPACE'
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_VIEW_MAIN
    sb %ebx %eax
    mov %eax 1
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_VIEW_BOOT
    sb %ebx %eax
    mov %eax 2
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_VIEW_SYSINFO
    sb %ebx %eax
    mov %eax 3
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_VIEW_RAMCHECK
    sb %ebx %eax
    mov %eax 4
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_VIEW_SETTINGS
    sb %ebx %eax
    mov %eax 5
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_VIEW_THEME
    sb %ebx %eax
    mov %eax 6
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_VIEW_PASSWORD_SETUP
    sb %ebx %eax
    mov %eax __var_main_item_1
    psh %eax ; Save expression result
    mov %eax 0
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 4
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx __var_main_menu_items
    add %ebx %e8   ; %ebx = base_address + offset
    pop %eax ; Восстанавливаем результат для записи
    sd %ebx %eax ; Записываем значение по адресу
    mov %eax __var_main_item_2
    psh %eax ; Save expression result
    mov %eax 1
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 4
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx __var_main_menu_items
    add %ebx %e8   ; %ebx = base_address + offset
    pop %eax ; Восстанавливаем результат для записи
    sd %ebx %eax ; Записываем значение по адресу
    mov %eax __var_main_item_3
    psh %eax ; Save expression result
    mov %eax 2
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 4
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx __var_main_menu_items
    add %ebx %e8   ; %ebx = base_address + offset
    pop %eax ; Восстанавливаем результат для записи
    sd %ebx %eax ; Записываем значение по адресу
    mov %eax __var_main_item_4
    psh %eax ; Save expression result
    mov %eax 3
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 4
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx __var_main_menu_items
    add %ebx %e8   ; %ebx = base_address + offset
    pop %eax ; Восстанавливаем результат для записи
    sd %ebx %eax ; Записываем значение по адресу
    mov %eax __var_main_item_5
    psh %eax ; Save expression result
    mov %eax 4
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 4
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx __var_main_menu_items
    add %ebx %e8   ; %ebx = base_address + offset
    pop %eax ; Восстанавливаем результат для записи
    sd %ebx %eax ; Записываем значение по адресу
    mov %eax __var_settings_item_1
    psh %eax ; Save expression result
    mov %eax 0
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 4
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx __var_settings_menu_items
    add %ebx %e8   ; %ebx = base_address + offset
    pop %eax ; Восстанавливаем результат для записи
    sd %ebx %eax ; Записываем значение по адресу
    mov %eax __var_settings_item_2
    psh %eax ; Save expression result
    mov %eax 1
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 4
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx __var_settings_menu_items
    add %ebx %e8   ; %ebx = base_address + offset
    pop %eax ; Восстанавливаем результат для записи
    sd %ebx %eax ; Записываем значение по адресу
    mov %eax __var_settings_item_3
    psh %eax ; Save expression result
    mov %eax 2
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 4
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx __var_settings_menu_items
    add %ebx %e8   ; %ebx = base_address + offset
    pop %eax ; Восстанавливаем результат для записи
    sd %ebx %eax ; Записываем значение по адресу
    mov %eax __var_theme_item_1
    psh %eax ; Save expression result
    mov %eax 0
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 4
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx __var_theme_menu_items
    add %ebx %e8   ; %ebx = base_address + offset
    pop %eax ; Восстанавливаем результат для записи
    sd %ebx %eax ; Записываем значение по адресу
    mov %eax __var_theme_item_2
    psh %eax ; Save expression result
    mov %eax 1
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 4
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx __var_theme_menu_items
    add %ebx %e8   ; %ebx = base_address + offset
    pop %eax ; Восстанавливаем результат для записи
    sd %ebx %eax ; Записываем значение по адресу
    mov %eax __var_theme_item_3
    psh %eax ; Save expression result
    mov %eax 2
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 4
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx __var_theme_menu_items
    add %ebx %e8   ; %ebx = base_address + offset
    pop %eax ; Восстанавливаем результат для записи
    sd %ebx %eax ; Записываем значение по адресу
 jsr init_interrupts
 jsr find_bootable_disks
 jsr load_settings
 jsr apply_color_theme
 jsr run_post_screen
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 1
    sb %ebx %eax
    mov %eax 1
 psh %eax
    mov %ebx %ebp
    sub %ebx 1
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_156
 mov %eax 0 ; False
 jmp .L_comp_end_156
.L_comp_true_156:
 mov %eax 1 ; True
.L_comp_end_156:
        cmp %eax 0
        je .L_endif_154 ; Jump to end if condition is false
        ; --- if-body ---
    mov %eax 200
 psh %eax
 jsr sleep
 add %esp 4
 jsr bios_main_loop
        jmp .L_endif_154 ; End of if-body
.L_endif_154:
    mov %ebx __var_VGA_COLORS
    mov %eax 0
    lb %ebx %eax ; Load value of field 'BLACK'
 psh %eax
 jsr set_background_color
 add %esp 4
 jsr clear_screen
    mov %ebx __var_default_boot_disk
    ld %ebx %eax
 psh %eax
 jsr load_and_boot
 add %esp 4
    mov %ebx __var_VGA_COLORS
    add %ebx 4 ; offset for field 'RED'
    mov %eax 0
    lb %ebx %eax ; Load value of field 'RED'
 psh %eax
 jsr set_background_color
 add %esp 4
 jsr clear_screen
    mov %ebx __var_VGA_COLORS
    add %ebx 15 ; offset for field 'WHITE'
    mov %eax 0
    lb %ebx %eax ; Load value of field 'WHITE'
 psh %eax
 jsr set_character_color
 add %esp 4
    mov %eax 5
 psh %eax
    mov %eax 5
 psh %eax
 jsr set_cursor_pos
 add %esp 8
 mov %eax __str_init_18
 psh %eax
 jsr printf
 jsr screen_flush
    mov %eax 1
 psh %eax
 jsr confirm_exit
 add %esp 4
.L_ret__start:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

bios_main_loop:
    psh %ebp
    mov %ebp %esp
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_is_exit
    sb %ebx %eax
.L_while_start_157:
    mov %eax 0
 psh %eax
    mov %ebx __var_is_exit
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_159
 mov %eax 0 ; False
 jmp .L_comp_end_159
.L_comp_true_159:
 mov %eax 1 ; True
.L_comp_end_159:
 cmp %eax 0
 je .L_while_end_157 ; Jump to end if condition is false
 ; --- while-body ---
    mov %ebx __var_VIEW_MAIN
    mov %eax 0
    lb %ebx %eax
        psh %eax ; Save case value
    mov %ebx __var_current_view
    mov %eax 0
    lb %ebx %eax
        mov %ebx %eax ; Move match expression value to EBX for comparison
        pop %eax ; Restore case value to EAX for comparison
        cmp %eax %ebx
        je .L_block_body_161_0
    mov %ebx __var_VIEW_BOOT
    mov %eax 0
    lb %ebx %eax
        psh %eax ; Save case value
    mov %ebx __var_current_view
    mov %eax 0
    lb %ebx %eax
        mov %ebx %eax ; Move match expression value to EBX for comparison
        pop %eax ; Restore case value to EAX for comparison
        cmp %eax %ebx
        je .L_block_body_161_1
    mov %ebx __var_VIEW_SYSINFO
    mov %eax 0
    lb %ebx %eax
        psh %eax ; Save case value
    mov %ebx __var_current_view
    mov %eax 0
    lb %ebx %eax
        mov %ebx %eax ; Move match expression value to EBX for comparison
        pop %eax ; Restore case value to EAX for comparison
        cmp %eax %ebx
        je .L_block_body_161_2
    mov %ebx __var_VIEW_RAMCHECK
    mov %eax 0
    lb %ebx %eax
        psh %eax ; Save case value
    mov %ebx __var_current_view
    mov %eax 0
    lb %ebx %eax
        mov %ebx %eax ; Move match expression value to EBX for comparison
        pop %eax ; Restore case value to EAX for comparison
        cmp %eax %ebx
        je .L_block_body_161_3
    mov %ebx __var_VIEW_SETTINGS
    mov %eax 0
    lb %ebx %eax
        psh %eax ; Save case value
    mov %ebx __var_current_view
    mov %eax 0
    lb %ebx %eax
        mov %ebx %eax ; Move match expression value to EBX for comparison
        pop %eax ; Restore case value to EAX for comparison
        cmp %eax %ebx
        je .L_block_body_161_4
    mov %ebx __var_VIEW_THEME
    mov %eax 0
    lb %ebx %eax
        psh %eax ; Save case value
    mov %ebx __var_current_view
    mov %eax 0
    lb %ebx %eax
        mov %ebx %eax ; Move match expression value to EBX for comparison
        pop %eax ; Restore case value to EAX for comparison
        cmp %eax %ebx
        je .L_block_body_161_5
    mov %ebx __var_VIEW_PASSWORD_SETUP
    mov %eax 0
    lb %ebx %eax
        psh %eax ; Save case value
    mov %ebx __var_current_view
    mov %eax 0
    lb %ebx %eax
        mov %ebx %eax ; Move match expression value to EBX for comparison
        pop %eax ; Restore case value to EAX for comparison
        cmp %eax %ebx
        je .L_block_body_161_6
        jmp .L_match_end_160
.L_block_body_161_0:
 jsr draw_main_menu
 jsr handle_main_menu_input
        jmp .L_match_end_160
.L_block_body_161_1:
 jsr draw_boot_menu
 jsr handle_boot_menu_input
        jmp .L_match_end_160
.L_block_body_161_2:
 jsr display_sys_info
        jmp .L_match_end_160
.L_block_body_161_3:
 jsr run_ram_check
        jmp .L_match_end_160
.L_block_body_161_4:
 jsr draw_settings_menu
 jsr handle_settings_menu_input
        jmp .L_match_end_160
.L_block_body_161_5:
 jsr draw_theme_menu
 jsr handle_theme_menu_input
        jmp .L_match_end_160
.L_block_body_161_6:
 jsr password_setup_screen
        jmp .L_match_end_160
.L_match_end_160:
 jmp .L_while_start_157
.L_while_end_157:
.L_ret_bios_main_loop:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

handle_main_menu_input:
    psh %ebp
    mov %ebp %esp
    sub %esp 1 ; Allocate space for ALL local variables
 jsr getkey
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 1
    sb %ebx %eax
    mov %ebx __var_SC
    add %ebx 1 ; offset for field 'ARROW_DOWN'
    mov %eax 0
    lb %ebx %eax ; Load value of field 'ARROW_DOWN'
        psh %eax ; Save case value
    mov %ebx %ebp
    sub %ebx 1
    mov %eax 0
    lb %ebx %eax
        mov %ebx %eax ; Move match expression value to EBX for comparison
        pop %eax ; Restore case value to EAX for comparison
        cmp %eax %ebx
        je .L_block_body_162_0
    mov %ebx __var_SC
    mov %eax 0
    lb %ebx %eax ; Load value of field 'ARROW_UP'
        psh %eax ; Save case value
    mov %ebx %ebp
    sub %ebx 1
    mov %eax 0
    lb %ebx %eax
        mov %ebx %eax ; Move match expression value to EBX for comparison
        pop %eax ; Restore case value to EAX for comparison
        cmp %eax %ebx
        je .L_block_body_162_1
    mov %ebx __var_SC
    add %ebx 3 ; offset for field 'ENTER'
    mov %eax 0
    lb %ebx %eax ; Load value of field 'ENTER'
        psh %eax ; Save case value
    mov %ebx %ebp
    sub %ebx 1
    mov %eax 0
    lb %ebx %eax
        mov %ebx %eax ; Move match expression value to EBX for comparison
        pop %eax ; Restore case value to EAX for comparison
        cmp %eax %ebx
        je .L_block_body_162_2
    mov %ebx __var_SC
    add %ebx 2 ; offset for field 'ESC'
    mov %eax 0
    lb %ebx %eax ; Load value of field 'ESC'
        psh %eax ; Save case value
    mov %ebx %ebp
    sub %ebx 1
    mov %eax 0
    lb %ebx %eax
        mov %ebx %eax ; Move match expression value to EBX for comparison
        pop %eax ; Restore case value to EAX for comparison
        cmp %eax %ebx
        je .L_block_body_162_3
        jmp .L_match_end_161
.L_block_body_162_0:
    mov %ebx __var_MAIN_MENU_COUNT
    mov %eax 0
    lb %ebx %eax
 psh %eax
    mov %eax 1
 psh %eax
    mov %ebx __var_main_menu_selection
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 add %eax %ebx
 pop %ebx
 div %eax %ebx
 mov %eax %edx ; Remainder is in EDX
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_main_menu_selection
    sb %ebx %eax
    mov %eax 100
 psh %eax
 jsr sleep
 add %esp 4
        jmp .L_match_end_161
.L_block_body_162_1:
    mov %ebx __var_MAIN_MENU_COUNT
    mov %eax 0
    lb %ebx %eax
 psh %eax
    mov %ebx __var_MAIN_MENU_COUNT
    mov %eax 0
    lb %ebx %eax
 psh %eax
    mov %eax 1
 psh %eax
    mov %ebx __var_main_menu_selection
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 not %ebx
 inx %ebx
 add %eax %ebx
 pop %ebx
 add %eax %ebx
 pop %ebx
 div %eax %ebx
 mov %eax %edx ; Remainder is in EDX
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_main_menu_selection
    sb %ebx %eax
    mov %eax 100
 psh %eax
 jsr sleep
 add %esp 4
        jmp .L_match_end_161
.L_block_body_162_2:
    mov %eax 0
        psh %eax ; Save case value
    mov %ebx __var_main_menu_selection
    mov %eax 0
    lb %ebx %eax
        mov %ebx %eax ; Move match expression value to EBX for comparison
        pop %eax ; Restore case value to EAX for comparison
        cmp %eax %ebx
        je .L_block_body_163_0
    mov %eax 1
        psh %eax ; Save case value
    mov %ebx __var_main_menu_selection
    mov %eax 0
    lb %ebx %eax
        mov %ebx %eax ; Move match expression value to EBX for comparison
        pop %eax ; Restore case value to EAX for comparison
        cmp %eax %ebx
        je .L_block_body_163_1
    mov %eax 2
        psh %eax ; Save case value
    mov %ebx __var_main_menu_selection
    mov %eax 0
    lb %ebx %eax
        mov %ebx %eax ; Move match expression value to EBX for comparison
        pop %eax ; Restore case value to EAX for comparison
        cmp %eax %ebx
        je .L_block_body_163_2
    mov %eax 3
        psh %eax ; Save case value
    mov %ebx __var_main_menu_selection
    mov %eax 0
    lb %ebx %eax
        mov %ebx %eax ; Move match expression value to EBX for comparison
        pop %eax ; Restore case value to EAX for comparison
        cmp %eax %ebx
        je .L_block_body_163_3
    mov %eax 4
        psh %eax ; Save case value
    mov %ebx __var_main_menu_selection
    mov %eax 0
    lb %ebx %eax
        mov %ebx %eax ; Move match expression value to EBX for comparison
        pop %eax ; Restore case value to EAX for comparison
        cmp %eax %ebx
        je .L_block_body_163_4
        jmp .L_match_end_162
.L_block_body_163_0:
    mov %ebx __var_VIEW_BOOT
    mov %eax 0
    lb %ebx %eax
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_current_view
    sb %ebx %eax
        jmp .L_match_end_162
.L_block_body_163_1:
    mov %ebx __var_VIEW_SYSINFO
    mov %eax 0
    lb %ebx %eax
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_current_view
    sb %ebx %eax
        jmp .L_match_end_162
.L_block_body_163_2:
    mov %ebx __var_VIEW_RAMCHECK
    mov %eax 0
    lb %ebx %eax
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_current_view
    sb %ebx %eax
        jmp .L_match_end_162
.L_block_body_163_3:
    mov %ebx __var_VIEW_SETTINGS
    mov %eax 0
    lb %ebx %eax
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_current_view
    sb %ebx %eax
        jmp .L_match_end_162
.L_block_body_163_4:
 jsr save_settings
    mov %eax 1
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_is_exit
    sb %ebx %eax
        jmp .L_match_end_162
.L_match_end_162:
    mov %eax 150
 psh %eax
 jsr sleep
 add %esp 4
        jmp .L_match_end_161
.L_block_body_162_3:
    mov %eax 1
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_is_exit
    sb %ebx %eax
    mov %eax 150
 psh %eax
 jsr sleep
 add %esp 4
        jmp .L_match_end_161
.L_match_end_161:
.L_ret_handle_main_menu_input:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

handle_boot_menu_input:
    psh %ebp
    mov %ebp %esp
    sub %esp 1 ; Allocate space for ALL local variables
 jsr getkey
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 1
    sb %ebx %eax
    mov %ebx __var_SC
    add %ebx 1 ; offset for field 'ARROW_DOWN'
    mov %eax 0
    lb %ebx %eax ; Load value of field 'ARROW_DOWN'
        psh %eax ; Save case value
    mov %ebx %ebp
    sub %ebx 1
    mov %eax 0
    lb %ebx %eax
        mov %ebx %eax ; Move match expression value to EBX for comparison
        pop %eax ; Restore case value to EAX for comparison
        cmp %eax %ebx
        je .L_block_body_164_0
    mov %ebx __var_SC
    mov %eax 0
    lb %ebx %eax ; Load value of field 'ARROW_UP'
        psh %eax ; Save case value
    mov %ebx %ebp
    sub %ebx 1
    mov %eax 0
    lb %ebx %eax
        mov %ebx %eax ; Move match expression value to EBX for comparison
        pop %eax ; Restore case value to EAX for comparison
        cmp %eax %ebx
        je .L_block_body_164_1
    mov %ebx __var_SC
    add %ebx 3 ; offset for field 'ENTER'
    mov %eax 0
    lb %ebx %eax ; Load value of field 'ENTER'
        psh %eax ; Save case value
    mov %ebx %ebp
    sub %ebx 1
    mov %eax 0
    lb %ebx %eax
        mov %ebx %eax ; Move match expression value to EBX for comparison
        pop %eax ; Restore case value to EAX for comparison
        cmp %eax %ebx
        je .L_block_body_164_2
    mov %ebx __var_SC
    add %ebx 2 ; offset for field 'ESC'
    mov %eax 0
    lb %ebx %eax ; Load value of field 'ESC'
        psh %eax ; Save case value
    mov %ebx %ebp
    sub %ebx 1
    mov %eax 0
    lb %ebx %eax
        mov %ebx %eax ; Move match expression value to EBX for comparison
        pop %eax ; Restore case value to EAX for comparison
        cmp %eax %ebx
        je .L_block_body_164_3
        jmp .L_match_end_163
.L_block_body_164_0:
    mov %eax 0
 psh %eax
    mov %ebx __var_bootable_disk_count
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jne .L_comp_true_166
 mov %eax 0 ; False
 jmp .L_comp_end_166
.L_comp_true_166:
 mov %eax 1 ; True
.L_comp_end_166:
        cmp %eax 0
        je .L_endif_164 ; Jump to end if condition is false
        ; --- if-body ---
    mov %ebx __var_bootable_disk_count
    mov %eax 0
    lb %ebx %eax
 psh %eax
    mov %eax 1
 psh %eax
    mov %ebx __var_boot_menu_selection
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 add %eax %ebx
 pop %ebx
 div %eax %ebx
 mov %eax %edx ; Remainder is in EDX
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_boot_menu_selection
    sb %ebx %eax
    mov %eax 100
 psh %eax
 jsr sleep
 add %esp 4
        jmp .L_endif_164 ; End of if-body
.L_endif_164:
        jmp .L_match_end_163
.L_block_body_164_1:
    mov %eax 0
 psh %eax
    mov %ebx __var_bootable_disk_count
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jne .L_comp_true_169
 mov %eax 0 ; False
 jmp .L_comp_end_169
.L_comp_true_169:
 mov %eax 1 ; True
.L_comp_end_169:
        cmp %eax 0
        je .L_endif_167 ; Jump to end if condition is false
        ; --- if-body ---
    mov %ebx __var_bootable_disk_count
    mov %eax 0
    lb %ebx %eax
 psh %eax
    mov %ebx __var_bootable_disk_count
    mov %eax 0
    lb %ebx %eax
 psh %eax
    mov %eax 1
 psh %eax
    mov %ebx __var_boot_menu_selection
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 not %ebx
 inx %ebx
 add %eax %ebx
 pop %ebx
 add %eax %ebx
 pop %ebx
 div %eax %ebx
 mov %eax %edx ; Remainder is in EDX
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_boot_menu_selection
    sb %ebx %eax
    mov %eax 100
 psh %eax
 jsr sleep
 add %esp 4
        jmp .L_endif_167 ; End of if-body
.L_endif_167:
        jmp .L_match_end_163
.L_block_body_164_2:
    mov %eax 0
 psh %eax
    mov %ebx __var_bootable_disk_count
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jne .L_comp_true_172
 mov %eax 0 ; False
 jmp .L_comp_end_172
.L_comp_true_172:
 mov %eax 1 ; True
.L_comp_end_172:
        cmp %eax 0
        je .L_endif_170 ; Jump to end if condition is false
        ; --- if-body ---
    mov %ebx __var_boot_menu_selection
    mov %eax 0
    lb %ebx %eax
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 4
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx __var_bootable_disk_ids
    add %ebx %e8   ; %ebx = base_address + offset
    ld %ebx %eax ; Load value from address
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_default_boot_disk
    sd %ebx %eax
    mov %ebx __var_VIEW_MAIN
    mov %eax 0
    lb %ebx %eax
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_current_view
    sb %ebx %eax
    mov %eax 150
 psh %eax
 jsr sleep
 add %esp 4
        jmp .L_endif_170 ; End of if-body
.L_endif_170:
        jmp .L_match_end_163
.L_block_body_164_3:
    mov %ebx __var_VIEW_MAIN
    mov %eax 0
    lb %ebx %eax
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_current_view
    sb %ebx %eax
    mov %eax 150
 psh %eax
 jsr sleep
 add %esp 4
        jmp .L_match_end_163
.L_match_end_163:
.L_ret_handle_boot_menu_input:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

handle_settings_menu_input:
    psh %ebp
    mov %ebp %esp
    sub %esp 1 ; Allocate space for ALL local variables
 jsr getkey
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 1
    sb %ebx %eax
    mov %ebx __var_SC
    add %ebx 1 ; offset for field 'ARROW_DOWN'
    mov %eax 0
    lb %ebx %eax ; Load value of field 'ARROW_DOWN'
        psh %eax ; Save case value
    mov %ebx %ebp
    sub %ebx 1
    mov %eax 0
    lb %ebx %eax
        mov %ebx %eax ; Move match expression value to EBX for comparison
        pop %eax ; Restore case value to EAX for comparison
        cmp %eax %ebx
        je .L_block_body_174_0
    mov %ebx __var_SC
    mov %eax 0
    lb %ebx %eax ; Load value of field 'ARROW_UP'
        psh %eax ; Save case value
    mov %ebx %ebp
    sub %ebx 1
    mov %eax 0
    lb %ebx %eax
        mov %ebx %eax ; Move match expression value to EBX for comparison
        pop %eax ; Restore case value to EAX for comparison
        cmp %eax %ebx
        je .L_block_body_174_1
    mov %ebx __var_SC
    add %ebx 3 ; offset for field 'ENTER'
    mov %eax 0
    lb %ebx %eax ; Load value of field 'ENTER'
        psh %eax ; Save case value
    mov %ebx %ebp
    sub %ebx 1
    mov %eax 0
    lb %ebx %eax
        mov %ebx %eax ; Move match expression value to EBX for comparison
        pop %eax ; Restore case value to EAX for comparison
        cmp %eax %ebx
        je .L_block_body_174_2
    mov %ebx __var_SC
    add %ebx 2 ; offset for field 'ESC'
    mov %eax 0
    lb %ebx %eax ; Load value of field 'ESC'
        psh %eax ; Save case value
    mov %ebx %ebp
    sub %ebx 1
    mov %eax 0
    lb %ebx %eax
        mov %ebx %eax ; Move match expression value to EBX for comparison
        pop %eax ; Restore case value to EAX for comparison
        cmp %eax %ebx
        je .L_block_body_174_3
        jmp .L_match_end_173
.L_block_body_174_0:
    mov %ebx __var_SETTINGS_MENU_COUNT
    mov %eax 0
    lb %ebx %eax
 psh %eax
    mov %eax 1
 psh %eax
    mov %ebx __var_settings_menu_selection
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 add %eax %ebx
 pop %ebx
 div %eax %ebx
 mov %eax %edx ; Remainder is in EDX
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_settings_menu_selection
    sb %ebx %eax
    mov %eax 100
 psh %eax
 jsr sleep
 add %esp 4
        jmp .L_match_end_173
.L_block_body_174_1:
    mov %ebx __var_SETTINGS_MENU_COUNT
    mov %eax 0
    lb %ebx %eax
 psh %eax
    mov %ebx __var_SETTINGS_MENU_COUNT
    mov %eax 0
    lb %ebx %eax
 psh %eax
    mov %eax 1
 psh %eax
    mov %ebx __var_settings_menu_selection
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 not %ebx
 inx %ebx
 add %eax %ebx
 pop %ebx
 add %eax %ebx
 pop %ebx
 div %eax %ebx
 mov %eax %edx ; Remainder is in EDX
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_settings_menu_selection
    sb %ebx %eax
    mov %eax 100
 psh %eax
 jsr sleep
 add %esp 4
        jmp .L_match_end_173
.L_block_body_174_2:
    mov %eax 0
        psh %eax ; Save case value
    mov %ebx __var_settings_menu_selection
    mov %eax 0
    lb %ebx %eax
        mov %ebx %eax ; Move match expression value to EBX for comparison
        pop %eax ; Restore case value to EAX for comparison
        cmp %eax %ebx
        je .L_block_body_175_0
    mov %eax 1
        psh %eax ; Save case value
    mov %ebx __var_settings_menu_selection
    mov %eax 0
    lb %ebx %eax
        mov %ebx %eax ; Move match expression value to EBX for comparison
        pop %eax ; Restore case value to EAX for comparison
        cmp %eax %ebx
        je .L_block_body_175_1
    mov %eax 2
        psh %eax ; Save case value
    mov %ebx __var_settings_menu_selection
    mov %eax 0
    lb %ebx %eax
        mov %ebx %eax ; Move match expression value to EBX for comparison
        pop %eax ; Restore case value to EAX for comparison
        cmp %eax %ebx
        je .L_block_body_175_2
        jmp .L_match_end_174
.L_block_body_175_0:
    mov %ebx __var_VIEW_THEME
    mov %eax 0
    lb %ebx %eax
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_current_view
    sb %ebx %eax
        jmp .L_match_end_174
.L_block_body_175_1:
    mov %ebx __var_VIEW_PASSWORD_SETUP
    mov %eax 0
    lb %ebx %eax
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_current_view
    sb %ebx %eax
        jmp .L_match_end_174
.L_block_body_175_2:
    mov %ebx __var_VIEW_MAIN
    mov %eax 0
    lb %ebx %eax
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_current_view
    sb %ebx %eax
        jmp .L_match_end_174
.L_match_end_174:
    mov %eax 150
 psh %eax
 jsr sleep
 add %esp 4
        jmp .L_match_end_173
.L_block_body_174_3:
    mov %ebx __var_VIEW_MAIN
    mov %eax 0
    lb %ebx %eax
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_current_view
    sb %ebx %eax
    mov %eax 150
 psh %eax
 jsr sleep
 add %esp 4
        jmp .L_match_end_173
.L_match_end_173:
.L_ret_handle_settings_menu_input:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

handle_theme_menu_input:
    psh %ebp
    mov %ebp %esp
    sub %esp 1 ; Allocate space for ALL local variables
 jsr getkey
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 1
    sb %ebx %eax
    mov %ebx __var_SC
    add %ebx 1 ; offset for field 'ARROW_DOWN'
    mov %eax 0
    lb %ebx %eax ; Load value of field 'ARROW_DOWN'
        psh %eax ; Save case value
    mov %ebx %ebp
    sub %ebx 1
    mov %eax 0
    lb %ebx %eax
        mov %ebx %eax ; Move match expression value to EBX for comparison
        pop %eax ; Restore case value to EAX for comparison
        cmp %eax %ebx
        je .L_block_body_176_0
    mov %ebx __var_SC
    mov %eax 0
    lb %ebx %eax ; Load value of field 'ARROW_UP'
        psh %eax ; Save case value
    mov %ebx %ebp
    sub %ebx 1
    mov %eax 0
    lb %ebx %eax
        mov %ebx %eax ; Move match expression value to EBX for comparison
        pop %eax ; Restore case value to EAX for comparison
        cmp %eax %ebx
        je .L_block_body_176_1
    mov %ebx __var_SC
    add %ebx 3 ; offset for field 'ENTER'
    mov %eax 0
    lb %ebx %eax ; Load value of field 'ENTER'
        psh %eax ; Save case value
    mov %ebx %ebp
    sub %ebx 1
    mov %eax 0
    lb %ebx %eax
        mov %ebx %eax ; Move match expression value to EBX for comparison
        pop %eax ; Restore case value to EAX for comparison
        cmp %eax %ebx
        je .L_block_body_176_2
    mov %ebx __var_SC
    add %ebx 2 ; offset for field 'ESC'
    mov %eax 0
    lb %ebx %eax ; Load value of field 'ESC'
        psh %eax ; Save case value
    mov %ebx %ebp
    sub %ebx 1
    mov %eax 0
    lb %ebx %eax
        mov %ebx %eax ; Move match expression value to EBX for comparison
        pop %eax ; Restore case value to EAX for comparison
        cmp %eax %ebx
        je .L_block_body_176_3
        jmp .L_match_end_175
.L_block_body_176_0:
    mov %ebx __var_THEME_MENU_COUNT
    mov %eax 0
    lb %ebx %eax
 psh %eax
    mov %eax 1
 psh %eax
    mov %ebx __var_theme_menu_selection
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 add %eax %ebx
 pop %ebx
 div %eax %ebx
 mov %eax %edx ; Remainder is in EDX
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_theme_menu_selection
    sb %ebx %eax
    mov %eax 100
 psh %eax
 jsr sleep
 add %esp 4
        jmp .L_match_end_175
.L_block_body_176_1:
    mov %ebx __var_THEME_MENU_COUNT
    mov %eax 0
    lb %ebx %eax
 psh %eax
    mov %ebx __var_THEME_MENU_COUNT
    mov %eax 0
    lb %ebx %eax
 psh %eax
    mov %eax 1
 psh %eax
    mov %ebx __var_theme_menu_selection
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 not %ebx
 inx %ebx
 add %eax %ebx
 pop %ebx
 add %eax %ebx
 pop %ebx
 div %eax %ebx
 mov %eax %edx ; Remainder is in EDX
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_theme_menu_selection
    sb %ebx %eax
    mov %eax 100
 psh %eax
 jsr sleep
 add %esp 4
        jmp .L_match_end_175
.L_block_body_176_2:
    mov %ebx __var_theme_menu_selection
    mov %eax 0
    lb %ebx %eax
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_color_theme
    sd %ebx %eax
 jsr apply_color_theme
    mov %ebx __var_VIEW_SETTINGS
    mov %eax 0
    lb %ebx %eax
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_current_view
    sb %ebx %eax
    mov %eax 150
 psh %eax
 jsr sleep
 add %esp 4
        jmp .L_match_end_175
.L_block_body_176_3:
    mov %ebx __var_VIEW_SETTINGS
    mov %eax 0
    lb %ebx %eax
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_current_view
    sb %ebx %eax
    mov %eax 150
 psh %eax
 jsr sleep
 add %esp 4
        jmp .L_match_end_175
.L_match_end_175:
.L_ret_handle_theme_menu_input:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

draw_main_menu:
    psh %ebp
    mov %ebp %esp
    sub %esp 4 ; Allocate space for ALL local variables
    mov %ebx __var_MAIN_BG
    mov %eax 0
    lb %ebx %eax
 psh %eax
 jsr set_background_color
 add %esp 4
 jsr clear_screen
 mov %eax __str_init_19
 psh %eax
 jsr draw_header
 add %esp 4
 mov %eax __str_init_20
 psh %eax
 jsr draw_footer
 add %esp 4
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 4
    sd %ebx %eax
.L_while_start_176:
    mov %ebx __var_MAIN_MENU_COUNT
    mov %eax 0
    lb %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jne .L_comp_true_178
 mov %eax 0 ; False
 jmp .L_comp_end_178
.L_comp_true_178:
 mov %eax 1 ; True
.L_comp_end_178:
 cmp %eax 0
 je .L_while_end_176 ; Jump to end if condition is false
 ; --- while-body ---
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
 psh %eax
    mov %eax 5
 pop %ebx
 add %eax %ebx
 psh %eax
    mov %eax 4
 psh %eax
 jsr set_cursor_pos
 add %esp 8
    mov %ebx __var_main_menu_selection
    mov %eax 0
    lb %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_181
 mov %eax 0 ; False
 jmp .L_comp_end_181
.L_comp_true_181:
 mov %eax 1 ; True
.L_comp_end_181:
        cmp %eax 0
        je .L_else_179 ; Jump to else if condition is false
        ; --- if-body ---
    mov %ebx __var_SELECT_FG
    mov %eax 0
    lb %ebx %eax
 psh %eax
 jsr set_character_color
 add %esp 4
    mov %ebx __var_SELECT_BG
    mov %eax 0
    lb %ebx %eax
 psh %eax
 jsr set_background_color
 add %esp 4
        jmp .L_endif_179 ; End of if-body
.L_else_179:
        ; --- else-body ---
    mov %ebx __var_MAIN_FG
    mov %eax 0
    lb %ebx %eax
 psh %eax
 jsr set_character_color
 add %esp 4
    mov %ebx __var_MAIN_BG
    mov %eax 0
    lb %ebx %eax
 psh %eax
 jsr set_background_color
 add %esp 4
.L_endif_179:
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 4
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx __var_main_menu_items
    add %ebx %e8   ; %ebx = base_address + offset
    ld %ebx %eax ; Load value from address
 psh %eax
 mov %eax __str_init_21
 psh %eax
 jsr printf
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
 jmp .L_while_start_176
.L_while_end_176:
 jsr screen_flush
.L_ret_draw_main_menu:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

draw_boot_menu:
    psh %ebp
    mov %ebp %esp
    sub %esp 4 ; Allocate space for ALL local variables
    mov %ebx __var_MAIN_BG
    mov %eax 0
    lb %ebx %eax
 psh %eax
 jsr set_background_color
 add %esp 4
 jsr clear_screen
 mov %eax __str_init_22
 psh %eax
 jsr draw_header
 add %esp 4
 mov %eax __str_init_23
 psh %eax
 jsr draw_footer
 add %esp 4
    mov %eax 3
 psh %eax
    mov %eax 4
 psh %eax
 jsr set_cursor_pos
 add %esp 8
    mov %ebx __var_HIGHLIGHT_FG
    mov %eax 0
    lb %ebx %eax
 psh %eax
 jsr set_character_color
 add %esp 4
 mov %eax __str_init_24
 psh %eax
 jsr printf
    mov %eax 0
 psh %eax
    mov %ebx __var_bootable_disk_count
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_184
 mov %eax 0 ; False
 jmp .L_comp_end_184
.L_comp_true_184:
 mov %eax 1 ; True
.L_comp_end_184:
        cmp %eax 0
        je .L_else_182 ; Jump to else if condition is false
        ; --- if-body ---
    mov %eax 5
 psh %eax
    mov %eax 4
 psh %eax
 jsr set_cursor_pos
 add %esp 8
    mov %ebx __var_VGA_COLORS
    add %ebx 11 ; offset for field 'LIGHT_RED'
    mov %eax 0
    lb %ebx %eax ; Load value of field 'LIGHT_RED'
 psh %eax
 jsr set_character_color
 add %esp 4
 mov %eax __str_init_25
 psh %eax
 jsr printf
        jmp .L_endif_182 ; End of if-body
.L_else_182:
        ; --- else-body ---
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 4
    sd %ebx %eax
.L_while_start_185:
    mov %ebx __var_bootable_disk_count
    mov %eax 0
    lb %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jne .L_comp_true_187
 mov %eax 0 ; False
 jmp .L_comp_end_187
.L_comp_true_187:
 mov %eax 1 ; True
.L_comp_end_187:
 cmp %eax 0
 je .L_while_end_185 ; Jump to end if condition is false
 ; --- while-body ---
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
 psh %eax
    mov %eax 5
 pop %ebx
 add %eax %ebx
 psh %eax
    mov %eax 4
 psh %eax
 jsr set_cursor_pos
 add %esp 8
    mov %ebx __var_boot_menu_selection
    mov %eax 0
    lb %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_190
 mov %eax 0 ; False
 jmp .L_comp_end_190
.L_comp_true_190:
 mov %eax 1 ; True
.L_comp_end_190:
        cmp %eax 0
        je .L_else_188 ; Jump to else if condition is false
        ; --- if-body ---
    mov %ebx __var_SELECT_FG
    mov %eax 0
    lb %ebx %eax
 psh %eax
 jsr set_character_color
 add %esp 4
    mov %ebx __var_SELECT_BG
    mov %eax 0
    lb %ebx %eax
 psh %eax
 jsr set_background_color
 add %esp 4
        jmp .L_endif_188 ; End of if-body
.L_else_188:
        ; --- else-body ---
    mov %ebx __var_MAIN_FG
    mov %eax 0
    lb %ebx %eax
 psh %eax
 jsr set_character_color
 add %esp 4
    mov %ebx __var_MAIN_BG
    mov %eax 0
    lb %ebx %eax
 psh %eax
 jsr set_background_color
 add %esp 4
.L_endif_188:
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 4
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx __var_boot_menu_items
    add %ebx %e8   ; %ebx = base_address + offset
    ld %ebx %eax ; Load value from address
 psh %eax
 mov %eax __str_init_26
 psh %eax
 jsr printf
    mov %ebx __var_default_boot_disk
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 4
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx __var_bootable_disk_ids
    add %ebx %e8   ; %ebx = base_address + offset
    ld %ebx %eax ; Load value from address
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_193
 mov %eax 0 ; False
 jmp .L_comp_end_193
.L_comp_true_193:
 mov %eax 1 ; True
.L_comp_end_193:
        cmp %eax 0
        je .L_endif_191 ; Jump to end if condition is false
        ; --- if-body ---
 mov %eax __str_init_27
 psh %eax
 jsr printf
        jmp .L_endif_191 ; End of if-body
.L_endif_191:
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
 jmp .L_while_start_185
.L_while_end_185:
.L_endif_182:
 jsr screen_flush
.L_ret_draw_boot_menu:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

draw_settings_menu:
    psh %ebp
    mov %ebp %esp
    sub %esp 4 ; Allocate space for ALL local variables
    mov %ebx __var_MAIN_BG
    mov %eax 0
    lb %ebx %eax
 psh %eax
 jsr set_background_color
 add %esp 4
 jsr clear_screen
 mov %eax __str_init_28
 psh %eax
 jsr draw_header
 add %esp 4
 mov %eax __str_init_29
 psh %eax
 jsr draw_footer
 add %esp 4
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 4
    sd %ebx %eax
.L_while_start_194:
    mov %ebx __var_SETTINGS_MENU_COUNT
    mov %eax 0
    lb %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jne .L_comp_true_196
 mov %eax 0 ; False
 jmp .L_comp_end_196
.L_comp_true_196:
 mov %eax 1 ; True
.L_comp_end_196:
 cmp %eax 0
 je .L_while_end_194 ; Jump to end if condition is false
 ; --- while-body ---
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
 psh %eax
    mov %eax 5
 pop %ebx
 add %eax %ebx
 psh %eax
    mov %eax 4
 psh %eax
 jsr set_cursor_pos
 add %esp 8
    mov %ebx __var_settings_menu_selection
    mov %eax 0
    lb %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_199
 mov %eax 0 ; False
 jmp .L_comp_end_199
.L_comp_true_199:
 mov %eax 1 ; True
.L_comp_end_199:
        cmp %eax 0
        je .L_else_197 ; Jump to else if condition is false
        ; --- if-body ---
    mov %ebx __var_SELECT_FG
    mov %eax 0
    lb %ebx %eax
 psh %eax
 jsr set_character_color
 add %esp 4
    mov %ebx __var_SELECT_BG
    mov %eax 0
    lb %ebx %eax
 psh %eax
 jsr set_background_color
 add %esp 4
        jmp .L_endif_197 ; End of if-body
.L_else_197:
        ; --- else-body ---
    mov %ebx __var_MAIN_FG
    mov %eax 0
    lb %ebx %eax
 psh %eax
 jsr set_character_color
 add %esp 4
    mov %ebx __var_MAIN_BG
    mov %eax 0
    lb %ebx %eax
 psh %eax
 jsr set_background_color
 add %esp 4
.L_endif_197:
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 4
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx __var_settings_menu_items
    add %ebx %e8   ; %ebx = base_address + offset
    ld %ebx %eax ; Load value from address
 psh %eax
 mov %eax __str_init_30
 psh %eax
 jsr printf
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
 jmp .L_while_start_194
.L_while_end_194:
 jsr screen_flush
.L_ret_draw_settings_menu:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

draw_theme_menu:
    psh %ebp
    mov %ebp %esp
    sub %esp 4 ; Allocate space for ALL local variables
    mov %ebx __var_MAIN_BG
    mov %eax 0
    lb %ebx %eax
 psh %eax
 jsr set_background_color
 add %esp 4
 jsr clear_screen
 mov %eax __str_init_31
 psh %eax
 jsr draw_header
 add %esp 4
 mov %eax __str_init_32
 psh %eax
 jsr draw_footer
 add %esp 4
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 4
    sd %ebx %eax
.L_while_start_200:
    mov %ebx __var_THEME_MENU_COUNT
    mov %eax 0
    lb %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jne .L_comp_true_202
 mov %eax 0 ; False
 jmp .L_comp_end_202
.L_comp_true_202:
 mov %eax 1 ; True
.L_comp_end_202:
 cmp %eax 0
 je .L_while_end_200 ; Jump to end if condition is false
 ; --- while-body ---
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
 psh %eax
    mov %eax 5
 pop %ebx
 add %eax %ebx
 psh %eax
    mov %eax 4
 psh %eax
 jsr set_cursor_pos
 add %esp 8
    mov %ebx __var_theme_menu_selection
    mov %eax 0
    lb %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_205
 mov %eax 0 ; False
 jmp .L_comp_end_205
.L_comp_true_205:
 mov %eax 1 ; True
.L_comp_end_205:
        cmp %eax 0
        je .L_else_203 ; Jump to else if condition is false
        ; --- if-body ---
    mov %ebx __var_SELECT_FG
    mov %eax 0
    lb %ebx %eax
 psh %eax
 jsr set_character_color
 add %esp 4
    mov %ebx __var_SELECT_BG
    mov %eax 0
    lb %ebx %eax
 psh %eax
 jsr set_background_color
 add %esp 4
        jmp .L_endif_203 ; End of if-body
.L_else_203:
        ; --- else-body ---
    mov %ebx __var_MAIN_FG
    mov %eax 0
    lb %ebx %eax
 psh %eax
 jsr set_character_color
 add %esp 4
    mov %ebx __var_MAIN_BG
    mov %eax 0
    lb %ebx %eax
 psh %eax
 jsr set_background_color
 add %esp 4
.L_endif_203:
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 4
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx __var_theme_menu_items
    add %ebx %e8   ; %ebx = base_address + offset
    ld %ebx %eax ; Load value from address
 psh %eax
 mov %eax __str_init_33
 psh %eax
 jsr printf
    mov %ebx __var_color_theme
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_208
 mov %eax 0 ; False
 jmp .L_comp_end_208
.L_comp_true_208:
 mov %eax 1 ; True
.L_comp_end_208:
        cmp %eax 0
        je .L_endif_206 ; Jump to end if condition is false
        ; --- if-body ---
 mov %eax __str_init_34
 psh %eax
 jsr printf
        jmp .L_endif_206 ; End of if-body
.L_endif_206:
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
 jmp .L_while_start_200
.L_while_end_200:
 jsr screen_flush
.L_ret_draw_theme_menu:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

display_sys_info:
    psh %ebp
    mov %ebp %esp
    sub %esp 29 ; Allocate space for ALL local variables
    mov %ebx __var_MAIN_BG
    mov %eax 0
    lb %ebx %eax
 psh %eax
 jsr set_background_color
 add %esp 4
 jsr clear_screen
 mov %eax __str_init_35
 psh %eax
 jsr draw_header
 add %esp 4
 mov %eax __str_init_36
 psh %eax
 jsr draw_footer
 add %esp 4
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 29
    sd %ebx %eax
    mov %eax %ebp
    sub %eax 29
 psh %eax
    mov %eax %ebp
    sub %eax 25
 psh %eax
 jsr get_hardware_info_safe
 add %esp 8
    mov %ebx __var_HIGHLIGHT_FG
    mov %eax 0
    lb %ebx %eax
 psh %eax
 jsr set_character_color
 add %esp 4
    mov %eax 5
 psh %eax
    mov %eax 4
 psh %eax
 jsr set_cursor_pos
 add %esp 8
 mov %eax __str_init_37
 psh %eax
 jsr printf
    mov %ebx __var_MAIN_FG
    mov %eax 0
    lb %ebx %eax
 psh %eax
 jsr set_character_color
 add %esp 4
    mov %eax 7
 psh %eax
    mov %eax 6
 psh %eax
 jsr set_cursor_pos
 add %esp 8
    mov %eax %ebp
    sub %eax 25
 psh %eax
 mov %eax __str_init_38
 psh %eax
 jsr printf
    mov %eax 8
 psh %eax
    mov %eax 6
 psh %eax
 jsr set_cursor_pos
 add %esp 8
 mov %eax __str_init_39
 psh %eax
 jsr printf
    mov %eax 10
 psh %eax
    mov %eax 6
 psh %eax
 jsr set_cursor_pos
 add %esp 8
    mov %eax 1024
 psh %eax
    mov %eax 1024
 psh %eax
    mov %ebx %ebp
    sub %ebx 29
    ld %ebx %eax
 pop %ebx
 div %eax %ebx
 pop %ebx
 div %eax %ebx
 psh %eax
 mov %eax __str_init_40
 psh %eax
 jsr printf
    mov %eax 12
 psh %eax
    mov %eax 6
 psh %eax
 jsr set_cursor_pos
 add %esp 8
    mov %ebx __var_bootable_disk_count
    mov %eax 0
    lb %ebx %eax
 psh %eax
 mov %eax __str_init_41
 psh %eax
 jsr printf
 jsr screen_flush
    mov %eax 150
 psh %eax
 jsr sleep
 add %esp 4
 jsr getkey
    mov %eax 20
 psh %eax
 jsr sleep
 add %esp 4
    mov %ebx __var_VIEW_MAIN
    mov %eax 0
    lb %ebx %eax
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_current_view
    sb %ebx %eax
.L_ret_display_sys_info:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

password_setup_screen:
    psh %ebp
    mov %ebp %esp
    sub %esp 34 ; Allocate space for ALL local variables
    mov %ebx __var_MAIN_BG
    mov %eax 0
    lb %ebx %eax
 psh %eax
 jsr set_background_color
 add %esp 4
 jsr clear_screen
 mov %eax __str_init_42
 psh %eax
 jsr draw_header
 add %esp 4
 mov %eax __str_init_43
 psh %eax
 jsr draw_footer
 add %esp 4
    mov %eax 7
 psh %eax
    mov %eax 5
 psh %eax
 jsr set_cursor_pos
 add %esp 8
    mov %ebx __var_MAIN_FG
    mov %eax 0
    lb %ebx %eax
 psh %eax
 jsr set_character_color
 add %esp 4
 mov %eax __str_init_44
 psh %eax
 jsr printf
 jsr screen_flush
    mov %eax 17
 psh %eax
    mov %eax %ebp
    sub %eax 17
 psh %eax
 jsr read_masked_input
 add %esp 8
    mov %eax 80
 psh %eax
 jsr sleep
 add %esp 4
    mov %eax 9
 psh %eax
    mov %eax 5
 psh %eax
 jsr set_cursor_pos
 add %esp 8
 mov %eax __str_init_45
 psh %eax
 jsr printf
 jsr screen_flush
    mov %eax 17
 psh %eax
    mov %eax %ebp
    sub %eax 34
 psh %eax
 jsr read_masked_input
 add %esp 8
    mov %eax 12
 psh %eax
    mov %eax 5
 psh %eax
 jsr set_cursor_pos
 add %esp 8
    mov %eax 0
 psh %eax
    mov %eax %ebp
    sub %eax 34
 psh %eax
    mov %eax %ebp
    sub %eax 17
 psh %eax
 jsr string_compare
 add %esp 8
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_211
 mov %eax 0 ; False
 jmp .L_comp_end_211
.L_comp_true_211:
 mov %eax 1 ; True
.L_comp_end_211:
        cmp %eax 0
        je .L_else_209 ; Jump to else if condition is false
        ; --- if-body ---
    mov %eax %ebp
    sub %eax 17
 psh %eax
    mov %eax __var_bios_password
 psh %eax
 jsr string_copy
 add %esp 8
 mov %eax __str_init_46
 psh %eax
 jsr printf
        jmp .L_endif_209 ; End of if-body
.L_else_209:
        ; --- else-body ---
 mov %eax __str_init_47
 psh %eax
 jsr printf
.L_endif_209:
    mov %eax 14
 psh %eax
    mov %eax 5
 psh %eax
 jsr set_cursor_pos
 add %esp 8
 mov %eax __str_init_48
 psh %eax
 jsr printf
 jsr screen_flush
    mov %eax 150
 psh %eax
 jsr sleep
 add %esp 4
 jsr getkey
    mov %eax 20
 psh %eax
 jsr sleep
 add %esp 4
    mov %ebx __var_VIEW_SETTINGS
    mov %eax 0
    lb %ebx %eax
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_current_view
    sb %ebx %eax
.L_ret_password_setup_screen:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

run_ram_check:
    psh %ebp
    mov %ebp %esp
    sub %esp 72 ; Allocate space for ALL local variables
    mov %ebx __var_VGA_COLORS
    mov %eax 0
    lb %ebx %eax ; Load value of field 'BLACK'
 psh %eax
 jsr set_background_color
 add %esp 4
 jsr clear_screen
    mov %ebx __var_VGA_COLORS
    add %ebx 15 ; offset for field 'WHITE'
    mov %eax 0
    lb %ebx %eax ; Load value of field 'WHITE'
 psh %eax
 jsr set_character_color
 add %esp 4
    mov %eax 5
 psh %eax
    mov %eax 5
 psh %eax
 jsr set_cursor_pos
 add %esp 8
 mov %eax __str_init_49
 psh %eax
 jsr printf
 jsr screen_flush
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
 int $A
    mov %eax %ebp
    sub %eax 4
 psh %eax ; Save kasmf argument
 pop %eax ; Restore kasmf argument
sd %eax %e8
    mov %eax 2863311530
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 12
    sd %ebx %eax
    mov %eax 262144
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 16
    sd %ebx %eax
    mov %eax 1048576
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 20
    sd %ebx %eax
    mov %eax 4194304
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 24
    sd %ebx %eax
    mov %eax 5242880
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 28
    sd %ebx %eax
    mov %eax 7340032
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 32
    sd %ebx %eax
    mov %eax 8388608
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 36
    sd %ebx %eax
    mov %eax 15728640
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 40
    sd %ebx %eax
    mov %eax 16777216
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 44
    sd %ebx %eax
    mov %eax 1048576
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 48
    sd %ebx %eax
    mov %ebx %ebp
    sub %ebx 48
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
 pop %ebx
 not %ebx
 inx %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 52
    sd %ebx %eax
    mov %ebx %ebp
    sub %ebx 20
    ld %ebx %eax
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 56
    sd %ebx %eax
.L_while_start_212:
    mov %ebx %ebp
    sub %ebx 52
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 56
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_true_214
 mov %eax 0 ; False
 jmp .L_comp_end_214
.L_comp_true_214:
 mov %eax 1 ; True
.L_comp_end_214:
 cmp %eax 0
 je .L_while_end_212 ; Jump to end if condition is false
 ; --- while-body ---
    mov %eax 7
 psh %eax
    mov %eax 5
 psh %eax
 jsr set_cursor_pos
 add %esp 8
    mov %eax 1048576
 psh %eax
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
 pop %ebx
 div %eax %ebx
 psh %eax
    mov %eax 1048576
 psh %eax
    mov %ebx %ebp
    sub %ebx 56
    ld %ebx %eax
 pop %ebx
 div %eax %ebx
 psh %eax
 mov %eax __str_init_50
 psh %eax
 jsr printf
 jsr screen_flush
    mov %ebx %ebp
    sub %ebx 28
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 56
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_true_217
 mov %eax 0 ; False
 jmp .L_comp_end_217
.L_comp_true_217:
 mov %eax 1 ; True
.L_comp_end_217:
 psh %eax
    mov %ebx %ebp
    sub %ebx 24
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 56
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_false_220
 jmp .L_comp_true_219
.L_comp_false_220:
 mov %eax 0 ; False
 jmp .L_comp_end_219
.L_comp_true_219:
 mov %eax 1 ; True
.L_comp_end_219:
 pop %ebx
    mov %ebx %ebp
    sub %ebx 24
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 56
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_false_225
 jmp .L_comp_true_224
.L_comp_false_225:
 mov %eax 0 ; False
 jmp .L_comp_end_224
.L_comp_true_224:
 mov %eax 1 ; True
.L_comp_end_224:
 cmp %eax 0
 je .L_logic_false_222
    mov %ebx %ebp
    sub %ebx 28
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 56
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_true_227
 mov %eax 0 ; False
 jmp .L_comp_end_227
.L_comp_true_227:
 mov %eax 1 ; True
.L_comp_end_227:
 cmp %eax 0
 je .L_logic_false_222
 mov %eax 1
 jmp .L_logic_end_221
.L_logic_false_222:
 mov %eax 0
.L_logic_end_221:
        cmp %eax 0
        je .L_endif_215 ; Jump to end if condition is false
        ; --- if-body ---
    mov %ebx %ebp
    sub %ebx 28
    ld %ebx %eax
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 56
    sd %ebx %eax
    jmp .L_while_start_212
        jmp .L_endif_215 ; End of if-body
.L_endif_215:
    mov %ebx %ebp
    sub %ebx 36
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 56
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_true_230
 mov %eax 0 ; False
 jmp .L_comp_end_230
.L_comp_true_230:
 mov %eax 1 ; True
.L_comp_end_230:
 psh %eax
    mov %ebx %ebp
    sub %ebx 32
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 56
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_false_233
 jmp .L_comp_true_232
.L_comp_false_233:
 mov %eax 0 ; False
 jmp .L_comp_end_232
.L_comp_true_232:
 mov %eax 1 ; True
.L_comp_end_232:
 pop %ebx
    mov %ebx %ebp
    sub %ebx 32
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 56
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_false_238
 jmp .L_comp_true_237
.L_comp_false_238:
 mov %eax 0 ; False
 jmp .L_comp_end_237
.L_comp_true_237:
 mov %eax 1 ; True
.L_comp_end_237:
 cmp %eax 0
 je .L_logic_false_235
    mov %ebx %ebp
    sub %ebx 36
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 56
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_true_240
 mov %eax 0 ; False
 jmp .L_comp_end_240
.L_comp_true_240:
 mov %eax 1 ; True
.L_comp_end_240:
 cmp %eax 0
 je .L_logic_false_235
 mov %eax 1
 jmp .L_logic_end_234
.L_logic_false_235:
 mov %eax 0
.L_logic_end_234:
        cmp %eax 0
        je .L_endif_228 ; Jump to end if condition is false
        ; --- if-body ---
    mov %ebx %ebp
    sub %ebx 36
    ld %ebx %eax
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 56
    sd %ebx %eax
    jmp .L_while_start_212
        jmp .L_endif_228 ; End of if-body
.L_endif_228:
    mov %ebx %ebp
    sub %ebx 44
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 56
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_true_243
 mov %eax 0 ; False
 jmp .L_comp_end_243
.L_comp_true_243:
 mov %eax 1 ; True
.L_comp_end_243:
 psh %eax
    mov %ebx %ebp
    sub %ebx 40
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 56
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_false_246
 jmp .L_comp_true_245
.L_comp_false_246:
 mov %eax 0 ; False
 jmp .L_comp_end_245
.L_comp_true_245:
 mov %eax 1 ; True
.L_comp_end_245:
 pop %ebx
    mov %ebx %ebp
    sub %ebx 40
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 56
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_false_251
 jmp .L_comp_true_250
.L_comp_false_251:
 mov %eax 0 ; False
 jmp .L_comp_end_250
.L_comp_true_250:
 mov %eax 1 ; True
.L_comp_end_250:
 cmp %eax 0
 je .L_logic_false_248
    mov %ebx %ebp
    sub %ebx 44
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 56
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_true_253
 mov %eax 0 ; False
 jmp .L_comp_end_253
.L_comp_true_253:
 mov %eax 1 ; True
.L_comp_end_253:
 cmp %eax 0
 je .L_logic_false_248
 mov %eax 1
 jmp .L_logic_end_247
.L_logic_false_248:
 mov %eax 0
.L_logic_end_247:
        cmp %eax 0
        je .L_endif_241 ; Jump to end if condition is false
        ; --- if-body ---
    mov %ebx %ebp
    sub %ebx 44
    ld %ebx %eax
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 56
    sd %ebx %eax
    jmp .L_while_start_212
        jmp .L_endif_241 ; End of if-body
.L_endif_241:
    mov %ebx %ebp
    sub %ebx 16
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 56
    ld %ebx %eax
 pop %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 60
    sd %ebx %eax
    mov %ebx %ebp
    sub %ebx 52
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 60
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jg .L_comp_true_256
 mov %eax 0 ; False
 jmp .L_comp_end_256
.L_comp_true_256:
 mov %eax 1 ; True
.L_comp_end_256:
        cmp %eax 0
        je .L_endif_254 ; Jump to end if condition is false
        ; --- if-body ---
    mov %ebx %ebp
    sub %ebx 52
    ld %ebx %eax
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 60
    sd %ebx %eax
        jmp .L_endif_254 ; End of if-body
.L_endif_254:
    mov %ebx %ebp
    sub %ebx 56
    ld %ebx %eax
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 64
    sd %ebx %eax
.L_while_start_257:
    mov %ebx %ebp
    sub %ebx 60
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 64
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_true_259
 mov %eax 0 ; False
 jmp .L_comp_end_259
.L_comp_true_259:
 mov %eax 1 ; True
.L_comp_end_259:
 cmp %eax 0
 je .L_while_end_257 ; Jump to end if condition is false
 ; --- while-body ---
    mov %ebx %ebp
    sub %ebx 28
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 64
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_true_262
 mov %eax 0 ; False
 jmp .L_comp_end_262
.L_comp_true_262:
 mov %eax 1 ; True
.L_comp_end_262:
 psh %eax
    mov %ebx %ebp
    sub %ebx 24
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 64
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_false_265
 jmp .L_comp_true_264
.L_comp_false_265:
 mov %eax 0 ; False
 jmp .L_comp_end_264
.L_comp_true_264:
 mov %eax 1 ; True
.L_comp_end_264:
 pop %ebx
    mov %ebx %ebp
    sub %ebx 24
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 64
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_false_270
 jmp .L_comp_true_269
.L_comp_false_270:
 mov %eax 0 ; False
 jmp .L_comp_end_269
.L_comp_true_269:
 mov %eax 1 ; True
.L_comp_end_269:
 cmp %eax 0
 je .L_logic_false_267
    mov %ebx %ebp
    sub %ebx 28
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 64
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_true_272
 mov %eax 0 ; False
 jmp .L_comp_end_272
.L_comp_true_272:
 mov %eax 1 ; True
.L_comp_end_272:
 cmp %eax 0
 je .L_logic_false_267
 mov %eax 1
 jmp .L_logic_end_266
.L_logic_false_267:
 mov %eax 0
.L_logic_end_266:
        cmp %eax 0
        je .L_endif_260 ; Jump to end if condition is false
        ; --- if-body ---
    mov %ebx %ebp
    sub %ebx 28
    ld %ebx %eax
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 64
    sd %ebx %eax
    jmp .L_while_start_257
        jmp .L_endif_260 ; End of if-body
.L_endif_260:
    mov %ebx %ebp
    sub %ebx 36
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 64
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_true_275
 mov %eax 0 ; False
 jmp .L_comp_end_275
.L_comp_true_275:
 mov %eax 1 ; True
.L_comp_end_275:
 psh %eax
    mov %ebx %ebp
    sub %ebx 32
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 64
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_false_278
 jmp .L_comp_true_277
.L_comp_false_278:
 mov %eax 0 ; False
 jmp .L_comp_end_277
.L_comp_true_277:
 mov %eax 1 ; True
.L_comp_end_277:
 pop %ebx
    mov %ebx %ebp
    sub %ebx 32
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 64
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_false_283
 jmp .L_comp_true_282
.L_comp_false_283:
 mov %eax 0 ; False
 jmp .L_comp_end_282
.L_comp_true_282:
 mov %eax 1 ; True
.L_comp_end_282:
 cmp %eax 0
 je .L_logic_false_280
    mov %ebx %ebp
    sub %ebx 36
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 64
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_true_285
 mov %eax 0 ; False
 jmp .L_comp_end_285
.L_comp_true_285:
 mov %eax 1 ; True
.L_comp_end_285:
 cmp %eax 0
 je .L_logic_false_280
 mov %eax 1
 jmp .L_logic_end_279
.L_logic_false_280:
 mov %eax 0
.L_logic_end_279:
        cmp %eax 0
        je .L_endif_273 ; Jump to end if condition is false
        ; --- if-body ---
    mov %ebx %ebp
    sub %ebx 36
    ld %ebx %eax
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 64
    sd %ebx %eax
    jmp .L_while_start_257
        jmp .L_endif_273 ; End of if-body
.L_endif_273:
    mov %ebx %ebp
    sub %ebx 44
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 64
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_true_288
 mov %eax 0 ; False
 jmp .L_comp_end_288
.L_comp_true_288:
 mov %eax 1 ; True
.L_comp_end_288:
 psh %eax
    mov %ebx %ebp
    sub %ebx 40
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 64
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_false_291
 jmp .L_comp_true_290
.L_comp_false_291:
 mov %eax 0 ; False
 jmp .L_comp_end_290
.L_comp_true_290:
 mov %eax 1 ; True
.L_comp_end_290:
 pop %ebx
    mov %ebx %ebp
    sub %ebx 40
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 64
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_false_296
 jmp .L_comp_true_295
.L_comp_false_296:
 mov %eax 0 ; False
 jmp .L_comp_end_295
.L_comp_true_295:
 mov %eax 1 ; True
.L_comp_end_295:
 cmp %eax 0
 je .L_logic_false_293
    mov %ebx %ebp
    sub %ebx 44
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 64
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_true_298
 mov %eax 0 ; False
 jmp .L_comp_end_298
.L_comp_true_298:
 mov %eax 1 ; True
.L_comp_end_298:
 cmp %eax 0
 je .L_logic_false_293
 mov %eax 1
 jmp .L_logic_end_292
.L_logic_false_293:
 mov %eax 0
.L_logic_end_292:
        cmp %eax 0
        je .L_endif_286 ; Jump to end if condition is false
        ; --- if-body ---
    mov %ebx %ebp
    sub %ebx 44
    ld %ebx %eax
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 64
    sd %ebx %eax
    jmp .L_while_start_257
        jmp .L_endif_286 ; End of if-body
.L_endif_286:
    mov %ebx %ebp
    sub %ebx 64
    ld %ebx %eax
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 68
    sd %ebx %eax
    mov %ebx %ebp
    sub %ebx 68
    ld %ebx %eax
    mov %ebx %eax ; EBX теперь хранит адрес для чтения
    ld %ebx %eax ; Загружаем значение по адресу из %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 72
    sd %ebx %eax
    mov %ebx %ebp
    sub %ebx 12
    ld %ebx %eax
    psh %eax ; Save expression result
    mov %ebx %ebp
    sub %ebx 68
    ld %ebx %eax
    mov %ebx %eax  ; %ebx = адрес для записи
    pop %eax       ; %eax = значение для записи
    sd %ebx %eax ; Записываем значение по разыменованному указателю
    mov %ebx %ebp
    sub %ebx 12
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 68
    ld %ebx %eax
    mov %ebx %eax ; EBX теперь хранит адрес для чтения
    ld %ebx %eax ; Загружаем значение по адресу из %ebx
 pop %ebx
 cmp %eax %ebx
 jne .L_comp_true_301
 mov %eax 0 ; False
 jmp .L_comp_end_301
.L_comp_true_301:
 mov %eax 1 ; True
.L_comp_end_301:
        cmp %eax 0
        je .L_endif_299 ; Jump to end if condition is false
        ; --- if-body ---
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
        jmp .L_endif_299 ; End of if-body
.L_endif_299:
    mov %ebx %ebp
    sub %ebx 72
    ld %ebx %eax
    psh %eax ; Save expression result
    mov %ebx %ebp
    sub %ebx 68
    ld %ebx %eax
    mov %ebx %eax  ; %ebx = адрес для записи
    pop %eax       ; %eax = значение для записи
    sd %ebx %eax ; Записываем значение по разыменованному указателю
    mov %eax 4
 psh %eax
    mov %ebx %ebp
    sub %ebx 64
    ld %ebx %eax
 pop %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 64
    sd %ebx %eax
 jmp .L_while_start_257
.L_while_end_257:
    mov %ebx %ebp
    sub %ebx 16
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 56
    ld %ebx %eax
 pop %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 56
    sd %ebx %eax
 jmp .L_while_start_212
.L_while_end_212:
    mov %eax 9
 psh %eax
    mov %eax 5
 psh %eax
 jsr set_cursor_pos
 add %esp 8
    mov %eax 0
 psh %eax
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jne .L_comp_true_304
 mov %eax 0 ; False
 jmp .L_comp_end_304
.L_comp_true_304:
 mov %eax 1 ; True
.L_comp_end_304:
        cmp %eax 0
        je .L_else_302 ; Jump to else if condition is false
        ; --- if-body ---
    mov %ebx __var_VGA_COLORS
    add %ebx 4 ; offset for field 'RED'
    mov %eax 0
    lb %ebx %eax ; Load value of field 'RED'
 psh %eax
 jsr set_character_color
 add %esp 4
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
 psh %eax
 mov %eax __str_init_51
 psh %eax
 jsr printf
    mov %ebx __var_VGA_COLORS
    add %ebx 15 ; offset for field 'WHITE'
    mov %eax 0
    lb %ebx %eax ; Load value of field 'WHITE'
 psh %eax
 jsr set_character_color
 add %esp 4
        jmp .L_endif_302 ; End of if-body
.L_else_302:
        ; --- else-body ---
 mov %eax __str_init_52
 psh %eax
 jsr printf
.L_endif_302:
    mov %eax 11
 psh %eax
    mov %eax 5
 psh %eax
 jsr set_cursor_pos
 add %esp 8
 mov %eax __str_init_53
 psh %eax
 jsr printf
 jsr screen_flush
    mov %eax 150
 psh %eax
 jsr sleep
 add %esp 4
 jsr getkey
    mov %eax 80
 psh %eax
 jsr sleep
 add %esp 4
    mov %ebx __var_VIEW_MAIN
    mov %eax 0
    lb %ebx %eax
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_current_view
    sb %ebx %eax
.L_ret_run_ram_check:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

load_and_boot:
    psh %ebp
    mov %ebp %esp
    mov %eax 0
 psh %eax
    mov %ebx __var_bootable_disk_count
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jne .L_comp_true_307
 mov %eax 0 ; False
 jmp .L_comp_end_307
.L_comp_true_307:
 mov %eax 1 ; True
.L_comp_end_307:
        cmp %eax 0
        je .L_endif_305 ; Jump to end if condition is false
        ; --- if-body ---
    mov %ebx %ebp
    add %ebx 8
    ld %ebx %eax
 psh %eax ; Save kasmf argument
 pop %eax ; Restore kasmf argument
mov %e9 %eax
 mov %esi $00010000
 mov %egi $030000
 mov %ecx 512
 .copy_loop:
   ldds %e9
   sb %egi %eax
   inx %esi
   lp .copy_loop
 .boot_start:
   xor %eax %eax
   xor %ebx %ebx
   xor %ecx %ecx
   xor %edx %edx
   xor %esi %esi
   xor %egi %egi
   xor %e8 %e8
   jmp $030000
        jmp .L_endif_305 ; End of if-body
.L_endif_305:
.L_ret_load_and_boot:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

printf_interrupt:
    psh %ebp
    mov %ebp %esp
    mov %ebx %ebp
    add %ebx 8
    ld %ebx %eax
 psh %eax
 jsr printf
 mov %esp %ebp
 pop %ebp
 irts
.L_ret_printf_interrupt:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

print_newline_interrupt:
    psh %ebp
    mov %ebp %esp
 jsr print_newline
 irts
.L_ret_print_newline_interrupt:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

clear_screen_interrupt:
    psh %ebp
    mov %ebp %esp
 jsr clear_screen
 irts
.L_ret_clear_screen_interrupt:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

init_interrupts:
    psh %ebp
    mov %ebp %esp
 mov %esi printf_interrupt
 sti $72
 mov %esi print_newline_interrupt
 sti $73
 mov %esi clear_screen_interrupt
 sti $70
.L_ret_init_interrupts:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

read_masked_input:
    psh %ebp
    mov %ebp %esp
    sub %esp 5 ; Allocate space for ALL local variables
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 4
    sd %ebx %eax
    mov %eax 0
    psh %eax ; Save expression result
    mov %eax 0
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
    pop %eax ; Восстанавливаем результат для записи
    sd %ebx %eax ; Записываем значение по адресу
.L_while_start_308:
    mov %eax 1
 cmp %eax 0
 je .L_while_end_308 ; Jump to end if condition is false
 ; --- while-body ---
 jsr getkey
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 5
    sb %ebx %eax
    mov %eax 0
 psh %eax
    mov %ebx %ebp
    sub %ebx 5
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jne .L_comp_true_311
 mov %eax 0 ; False
 jmp .L_comp_end_311
.L_comp_true_311:
 mov %eax 1 ; True
.L_comp_end_311:
        cmp %eax 0
        je .L_endif_309 ; Jump to end if condition is false
        ; --- if-body ---
    mov %eax 20
 psh %eax
 jsr sleep
 add %esp 4
    mov %ebx __var_SC
    add %ebx 3 ; offset for field 'ENTER'
    mov %eax 0
    lb %ebx %eax ; Load value of field 'ENTER'
 psh %eax
    mov %ebx %ebp
    sub %ebx 5
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_314
 mov %eax 0 ; False
 jmp .L_comp_end_314
.L_comp_true_314:
 mov %eax 1 ; True
.L_comp_end_314:
        cmp %eax 0
        je .L_endif_312 ; Jump to end if condition is false
        ; --- if-body ---
    jmp .L_while_end_308
        jmp .L_endif_312 ; End of if-body
.L_endif_312:
    mov %ebx __var_SC
    add %ebx 4 ; offset for field 'BACKSPACE'
    mov %eax 0
    lb %ebx %eax ; Load value of field 'BACKSPACE'
 psh %eax
    mov %ebx %ebp
    sub %ebx 5
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_317
 mov %eax 0 ; False
 jmp .L_comp_end_317
.L_comp_true_317:
 mov %eax 1 ; True
.L_comp_end_317:
        cmp %eax 0
        je .L_endif_315 ; Jump to end if condition is false
        ; --- if-body ---
    mov %eax 0
 psh %eax
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jne .L_comp_true_320
 mov %eax 0 ; False
 jmp .L_comp_end_320
.L_comp_true_320:
 mov %eax 1 ; True
.L_comp_end_320:
        cmp %eax 0
        je .L_endif_318 ; Jump to end if condition is false
        ; --- if-body ---
    mov %eax 1
 psh %eax
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
 pop %ebx
 not %ebx
 inx %ebx
 add %eax %ebx
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
    pop %eax ; Восстанавливаем результат для записи
    sd %ebx %eax ; Записываем значение по адресу
 mov %eax __str_init_54
 psh %eax
 jsr printf
        jmp .L_endif_318 ; End of if-body
.L_endif_318:
        jmp .L_endif_315 ; End of if-body
.L_endif_315:
    mov %eax 126
 psh %eax
    mov %ebx %ebp
    sub %ebx 5
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jg .L_comp_false_324
 jmp .L_comp_true_323
.L_comp_false_324:
 mov %eax 0 ; False
 jmp .L_comp_end_323
.L_comp_true_323:
 mov %eax 1 ; True
.L_comp_end_323:
 psh %eax
    mov %eax 32
 psh %eax
    mov %ebx %ebp
    sub %ebx 5
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_false_327
 jmp .L_comp_true_326
.L_comp_false_327:
 mov %eax 0 ; False
 jmp .L_comp_end_326
.L_comp_true_326:
 mov %eax 1 ; True
.L_comp_end_326:
 pop %ebx
    mov %eax 32
 psh %eax
    mov %ebx %ebp
    sub %ebx 5
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_false_332
 jmp .L_comp_true_331
.L_comp_false_332:
 mov %eax 0 ; False
 jmp .L_comp_end_331
.L_comp_true_331:
 mov %eax 1 ; True
.L_comp_end_331:
 cmp %eax 0
 je .L_logic_false_329
    mov %eax 126
 psh %eax
    mov %ebx %ebp
    sub %ebx 5
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jg .L_comp_false_335
 jmp .L_comp_true_334
.L_comp_false_335:
 mov %eax 0 ; False
 jmp .L_comp_end_334
.L_comp_true_334:
 mov %eax 1 ; True
.L_comp_end_334:
 cmp %eax 0
 je .L_logic_false_329
 mov %eax 1
 jmp .L_logic_end_328
.L_logic_false_329:
 mov %eax 0
.L_logic_end_328:
        cmp %eax 0
        je .L_endif_321 ; Jump to end if condition is false
        ; --- if-body ---
    mov %eax 1
 psh %eax
    mov %ebx %ebp
    add %ebx 12
    ld %ebx %eax
 pop %ebx
 not %ebx
 inx %ebx
 add %eax %ebx
 psh %eax
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_true_338
 mov %eax 0 ; False
 jmp .L_comp_end_338
.L_comp_true_338:
 mov %eax 1 ; True
.L_comp_end_338:
        cmp %eax 0
        je .L_endif_336 ; Jump to end if condition is false
        ; --- if-body ---
    mov %ebx %ebp
    sub %ebx 5
    mov %eax 0
    lb %ebx %eax
    psh %eax ; Save expression result
    mov %ebx %ebp
    sub %ebx 4
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
    pop %eax ; Восстанавливаем результат для записи
    sd %ebx %eax ; Записываем значение по адресу
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
    mov %eax 0
    psh %eax ; Save expression result
    mov %ebx %ebp
    sub %ebx 4
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
    pop %eax ; Восстанавливаем результат для записи
    sd %ebx %eax ; Записываем значение по адресу
 mov %eax __str_init_55
 psh %eax
 jsr printf
        jmp .L_endif_336 ; End of if-body
.L_endif_336:
        jmp .L_endif_321 ; End of if-body
.L_endif_321:
 jsr screen_flush
        jmp .L_endif_309 ; End of if-body
.L_endif_309:
 jmp .L_while_start_308
.L_while_end_308:
.L_ret_read_masked_input:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

run_post_screen:
    psh %ebp
    mov %ebp %esp
    sub %esp 37 ; Allocate space for ALL local variables
    mov %ebx __var_VGA_COLORS
    mov %eax 0
    lb %ebx %eax ; Load value of field 'BLACK'
 psh %eax
 jsr set_background_color
 add %esp 4
 jsr clear_screen
    mov %ebx __var_VGA_COLORS
    add %ebx 15 ; offset for field 'WHITE'
    mov %eax 0
    lb %ebx %eax ; Load value of field 'WHITE'
 psh %eax
 jsr set_character_color
 add %esp 4
    mov %eax 5
 psh %eax
    mov %eax 5
 psh %eax
 jsr set_cursor_pos
 add %esp 8
 mov %eax __str_init_56
 psh %eax
 jsr printf
 jsr screen_flush
    mov %eax 200
 psh %eax
 jsr sleep
 add %esp 4
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 29
    sd %ebx %eax
    mov %eax %ebp
    sub %eax 29
 psh %eax
    mov %eax %ebp
    sub %eax 25
 psh %eax
 jsr get_hardware_info_safe
 add %esp 8
    mov %eax 7
 psh %eax
    mov %eax 5
 psh %eax
 jsr set_cursor_pos
 add %esp 8
    mov %eax %ebp
    sub %eax 25
 psh %eax
 mov %eax __str_init_57
 psh %eax
 jsr printf
 jsr screen_flush
    mov %eax 200
 psh %eax
 jsr sleep
 add %esp 4
    mov %eax 8
 psh %eax
    mov %eax 5
 psh %eax
 jsr set_cursor_pos
 add %esp 8
    mov %eax 1024
 psh %eax
    mov %eax 1024
 psh %eax
    mov %ebx %ebp
    sub %ebx 29
    ld %ebx %eax
 pop %ebx
 div %eax %ebx
 pop %ebx
 div %eax %ebx
 psh %eax
 mov %eax __str_init_58
 psh %eax
 jsr printf
 jsr screen_flush
    mov %eax 200
 psh %eax
 jsr sleep
 add %esp 4
    mov %eax 9
 psh %eax
    mov %eax 5
 psh %eax
 jsr set_cursor_pos
 add %esp 8
    mov %eax 0
 psh %eax
    mov %ebx __var_bootable_disk_count
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jne .L_comp_true_341
 mov %eax 0 ; False
 jmp .L_comp_end_341
.L_comp_true_341:
 mov %eax 1 ; True
.L_comp_end_341:
        cmp %eax 0
        je .L_else_339 ; Jump to else if condition is false
        ; --- if-body ---
    mov %ebx __var_VGA_COLORS
    add %ebx 15 ; offset for field 'WHITE'
    mov %eax 0
    lb %ebx %eax ; Load value of field 'WHITE'
 psh %eax
 jsr set_character_color
 add %esp 4
    mov %ebx __var_bootable_disk_count
    mov %eax 0
    lb %ebx %eax
 psh %eax
 mov %eax __str_init_59
 psh %eax
 jsr printf
        jmp .L_endif_339 ; End of if-body
.L_else_339:
        ; --- else-body ---
    mov %ebx __var_VGA_COLORS
    add %ebx 14 ; offset for field 'YELLOW'
    mov %eax 0
    lb %ebx %eax ; Load value of field 'YELLOW'
 psh %eax
 jsr set_character_color
 add %esp 4
 mov %eax __str_init_60
 psh %eax
 jsr printf
    mov %ebx __var_VGA_COLORS
    add %ebx 15 ; offset for field 'WHITE'
    mov %eax 0
    lb %ebx %eax ; Load value of field 'WHITE'
 psh %eax
 jsr set_character_color
 add %esp 4
.L_endif_339:
 jsr screen_flush
    mov %eax 200
 psh %eax
 jsr sleep
 add %esp 4
    mov %eax 5
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 33
    sd %ebx %eax
.L_while_start_342:
    mov %eax 0
 psh %eax
    mov %ebx %ebp
    sub %ebx 33
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jne .L_comp_true_344
 mov %eax 0 ; False
 jmp .L_comp_end_344
.L_comp_true_344:
 mov %eax 1 ; True
.L_comp_end_344:
 cmp %eax 0
 je .L_while_end_342 ; Jump to end if condition is false
 ; --- while-body ---
    mov %eax 12
 psh %eax
    mov %eax 5
 psh %eax
 jsr set_cursor_pos
 add %esp 8
    mov %ebx %ebp
    sub %ebx 33
    ld %ebx %eax
 psh %eax
 mov %eax __str_init_61
 psh %eax
 jsr printf
 jsr screen_flush
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 37
    sd %ebx %eax
.L_while_start_345:
    mov %eax 10
 psh %eax
    mov %ebx %ebp
    sub %ebx 37
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jne .L_comp_true_347
 mov %eax 0 ; False
 jmp .L_comp_end_347
.L_comp_true_347:
 mov %eax 1 ; True
.L_comp_end_347:
 cmp %eax 0
 je .L_while_end_345 ; Jump to end if condition is false
 ; --- while-body ---
    mov %eax 1
 psh %eax
    mov %ebx __var_SC
    add %ebx 2 ; offset for field 'ESC'
    mov %eax 0
    lb %ebx %eax ; Load value of field 'ESC'
 psh %eax
 jsr key_in_buffer
 add %esp 4
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_350
 mov %eax 0 ; False
 jmp .L_comp_end_350
.L_comp_true_350:
 mov %eax 1 ; True
.L_comp_end_350:
        cmp %eax 0
        je .L_endif_348 ; Jump to end if condition is false
        ; --- if-body ---
    mov %eax 1
    jmp .L_ret_run_post_screen
        jmp .L_endif_348 ; End of if-body
.L_endif_348:
    mov %eax 100
 psh %eax
 jsr sleep
 add %esp 4
    mov %eax 1
 psh %eax
    mov %ebx %ebp
    sub %ebx 37
    ld %ebx %eax
 pop %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 37
    sd %ebx %eax
 jmp .L_while_start_345
.L_while_end_345:
    mov %eax 1
 psh %eax
    mov %ebx %ebp
    sub %ebx 33
    ld %ebx %eax
 pop %ebx
 not %ebx
 inx %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 33
    sd %ebx %eax
 jmp .L_while_start_342
.L_while_end_342:
    mov %eax 0
    jmp .L_ret_run_post_screen
.L_ret_run_post_screen:
    mov %esp %ebp
    pop %ebp
    rts

get_hardware_info_safe:
    psh %ebp
    mov %ebp %esp
    mov %ebx %ebp
    add %ebx 8
    ld %ebx %eax
 psh %eax ; Save kasmf argument
 pop %eax ; Restore kasmf argument
mov %e14 %eax
 int $A
 sd %e14 %eax
 sd %e14 %ebx
 sd %e14 %ecx
 sd %e14 %edx
 sd %e14 %esi
    mov %eax 0
    psh %eax ; Save expression result
    mov %eax 20
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
    pop %eax ; Восстанавливаем результат для записи
    sd %ebx %eax ; Записываем значение по адресу
 int $A
    mov %ebx %ebp
    add %ebx 12
    ld %ebx %eax
 psh %eax ; Save kasmf argument
 pop %eax ; Restore kasmf argument
sd %eax %e8
.L_ret_get_hardware_info_safe:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

find_bootable_disks:
    psh %ebp
    mov %ebp %esp
    sub %esp 12 ; Allocate space for ALL local variables
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_bootable_disk_count
    sb %ebx %eax
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 4
    sd %ebx %eax
.L_while_start_351:
    mov %eax 8
 psh %eax
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jne .L_comp_true_353
 mov %eax 0 ; False
 jmp .L_comp_end_353
.L_comp_true_353:
 mov %eax 1 ; True
.L_comp_end_353:
 cmp %eax 0
 je .L_while_end_351 ; Jump to end if condition is false
 ; --- while-body ---
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 8
    sd %ebx %eax
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
 psh %eax ; Save kasmf argument
 pop %eax ; Restore kasmf argument
mov %edx %eax
 int $0B
    mov %eax %ebp
    sub %eax 8
 psh %eax ; Save kasmf argument
 pop %eax ; Restore kasmf argument
sd %eax %edx
    mov %eax 0
 psh %eax
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jne .L_comp_true_356
 mov %eax 0 ; False
 jmp .L_comp_end_356
.L_comp_true_356:
 mov %eax 1 ; True
.L_comp_end_356:
        cmp %eax 0
        je .L_endif_354 ; Jump to end if condition is false
        ; --- if-body ---
    mov %eax 32
 psh %eax
    mov %ebx __var_bootable_disk_count
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 mul %eax %ebx
 psh %eax
    mov %eax __var_boot_menu_text_buffer
 pop %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 12
    sd %ebx %eax
    mov %eax 1024
 psh %eax
    mov %eax 1024
 psh %eax
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
 pop %ebx
 div %eax %ebx
 pop %ebx
 div %eax %ebx
 psh %eax
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
 psh %eax
 mov %eax __str_init_62
 psh %eax
    mov %ebx %ebp
    sub %ebx 12
    ld %ebx %eax
 psh %eax
 jsr sprintf
    mov %ebx %ebp
    sub %ebx 12
    ld %ebx %eax
    psh %eax ; Save expression result
    mov %ebx __var_bootable_disk_count
    mov %eax 0
    lb %ebx %eax
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 4
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx __var_boot_menu_items
    add %ebx %e8   ; %ebx = base_address + offset
    pop %eax ; Восстанавливаем результат для записи
    sd %ebx %eax ; Записываем значение по адресу
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    psh %eax ; Save expression result
    mov %ebx __var_bootable_disk_count
    mov %eax 0
    lb %ebx %eax
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 4
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx __var_bootable_disk_ids
    add %ebx %e8   ; %ebx = base_address + offset
    pop %eax ; Восстанавливаем результат для записи
    sd %ebx %eax ; Записываем значение по адресу
    mov %eax 1
 psh %eax
    mov %ebx __var_bootable_disk_count
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_bootable_disk_count
    sb %ebx %eax
        jmp .L_endif_354 ; End of if-body
.L_endif_354:
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
 jmp .L_while_start_351
.L_while_end_351:
.L_ret_find_bootable_disks:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

draw_header:
    psh %ebp
    mov %ebp %esp
    sub %esp 16 ; Allocate space for ALL local variables
    mov %eax 0
 psh %eax
    mov %eax 0
 psh %eax
 jsr set_cursor_pos
 add %esp 8
    mov %ebx __var_HEADER_BG
    mov %eax 0
    lb %ebx %eax
 psh %eax
 jsr set_background_color
 add %esp 4
    mov %ebx __var_HEADER_FG
    mov %eax 0
    lb %ebx %eax
 psh %eax
 jsr set_character_color
 add %esp 4
    mov %ebx %ebp
    add %ebx 8
    ld %ebx %eax
 psh %eax
 jsr strlen
 add %esp 4
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 4
    sd %ebx %eax
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
 psh %eax
    mov %eax 80
 pop %ebx
 not %ebx
 inx %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 8
    sd %ebx %eax
    mov %eax 2
 psh %eax
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
 pop %ebx
 div %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 12
    sd %ebx %eax
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 16
    sd %ebx %eax
.L_while_start_357:
    mov %ebx %ebp
    sub %ebx 12
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 16
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jne .L_comp_true_359
 mov %eax 0 ; False
 jmp .L_comp_end_359
.L_comp_true_359:
 mov %eax 1 ; True
.L_comp_end_359:
 cmp %eax 0
 je .L_while_end_357 ; Jump to end if condition is false
 ; --- while-body ---
 mov %eax __str_init_63
 psh %eax
 jsr printf
    mov %eax 1
 psh %eax
    mov %ebx %ebp
    sub %ebx 16
    ld %ebx %eax
 pop %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 16
    sd %ebx %eax
 jmp .L_while_start_357
.L_while_end_357:
    mov %ebx %ebp
    add %ebx 8
    ld %ebx %eax
 psh %eax
 mov %eax __str_init_64
 psh %eax
 jsr printf
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 16
    sd %ebx %eax
.L_while_start_360:
    mov %ebx %ebp
    sub %ebx 12
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
 pop %ebx
 not %ebx
 inx %ebx
 add %eax %ebx
 psh %eax
    mov %ebx %ebp
    sub %ebx 16
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jne .L_comp_true_362
 mov %eax 0 ; False
 jmp .L_comp_end_362
.L_comp_true_362:
 mov %eax 1 ; True
.L_comp_end_362:
 cmp %eax 0
 je .L_while_end_360 ; Jump to end if condition is false
 ; --- while-body ---
 mov %eax __str_init_65
 psh %eax
 jsr printf
    mov %eax 1
 psh %eax
    mov %ebx %ebp
    sub %ebx 16
    ld %ebx %eax
 pop %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 16
    sd %ebx %eax
 jmp .L_while_start_360
.L_while_end_360:
.L_ret_draw_header:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

draw_footer:
    psh %ebp
    mov %ebp %esp
    sub %esp 8 ; Allocate space for ALL local variables
    mov %eax 58
 psh %eax
    mov %eax 0
 psh %eax
 jsr set_cursor_pos
 add %esp 8
    mov %ebx __var_HEADER_BG
    mov %eax 0
    lb %ebx %eax
 psh %eax
 jsr set_background_color
 add %esp 4
    mov %ebx __var_HEADER_FG
    mov %eax 0
    lb %ebx %eax
 psh %eax
 jsr set_character_color
 add %esp 4
    mov %ebx %ebp
    add %ebx 8
    ld %ebx %eax
 psh %eax
 jsr strlen
 add %esp 4
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 4
    sd %ebx %eax
    mov %ebx %ebp
    add %ebx 8
    ld %ebx %eax
 psh %eax
 mov %eax __str_init_66
 psh %eax
 jsr printf
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 8
    sd %ebx %eax
.L_while_start_363:
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
 psh %eax
    mov %eax 79
 pop %ebx
 not %ebx
 inx %ebx
 add %eax %ebx
 psh %eax
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jne .L_comp_true_365
 mov %eax 0 ; False
 jmp .L_comp_end_365
.L_comp_true_365:
 mov %eax 1 ; True
.L_comp_end_365:
 cmp %eax 0
 je .L_while_end_363 ; Jump to end if condition is false
 ; --- while-body ---
 mov %eax __str_init_67
 psh %eax
 jsr printf
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
 jmp .L_while_start_363
.L_while_end_363:
.L_ret_draw_footer:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

save_settings:
    psh %ebp
    mov %ebp %esp
    sub %esp 32 ; Allocate space for ALL local variables
    mov %eax 0
 psh %eax
    mov %ebx __var_bootable_disk_count
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_368
 mov %eax 0 ; False
 jmp .L_comp_end_368
.L_comp_true_368:
 mov %eax 1 ; True
.L_comp_end_368:
        cmp %eax 0
        je .L_endif_366 ; Jump to end if condition is false
        ; --- if-body ---
    mov %eax 0
    jmp .L_ret_save_settings
        jmp .L_endif_366 ; End of if-body
.L_endif_366:
    mov %eax 71
    psh %eax ; Save expression result
    mov %eax 0
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 1
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx %ebp
    sub %ebx 32
    add %ebx %e8   ; %ebx = base_address + offset
    pop %eax ; Восстанавливаем результат для записи
    sb %ebx %eax ; Записываем значение по адресу
    mov %eax 67
    psh %eax ; Save expression result
    mov %eax 1
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 1
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx %ebp
    sub %ebx 32
    add %ebx %e8   ; %ebx = base_address + offset
    pop %eax ; Восстанавливаем результат для записи
    sb %ebx %eax ; Записываем значение по адресу
    mov %eax 66
    psh %eax ; Save expression result
    mov %eax 2
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 1
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx %ebp
    sub %ebx 32
    add %ebx %e8   ; %ebx = base_address + offset
    pop %eax ; Восстанавливаем результат для записи
    sb %ebx %eax ; Записываем значение по адресу
    mov %eax 83
    psh %eax ; Save expression result
    mov %eax 3
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 1
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx %ebp
    sub %ebx 32
    add %ebx %e8   ; %ebx = base_address + offset
    pop %eax ; Восстанавливаем результат для записи
    sb %ebx %eax ; Записываем значение по адресу
    mov %eax 4
 psh %eax
    mov %eax __var_default_boot_disk
 psh %eax
    mov %eax 4
 psh %eax
    mov %eax %ebp
    sub %eax 32
 pop %ebx
 add %eax %ebx
 psh %eax
 jsr memory_copy
 add %esp 12
    mov %eax 4
 psh %eax
    mov %eax __var_color_theme
 psh %eax
    mov %eax 8
 psh %eax
    mov %eax %ebp
    sub %eax 32
 pop %ebx
 add %eax %ebx
 psh %eax
 jsr memory_copy
 add %esp 12
    mov %eax 17
 psh %eax
    mov %eax __var_bios_password
 psh %eax
    mov %eax 12
 psh %eax
    mov %eax %ebp
    sub %eax 32
 pop %ebx
 add %eax %ebx
 psh %eax
 jsr memory_copy
 add %esp 12
 mov %e9 0
 mov %esi 512
    mov %eax %ebp
    sub %eax 32
 psh %eax ; Save kasmf argument
 pop %eax ; Restore kasmf argument
mov %egi %eax
 mov %ecx 32
 .save_loop:
  lb %egi %eax
  stds %e9
  inx %esi
  lp .save_loop
.L_ret_save_settings:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

load_settings:
    psh %ebp
    mov %ebp %esp
    sub %esp 32 ; Allocate space for ALL local variables
    mov %eax 0
 psh %eax
    mov %ebx __var_bootable_disk_count
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_371
 mov %eax 0 ; False
 jmp .L_comp_end_371
.L_comp_true_371:
 mov %eax 1 ; True
.L_comp_end_371:
        cmp %eax 0
        je .L_endif_369 ; Jump to end if condition is false
        ; --- if-body ---
    mov %eax 0
 psh %eax
    mov %ebx __var_bootable_disk_count
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jne .L_comp_true_374
 mov %eax 0 ; False
 jmp .L_comp_end_374
.L_comp_true_374:
 mov %eax 1 ; True
.L_comp_end_374:
        cmp %eax 0
        je .L_endif_372 ; Jump to end if condition is false
        ; --- if-body ---
    mov %eax 0
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 4
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx __var_bootable_disk_ids
    add %ebx %e8   ; %ebx = base_address + offset
    ld %ebx %eax ; Load value from address
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_default_boot_disk
    sd %ebx %eax
        jmp .L_endif_372 ; End of if-body
.L_endif_372:
    mov %eax 0
    jmp .L_ret_load_settings
        jmp .L_endif_369 ; End of if-body
.L_endif_369:
 mov %e9 0
 mov %esi 512
    mov %eax %ebp
    sub %eax 32
 psh %eax ; Save kasmf argument
 pop %eax ; Restore kasmf argument
mov %egi %eax
 mov %ecx 32
 .load_loop:
  ldds %e9
  sb %egi %eax
  inx %esi
  lp .load_loop
    mov %eax 83
 psh %eax
    mov %eax 3
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 1
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx %ebp
    sub %ebx 32
    add %ebx %e8   ; %ebx = base_address + offset
    mov %eax 0
    lb %ebx %eax ; Load value from address
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_377
 mov %eax 0 ; False
 jmp .L_comp_end_377
.L_comp_true_377:
 mov %eax 1 ; True
.L_comp_end_377:
 psh %eax
    mov %eax 66
 psh %eax
    mov %eax 2
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 1
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx %ebp
    sub %ebx 32
    add %ebx %e8   ; %ebx = base_address + offset
    mov %eax 0
    lb %ebx %eax ; Load value from address
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_379
 mov %eax 0 ; False
 jmp .L_comp_end_379
.L_comp_true_379:
 mov %eax 1 ; True
.L_comp_end_379:
 psh %eax
    mov %eax 67
 psh %eax
    mov %eax 1
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 1
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx %ebp
    sub %ebx 32
    add %ebx %e8   ; %ebx = base_address + offset
    mov %eax 0
    lb %ebx %eax ; Load value from address
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_381
 mov %eax 0 ; False
 jmp .L_comp_end_381
.L_comp_true_381:
 mov %eax 1 ; True
.L_comp_end_381:
 psh %eax
    mov %eax 71
 psh %eax
    mov %eax 0
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 1
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx %ebp
    sub %ebx 32
    add %ebx %e8   ; %ebx = base_address + offset
    mov %eax 0
    lb %ebx %eax ; Load value from address
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_383
 mov %eax 0 ; False
 jmp .L_comp_end_383
.L_comp_true_383:
 mov %eax 1 ; True
.L_comp_end_383:
 pop %ebx
    mov %eax 71
 psh %eax
    mov %eax 0
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 1
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx %ebp
    sub %ebx 32
    add %ebx %e8   ; %ebx = base_address + offset
    mov %eax 0
    lb %ebx %eax ; Load value from address
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_387
 mov %eax 0 ; False
 jmp .L_comp_end_387
.L_comp_true_387:
 mov %eax 1 ; True
.L_comp_end_387:
 cmp %eax 0
 je .L_logic_false_385
    mov %eax 67
 psh %eax
    mov %eax 1
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 1
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx %ebp
    sub %ebx 32
    add %ebx %e8   ; %ebx = base_address + offset
    mov %eax 0
    lb %ebx %eax ; Load value from address
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_389
 mov %eax 0 ; False
 jmp .L_comp_end_389
.L_comp_true_389:
 mov %eax 1 ; True
.L_comp_end_389:
 cmp %eax 0
 je .L_logic_false_385
 mov %eax 1
 jmp .L_logic_end_384
.L_logic_false_385:
 mov %eax 0
.L_logic_end_384:
 pop %ebx
    mov %eax 67
 psh %eax
    mov %eax 1
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 1
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx %ebp
    sub %ebx 32
    add %ebx %e8   ; %ebx = base_address + offset
    mov %eax 0
    lb %ebx %eax ; Load value from address
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_393
 mov %eax 0 ; False
 jmp .L_comp_end_393
.L_comp_true_393:
 mov %eax 1 ; True
.L_comp_end_393:
 psh %eax
    mov %eax 71
 psh %eax
    mov %eax 0
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 1
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx %ebp
    sub %ebx 32
    add %ebx %e8   ; %ebx = base_address + offset
    mov %eax 0
    lb %ebx %eax ; Load value from address
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_395
 mov %eax 0 ; False
 jmp .L_comp_end_395
.L_comp_true_395:
 mov %eax 1 ; True
.L_comp_end_395:
 pop %ebx
    mov %eax 71
 psh %eax
    mov %eax 0
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 1
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx %ebp
    sub %ebx 32
    add %ebx %e8   ; %ebx = base_address + offset
    mov %eax 0
    lb %ebx %eax ; Load value from address
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_399
 mov %eax 0 ; False
 jmp .L_comp_end_399
.L_comp_true_399:
 mov %eax 1 ; True
.L_comp_end_399:
 cmp %eax 0
 je .L_logic_false_397
    mov %eax 67
 psh %eax
    mov %eax 1
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 1
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx %ebp
    sub %ebx 32
    add %ebx %e8   ; %ebx = base_address + offset
    mov %eax 0
    lb %ebx %eax ; Load value from address
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_401
 mov %eax 0 ; False
 jmp .L_comp_end_401
.L_comp_true_401:
 mov %eax 1 ; True
.L_comp_end_401:
 cmp %eax 0
 je .L_logic_false_397
 mov %eax 1
 jmp .L_logic_end_396
.L_logic_false_397:
 mov %eax 0
.L_logic_end_396:
 cmp %eax 0
 je .L_logic_false_391
    mov %eax 66
 psh %eax
    mov %eax 2
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 1
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx %ebp
    sub %ebx 32
    add %ebx %e8   ; %ebx = base_address + offset
    mov %eax 0
    lb %ebx %eax ; Load value from address
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_403
 mov %eax 0 ; False
 jmp .L_comp_end_403
.L_comp_true_403:
 mov %eax 1 ; True
.L_comp_end_403:
 cmp %eax 0
 je .L_logic_false_391
 mov %eax 1
 jmp .L_logic_end_390
.L_logic_false_391:
 mov %eax 0
.L_logic_end_390:
 pop %ebx
    mov %eax 66
 psh %eax
    mov %eax 2
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 1
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx %ebp
    sub %ebx 32
    add %ebx %e8   ; %ebx = base_address + offset
    mov %eax 0
    lb %ebx %eax ; Load value from address
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_407
 mov %eax 0 ; False
 jmp .L_comp_end_407
.L_comp_true_407:
 mov %eax 1 ; True
.L_comp_end_407:
 psh %eax
    mov %eax 67
 psh %eax
    mov %eax 1
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 1
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx %ebp
    sub %ebx 32
    add %ebx %e8   ; %ebx = base_address + offset
    mov %eax 0
    lb %ebx %eax ; Load value from address
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_409
 mov %eax 0 ; False
 jmp .L_comp_end_409
.L_comp_true_409:
 mov %eax 1 ; True
.L_comp_end_409:
 psh %eax
    mov %eax 71
 psh %eax
    mov %eax 0
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 1
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx %ebp
    sub %ebx 32
    add %ebx %e8   ; %ebx = base_address + offset
    mov %eax 0
    lb %ebx %eax ; Load value from address
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_411
 mov %eax 0 ; False
 jmp .L_comp_end_411
.L_comp_true_411:
 mov %eax 1 ; True
.L_comp_end_411:
 pop %ebx
    mov %eax 71
 psh %eax
    mov %eax 0
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 1
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx %ebp
    sub %ebx 32
    add %ebx %e8   ; %ebx = base_address + offset
    mov %eax 0
    lb %ebx %eax ; Load value from address
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_415
 mov %eax 0 ; False
 jmp .L_comp_end_415
.L_comp_true_415:
 mov %eax 1 ; True
.L_comp_end_415:
 cmp %eax 0
 je .L_logic_false_413
    mov %eax 67
 psh %eax
    mov %eax 1
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 1
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx %ebp
    sub %ebx 32
    add %ebx %e8   ; %ebx = base_address + offset
    mov %eax 0
    lb %ebx %eax ; Load value from address
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_417
 mov %eax 0 ; False
 jmp .L_comp_end_417
.L_comp_true_417:
 mov %eax 1 ; True
.L_comp_end_417:
 cmp %eax 0
 je .L_logic_false_413
 mov %eax 1
 jmp .L_logic_end_412
.L_logic_false_413:
 mov %eax 0
.L_logic_end_412:
 pop %ebx
    mov %eax 67
 psh %eax
    mov %eax 1
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 1
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx %ebp
    sub %ebx 32
    add %ebx %e8   ; %ebx = base_address + offset
    mov %eax 0
    lb %ebx %eax ; Load value from address
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_421
 mov %eax 0 ; False
 jmp .L_comp_end_421
.L_comp_true_421:
 mov %eax 1 ; True
.L_comp_end_421:
 psh %eax
    mov %eax 71
 psh %eax
    mov %eax 0
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 1
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx %ebp
    sub %ebx 32
    add %ebx %e8   ; %ebx = base_address + offset
    mov %eax 0
    lb %ebx %eax ; Load value from address
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_423
 mov %eax 0 ; False
 jmp .L_comp_end_423
.L_comp_true_423:
 mov %eax 1 ; True
.L_comp_end_423:
 pop %ebx
    mov %eax 71
 psh %eax
    mov %eax 0
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 1
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx %ebp
    sub %ebx 32
    add %ebx %e8   ; %ebx = base_address + offset
    mov %eax 0
    lb %ebx %eax ; Load value from address
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_427
 mov %eax 0 ; False
 jmp .L_comp_end_427
.L_comp_true_427:
 mov %eax 1 ; True
.L_comp_end_427:
 cmp %eax 0
 je .L_logic_false_425
    mov %eax 67
 psh %eax
    mov %eax 1
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 1
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx %ebp
    sub %ebx 32
    add %ebx %e8   ; %ebx = base_address + offset
    mov %eax 0
    lb %ebx %eax ; Load value from address
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_429
 mov %eax 0 ; False
 jmp .L_comp_end_429
.L_comp_true_429:
 mov %eax 1 ; True
.L_comp_end_429:
 cmp %eax 0
 je .L_logic_false_425
 mov %eax 1
 jmp .L_logic_end_424
.L_logic_false_425:
 mov %eax 0
.L_logic_end_424:
 cmp %eax 0
 je .L_logic_false_419
    mov %eax 66
 psh %eax
    mov %eax 2
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 1
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx %ebp
    sub %ebx 32
    add %ebx %e8   ; %ebx = base_address + offset
    mov %eax 0
    lb %ebx %eax ; Load value from address
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_431
 mov %eax 0 ; False
 jmp .L_comp_end_431
.L_comp_true_431:
 mov %eax 1 ; True
.L_comp_end_431:
 cmp %eax 0
 je .L_logic_false_419
 mov %eax 1
 jmp .L_logic_end_418
.L_logic_false_419:
 mov %eax 0
.L_logic_end_418:
 cmp %eax 0
 je .L_logic_false_405
    mov %eax 83
 psh %eax
    mov %eax 3
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 1
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx %ebp
    sub %ebx 32
    add %ebx %e8   ; %ebx = base_address + offset
    mov %eax 0
    lb %ebx %eax ; Load value from address
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_433
 mov %eax 0 ; False
 jmp .L_comp_end_433
.L_comp_true_433:
 mov %eax 1 ; True
.L_comp_end_433:
 cmp %eax 0
 je .L_logic_false_405
 mov %eax 1
 jmp .L_logic_end_404
.L_logic_false_405:
 mov %eax 0
.L_logic_end_404:
        cmp %eax 0
        je .L_else_375 ; Jump to else if condition is false
        ; --- if-body ---
    mov %eax 4
 psh %eax
    mov %eax 4
 psh %eax
    mov %eax %ebp
    sub %eax 32
 pop %ebx
 add %eax %ebx
 psh %eax
    mov %eax __var_default_boot_disk
 psh %eax
 jsr memory_copy
 add %esp 12
    mov %eax 4
 psh %eax
    mov %eax 8
 psh %eax
    mov %eax %ebp
    sub %eax 32
 pop %ebx
 add %eax %ebx
 psh %eax
    mov %eax __var_color_theme
 psh %eax
 jsr memory_copy
 add %esp 12
    mov %eax 17
 psh %eax
    mov %eax 12
 psh %eax
    mov %eax %ebp
    sub %eax 32
 pop %ebx
 add %eax %ebx
 psh %eax
    mov %eax __var_bios_password
 psh %eax
 jsr memory_copy
 add %esp 12
        jmp .L_endif_375 ; End of if-body
.L_else_375:
        ; --- else-body ---
    mov %eax 0
 psh %eax
    mov %ebx __var_bootable_disk_count
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jne .L_comp_true_436
 mov %eax 0 ; False
 jmp .L_comp_end_436
.L_comp_true_436:
 mov %eax 1 ; True
.L_comp_end_436:
        cmp %eax 0
        je .L_endif_434 ; Jump to end if condition is false
        ; --- if-body ---
    mov %eax 0
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 4
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx __var_bootable_disk_ids
    add %ebx %e8   ; %ebx = base_address + offset
    ld %ebx %eax ; Load value from address
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_default_boot_disk
    sd %ebx %eax
        jmp .L_endif_434 ; End of if-body
.L_endif_434:
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_color_theme
    sd %ebx %eax
    mov %eax 0
    psh %eax ; Save expression result
    mov %eax 0
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 1
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx __var_bios_password
    add %ebx %e8   ; %ebx = base_address + offset
    pop %eax ; Восстанавливаем результат для записи
    sb %ebx %eax ; Записываем значение по адресу
.L_endif_375:
.L_ret_load_settings:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

apply_color_theme:
    psh %ebp
    mov %ebp %esp
    mov %eax 1
        psh %eax ; Save case value
    mov %ebx __var_color_theme
    ld %ebx %eax
        mov %ebx %eax ; Move match expression value to EBX for comparison
        pop %eax ; Restore case value to EAX for comparison
        cmp %eax %ebx
        je .L_block_body_438_0
    mov %eax 2
        psh %eax ; Save case value
    mov %ebx __var_color_theme
    ld %ebx %eax
        mov %ebx %eax ; Move match expression value to EBX for comparison
        pop %eax ; Restore case value to EAX for comparison
        cmp %eax %ebx
        je .L_block_body_438_1
        jmp .L_block_body_438_2
.L_block_body_438_0:
    mov %ebx __var_VGA_COLORS
    mov %eax 0
    lb %ebx %eax ; Load value of field 'BLACK'
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_HEADER_BG
    sb %ebx %eax
    mov %ebx __var_VGA_COLORS
    add %ebx 2 ; offset for field 'GREEN'
    mov %eax 0
    lb %ebx %eax ; Load value of field 'GREEN'
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_HEADER_FG
    sb %ebx %eax
    mov %ebx __var_VGA_COLORS
    mov %eax 0
    lb %ebx %eax ; Load value of field 'BLACK'
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_MAIN_BG
    sb %ebx %eax
    mov %ebx __var_VGA_COLORS
    add %ebx 2 ; offset for field 'GREEN'
    mov %eax 0
    lb %ebx %eax ; Load value of field 'GREEN'
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_MAIN_FG
    sb %ebx %eax
    mov %ebx __var_VGA_COLORS
    add %ebx 2 ; offset for field 'GREEN'
    mov %eax 0
    lb %ebx %eax ; Load value of field 'GREEN'
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_SELECT_BG
    sb %ebx %eax
    mov %ebx __var_VGA_COLORS
    mov %eax 0
    lb %ebx %eax ; Load value of field 'BLACK'
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_SELECT_FG
    sb %ebx %eax
    mov %ebx __var_VGA_COLORS
    add %ebx 9 ; offset for field 'LIGHT_GREEN'
    mov %eax 0
    lb %ebx %eax ; Load value of field 'LIGHT_GREEN'
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_HIGHLIGHT_FG
    sb %ebx %eax
        jmp .L_match_end_437
.L_block_body_438_1:
    mov %ebx __var_VGA_COLORS
    mov %eax 0
    lb %ebx %eax ; Load value of field 'BLACK'
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_HEADER_BG
    sb %ebx %eax
    mov %ebx __var_VGA_COLORS
    add %ebx 5 ; offset for field 'BROWN'
    mov %eax 0
    lb %ebx %eax ; Load value of field 'BROWN'
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_HEADER_FG
    sb %ebx %eax
    mov %ebx __var_VGA_COLORS
    mov %eax 0
    lb %ebx %eax ; Load value of field 'BLACK'
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_MAIN_BG
    sb %ebx %eax
    mov %ebx __var_VGA_COLORS
    add %ebx 5 ; offset for field 'BROWN'
    mov %eax 0
    lb %ebx %eax ; Load value of field 'BROWN'
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_MAIN_FG
    sb %ebx %eax
    mov %ebx __var_VGA_COLORS
    add %ebx 5 ; offset for field 'BROWN'
    mov %eax 0
    lb %ebx %eax ; Load value of field 'BROWN'
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_SELECT_BG
    sb %ebx %eax
    mov %ebx __var_VGA_COLORS
    mov %eax 0
    lb %ebx %eax ; Load value of field 'BLACK'
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_SELECT_FG
    sb %ebx %eax
    mov %ebx __var_VGA_COLORS
    add %ebx 14 ; offset for field 'YELLOW'
    mov %eax 0
    lb %ebx %eax ; Load value of field 'YELLOW'
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_HIGHLIGHT_FG
    sb %ebx %eax
        jmp .L_match_end_437
.L_block_body_438_2:
    mov %ebx __var_VGA_COLORS
    add %ebx 7 ; offset for field 'DARK_GRAY'
    mov %eax 0
    lb %ebx %eax ; Load value of field 'DARK_GRAY'
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_HEADER_BG
    sb %ebx %eax
    mov %ebx __var_VGA_COLORS
    add %ebx 15 ; offset for field 'WHITE'
    mov %eax 0
    lb %ebx %eax ; Load value of field 'WHITE'
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_HEADER_FG
    sb %ebx %eax
    mov %ebx __var_VGA_COLORS
    add %ebx 1 ; offset for field 'BLUE'
    mov %eax 0
    lb %ebx %eax ; Load value of field 'BLUE'
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_MAIN_BG
    sb %ebx %eax
    mov %ebx __var_VGA_COLORS
    add %ebx 6 ; offset for field 'LIGHT_GRAY'
    mov %eax 0
    lb %ebx %eax ; Load value of field 'LIGHT_GRAY'
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_MAIN_FG
    sb %ebx %eax
    mov %ebx __var_VGA_COLORS
    add %ebx 7 ; offset for field 'DARK_GRAY'
    mov %eax 0
    lb %ebx %eax ; Load value of field 'DARK_GRAY'
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_SELECT_BG
    sb %ebx %eax
    mov %ebx __var_VGA_COLORS
    add %ebx 15 ; offset for field 'WHITE'
    mov %eax 0
    lb %ebx %eax ; Load value of field 'WHITE'
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_SELECT_FG
    sb %ebx %eax
    mov %ebx __var_VGA_COLORS
    add %ebx 14 ; offset for field 'YELLOW'
    mov %eax 0
    lb %ebx %eax ; Load value of field 'YELLOW'
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_HIGHLIGHT_FG
    sb %ebx %eax
.L_match_end_437:
.L_ret_apply_color_theme:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

string_compare:
    psh %ebp
    mov %ebp %esp
.L_while_start_438:
    mov %ebx %ebp
    add %ebx 12
    ld %ebx %eax
    mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov %eax 0
    lb %ebx %eax ; Загружаем значение по адресу из %ebx
 psh %eax
    mov %ebx %ebp
    add %ebx 8
    ld %ebx %eax
    mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov %eax 0
    lb %ebx %eax ; Загружаем значение по адресу из %ebx
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_440
 mov %eax 0 ; False
 jmp .L_comp_end_440
.L_comp_true_440:
 mov %eax 1 ; True
.L_comp_end_440:
 cmp %eax 0
 je .L_while_end_438 ; Jump to end if condition is false
 ; --- while-body ---
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
 je .L_comp_true_443
 mov %eax 0 ; False
 jmp .L_comp_end_443
.L_comp_true_443:
 mov %eax 1 ; True
.L_comp_end_443:
        cmp %eax 0
        je .L_endif_441 ; Jump to end if condition is false
        ; --- if-body ---
    mov %eax 0
    jmp .L_ret_string_compare
        jmp .L_endif_441 ; End of if-body
.L_endif_441:
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
    mov %eax 1
 psh %eax
    mov %ebx %ebp
    add %ebx 12
    ld %ebx %eax
 pop %ebx
 add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    add %ebx 12
    sd %ebx %eax
 jmp .L_while_start_438
.L_while_end_438:
    mov %eax 1
    jmp .L_ret_string_compare
.L_ret_string_compare:
    mov %esp %ebp
    pop %ebp
    rts

string_copy:
    psh %ebp
    mov %ebp %esp
    sub %esp 4 ; Allocate space for ALL local variables
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 4
    sd %ebx %eax
.L_while_start_444:
    mov %eax 1
 cmp %eax 0
 je .L_while_end_444 ; Jump to end if condition is false
 ; --- while-body ---
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 1
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx %ebp
    add %ebx 12
    ld %ebx %eax
    mov %ebx %eax  ; %ebx = базовый адрес (значение указателя)
    add %ebx %e8   ; %ebx = base_address + offset
    ld %ebx %eax ; Load value from address
    psh %eax ; Save expression result
    mov %ebx %ebp
    sub %ebx 4
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
    pop %eax ; Восстанавливаем результат для записи
    sd %ebx %eax ; Записываем значение по адресу
    mov %eax 0
 psh %eax
    mov %ebx %ebp
    sub %ebx 4
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
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_447
 mov %eax 0 ; False
 jmp .L_comp_end_447
.L_comp_true_447:
 mov %eax 1 ; True
.L_comp_end_447:
        cmp %eax 0
        je .L_endif_445 ; Jump to end if condition is false
        ; --- if-body ---
    jmp .L_while_end_444
        jmp .L_endif_445 ; End of if-body
.L_endif_445:
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
 jmp .L_while_start_444
.L_while_end_444:
.L_ret_string_copy:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

memory_copy:
    psh %ebp
    mov %ebp %esp
    sub %esp 4 ; Allocate space for ALL local variables
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 4
    sd %ebx %eax
.L_while_start_448:
    mov %ebx %ebp
    add %ebx 16
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jne .L_comp_true_450
 mov %eax 0 ; False
 jmp .L_comp_end_450
.L_comp_true_450:
 mov %eax 1 ; True
.L_comp_end_450:
 cmp %eax 0
 je .L_while_end_448 ; Jump to end if condition is false
 ; --- while-body ---
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    psh %ebx       ; Сохраняем %ebx
    mov %ebx 1
    mul %eax %ebx  ; eax = offset
    mov %e8 %eax   ; Сохраняем offset в %e8
    pop %ebx       ; Восстанавливаем %ebx
    mov %ebx %ebp
    add %ebx 12
    ld %ebx %eax
    mov %ebx %eax  ; %ebx = базовый адрес (значение указателя)
    add %ebx %e8   ; %ebx = base_address + offset
    ld %ebx %eax ; Load value from address
    psh %eax ; Save expression result
    mov %ebx %ebp
    sub %ebx 4
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
    pop %eax ; Восстанавливаем результат для записи
    sd %ebx %eax ; Записываем значение по адресу
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
 jmp .L_while_start_448
.L_while_end_448:
.L_ret_memory_copy:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

; === Data Section ===
__var_VGA_COLORS: reserve 16 bytes
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
__var_is_exit: reserve 1 bytes
__var_current_view: reserve 1 bytes
__var_main_menu_selection: reserve 1 bytes
__var_boot_menu_selection: reserve 1 bytes
__var_settings_menu_selection: reserve 1 bytes
__var_theme_menu_selection: reserve 1 bytes
__var_default_boot_disk: reserve 4 bytes
__var_color_theme: reserve 4 bytes
__var_bios_password: reserve 17 bytes
__var_HEADER_BG: reserve 1 bytes
__var_HEADER_FG: reserve 1 bytes
__var_MAIN_BG: reserve 1 bytes
__var_MAIN_FG: reserve 1 bytes
__var_SELECT_BG: reserve 1 bytes
__var_SELECT_FG: reserve 1 bytes
__var_HIGHLIGHT_FG: reserve 1 bytes
__var_main_menu_items: reserve 20 bytes
__var_main_item_1: reserve 21 bytes
__str_init_global_0: bytes "Select Boot Device"  0
__var_main_item_2: reserve 21 bytes
__str_init_global_1: bytes "System Information"  0
__var_main_item_3: reserve 21 bytes
__str_init_global_2: bytes "Run RAM Check"  0
__var_main_item_4: reserve 21 bytes
__str_init_global_3: bytes "BIOS Settings"  0
__var_main_item_5: reserve 21 bytes
__str_init_global_4: bytes "Save & Exit"  0
__var_MAIN_MENU_COUNT: reserve 1 bytes
__var_settings_menu_items: reserve 12 bytes
__var_settings_item_1: reserve 21 bytes
__str_init_global_5: bytes "Change Color Theme"  0
__var_settings_item_2: reserve 21 bytes
__str_init_global_6: bytes "Set Supervisor Password"  0
__var_settings_item_3: reserve 21 bytes
__str_init_global_7: bytes "Return to Main Menu"  0
__var_SETTINGS_MENU_COUNT: reserve 1 bytes
__var_theme_menu_items: reserve 12 bytes
__var_theme_item_1: reserve 21 bytes
__str_init_global_8: bytes "Classic Blue"  0
__var_theme_item_2: reserve 21 bytes
__str_init_global_9: bytes "Hacker Green"  0
__var_theme_item_3: reserve 21 bytes
__str_init_global_10: bytes "Amber Monochrome"  0
__var_THEME_MENU_COUNT: reserve 1 bytes
__var_boot_menu_items: reserve 32 bytes
__var_bootable_disk_count: reserve 1 bytes
__var_bootable_disk_ids: reserve 32 bytes
__var_boot_menu_text_buffer: reserve 256 bytes
__var_SC: reserve 5 bytes
__var_VIEW_MAIN: reserve 1 bytes
__var_VIEW_BOOT: reserve 1 bytes
__var_VIEW_SYSINFO: reserve 1 bytes
__var_VIEW_RAMCHECK: reserve 1 bytes
__var_VIEW_SETTINGS: reserve 1 bytes
__var_VIEW_THEME: reserve 1 bytes
__var_VIEW_PASSWORD_SETUP: reserve 1 bytes
__var_float_0:
 bytes 0 0 0 0 ; Float value: 0.0
__var_float_1:
 bytes 0 0 128 63 ; Float value: 1.0
__var_float_2:
 bytes 0 80 195 71 ; Float value: 100000.0
__var_float_3:
 bytes 0 0 0 63 ; Float value: 0.5
__str_init_11: bytes "abcdefghijklmnopqrstuvwxyz1234567890" $0A $1B $7F $09 " -=[]" $5C "`';'`,./"  0
__str_init_12: bytes "ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%^&*()" $0A $1B $7F $09 " _+{}|~:" $5C $22 "~<>?"  0
__str_init_13: bytes $13 $E0 $E1 $E2 $E3 $E4 $E5 $E6 $E7 $E8 $E9 $EA $EB $14 $17 $12 $07 $C3 $C2 $FE $B4 $C1 $10 $11 $1F $1E  0
__str_init_14: bytes "abcdefghijklmnopqrstuvwxyz1234567890" $0A $1B $7F $09 " -=[]" $5C "`';'`,./"  0
__str_init_15: bytes "ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%^&*()" $0A $1B $7F $09 " _+{}|~:" $5C $22 "~<>?"  0
__str_init_16: bytes $13 $E0 $E1 $E2 $E3 $E4 $E5 $E6 $E7 $E8 $E9 $EA $EB $14 $17 $12 $07 $C3 $C2 $FE $B4 $C1 $10 $11 $1F $1E  0
__str_init_17: bytes "Press any key to exit from this program..." 0
__str_init_18: bytes "FATAL ERROR: No bootable device found or boot failed." $0A $0A 0
__str_init_19: bytes "GovnoCore32-20020 BIOS Setup Utility" 0
__str_init_20: bytes "Arrow Keys: Select | Enter: Confirm | ESC: Exit" 0
__str_init_21: bytes "   %s   " 0
__str_init_22: bytes "Boot Device Selection" 0
__str_init_23: bytes "Arrows: Select | Enter: Set Default | ESC: Back" 0
__str_init_24: bytes "Select a disk to boot from:" 0
__str_init_25: bytes "No bootable disks found." 0
__str_init_26: bytes "   %s   " 0
__str_init_27: bytes " <- Default" 0
__str_init_28: bytes "BIOS Settings" 0
__str_init_29: bytes "Enter: Select | ESC: Back" 0
__str_init_30: bytes "   %s   " 0
__str_init_31: bytes "Color Theme Selection" 0
__str_init_32: bytes "Arrows: Select | Enter: Apply | ESC: Back" 0
__str_init_33: bytes "   %s   " 0
__str_init_34: bytes " <- Current" 0
__str_init_35: bytes "System Information" 0
__str_init_36: bytes "Press any key to return..." 0
__str_init_37: bytes "System Information:" 0
__str_init_38: bytes "CPU Type                 : %s" 0
__str_init_39: bytes "CPU Speed                : 8.5 THz (Holy 2.0)" 0
__str_init_40: bytes "Total Memory             : %i MB" 0
__str_init_41: bytes "Bootable Drives Detected : %i" 0
__str_init_42: bytes "Set Supervisor Password" 0
__str_init_43: bytes "Enter: Confirm | ESC: Cancel" 0
__str_init_44: bytes "Enter New Password : " 0
__str_init_45: bytes "Confirm Password   : " 0
__str_init_46: bytes "Password has been set successfully!" 0
__str_init_47: bytes "Error: Passwords do not match." 0
__str_init_48: bytes "Press any key to continue..." 0
__str_init_49: bytes "Performing RAM check..." 0
__str_init_50: bytes "Checked: %i / %i MB " 0
__str_init_51: bytes "RAM check completed. ERRORS FOUND: %i" 0
__str_init_52: bytes "RAM check completed. OK. No errors found.         " 0
__str_init_53: bytes "Press any key to return..." 0
__str_init_54: bytes "\b \b" 0
__str_init_55: bytes "*" 0
__str_init_56: bytes "GovnoCore32-20020 BIOS v2.0" 0
__str_init_57: bytes "CPU: %s ... OK" 0
__str_init_58: bytes "RAM: %i MB ... OK" 0
__str_init_59: bytes "Drives: %i detected ... OK" 0
__str_init_60: bytes "Drives: 0 detected ... WARNING" 0
__str_init_61: bytes "Press ESC to enter Setup, booting in %i... " 0
__str_init_62: bytes "Disk %i: %i MB" 0
__str_init_63: bytes " " 0
__str_init_64: bytes "%s" 0
__str_init_65: bytes " " 0
__str_init_66: bytes " %s" 0
__str_init_67: bytes " " 0

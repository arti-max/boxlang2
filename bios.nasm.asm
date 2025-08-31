BITS 16
ORG 0x7C00

section .text
global _start

_start:

; Инициализация виртуальных регистров %e8-%e31
; Базовый адрес: 0x1000

    jmp _start



init_vga_colors:
    push bp
    mov bp, sp
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, __var_VGA_COLORS
; ERROR: Invalid stack instruction: pop %eax ; Restore expression result
; ERROR: Invalid memory instruction: sb %ebx %eax ; Store value into field 'BLACK'
    mov ax, 1
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov ax, 1
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, __var_VGA_COLORS
; ERROR: Invalid add instruction: add %ebx 4 ; offset for field 'RED'
; ERROR: Invalid stack instruction: pop %eax ; Restore expression result
; ERROR: Invalid memory instruction: sb %ebx %eax ; Store value into field 'RED'
    mov ax, 2
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov ax, 2
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, __var_VGA_COLORS
; ERROR: Invalid add instruction: add %ebx 2 ; offset for field 'GREEN'
; ERROR: Invalid stack instruction: pop %eax ; Restore expression result
; ERROR: Invalid memory instruction: sb %ebx %eax ; Store value into field 'GREEN'
    mov ax, 3
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov ax, 3
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, __var_VGA_COLORS
; ERROR: Invalid add instruction: add %ebx 5 ; offset for field 'BROWN'
; ERROR: Invalid stack instruction: pop %eax ; Restore expression result
; ERROR: Invalid memory instruction: sb %ebx %eax ; Store value into field 'BROWN'
    mov ax, 4
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov ax, 4
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, __var_VGA_COLORS
; ERROR: Invalid add instruction: add %ebx 1 ; offset for field 'BLUE'
; ERROR: Invalid stack instruction: pop %eax ; Restore expression result
; ERROR: Invalid memory instruction: sb %ebx %eax ; Store value into field 'BLUE'
    mov ax, 5
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov ax, 5
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, __var_VGA_COLORS
; ERROR: Invalid add instruction: add %ebx 12 ; offset for field 'MAGENTA'
; ERROR: Invalid stack instruction: pop %eax ; Restore expression result
; ERROR: Invalid memory instruction: sb %ebx %eax ; Store value into field 'MAGENTA'
    mov ax, 6
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov ax, 6
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, __var_VGA_COLORS
; ERROR: Invalid add instruction: add %ebx 3 ; offset for field 'CYAN'
; ERROR: Invalid stack instruction: pop %eax ; Restore expression result
; ERROR: Invalid memory instruction: sb %ebx %eax ; Store value into field 'CYAN'
    mov ax, 7
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov ax, 7
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, __var_VGA_COLORS
; ERROR: Invalid add instruction: add %ebx 6 ; offset for field 'LIGHT_GRAY'
; ERROR: Invalid stack instruction: pop %eax ; Restore expression result
; ERROR: Invalid memory instruction: sb %ebx %eax ; Store value into field 'LIGHT_GRAY'
    mov ax, 8
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov ax, 8
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, __var_VGA_COLORS
; ERROR: Invalid add instruction: add %ebx 7 ; offset for field 'DARK_GRAY'
; ERROR: Invalid stack instruction: pop %eax ; Restore expression result
; ERROR: Invalid memory instruction: sb %ebx %eax ; Store value into field 'DARK_GRAY'
    mov ax, 9
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov ax, 9
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, __var_VGA_COLORS
; ERROR: Invalid add instruction: add %ebx 11 ; offset for field 'LIGHT_RED'
; ERROR: Invalid stack instruction: pop %eax ; Restore expression result
; ERROR: Invalid memory instruction: sb %ebx %eax ; Store value into field 'LIGHT_RED'
    mov ax, 10
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov ax, 10
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, __var_VGA_COLORS
; ERROR: Invalid add instruction: add %ebx 9 ; offset for field 'LIGHT_GREEN'
; ERROR: Invalid stack instruction: pop %eax ; Restore expression result
; ERROR: Invalid memory instruction: sb %ebx %eax ; Store value into field 'LIGHT_GREEN'
    mov ax, 11
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov ax, 11
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, __var_VGA_COLORS
; ERROR: Invalid add instruction: add %ebx 14 ; offset for field 'YELLOW'
; ERROR: Invalid stack instruction: pop %eax ; Restore expression result
; ERROR: Invalid memory instruction: sb %ebx %eax ; Store value into field 'YELLOW'
    mov ax, 12
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov ax, 12
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, __var_VGA_COLORS
; ERROR: Invalid add instruction: add %ebx 8 ; offset for field 'LIGHT_BLUE'
; ERROR: Invalid stack instruction: pop %eax ; Restore expression result
; ERROR: Invalid memory instruction: sb %ebx %eax ; Store value into field 'LIGHT_BLUE'
    mov ax, 13
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov ax, 13
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, __var_VGA_COLORS
; ERROR: Invalid add instruction: add %ebx 13 ; offset for field 'PINK'
; ERROR: Invalid stack instruction: pop %eax ; Restore expression result
; ERROR: Invalid memory instruction: sb %ebx %eax ; Store value into field 'PINK'
    mov ax, 14
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov ax, 14
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, __var_VGA_COLORS
; ERROR: Invalid add instruction: add %ebx 10 ; offset for field 'LIGHT_CYAN'
; ERROR: Invalid stack instruction: pop %eax ; Restore expression result
; ERROR: Invalid memory instruction: sb %ebx %eax ; Store value into field 'LIGHT_CYAN'
    mov ax, 15
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov ax, 15
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, __var_VGA_COLORS
; ERROR: Invalid add instruction: add %ebx 15 ; offset for field 'WHITE'
; ERROR: Invalid stack instruction: pop %eax ; Restore expression result
; ERROR: Invalid memory instruction: sb %ebx %eax ; Store value into field 'WHITE'
.L_ret_init_vga_colors:
; ERROR: Invalid mov instruction: mov %eax 0 ; Default return value
    mov sp, bp
    pop bp
    ret

init_text_mode:
    push bp
    mov bp, sp
    mov ax, 2
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, __var_videomode_ptr
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; %ebx = адрес для записи
; ERROR: Invalid stack instruction: pop %eax ; %eax = значение для записи
; ERROR: Invalid memory instruction: sb %ebx %eax ; Записываем значение по разыменованному указателю
    mov ax, 5177344
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_text_ptr
    mov word bx, ax
    mov ax, 9600
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_buffer_length
    mov word bx, ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_cursor_x
    mov byte bx, ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_cursor_y
    mov byte bx, ax
    mov ax, 0
    push ax
    mov ax, 0
    push ax
    call set_cursor_pos
    add sp, 8
    call init_vga_colors
    call init_standard_colors
    mov bx, __var_VGA_COLORS
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'BLACK'
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var__current_background_color
    mov byte bx, ax
    mov bx, __var_VGA_COLORS
; ERROR: Invalid add instruction: add %ebx 15 ; offset for field 'WHITE'
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'WHITE'
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var__current_character_color
    mov byte bx, ax
.L_ret_init_text_mode:
; ERROR: Invalid mov instruction: mov %eax 0 ; Default return value
    mov sp, bp
    pop bp
    ret

init_text_mode_beta:
    push bp
    mov bp, sp
    mov ax, 3
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, __var_videomode_ptr
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; %ebx = адрес для записи
; ERROR: Invalid stack instruction: pop %eax ; %eax = значение для записи
; ERROR: Invalid memory instruction: sb %ebx %eax ; Записываем значение по разыменованному указателю
    mov ax, 5177344
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_text_ptr
    mov word bx, ax
    mov ax, 9600
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_buffer_length
    mov word bx, ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_cursor_x
    mov byte bx, ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_cursor_y
    mov byte bx, ax
    mov ax, 0
    push ax
    mov ax, 0
    push ax
    call set_cursor_pos
    add sp, 8
    call init_vga_colors
    call init_standard_colors
    mov bx, __var_VGA_COLORS
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'BLACK'
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var__current_background_color
    mov byte bx, ax
    mov bx, __var_VGA_COLORS
; ERROR: Invalid add instruction: add %ebx 15 ; offset for field 'WHITE'
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'WHITE'
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var__current_character_color
    mov byte bx, ax
.L_ret_init_text_mode_beta:
; ERROR: Invalid mov instruction: mov %eax 0 ; Default return value
    mov sp, bp
    pop bp
    ret

set_auto_flush:
    push bp
    mov bp, sp
    mov bx, bp
    add bx, 8
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_auto_flush
    mov byte bx, ax
.L_ret_set_auto_flush:
; ERROR: Invalid mov instruction: mov %eax 0 ; Default return value
    mov sp, bp
    pop bp
    ret

init_cga_mode:
    push bp
    mov bp, sp
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, __var_videomode_ptr
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; %ebx = адрес для записи
; ERROR: Invalid stack instruction: pop %eax ; %eax = значение для записи
; ERROR: Invalid memory instruction: sb %ebx %eax ; Записываем значение по разыменованному указателю
    mov ax, 307200
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_buffer_length
    mov word bx, ax
.L_ret_init_cga_mode:
; ERROR: Invalid mov instruction: mov %eax 0 ; Default return value
    mov sp, bp
    pop bp
    ret

init_graphics_mode:
    push bp
    mov bp, sp
    mov ax, 1
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, __var_videomode_ptr
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; %ebx = адрес для записи
; ERROR: Invalid stack instruction: pop %eax ; %eax = значение для записи
; ERROR: Invalid memory instruction: sb %ebx %eax ; Записываем значение по разыменованному указателю
    mov ax, 307200
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_buffer_length
    mov word bx, ax
.L_ret_init_graphics_mode:
; ERROR: Invalid mov instruction: mov %eax 0 ; Default return value
    mov sp, bp
    pop bp
    ret

init_standard_colors:
    push bp
    mov bp, sp
; ERROR: Invalid sub instruction: sub %esp 4 ; Allocate space for ALL local variables
    mov ax, 4849664
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, bp
    sub bx, 4
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; %ebx = адрес для записи
; ERROR: Invalid stack instruction: pop %eax ; %eax = значение для записи
; ERROR: Invalid memory instruction: sw %ebx %eax ; Записываем значение по разыменованному указателю
    mov ax, 2
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
    mov ax, 21504
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, bp
    sub bx, 4
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; %ebx = адрес для записи
; ERROR: Invalid stack instruction: pop %eax ; %eax = значение для записи
; ERROR: Invalid memory instruction: sw %ebx %eax ; Записываем значение по разыменованному указателю
    mov ax, 2
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
    mov ax, 672
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, bp
    sub bx, 4
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; %ebx = адрес для записи
; ERROR: Invalid stack instruction: pop %eax ; %eax = значение для записи
; ERROR: Invalid memory instruction: sw %ebx %eax ; Записываем значение по разыменованному указателю
    mov ax, 2
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
    mov ax, 22176
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, bp
    sub bx, 4
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; %ebx = адрес для записи
; ERROR: Invalid stack instruction: pop %eax ; %eax = значение для записи
; ERROR: Invalid memory instruction: sw %ebx %eax ; Записываем значение по разыменованному указателю
    mov ax, 2
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
    mov ax, 21
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, bp
    sub bx, 4
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; %ebx = адрес для записи
; ERROR: Invalid stack instruction: pop %eax ; %eax = значение для записи
; ERROR: Invalid memory instruction: sw %ebx %eax ; Записываем значение по разыменованному указателю
    mov ax, 2
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
    mov ax, 21525
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, bp
    sub bx, 4
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; %ebx = адрес для записи
; ERROR: Invalid stack instruction: pop %eax ; %eax = значение для записи
; ERROR: Invalid memory instruction: sw %ebx %eax ; Записываем значение по разыменованному указателю
    mov ax, 2
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
    mov ax, 693
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, bp
    sub bx, 4
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; %ebx = адрес для записи
; ERROR: Invalid stack instruction: pop %eax ; %eax = значение для записи
; ERROR: Invalid memory instruction: sw %ebx %eax ; Записываем значение по разыменованному указателю
    mov ax, 2
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
    mov ax, 22197
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, bp
    sub bx, 4
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; %ebx = адрес для записи
; ERROR: Invalid stack instruction: pop %eax ; %eax = значение для записи
; ERROR: Invalid memory instruction: sw %ebx %eax ; Записываем значение по разыменованному указателю
    mov ax, 2
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
    mov ax, 10570
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, bp
    sub bx, 4
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; %ebx = адрес для записи
; ERROR: Invalid stack instruction: pop %eax ; %eax = значение для записи
; ERROR: Invalid memory instruction: sw %ebx %eax ; Записываем значение по разыменованному указателю
    mov ax, 2
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
    mov ax, 32074
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, bp
    sub bx, 4
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; %ebx = адрес для записи
; ERROR: Invalid stack instruction: pop %eax ; %eax = значение для записи
; ERROR: Invalid memory instruction: sw %ebx %eax ; Записываем значение по разыменованному указателю
    mov ax, 2
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
    mov ax, 11242
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, bp
    sub bx, 4
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; %ebx = адрес для записи
; ERROR: Invalid stack instruction: pop %eax ; %eax = значение для записи
; ERROR: Invalid memory instruction: sw %ebx %eax ; Записываем значение по разыменованному указателю
    mov ax, 2
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
    mov ax, 32746
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, bp
    sub bx, 4
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; %ebx = адрес для записи
; ERROR: Invalid stack instruction: pop %eax ; %eax = значение для записи
; ERROR: Invalid memory instruction: sw %ebx %eax ; Записываем значение по разыменованному указателю
    mov ax, 2
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
    mov ax, 10591
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, bp
    sub bx, 4
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; %ebx = адрес для записи
; ERROR: Invalid stack instruction: pop %eax ; %eax = значение для записи
; ERROR: Invalid memory instruction: sw %ebx %eax ; Записываем значение по разыменованному указателю
    mov ax, 2
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
    mov ax, 32095
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, bp
    sub bx, 4
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; %ebx = адрес для записи
; ERROR: Invalid stack instruction: pop %eax ; %eax = значение для записи
; ERROR: Invalid memory instruction: sw %ebx %eax ; Записываем значение по разыменованному указателю
    mov ax, 2
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
    mov ax, 11263
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, bp
    sub bx, 4
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; %ebx = адрес для записи
; ERROR: Invalid stack instruction: pop %eax ; %eax = значение для записи
; ERROR: Invalid memory instruction: sw %ebx %eax ; Записываем значение по разыменованному указателю
    mov ax, 2
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
    mov ax, 32767
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, bp
    sub bx, 4
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; %ebx = адрес для записи
; ERROR: Invalid stack instruction: pop %eax ; %eax = значение для записи
; ERROR: Invalid memory instruction: sw %ebx %eax ; Записываем значение по разыменованному указателю
.L_ret_init_standard_colors:
; ERROR: Invalid mov instruction: mov %eax 0 ; Default return value
    mov sp, bp
    pop bp
    ret

screen_flush:
    push bp
    mov bp, sp
    int 11
.L_ret_screen_flush:
; ERROR: Invalid mov instruction: mov %eax 0 ; Default return value
    mov sp, bp
    pop bp
    ret

clear_screen:
    push bp
    mov bp, sp
; ERROR: Invalid sub instruction: sub %esp 8 ; Allocate space for ALL local variables
    mov ax, 2
    push ax
    mov bx, __var_videomode_ptr
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Загружаем значение по адресу из %ebx
    pop bx
    cmp ax, bx
    je .L_comp_true_13
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_13
.L_comp_true_13:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_13:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_endif_11 ; Jump to end if condition is false
; --- if-body ---
    mov ax, 5177344
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_text_ptr
    mov word bx, ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 8
    mov word bx, ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 8
    mov word bx, ax
.L_for_start_14:
    mov bx, __var_buffer_length
    mov bx, word ax
    push ax
    mov bx, bp
    sub bx, 8
    mov bx, word ax
    pop bx
    cmp ax, bx
    jl .L_comp_true_16
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_16
.L_comp_true_16:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_16:
    cmp ax, 0
    je .L_for_end_14
    mov ax, 32
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, __var_text_ptr
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; %ebx = адрес для записи
; ERROR: Invalid stack instruction: pop %eax ; %eax = значение для записи
; ERROR: Invalid memory instruction: sb %ebx %eax ; Записываем значение по разыменованному указателю
    mov ax, 1
    push ax
    mov bx, __var_text_ptr
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_text_ptr
    mov word bx, ax
    mov ax, 4
    push ax
    mov bx, __var__current_background_color
    mov ax, 0
    mov bx, byte ax
    pop bx
    mov bx, __var__current_background_color
    mov ax, 0
    mov bx, byte ax
    ; TODO: Convert sal %eax 4
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, __var_text_ptr
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; %ebx = адрес для записи
; ERROR: Invalid stack instruction: pop %eax ; %eax = значение для записи
; ERROR: Invalid memory instruction: sb %ebx %eax ; Записываем значение по разыменованному указателю
    mov ax, 1
    push ax
    mov bx, __var_text_ptr
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_text_ptr
    mov word bx, ax
.L_for_inc_14:
    mov ax, 2
    push ax
    mov bx, bp
    sub bx, 8
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 8
    mov word bx, ax
    jmp .L_for_start_14
.L_for_end_14:
    mov ax, 1
    push ax
    mov bx, __var_auto_flush
    mov ax, 0
    mov bx, byte ax
    pop bx
    cmp ax, bx
    je .L_comp_true_19
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_19
.L_comp_true_19:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_19:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_endif_17 ; Jump to end if condition is false
; --- if-body ---
    call screen_flush
; ERROR: Invalid jump instruction: jmp .L_endif_17 ; End of if-body
.L_endif_17:
    mov ax, 5177344
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_text_ptr
    mov word bx, ax
; ERROR: Invalid jump instruction: jmp .L_endif_11 ; End of if-body
.L_endif_11:
.L_ret_clear_screen:
; ERROR: Invalid mov instruction: mov %eax 0 ; Default return value
    mov sp, bp
    pop bp
    ret

get_cursor_address:
    push bp
    mov bp, sp
; ERROR: Invalid sub instruction: sub %esp 12 ; Allocate space for ALL local variables
    mov bx, bp
    add bx, 8
    mov ax, 0
    mov bx, byte ax
    push ax
    mov bx, __var_text_screen_width
    mov ax, 0
    mov bx, byte ax
    push ax
    mov bx, bp
    add bx, 12
    mov ax, 0
    mov bx, byte ax
    pop bx
    ; TODO: Convert mul %eax %ebx
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
    mov ax, 2
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    pop bx
    ; TODO: Convert mul %eax %ebx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 8
    mov word bx, ax
    mov bx, bp
    sub bx, 8
    mov bx, word ax
    push ax
    mov ax, 5177344
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 12
    mov word bx, ax
    mov bx, bp
    sub bx, 12
    mov bx, word ax
    jmp .L_ret_get_cursor_address
.L_ret_get_cursor_address:
    mov sp, bp
    pop bp
    ret

set_cursor_pos:
    push bp
    mov bp, sp
; ERROR: Invalid sub instruction: sub %esp 4 ; Allocate space for ALL local variables
    mov bx, bp
    add bx, 8
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_cursor_x
    mov byte bx, ax
    mov bx, bp
    add bx, 12
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_cursor_y
    mov byte bx, ax
    mov bx, bp
    add bx, 12
    mov ax, 0
    mov bx, byte ax
    push ax
    mov bx, bp
    add bx, 8
    mov ax, 0
    mov bx, byte ax
    push ax
    call get_cursor_address
    add sp, 8
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_text_ptr
    mov word bx, ax
.L_ret_set_cursor_pos:
; ERROR: Invalid mov instruction: mov %eax 0 ; Default return value
    mov sp, bp
    pop bp
    ret

get_cursor_x:
    push bp
    mov bp, sp
    mov bx, __var_cursor_x
    mov ax, 0
    mov bx, byte ax
    jmp .L_ret_get_cursor_x
.L_ret_get_cursor_x:
    mov sp, bp
    pop bp
    ret

get_cursor_y:
    push bp
    mov bp, sp
    mov bx, __var_cursor_y
    mov ax, 0
    mov bx, byte ax
    jmp .L_ret_get_cursor_y
.L_ret_get_cursor_y:
    mov sp, bp
    pop bp
    ret

update_cursor:
    push bp
    mov bp, sp
    mov bx, __var_text_screen_width
    mov ax, 0
    mov bx, byte ax
    push ax
    mov bx, __var_cursor_x
    mov ax, 0
    mov bx, byte ax
    pop bx
    cmp ax, bx
    jg .L_comp_true_22
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_22
.L_comp_true_22:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_22:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_endif_20 ; Jump to end if condition is false
; --- if-body ---
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_cursor_x
    mov byte bx, ax
    mov ax, 1
    push ax
    mov bx, __var_cursor_y
    mov ax, 0
    mov bx, byte ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_cursor_y
    mov byte bx, ax
; ERROR: Invalid jump instruction: jmp .L_endif_20 ; End of if-body
.L_endif_20:
    mov bx, __var_text_screen_height
    mov ax, 0
    mov bx, byte ax
    push ax
    mov bx, __var_cursor_y
    mov ax, 0
    mov bx, byte ax
    pop bx
    cmp ax, bx
    jg .L_comp_true_25
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_25
.L_comp_true_25:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_25:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_endif_23 ; Jump to end if condition is false
; --- if-body ---
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_cursor_y
    mov byte bx, ax
; ERROR: Invalid jump instruction: jmp .L_endif_23 ; End of if-body
.L_endif_23:
    mov bx, __var_cursor_y
    mov ax, 0
    mov bx, byte ax
    push ax
    mov bx, __var_cursor_x
    mov ax, 0
    mov bx, byte ax
    push ax
    call set_cursor_pos
    add sp, 8
.L_ret_update_cursor:
; ERROR: Invalid mov instruction: mov %eax 0 ; Default return value
    mov sp, bp
    pop bp
    ret

print_newline:
    push bp
    mov bp, sp
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_cursor_x
    mov byte bx, ax
    mov ax, 1
    push ax
    mov bx, __var_cursor_y
    mov ax, 0
    mov bx, byte ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_cursor_y
    mov byte bx, ax
    call update_cursor
.L_ret_print_newline:
; ERROR: Invalid mov instruction: mov %eax 0 ; Default return value
    mov sp, bp
    pop bp
    ret

set_character_color:
    push bp
    mov bp, sp
    mov bx, bp
    add bx, 8
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var__current_character_color
    mov byte bx, ax
.L_ret_set_character_color:
; ERROR: Invalid mov instruction: mov %eax 0 ; Default return value
    mov sp, bp
    pop bp
    ret

set_background_color:
    push bp
    mov bp, sp
    mov bx, bp
    add bx, 8
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var__current_background_color
    mov byte bx, ax
.L_ret_set_background_color:
; ERROR: Invalid mov instruction: mov %eax 0 ; Default return value
    mov sp, bp
    pop bp
    ret

combine_colors:
    push bp
    mov bp, sp
    mov bx, __var__current_character_color
    mov ax, 0
    mov bx, byte ax
    push ax
    mov ax, 4
    push ax
    mov bx, __var__current_background_color
    mov ax, 0
    mov bx, byte ax
    pop bx
    mov bx, __var__current_background_color
    mov ax, 0
    mov bx, byte ax
    ; TODO: Convert sal %eax 4
    pop bx
    add ax, bx
    jmp .L_ret_combine_colors
.L_ret_combine_colors:
    mov sp, bp
    pop bp
    ret

print_char:
    push bp
    mov bp, sp
    mov ax, 10
    push ax
    mov bx, bp
    add bx, 8
    mov ax, 0
    mov bx, byte ax
    pop bx
    cmp ax, bx
    je .L_comp_true_28
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_28
.L_comp_true_28:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_28:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_else_26 ; Jump to else if condition is false
; --- if-body ---
    call print_newline
; ERROR: Invalid jump instruction: jmp .L_endif_26 ; End of if-body
.L_else_26:
; --- else-body ---
    mov bx, bp
    add bx, 8
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, __var_text_ptr
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; %ebx = адрес для записи
; ERROR: Invalid stack instruction: pop %eax ; %eax = значение для записи
; ERROR: Invalid memory instruction: sb %ebx %eax ; Записываем значение по разыменованному указателю
    mov ax, 1
    push ax
    mov bx, __var_text_ptr
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_text_ptr
    mov word bx, ax
    call combine_colors
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, __var_text_ptr
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; %ebx = адрес для записи
; ERROR: Invalid stack instruction: pop %eax ; %eax = значение для записи
; ERROR: Invalid memory instruction: sb %ebx %eax ; Записываем значение по разыменованному указателю
    mov ax, 1
    push ax
    mov bx, __var_text_ptr
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_text_ptr
    mov word bx, ax
    mov ax, 1
    push ax
    mov bx, __var_cursor_x
    mov ax, 0
    mov bx, byte ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_cursor_x
    mov byte bx, ax
    call update_cursor
.L_endif_26:
    mov ax, 1
    push ax
    mov bx, __var_auto_flush
    mov ax, 0
    mov bx, byte ax
    pop bx
    cmp ax, bx
    je .L_comp_true_31
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_31
.L_comp_true_31:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_31:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_endif_29 ; Jump to end if condition is false
; --- if-body ---
    call screen_flush
; ERROR: Invalid jump instruction: jmp .L_endif_29 ; End of if-body
.L_endif_29:
.L_ret_print_char:
; ERROR: Invalid mov instruction: mov %eax 0 ; Default return value
    mov sp, bp
    pop bp
    ret

print:
    push bp
    mov bp, sp
.L_while_start_32:
    mov ax, 0
    push ax
    mov bx, bp
    add bx, 8
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Загружаем значение по адресу из %ebx
    pop bx
    cmp ax, bx
    jne .L_comp_true_34
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_34
.L_comp_true_34:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_34:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_while_end_32 ; Jump to end if condition is false
; --- while-body ---
    mov bx, bp
    add bx, 8
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Загружаем значение по адресу из %ebx
    push ax
    call print_char
    add sp, 4
    mov ax, 1
    push ax
    mov bx, bp
    add bx, 8
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    add bx, 8
    mov word bx, ax
    jmp .L_while_start_32
.L_while_end_32:
.L_ret_print:
; ERROR: Invalid mov instruction: mov %eax 0 ; Default return value
    mov sp, bp
    pop bp
    ret

print_num:
    push bp
    mov bp, sp
; ERROR: Invalid sub instruction: sub %esp 263 ; Allocate space for ALL local variables
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 258
    mov word bx, ax
    mov ax, 0
    push ax
    mov bx, bp
    add bx, 8
    mov bx, word ax
    pop bx
    cmp ax, bx
    je .L_comp_true_37
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_37
.L_comp_true_37:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_37:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_endif_35 ; Jump to end if condition is false
; --- if-body ---
    mov ax, 48
    push ax
    call print_char
    add sp, 4
    mov ax, 0
    jmp .L_ret_print_num
; ERROR: Invalid jump instruction: jmp .L_endif_35 ; End of if-body
.L_endif_35:
    mov ax, 0
    push ax
    mov bx, bp
    add bx, 8
    mov bx, word ax
    pop bx
    cmp ax, bx
    jl .L_comp_true_40
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_40
.L_comp_true_40:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_40:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_endif_38 ; Jump to end if condition is false
; --- if-body ---
    mov ax, 45
    push ax
    call print_char
    add sp, 4
    mov ax, 1
    ; TODO: Convert not %eax
    ; TODO: Convert inx %eax
    push ax
    mov bx, bp
    add bx, 8
    mov bx, word ax
    pop bx
    ; TODO: Convert mul %eax %ebx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    add bx, 8
    mov word bx, ax
; ERROR: Invalid jump instruction: jmp .L_endif_38 ; End of if-body
.L_endif_38:
.L_while_start_41:
    mov ax, 0
    push ax
    mov bx, bp
    add bx, 8
    mov bx, word ax
    pop bx
    cmp ax, bx
    jne .L_comp_true_43
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_43
.L_comp_true_43:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_43:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_while_end_41 ; Jump to end if condition is false
; --- while-body ---
    mov ax, 10
    push ax
    mov bx, bp
    add bx, 8
    mov bx, word ax
    pop bx
    ; TODO: Convert div %eax %ebx
; ERROR: Invalid mov instruction: mov %eax %edx ; Remainder is in EDX
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 262
    mov word bx, ax
    mov ax, 48
    push ax
    mov bx, bp
    sub bx, 262
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 263
    mov byte bx, ax
    mov ax, 10
    push ax
    mov bx, bp
    add bx, 8
    mov bx, word ax
    pop bx
    ; TODO: Convert div %eax %ebx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    add bx, 8
    mov word bx, ax
    mov bx, bp
    sub bx, 263
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, bp
    sub bx, 258
    mov ax, 0
    mov bx, word ax
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 1
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, bp
    sub bx, 256
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
; ERROR: Invalid memory instruction: sb %ebx %eax ; Записываем значение по адресу
    mov ax, 1
    push ax
    mov bx, bp
    sub bx, 258
    mov ax, 0
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 258
    mov word bx, ax
    jmp .L_while_start_41
.L_while_end_41:
.L_while_start_44:
    mov ax, 0
    push ax
    mov bx, bp
    sub bx, 258
    mov ax, 0
    mov bx, word ax
    pop bx
    cmp ax, bx
    jne .L_comp_true_46
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_46
.L_comp_true_46:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_46:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_while_end_44 ; Jump to end if condition is false
; --- while-body ---
    mov ax, 1
    push ax
    mov bx, bp
    sub bx, 258
    mov ax, 0
    mov bx, word ax
    pop bx
    ; TODO: Convert not %ebx
    ; TODO: Convert inx %ebx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 258
    mov word bx, ax
    mov bx, bp
    sub bx, 258
    mov ax, 0
    mov bx, word ax
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 1
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, bp
    sub bx, 256
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value from address
    push ax
    call print_char
    add sp, 4
    jmp .L_while_start_44
.L_while_end_44:
.L_ret_print_num:
; ERROR: Invalid mov instruction: mov %eax 0 ; Default return value
    mov sp, bp
    pop bp
    ret

print_float:
    push bp
    mov bp, sp
; ERROR: Invalid sub instruction: sub %esp 12 ; Allocate space for ALL local variables
    mov bx, __var_float_0
    mov bx, word ax
    push ax
    mov bx, bp
    add bx, 8
    mov bx, word ax
    pop bx
    ; TODO: Convert subf32 %eax %ebx ; Emulate float comparison
    ; TODO: Convert and %eax $80000000
    cmp ax, 80000000
    je __comp_true_48
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp __comp_end_48
__comp_true_48:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
__comp_end_48:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_endif_47 ; Jump to end if condition is false
; --- if-body ---
    mov ax, 45
    push ax
    call print_char
    add sp, 4
    mov bx, __var_float_1
    mov bx, word ax
    ; TODO: Convert negf32 %eax ; Negate float value by flipping the sign bit
    push ax
    mov bx, bp
    add bx, 8
    mov bx, word ax
    pop bx
    ; TODO: Convert mulf32 %eax %ebx ; Float operation
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    add bx, 8
    mov word bx, ax
; ERROR: Invalid jump instruction: jmp .L_endif_47 ; End of if-body
.L_endif_47:
    mov bx, bp
    add bx, 8
    mov bx, word ax
    ; TODO: Convert cfi %eax ; Convert float in EAX to integer
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    push ax
    call print_num
    add sp, 4
    mov ax, 46
    push ax
    call print_char
    add sp, 4
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    ; TODO: Convert cif %eax ; Convert integer in EAX to float
    push ax
    mov bx, bp
    add bx, 8
    mov bx, word ax
    pop bx
    ; TODO: Convert subf32 %eax %ebx ; Float operation
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 8
    mov word bx, ax
    mov bx, __var_float_2
    mov bx, word ax
    push ax
    mov bx, bp
    sub bx, 8
    mov bx, word ax
    pop bx
    ; TODO: Convert mulf32 %eax %ebx ; Float operation
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 8
    mov word bx, ax
    mov bx, __var_float_3
    mov bx, word ax
    push ax
    mov bx, bp
    sub bx, 8
    mov bx, word ax
    pop bx
    ; TODO: Convert addf32 %eax %ebx ; Float operation
    ; TODO: Convert cfi %eax ; Convert float in EAX to integer
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 12
    mov word bx, ax
    mov bx, bp
    sub bx, 12
    mov bx, word ax
    push ax
    call print_num
    add sp, 4
.L_ret_print_float:
; ERROR: Invalid mov instruction: mov %eax 0 ; Default return value
    mov sp, bp
    pop bp
    ret

exit:
    push bp
    mov bp, sp
    hlt
.L_ret_exit:
; ERROR: Invalid mov instruction: mov %eax 0 ; Default return value
    mov sp, bp
    pop bp
    ret

trapf:
    push bp
    mov bp, sp
    ; TODO: Convert trap
.L_ret_trapf:
; ERROR: Invalid mov instruction: mov %eax 0 ; Default return value
    mov sp, bp
    pop bp
    ret

rand:
    push bp
    mov bp, sp
; ERROR: Invalid sub instruction: sub %esp 4 ; Allocate space for ALL local variables
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
    int 21
    mov ax, bp
    sub ax, 4
    mov word [4104], ax
    mov word [4104], dx
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    jmp .L_ret_rand
.L_ret_rand:
    mov sp, bp
    pop bp
    ret

randrange:
    push bp
    mov bp, sp
; ERROR: Invalid sub instruction: sub %esp 4 ; Allocate space for ALL local variables
    call rand
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
    mov bx, bp
    add bx, 8
    mov bx, word ax
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    pop bx
    ; TODO: Convert div %eax %ebx
; ERROR: Invalid mov instruction: mov %eax %edx ; Remainder is in EDX
    jmp .L_ret_randrange
.L_ret_randrange:
    mov sp, bp
    pop bp
    ret

sum_n32:
    push bp
    mov bp, sp
; ERROR: Invalid sub instruction: sub %esp 8 ; Allocate space for ALL local variables
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 8
    mov word bx, ax
.L_for_start_49:
    mov bx, bp
    add bx, 12
    mov bx, word ax
    push ax
    mov bx, bp
    sub bx, 8
    mov bx, word ax
    pop bx
    cmp ax, bx
    jl .L_comp_true_51
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_51
.L_comp_true_51:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_51:
    cmp ax, 0
    je .L_for_end_49
    mov bx, bp
    sub bx, 8
    mov bx, word ax
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 4
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, bp
    add bx, 8
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; %ebx = базовый адрес (значение указателя)
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
; ERROR: Invalid memory instruction: ld %ebx %eax ; Load value from address
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
.L_for_inc_49:
    mov ax, 1
    push ax
    mov bx, bp
    sub bx, 8
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 8
    mov word bx, ax
    jmp .L_for_start_49
.L_for_end_49:
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    jmp .L_ret_sum_n32
.L_ret_sum_n32:
    mov sp, bp
    pop bp
    ret

sum_n16:
    push bp
    mov bp, sp
; ERROR: Invalid sub instruction: sub %esp 8 ; Allocate space for ALL local variables
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 8
    mov word bx, ax
.L_for_start_52:
    mov bx, bp
    add bx, 12
    mov bx, word ax
    push ax
    mov bx, bp
    sub bx, 8
    mov bx, word ax
    pop bx
    cmp ax, bx
    jl .L_comp_true_54
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_54
.L_comp_true_54:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_54:
    cmp ax, 0
    je .L_for_end_52
    mov bx, bp
    sub bx, 8
    mov bx, word ax
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 2
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, bp
    add bx, 8
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; %ebx = базовый адрес (значение указателя)
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
; ERROR: Invalid memory instruction: ld %ebx %eax ; Load value from address
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
.L_for_inc_52:
    mov ax, 1
    push ax
    mov bx, bp
    sub bx, 8
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 8
    mov word bx, ax
    jmp .L_for_start_52
.L_for_end_52:
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    jmp .L_ret_sum_n16
.L_ret_sum_n16:
    mov sp, bp
    pop bp
    ret

sum_char:
    push bp
    mov bp, sp
; ERROR: Invalid sub instruction: sub %esp 8 ; Allocate space for ALL local variables
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 8
    mov word bx, ax
.L_for_start_55:
    mov bx, bp
    add bx, 12
    mov bx, word ax
    push ax
    mov bx, bp
    sub bx, 8
    mov bx, word ax
    pop bx
    cmp ax, bx
    jl .L_comp_true_57
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_57
.L_comp_true_57:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_57:
    cmp ax, 0
    je .L_for_end_55
    mov bx, bp
    sub bx, 8
    mov bx, word ax
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 1
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, bp
    add bx, 8
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; %ebx = базовый адрес (значение указателя)
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
; ERROR: Invalid memory instruction: ld %ebx %eax ; Load value from address
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
.L_for_inc_55:
    mov ax, 1
    push ax
    mov bx, bp
    sub bx, 8
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 8
    mov word bx, ax
    jmp .L_for_start_55
.L_for_end_55:
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    jmp .L_ret_sum_char
.L_ret_sum_char:
    mov sp, bp
    pop bp
    ret

printf:
    push bp
    mov bp, sp
; ERROR: Invalid sub instruction: sub %esp 21 ; Allocate space for ALL local variables
    mov bx, bp
    add bx, 8
    mov bx, word ax
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
    mov ax, 4
    push ax
    mov ax, bp
    add ax, 8
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 8
    mov word bx, ax
.L_while_start_58:
    mov ax, 0
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Загружаем значение по адресу из %ebx
    pop bx
    cmp ax, bx
    jne .L_comp_true_60
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_60
.L_comp_true_60:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_60:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_while_end_58 ; Jump to end if condition is false
; --- while-body ---
    mov ax, 37
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Загружаем значение по адресу из %ebx
    pop bx
    cmp ax, bx
    je .L_comp_true_63
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_63
.L_comp_true_63:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_63:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_else_61 ; Jump to else if condition is false
; --- if-body ---
    mov ax, 1
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
    mov ax, 105
; ERROR: Invalid stack instruction: psh %eax ; Save case value
    mov bx, bp
    sub bx, 4
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Загружаем значение по адресу из %ebx
; ERROR: Invalid mov instruction: mov %ebx %eax ; Move match expression value to EBX for comparison
; ERROR: Invalid stack instruction: pop %eax ; Restore case value to EAX for comparison
    cmp ax, bx
    je .L_block_body_65_0
    mov ax, 115
; ERROR: Invalid stack instruction: psh %eax ; Save case value
    mov bx, bp
    sub bx, 4
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Загружаем значение по адресу из %ebx
; ERROR: Invalid mov instruction: mov %ebx %eax ; Move match expression value to EBX for comparison
; ERROR: Invalid stack instruction: pop %eax ; Restore case value to EAX for comparison
    cmp ax, bx
    je .L_block_body_65_1
    mov ax, 99
; ERROR: Invalid stack instruction: psh %eax ; Save case value
    mov bx, bp
    sub bx, 4
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Загружаем значение по адресу из %ebx
; ERROR: Invalid mov instruction: mov %ebx %eax ; Move match expression value to EBX for comparison
; ERROR: Invalid stack instruction: pop %eax ; Restore case value to EAX for comparison
    cmp ax, bx
    je .L_block_body_65_2
    mov ax, 102
; ERROR: Invalid stack instruction: psh %eax ; Save case value
    mov bx, bp
    sub bx, 4
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Загружаем значение по адресу из %ebx
; ERROR: Invalid mov instruction: mov %ebx %eax ; Move match expression value to EBX for comparison
; ERROR: Invalid stack instruction: pop %eax ; Restore case value to EAX for comparison
    cmp ax, bx
    je .L_block_body_65_3
    jmp .L_block_body_65_4
.L_block_body_65_0:
    mov bx, bp
    sub bx, 8
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; EBX теперь хранит адрес для чтения
; ERROR: Invalid memory instruction: ld %ebx %eax ; Загружаем значение по адресу из %ebx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 12
    mov word bx, ax
    mov bx, bp
    sub bx, 12
    mov bx, word ax
    push ax
    call print_num
    add sp, 4
    mov ax, 4
    push ax
    mov bx, bp
    sub bx, 8
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 8
    mov word bx, ax
    jmp .L_match_end_64
.L_block_body_65_1:
    mov bx, bp
    sub bx, 8
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; EBX теперь хранит адрес для чтения
; ERROR: Invalid memory instruction: ld %ebx %eax ; Загружаем значение по адресу из %ebx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 16
    mov word bx, ax
    mov bx, bp
    sub bx, 16
    mov bx, word ax
    push ax
    call print
    add sp, 4
    mov ax, 4
    push ax
    mov bx, bp
    sub bx, 8
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 8
    mov word bx, ax
    jmp .L_match_end_64
.L_block_body_65_2:
    mov bx, bp
    sub bx, 8
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; EBX теперь хранит адрес для чтения
; ERROR: Invalid memory instruction: ld %ebx %eax ; Загружаем значение по адресу из %ebx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 17
    mov byte bx, ax
    mov bx, bp
    sub bx, 17
    mov ax, 0
    mov bx, byte ax
    push ax
    call print_char
    add sp, 4
    mov ax, 4
    push ax
    mov bx, bp
    sub bx, 8
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 8
    mov word bx, ax
    jmp .L_match_end_64
.L_block_body_65_3:
    mov bx, bp
    sub bx, 8
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; EBX теперь хранит адрес для чтения
; ERROR: Invalid memory instruction: ld %ebx %eax ; Загружаем значение по адресу из %ebx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 21
    mov word bx, ax
    mov bx, bp
    sub bx, 21
    mov bx, word ax
    push ax
    call print_float
    add sp, 4
    mov ax, 4
    push ax
    mov bx, bp
    sub bx, 8
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 8
    mov word bx, ax
    jmp .L_match_end_64
.L_block_body_65_4:
    mov ax, 37
    push ax
    call print_char
    add sp, 4
    mov bx, bp
    sub bx, 4
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Загружаем значение по адресу из %ebx
    push ax
    call print_char
    add sp, 4
.L_match_end_64:
; ERROR: Invalid jump instruction: jmp .L_endif_61 ; End of if-body
.L_else_61:
; --- else-body ---
    mov bx, bp
    sub bx, 4
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Загружаем значение по адресу из %ebx
    push ax
    call print_char
    add sp, 4
.L_endif_61:
    mov ax, 1
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
    jmp .L_while_start_58
.L_while_end_58:
.L_ret_printf:
; ERROR: Invalid mov instruction: mov %eax 0 ; Default return value
    mov sp, bp
    pop bp
    ret

sleep:
    push bp
    mov bp, sp
    mov bx, bp
    add bx, 8
    mov bx, word ax
    mov word [4104], ax
    mov dx, word [4104]
    int 22
.L_ret_sleep:
; ERROR: Invalid mov instruction: mov %eax 0 ; Default return value
    mov sp, bp
    pop bp
    ret

getkey:
    push bp
    mov bp, sp
; ERROR: Invalid sub instruction: sub %esp 8 ; Allocate space for ALL local variables
    mov ax, 4718597
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 5
    mov byte bx, ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 6
    mov byte bx, ax
.L_while_start_65:
    mov ax, 0
    push ax
    mov bx, bp
    sub bx, 6
    mov ax, 0
    mov bx, byte ax
    pop bx
    cmp ax, bx
    je .L_comp_true_67
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_67
.L_comp_true_67:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_67:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_while_end_65 ; Jump to end if condition is false
; --- while-body ---
    mov ax, 10
    push ax
    call sleep
    add sp, 4
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 8
    mov word bx, ax
.L_for_start_68:
    mov ax, 6
    push ax
    mov bx, bp
    sub bx, 8
    mov ax, 0
    mov bx, word ax
    pop bx
    cmp ax, bx
    jl .L_comp_true_70
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_70
.L_comp_true_70:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_70:
    cmp ax, 0
    je .L_for_end_68
    mov bx, bp
    sub bx, 8
    mov ax, 0
    mov bx, word ax
    push ax
    mov ax, 4718597
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
    mov ax, 225
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Загружаем значение по адресу из %ebx
    pop bx
    cmp ax, bx
    jne .L_comp_true_73
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_73
.L_comp_true_73:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_73:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_endif_71 ; Jump to end if condition is false
; --- if-body ---
    mov ax, 229
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Загружаем значение по адресу из %ebx
    pop bx
    cmp ax, bx
    jne .L_comp_true_76
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_76
.L_comp_true_76:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_76:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_endif_74 ; Jump to end if condition is false
; --- if-body ---
    mov ax, 0
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Загружаем значение по адресу из %ebx
    pop bx
    cmp ax, bx
    jne .L_comp_true_79
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_79
.L_comp_true_79:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_79:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_endif_77 ; Jump to end if condition is false
; --- if-body ---
    mov bx, bp
    sub bx, 4
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Загружаем значение по адресу из %ebx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 5
    mov byte bx, ax
    mov ax, 1
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 6
    mov byte bx, ax
; ERROR: Invalid jump instruction: jmp .L_endif_77 ; End of if-body
.L_endif_77:
; ERROR: Invalid jump instruction: jmp .L_endif_74 ; End of if-body
.L_endif_74:
; ERROR: Invalid jump instruction: jmp .L_endif_71 ; End of if-body
.L_endif_71:
.L_for_inc_68:
    mov ax, 1
    push ax
    mov bx, bp
    sub bx, 8
    mov ax, 0
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 8
    mov word bx, ax
    jmp .L_for_start_68
.L_for_end_68:
    jmp .L_while_start_65
.L_while_end_65:
    mov bx, bp
    sub bx, 5
    mov ax, 0
    mov bx, byte ax
    jmp .L_ret_getkey
.L_ret_getkey:
    mov sp, bp
    pop bp
    ret

is_shift_pressed:
    push bp
    mov bp, sp
; ERROR: Invalid sub instruction: sub %esp 6 ; Allocate space for ALL local variables
    mov ax, 4718597
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 6
    mov word bx, ax
.L_for_start_80:
    mov ax, 6
    push ax
    mov bx, bp
    sub bx, 6
    mov ax, 0
    mov bx, word ax
    pop bx
    cmp ax, bx
    jl .L_comp_true_82
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_82
.L_comp_true_82:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_82:
    cmp ax, 0
    je .L_for_end_80
    mov bx, bp
    sub bx, 6
    mov ax, 0
    mov bx, word ax
    push ax
    mov ax, 4718597
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
    mov ax, 225
; ERROR: Invalid stack instruction: psh %eax ; Save case value
    mov bx, bp
    sub bx, 4
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Загружаем значение по адресу из %ebx
; ERROR: Invalid mov instruction: mov %ebx %eax ; Move match expression value to EBX for comparison
; ERROR: Invalid stack instruction: pop %eax ; Restore case value to EAX for comparison
    cmp ax, bx
    je .L_block_body_84_0
    mov ax, 229
; ERROR: Invalid stack instruction: psh %eax ; Save case value
    mov bx, bp
    sub bx, 4
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Загружаем значение по адресу из %ebx
; ERROR: Invalid mov instruction: mov %ebx %eax ; Move match expression value to EBX for comparison
; ERROR: Invalid stack instruction: pop %eax ; Restore case value to EAX for comparison
    cmp ax, bx
    je .L_block_body_84_1
    jmp .L_match_end_83
.L_block_body_84_0:
    mov ax, 1
    jmp .L_ret_is_shift_pressed
    jmp .L_match_end_83
.L_block_body_84_1:
    mov ax, 1
    jmp .L_ret_is_shift_pressed
    jmp .L_match_end_83
.L_match_end_83:
.L_for_inc_80:
    mov ax, 1
    push ax
    mov bx, bp
    sub bx, 6
    mov ax, 0
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 6
    mov word bx, ax
    jmp .L_for_start_80
.L_for_end_80:
    mov ax, 0
    jmp .L_ret_is_shift_pressed
.L_ret_is_shift_pressed:
    mov sp, bp
    pop bp
    ret

key_in_buffer:
    push bp
    mov bp, sp
; ERROR: Invalid sub instruction: sub %esp 7 ; Allocate space for ALL local variables
    mov ax, 4718597
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 5
    mov byte bx, ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 7
    mov word bx, ax
.L_for_start_84:
    mov ax, 6
    push ax
    mov bx, bp
    sub bx, 7
    mov ax, 0
    mov bx, word ax
    pop bx
    cmp ax, bx
    jl .L_comp_true_86
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_86
.L_comp_true_86:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_86:
    cmp ax, 0
    je .L_for_end_84
    mov bx, bp
    sub bx, 7
    mov ax, 0
    mov bx, word ax
    push ax
    mov ax, 4718597
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
    mov bx, bp
    add bx, 8
    mov ax, 0
    mov bx, byte ax
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Загружаем значение по адресу из %ebx
    pop bx
    cmp ax, bx
    je .L_comp_true_89
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_89
.L_comp_true_89:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_89:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_endif_87 ; Jump to end if condition is false
; --- if-body ---
    mov ax, 1
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 5
    mov byte bx, ax
; ERROR: Invalid jump instruction: jmp .L_endif_87 ; End of if-body
.L_endif_87:
.L_for_inc_84:
    mov ax, 1
    push ax
    mov bx, bp
    sub bx, 7
    mov ax, 0
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 7
    mov word bx, ax
    jmp .L_for_start_84
.L_for_end_84:
    mov bx, bp
    sub bx, 5
    mov ax, 0
    mov bx, byte ax
    jmp .L_ret_key_in_buffer
.L_ret_key_in_buffer:
    mov sp, bp
    pop bp
    ret

char_to_scancode:
    push bp
    mov bp, sp
; ERROR: Invalid sub instruction: sub %esp 151 ; Allocate space for ALL local variables
; --- Initialize array 'layout_chars' from __str_init_11 ---
    mov si, bp
    sub si, 57
    mov di, __str_init_11
    mov cx, 54
.L_strcpy_90:
    mov di, byte ax
    mov byte si, ax
    ; TODO: Convert lp .L_strcpy_90
; --- Initialize array 'shifted_chars' from __str_init_12 ---
    mov si, bp
    sub si, 114
    mov di, __str_init_12
    mov cx, 54
.L_strcpy_91:
    mov di, byte ax
    mov byte si, ax
    ; TODO: Convert lp .L_strcpy_91
; --- Initialize array 'extra' from __str_init_13 ---
    mov si, bp
    sub si, 140
    mov di, __str_init_13
    mov cx, 26
.L_strcpy_92:
    mov di, byte ax
    mov byte si, ax
    ; TODO: Convert lp .L_strcpy_92
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 141
    mov byte bx, ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 142
    mov byte bx, ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 150
    mov word bx, ax
.L_for_start_93:
; ERROR: Invalid mov instruction: mov %eax 57 ; .length of layout_chars
    push ax
    mov bx, bp
    sub bx, 150
    mov bx, word ax
    pop bx
    cmp ax, bx
    jl .L_comp_true_95
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_95
.L_comp_true_95:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_95:
    cmp ax, 0
    je .L_for_end_93
    mov bx, bp
    sub bx, 150
    mov bx, word ax
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 1
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, bp
    sub bx, 57
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value from address
    push ax
    mov bx, bp
    add bx, 8
    mov ax, 0
    mov bx, byte ax
    pop bx
    cmp ax, bx
    je .L_comp_true_98
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_98
.L_comp_true_98:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_98:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_endif_96 ; Jump to end if condition is false
; --- if-body ---
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 141
    mov byte bx, ax
    mov bx, bp
    sub bx, 150
    mov bx, word ax
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 142
    mov byte bx, ax
; ERROR: Invalid jump instruction: jmp .L_endif_96 ; End of if-body
.L_endif_96:
.L_for_inc_93:
    mov ax, 1
    push ax
    mov bx, bp
    sub bx, 150
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 150
    mov word bx, ax
    jmp .L_for_start_93
.L_for_end_93:
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 150
    mov word bx, ax
.L_for_start_99:
; ERROR: Invalid mov instruction: mov %eax 26 ; .length of extra
    push ax
    mov bx, bp
    sub bx, 150
    mov bx, word ax
    pop bx
    cmp ax, bx
    jl .L_comp_true_101
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_101
.L_comp_true_101:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_101:
    cmp ax, 0
    je .L_for_end_99
    mov bx, bp
    sub bx, 150
    mov bx, word ax
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 1
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, bp
    sub bx, 140
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value from address
    push ax
    mov bx, bp
    add bx, 8
    mov ax, 0
    mov bx, byte ax
    pop bx
    cmp ax, bx
    je .L_comp_true_104
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_104
.L_comp_true_104:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_104:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_endif_102 ; Jump to end if condition is false
; --- if-body ---
    mov ax, 1
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 141
    mov byte bx, ax
    mov bx, bp
    sub bx, 150
    mov bx, word ax
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 142
    mov byte bx, ax
; ERROR: Invalid jump instruction: jmp .L_endif_102 ; End of if-body
.L_endif_102:
.L_for_inc_99:
    mov ax, 1
    push ax
    mov bx, bp
    sub bx, 150
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 150
    mov word bx, ax
    jmp .L_for_start_99
.L_for_end_99:
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 151
    mov byte bx, ax
    mov ax, 0
    push ax
    mov bx, bp
    sub bx, 141
    mov ax, 0
    mov bx, byte ax
    pop bx
    cmp ax, bx
    je .L_comp_true_107
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_107
.L_comp_true_107:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_107:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_else_105 ; Jump to else if condition is false
; --- if-body ---
    mov ax, 4
    push ax
    mov bx, bp
    sub bx, 142
    mov ax, 0
    mov bx, byte ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 151
    mov byte bx, ax
; ERROR: Invalid jump instruction: jmp .L_endif_105 ; End of if-body
.L_else_105:
; --- else-body ---
    mov ax, 57
    push ax
    mov bx, bp
    sub bx, 142
    mov ax, 0
    mov bx, byte ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 151
    mov byte bx, ax
.L_endif_105:
    mov bx, bp
    sub bx, 151
    mov ax, 0
    mov bx, byte ax
    jmp .L_ret_char_to_scancode
.L_ret_char_to_scancode:
    mov sp, bp
    pop bp
    ret

getchar:
    push bp
    mov bp, sp
; ERROR: Invalid sub instruction: sub %esp 145 ; Allocate space for ALL local variables
    call getkey
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 1
    mov byte bx, ax
    mov ax, 63
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 2
    mov byte bx, ax
; --- Initialize array 'layout_chars' from __str_init_14 ---
    mov si, bp
    sub si, 59
    mov di, __str_init_14
    mov cx, 54
.L_strcpy_108:
    mov di, byte ax
    mov byte si, ax
    ; TODO: Convert lp .L_strcpy_108
; --- Initialize array 'shifted_chars' from __str_init_15 ---
    mov si, bp
    sub si, 116
    mov di, __str_init_15
    mov cx, 54
.L_strcpy_109:
    mov di, byte ax
    mov byte si, ax
    ; TODO: Convert lp .L_strcpy_109
; --- Initialize array 'extra' from __str_init_16 ---
    mov si, bp
    sub si, 142
    mov di, __str_init_16
    mov cx, 26
.L_strcpy_110:
    mov di, byte ax
    mov byte si, ax
    ; TODO: Convert lp .L_strcpy_110
    mov ax, 57
    push ax
    mov bx, bp
    sub bx, 1
    mov ax, 0
    mov bx, byte ax
    pop bx
    cmp ax, bx
    jl .L_comp_true_113
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_113
.L_comp_true_113:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_113:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_else_111 ; Jump to else if condition is false
; --- if-body ---
    mov ax, 4
    push ax
    mov bx, bp
    sub bx, 1
    mov ax, 0
    mov bx, byte ax
    pop bx
    ; TODO: Convert not %ebx
    ; TODO: Convert inx %ebx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 145
    mov byte bx, ax
    call is_shift_pressed
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 144
    mov byte bx, ax
    mov ax, 1
    push ax
    mov bx, bp
    sub bx, 144
    mov ax, 0
    mov bx, byte ax
    pop bx
    cmp ax, bx
    je .L_comp_true_116
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_116
.L_comp_true_116:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_116:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_else_114 ; Jump to else if condition is false
; --- if-body ---
    mov bx, bp
    sub bx, 145
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 1
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, bp
    sub bx, 116
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value from address
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 2
    mov byte bx, ax
; ERROR: Invalid jump instruction: jmp .L_endif_114 ; End of if-body
.L_else_114:
; --- else-body ---
    mov bx, bp
    sub bx, 145
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 1
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, bp
    sub bx, 59
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value from address
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 2
    mov byte bx, ax
.L_endif_114:
; ERROR: Invalid jump instruction: jmp .L_endif_111 ; End of if-body
.L_else_111:
; --- else-body ---
    mov ax, 57
    push ax
    mov bx, bp
    sub bx, 1
    mov ax, 0
    mov bx, byte ax
    pop bx
    ; TODO: Convert not %ebx
    ; TODO: Convert inx %ebx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 145
    mov byte bx, ax
    mov bx, bp
    sub bx, 145
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 1
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, bp
    sub bx, 142
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value from address
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 2
    mov byte bx, ax
.L_endif_111:
    mov bx, bp
    sub bx, 2
    mov ax, 0
    mov bx, byte ax
    jmp .L_ret_getchar
.L_ret_getchar:
    mov sp, bp
    pop bp
    ret

confirm_exit:
    push bp
    mov bp, sp
    mov ax, 0
    push ax
    mov bx, bp
    add bx, 8
    mov ax, 0
    mov bx, byte ax
    pop bx
    cmp ax, bx
    je .L_comp_true_119
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_119
.L_comp_true_119:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_119:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_endif_117 ; Jump to end if condition is false
; --- if-body ---
    call init_text_mode
; ERROR: Invalid jump instruction: jmp .L_endif_117 ; End of if-body
.L_endif_117:
    mov ax, __str_init_17
    push ax
    call printf
    call screen_flush
    call getkey
    call exit
.L_ret_confirm_exit:
; ERROR: Invalid mov instruction: mov %eax 0 ; Default return value
    mov sp, bp
    pop bp
    ret

strlen:
    push bp
    mov bp, sp
; ERROR: Invalid sub instruction: sub %esp 4 ; Allocate space for ALL local variables
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
.L_while_start_120:
    mov ax, 0
    push ax
    mov bx, bp
    add bx, 8
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Загружаем значение по адресу из %ebx
    pop bx
    cmp ax, bx
    jne .L_comp_true_122
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_122
.L_comp_true_122:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_122:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_while_end_120 ; Jump to end if condition is false
; --- while-body ---
    mov ax, 1
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
    mov ax, 1
    push ax
    mov bx, bp
    add bx, 8
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    add bx, 8
    mov word bx, ax
    jmp .L_while_start_120
.L_while_end_120:
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    jmp .L_ret_strlen
.L_ret_strlen:
    mov sp, bp
    pop bp
    ret

strcmp:
    push bp
    mov bp, sp
.L_while_start_123:
    mov bx, bp
    add bx, 12
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Загружаем значение по адресу из %ebx
    push ax
    mov bx, bp
    add bx, 8
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Загружаем значение по адресу из %ebx
    pop bx
    cmp ax, bx
    je .L_comp_true_125
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_125
.L_comp_true_125:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_125:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_while_end_123 ; Jump to end if condition is false
; --- while-body ---
    mov ax, 0
    push ax
    mov bx, bp
    add bx, 8
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Загружаем значение по адресу из %ebx
    pop bx
    cmp ax, bx
    je .L_comp_true_128
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_128
.L_comp_true_128:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_128:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_endif_126 ; Jump to end if condition is false
; --- if-body ---
    mov ax, 0
    jmp .L_ret_strcmp
; ERROR: Invalid jump instruction: jmp .L_endif_126 ; End of if-body
.L_endif_126:
    jmp .L_while_start_123
.L_while_end_123:
    mov ax, 1
    jmp .L_ret_strcmp
.L_ret_strcmp:
    mov sp, bp
    pop bp
    ret

strcpy:
    push bp
    mov bp, sp
.L_ret_strcpy:
; ERROR: Invalid mov instruction: mov %eax 0 ; Default return value
    mov sp, bp
    pop bp
    ret

_itoa:
    push bp
    mov bp, sp
; ERROR: Invalid sub instruction: sub %esp 28 ; Allocate space for ALL local variables
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 16
    mov word bx, ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 20
    mov word bx, ax
    mov ax, 0
    push ax
    mov bx, bp
    add bx, 8
    mov bx, word ax
    pop bx
    cmp ax, bx
    je .L_comp_true_131
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_131
.L_comp_true_131:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_131:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_endif_129 ; Jump to end if condition is false
; --- if-body ---
    mov ax, 48
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov ax, 0
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 1
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, bp
    add bx, 12
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; %ebx = базовый адрес (значение указателя)
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
; ERROR: Invalid memory instruction: sd %ebx %eax ; Записываем значение по адресу
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov ax, 1
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 1
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, bp
    add bx, 12
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; %ebx = базовый адрес (значение указателя)
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
; ERROR: Invalid memory instruction: sd %ebx %eax ; Записываем значение по адресу
    mov ax, 1
    jmp .L_ret__itoa
; ERROR: Invalid jump instruction: jmp .L_endif_129 ; End of if-body
.L_endif_129:
    mov ax, 0
    push ax
    mov bx, bp
    add bx, 8
    mov bx, word ax
    pop bx
    cmp ax, bx
    jl .L_comp_true_134
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_134
.L_comp_true_134:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_134:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_endif_132 ; Jump to end if condition is false
; --- if-body ---
    mov ax, 1
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 20
    mov word bx, ax
    mov bx, bp
    add bx, 8
    mov bx, word ax
    ; TODO: Convert not %eax
    ; TODO: Convert inx %eax
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    add bx, 8
    mov word bx, ax
; ERROR: Invalid jump instruction: jmp .L_endif_132 ; End of if-body
.L_endif_132:
.L_while_start_135:
    mov ax, 0
    push ax
    mov bx, bp
    add bx, 8
    mov bx, word ax
    pop bx
    cmp ax, bx
    jne .L_comp_true_137
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_137
.L_comp_true_137:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_137:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_while_end_135 ; Jump to end if condition is false
; --- while-body ---
    mov ax, 10
    push ax
    mov bx, bp
    add bx, 8
    mov bx, word ax
    pop bx
    ; TODO: Convert div %eax %ebx
; ERROR: Invalid mov instruction: mov %eax %edx ; Remainder is in EDX
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 24
    mov word bx, ax
    mov bx, bp
    sub bx, 24
    mov bx, word ax
    push ax
    mov ax, 48
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, bp
    sub bx, 16
    mov bx, word ax
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 1
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, bp
    sub bx, 12
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
; ERROR: Invalid memory instruction: sb %ebx %eax ; Записываем значение по адресу
    mov ax, 10
    push ax
    mov bx, bp
    add bx, 8
    mov bx, word ax
    pop bx
    ; TODO: Convert div %eax %ebx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    add bx, 8
    mov word bx, ax
    mov ax, 1
    push ax
    mov bx, bp
    sub bx, 16
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 16
    mov word bx, ax
    jmp .L_while_start_135
.L_while_end_135:
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 28
    mov word bx, ax
    mov ax, 1
    push ax
    mov bx, bp
    sub bx, 20
    mov bx, word ax
    pop bx
    cmp ax, bx
    je .L_comp_true_140
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_140
.L_comp_true_140:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_140:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_endif_138 ; Jump to end if condition is false
; --- if-body ---
    mov ax, 45
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, bp
    sub bx, 28
    mov bx, word ax
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 1
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, bp
    add bx, 12
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; %ebx = базовый адрес (значение указателя)
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
; ERROR: Invalid memory instruction: sd %ebx %eax ; Записываем значение по адресу
    mov ax, 1
    push ax
    mov bx, bp
    sub bx, 28
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 28
    mov word bx, ax
; ERROR: Invalid jump instruction: jmp .L_endif_138 ; End of if-body
.L_endif_138:
.L_while_start_141:
    mov ax, 0
    push ax
    mov bx, bp
    sub bx, 16
    mov bx, word ax
    pop bx
    cmp ax, bx
    jg .L_comp_true_143
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_143
.L_comp_true_143:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_143:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_while_end_141 ; Jump to end if condition is false
; --- while-body ---
    mov ax, 1
    push ax
    mov bx, bp
    sub bx, 16
    mov bx, word ax
    pop bx
    ; TODO: Convert not %ebx
    ; TODO: Convert inx %ebx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 16
    mov word bx, ax
    mov bx, bp
    sub bx, 16
    mov bx, word ax
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 1
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, bp
    sub bx, 12
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value from address
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, bp
    sub bx, 28
    mov bx, word ax
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 1
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, bp
    add bx, 12
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; %ebx = базовый адрес (значение указателя)
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
; ERROR: Invalid memory instruction: sd %ebx %eax ; Записываем значение по адресу
    mov ax, 1
    push ax
    mov bx, bp
    sub bx, 28
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 28
    mov word bx, ax
    jmp .L_while_start_141
.L_while_end_141:
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, bp
    sub bx, 28
    mov bx, word ax
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 1
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, bp
    add bx, 12
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; %ebx = базовый адрес (значение указателя)
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
; ERROR: Invalid memory instruction: sd %ebx %eax ; Записываем значение по адресу
    mov bx, bp
    sub bx, 28
    mov bx, word ax
    jmp .L_ret__itoa
.L_ret__itoa:
    mov sp, bp
    pop bp
    ret

sprintf:
    push bp
    mov bp, sp
; ERROR: Invalid sub instruction: sub %esp 24 ; Allocate space for ALL local variables
    mov bx, bp
    add bx, 12
    mov bx, word ax
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
    mov bx, bp
    add bx, 8
    mov bx, word ax
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 8
    mov word bx, ax
    mov ax, 4
    push ax
    mov ax, bp
    add ax, 12
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 12
    mov word bx, ax
.L_while_start_144:
    mov ax, 0
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Загружаем значение по адресу из %ebx
    pop bx
    cmp ax, bx
    jne .L_comp_true_146
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_146
.L_comp_true_146:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_146:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_while_end_144 ; Jump to end if condition is false
; --- while-body ---
    mov ax, 37
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Загружаем значение по адресу из %ebx
    pop bx
    cmp ax, bx
    je .L_comp_true_149
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_149
.L_comp_true_149:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_149:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_else_147 ; Jump to else if condition is false
; --- if-body ---
    mov ax, 1
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
    mov ax, 115
; ERROR: Invalid stack instruction: psh %eax ; Save case value
    mov bx, bp
    sub bx, 4
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Загружаем значение по адресу из %ebx
; ERROR: Invalid mov instruction: mov %ebx %eax ; Move match expression value to EBX for comparison
; ERROR: Invalid stack instruction: pop %eax ; Restore case value to EAX for comparison
    cmp ax, bx
    je .L_block_body_151_0
    mov ax, 105
; ERROR: Invalid stack instruction: psh %eax ; Save case value
    mov bx, bp
    sub bx, 4
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Загружаем значение по адресу из %ebx
; ERROR: Invalid mov instruction: mov %ebx %eax ; Move match expression value to EBX for comparison
; ERROR: Invalid stack instruction: pop %eax ; Restore case value to EAX for comparison
    cmp ax, bx
    je .L_block_body_151_1
    jmp .L_block_body_151_2
.L_block_body_151_0:
    mov bx, bp
    sub bx, 12
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; EBX теперь хранит адрес для чтения
; ERROR: Invalid memory instruction: ld %ebx %eax ; Загружаем значение по адресу из %ebx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 16
    mov word bx, ax
.L_while_start_151:
    mov ax, 0
    push ax
    mov bx, bp
    sub bx, 16
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Загружаем значение по адресу из %ebx
    pop bx
    cmp ax, bx
    jne .L_comp_true_153
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_153
.L_comp_true_153:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_153:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_while_end_151 ; Jump to end if condition is false
; --- while-body ---
    mov bx, bp
    sub bx, 16
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Загружаем значение по адресу из %ebx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, bp
    sub bx, 8
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; %ebx = адрес для записи
; ERROR: Invalid stack instruction: pop %eax ; %eax = значение для записи
; ERROR: Invalid memory instruction: sb %ebx %eax ; Записываем значение по разыменованному указателю
    mov ax, 1
    push ax
    mov bx, bp
    sub bx, 8
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 8
    mov word bx, ax
    mov ax, 1
    push ax
    mov bx, bp
    sub bx, 16
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 16
    mov word bx, ax
    jmp .L_while_start_151
.L_while_end_151:
    mov ax, 4
    push ax
    mov bx, bp
    sub bx, 12
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 12
    mov word bx, ax
    jmp .L_match_end_150
.L_block_body_151_1:
    mov bx, bp
    sub bx, 12
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; EBX теперь хранит адрес для чтения
; ERROR: Invalid memory instruction: ld %ebx %eax ; Загружаем значение по адресу из %ebx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 20
    mov word bx, ax
    mov bx, bp
    sub bx, 8
    mov bx, word ax
    push ax
    mov bx, bp
    sub bx, 20
    mov bx, word ax
    push ax
    call _itoa
    add sp, 8
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 24
    mov word bx, ax
    mov bx, bp
    sub bx, 24
    mov bx, word ax
    push ax
    mov bx, bp
    sub bx, 8
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 8
    mov word bx, ax
    mov ax, 4
    push ax
    mov bx, bp
    sub bx, 12
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 12
    mov word bx, ax
    jmp .L_match_end_150
.L_block_body_151_2:
    mov ax, 37
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, bp
    sub bx, 8
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; %ebx = адрес для записи
; ERROR: Invalid stack instruction: pop %eax ; %eax = значение для записи
; ERROR: Invalid memory instruction: sb %ebx %eax ; Записываем значение по разыменованному указателю
    mov ax, 1
    push ax
    mov bx, bp
    sub bx, 8
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 8
    mov word bx, ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Загружаем значение по адресу из %ebx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, bp
    sub bx, 8
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; %ebx = адрес для записи
; ERROR: Invalid stack instruction: pop %eax ; %eax = значение для записи
; ERROR: Invalid memory instruction: sb %ebx %eax ; Записываем значение по разыменованному указателю
    mov ax, 1
    push ax
    mov bx, bp
    sub bx, 8
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 8
    mov word bx, ax
.L_match_end_150:
; ERROR: Invalid jump instruction: jmp .L_endif_147 ; End of if-body
.L_else_147:
; --- else-body ---
    mov bx, bp
    sub bx, 4
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Загружаем значение по адресу из %ebx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, bp
    sub bx, 8
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; %ebx = адрес для записи
; ERROR: Invalid stack instruction: pop %eax ; %eax = значение для записи
; ERROR: Invalid memory instruction: sb %ebx %eax ; Записываем значение по разыменованному указателю
    mov ax, 1
    push ax
    mov bx, bp
    sub bx, 8
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 8
    mov word bx, ax
.L_endif_147:
    mov ax, 1
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
    jmp .L_while_start_144
.L_while_end_144:
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, bp
    sub bx, 8
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; %ebx = адрес для записи
; ERROR: Invalid stack instruction: pop %eax ; %eax = значение для записи
; ERROR: Invalid memory instruction: sb %ebx %eax ; Записываем значение по разыменованному указателю
.L_ret_sprintf:
; ERROR: Invalid mov instruction: mov %eax 0 ; Default return value
    mov sp, bp
    pop bp
    ret

_start:
    push bp
    mov bp, sp
; ERROR: Invalid sub instruction: sub %esp 1 ; Allocate space for ALL local variables

; --- BEGIN Global Variable Initialization ---
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_text_ptr
    mov word bx, ax
    mov ax, 4849408
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_videomode_ptr
    mov word bx, ax
    mov ax, 4849664
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_color_ptr
    mov word bx, ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_buffer_length
    mov word bx, ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_auto_flush
    mov byte bx, ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_cursor_x
    mov byte bx, ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_cursor_y
    mov byte bx, ax
    mov ax, 15
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var__current_character_color
    mov byte bx, ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var__current_background_color
    mov byte bx, ax
    mov ax, 80
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_text_screen_width
    mov byte bx, ax
    mov ax, 60
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_text_screen_height
    mov byte bx, ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_is_exit
    mov byte bx, ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_current_view
    mov byte bx, ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_main_menu_selection
    mov byte bx, ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_boot_menu_selection
    mov byte bx, ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_settings_menu_selection
    mov byte bx, ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_theme_menu_selection
    mov byte bx, ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_default_boot_disk
    mov word bx, ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_color_theme
    mov word bx, ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_HEADER_BG
    mov byte bx, ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_HEADER_FG
    mov byte bx, ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_MAIN_BG
    mov byte bx, ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_MAIN_FG
    mov byte bx, ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_SELECT_BG
    mov byte bx, ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_SELECT_FG
    mov byte bx, ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_HIGHLIGHT_FG
    mov byte bx, ax

;  Initializing global array 'main_item_1'
    mov si, __var_main_item_1
    mov di, __str_init_global_0
    mov cx, 18
.L_memcpy_g_0:
    mov di, byte ax
    mov byte si, ax
    ; TODO: Convert lp .L_memcpy_g_0

;  Initializing global array 'main_item_2'
    mov si, __var_main_item_2
    mov di, __str_init_global_1
    mov cx, 18
.L_memcpy_g_1:
    mov di, byte ax
    mov byte si, ax
    ; TODO: Convert lp .L_memcpy_g_1

;  Initializing global array 'main_item_3'
    mov si, __var_main_item_3
    mov di, __str_init_global_2
    mov cx, 13
.L_memcpy_g_2:
    mov di, byte ax
    mov byte si, ax
    ; TODO: Convert lp .L_memcpy_g_2

;  Initializing global array 'main_item_4'
    mov si, __var_main_item_4
    mov di, __str_init_global_3
    mov cx, 13
.L_memcpy_g_3:
    mov di, byte ax
    mov byte si, ax
    ; TODO: Convert lp .L_memcpy_g_3

;  Initializing global array 'main_item_5'
    mov si, __var_main_item_5
    mov di, __str_init_global_4
    mov cx, 11
.L_memcpy_g_4:
    mov di, byte ax
    mov byte si, ax
    ; TODO: Convert lp .L_memcpy_g_4
    mov ax, 5
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_MAIN_MENU_COUNT
    mov byte bx, ax

;  Initializing global array 'settings_item_1'
    mov si, __var_settings_item_1
    mov di, __str_init_global_5
    mov cx, 18
.L_memcpy_g_5:
    mov di, byte ax
    mov byte si, ax
    ; TODO: Convert lp .L_memcpy_g_5

;  Initializing global array 'settings_item_2'
    mov si, __var_settings_item_2
    mov di, __str_init_global_6
    mov cx, 23
.L_memcpy_g_6:
    mov di, byte ax
    mov byte si, ax
    ; TODO: Convert lp .L_memcpy_g_6

;  Initializing global array 'settings_item_3'
    mov si, __var_settings_item_3
    mov di, __str_init_global_7
    mov cx, 19
.L_memcpy_g_7:
    mov di, byte ax
    mov byte si, ax
    ; TODO: Convert lp .L_memcpy_g_7
    mov ax, 3
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_SETTINGS_MENU_COUNT
    mov byte bx, ax

;  Initializing global array 'theme_item_1'
    mov si, __var_theme_item_1
    mov di, __str_init_global_8
    mov cx, 12
.L_memcpy_g_8:
    mov di, byte ax
    mov byte si, ax
    ; TODO: Convert lp .L_memcpy_g_8

;  Initializing global array 'theme_item_2'
    mov si, __var_theme_item_2
    mov di, __str_init_global_9
    mov cx, 12
.L_memcpy_g_9:
    mov di, byte ax
    mov byte si, ax
    ; TODO: Convert lp .L_memcpy_g_9

;  Initializing global array 'theme_item_3'
    mov si, __var_theme_item_3
    mov di, __str_init_global_10
    mov cx, 16
.L_memcpy_g_10:
    mov di, byte ax
    mov byte si, ax
    ; TODO: Convert lp .L_memcpy_g_10
    mov ax, 3
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_THEME_MENU_COUNT
    mov byte bx, ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_bootable_disk_count
    mov byte bx, ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_VIEW_MAIN
    mov byte bx, ax
    mov ax, 1
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_VIEW_BOOT
    mov byte bx, ax
    mov ax, 2
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_VIEW_SYSINFO
    mov byte bx, ax
    mov ax, 3
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_VIEW_RAMCHECK
    mov byte bx, ax
    mov ax, 4
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_VIEW_SETTINGS
    mov byte bx, ax
    mov ax, 5
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_VIEW_THEME
    mov byte bx, ax
    mov ax, 6
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_VIEW_PASSWORD_SETUP
    mov byte bx, ax
; --- END Global Initialization ---

    call init_text_mode
    mov ax, 82
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov ax, 82
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, __var_SC
; ERROR: Invalid stack instruction: pop %eax ; Restore expression result
; ERROR: Invalid memory instruction: sb %ebx %eax ; Store value into field 'ARROW_UP'
    mov ax, 81
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov ax, 81
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, __var_SC
; ERROR: Invalid add instruction: add %ebx 1 ; offset for field 'ARROW_DOWN'
; ERROR: Invalid stack instruction: pop %eax ; Restore expression result
; ERROR: Invalid memory instruction: sb %ebx %eax ; Store value into field 'ARROW_DOWN'
    mov ax, 41
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov ax, 41
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, __var_SC
; ERROR: Invalid add instruction: add %ebx 2 ; offset for field 'ESC'
; ERROR: Invalid stack instruction: pop %eax ; Restore expression result
; ERROR: Invalid memory instruction: sb %ebx %eax ; Store value into field 'ESC'
    mov ax, 40
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov ax, 40
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, __var_SC
; ERROR: Invalid add instruction: add %ebx 3 ; offset for field 'ENTER'
; ERROR: Invalid stack instruction: pop %eax ; Restore expression result
; ERROR: Invalid memory instruction: sb %ebx %eax ; Store value into field 'ENTER'
    mov ax, 14
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov ax, 14
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, __var_SC
; ERROR: Invalid add instruction: add %ebx 4 ; offset for field 'BACKSPACE'
; ERROR: Invalid stack instruction: pop %eax ; Restore expression result
; ERROR: Invalid memory instruction: sb %ebx %eax ; Store value into field 'BACKSPACE'
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_VIEW_MAIN
    mov byte bx, ax
    mov ax, 1
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_VIEW_BOOT
    mov byte bx, ax
    mov ax, 2
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_VIEW_SYSINFO
    mov byte bx, ax
    mov ax, 3
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_VIEW_RAMCHECK
    mov byte bx, ax
    mov ax, 4
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_VIEW_SETTINGS
    mov byte bx, ax
    mov ax, 5
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_VIEW_THEME
    mov byte bx, ax
    mov ax, 6
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_VIEW_PASSWORD_SETUP
    mov byte bx, ax
    mov ax, __var_main_item_1
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov ax, 0
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 4
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, __var_main_menu_items
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
; ERROR: Invalid memory instruction: sd %ebx %eax ; Записываем значение по адресу
    mov ax, __var_main_item_2
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov ax, 1
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 4
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, __var_main_menu_items
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
; ERROR: Invalid memory instruction: sd %ebx %eax ; Записываем значение по адресу
    mov ax, __var_main_item_3
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov ax, 2
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 4
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, __var_main_menu_items
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
; ERROR: Invalid memory instruction: sd %ebx %eax ; Записываем значение по адресу
    mov ax, __var_main_item_4
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov ax, 3
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 4
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, __var_main_menu_items
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
; ERROR: Invalid memory instruction: sd %ebx %eax ; Записываем значение по адресу
    mov ax, __var_main_item_5
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov ax, 4
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 4
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, __var_main_menu_items
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
; ERROR: Invalid memory instruction: sd %ebx %eax ; Записываем значение по адресу
    mov ax, __var_settings_item_1
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov ax, 0
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 4
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, __var_settings_menu_items
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
; ERROR: Invalid memory instruction: sd %ebx %eax ; Записываем значение по адресу
    mov ax, __var_settings_item_2
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov ax, 1
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 4
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, __var_settings_menu_items
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
; ERROR: Invalid memory instruction: sd %ebx %eax ; Записываем значение по адресу
    mov ax, __var_settings_item_3
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov ax, 2
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 4
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, __var_settings_menu_items
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
; ERROR: Invalid memory instruction: sd %ebx %eax ; Записываем значение по адресу
    mov ax, __var_theme_item_1
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov ax, 0
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 4
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, __var_theme_menu_items
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
; ERROR: Invalid memory instruction: sd %ebx %eax ; Записываем значение по адресу
    mov ax, __var_theme_item_2
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov ax, 1
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 4
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, __var_theme_menu_items
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
; ERROR: Invalid memory instruction: sd %ebx %eax ; Записываем значение по адресу
    mov ax, __var_theme_item_3
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov ax, 2
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 4
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, __var_theme_menu_items
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
; ERROR: Invalid memory instruction: sd %ebx %eax ; Записываем значение по адресу
    call init_interrupts
    call find_bootable_disks
    call load_settings
    call apply_color_theme
    call run_post_screen
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 1
    mov byte bx, ax
    mov ax, 1
    push ax
    mov bx, bp
    sub bx, 1
    mov ax, 0
    mov bx, byte ax
    pop bx
    cmp ax, bx
    je .L_comp_true_156
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_156
.L_comp_true_156:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_156:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_endif_154 ; Jump to end if condition is false
; --- if-body ---
    mov ax, 200
    push ax
    call sleep
    add sp, 4
    call bios_main_loop
; ERROR: Invalid jump instruction: jmp .L_endif_154 ; End of if-body
.L_endif_154:
    mov bx, __var_VGA_COLORS
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'BLACK'
    push ax
    call set_background_color
    add sp, 4
    call clear_screen
    mov bx, __var_default_boot_disk
    mov bx, word ax
    push ax
    call load_and_boot
    add sp, 4
    mov bx, __var_VGA_COLORS
; ERROR: Invalid add instruction: add %ebx 4 ; offset for field 'RED'
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'RED'
    push ax
    call set_background_color
    add sp, 4
    call clear_screen
    mov bx, __var_VGA_COLORS
; ERROR: Invalid add instruction: add %ebx 15 ; offset for field 'WHITE'
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'WHITE'
    push ax
    call set_character_color
    add sp, 4
    mov ax, 5
    push ax
    mov ax, 5
    push ax
    call set_cursor_pos
    add sp, 8
    mov ax, __str_init_18
    push ax
    call printf
    call screen_flush
    mov ax, 1
    push ax
    call confirm_exit
    add sp, 4
    hlt

bios_main_loop:
    push bp
    mov bp, sp
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_is_exit
    mov byte bx, ax
.L_while_start_157:
    mov ax, 0
    push ax
    mov bx, __var_is_exit
    mov ax, 0
    mov bx, byte ax
    pop bx
    cmp ax, bx
    je .L_comp_true_159
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_159
.L_comp_true_159:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_159:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_while_end_157 ; Jump to end if condition is false
; --- while-body ---
    mov bx, __var_VIEW_MAIN
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid stack instruction: psh %eax ; Save case value
    mov bx, __var_current_view
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; Move match expression value to EBX for comparison
; ERROR: Invalid stack instruction: pop %eax ; Restore case value to EAX for comparison
    cmp ax, bx
    je .L_block_body_161_0
    mov bx, __var_VIEW_BOOT
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid stack instruction: psh %eax ; Save case value
    mov bx, __var_current_view
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; Move match expression value to EBX for comparison
; ERROR: Invalid stack instruction: pop %eax ; Restore case value to EAX for comparison
    cmp ax, bx
    je .L_block_body_161_1
    mov bx, __var_VIEW_SYSINFO
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid stack instruction: psh %eax ; Save case value
    mov bx, __var_current_view
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; Move match expression value to EBX for comparison
; ERROR: Invalid stack instruction: pop %eax ; Restore case value to EAX for comparison
    cmp ax, bx
    je .L_block_body_161_2
    mov bx, __var_VIEW_RAMCHECK
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid stack instruction: psh %eax ; Save case value
    mov bx, __var_current_view
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; Move match expression value to EBX for comparison
; ERROR: Invalid stack instruction: pop %eax ; Restore case value to EAX for comparison
    cmp ax, bx
    je .L_block_body_161_3
    mov bx, __var_VIEW_SETTINGS
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid stack instruction: psh %eax ; Save case value
    mov bx, __var_current_view
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; Move match expression value to EBX for comparison
; ERROR: Invalid stack instruction: pop %eax ; Restore case value to EAX for comparison
    cmp ax, bx
    je .L_block_body_161_4
    mov bx, __var_VIEW_THEME
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid stack instruction: psh %eax ; Save case value
    mov bx, __var_current_view
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; Move match expression value to EBX for comparison
; ERROR: Invalid stack instruction: pop %eax ; Restore case value to EAX for comparison
    cmp ax, bx
    je .L_block_body_161_5
    mov bx, __var_VIEW_PASSWORD_SETUP
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid stack instruction: psh %eax ; Save case value
    mov bx, __var_current_view
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; Move match expression value to EBX for comparison
; ERROR: Invalid stack instruction: pop %eax ; Restore case value to EAX for comparison
    cmp ax, bx
    je .L_block_body_161_6
    jmp .L_match_end_160
.L_block_body_161_0:
    call draw_main_menu
    call handle_main_menu_input
    jmp .L_match_end_160
.L_block_body_161_1:
    call draw_boot_menu
    call handle_boot_menu_input
    jmp .L_match_end_160
.L_block_body_161_2:
    call display_sys_info
    jmp .L_match_end_160
.L_block_body_161_3:
    call run_ram_check
    jmp .L_match_end_160
.L_block_body_161_4:
    call draw_settings_menu
    call handle_settings_menu_input
    jmp .L_match_end_160
.L_block_body_161_5:
    call draw_theme_menu
    call handle_theme_menu_input
    jmp .L_match_end_160
.L_block_body_161_6:
    call password_setup_screen
    jmp .L_match_end_160
.L_match_end_160:
    jmp .L_while_start_157
.L_while_end_157:
.L_ret_bios_main_loop:
; ERROR: Invalid mov instruction: mov %eax 0 ; Default return value
    mov sp, bp
    pop bp
    ret

handle_main_menu_input:
    push bp
    mov bp, sp
; ERROR: Invalid sub instruction: sub %esp 1 ; Allocate space for ALL local variables
    call getkey
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 1
    mov byte bx, ax
    mov bx, __var_SC
; ERROR: Invalid add instruction: add %ebx 1 ; offset for field 'ARROW_DOWN'
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'ARROW_DOWN'
; ERROR: Invalid stack instruction: psh %eax ; Save case value
    mov bx, bp
    sub bx, 1
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; Move match expression value to EBX for comparison
; ERROR: Invalid stack instruction: pop %eax ; Restore case value to EAX for comparison
    cmp ax, bx
    je .L_block_body_162_0
    mov bx, __var_SC
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'ARROW_UP'
; ERROR: Invalid stack instruction: psh %eax ; Save case value
    mov bx, bp
    sub bx, 1
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; Move match expression value to EBX for comparison
; ERROR: Invalid stack instruction: pop %eax ; Restore case value to EAX for comparison
    cmp ax, bx
    je .L_block_body_162_1
    mov bx, __var_SC
; ERROR: Invalid add instruction: add %ebx 3 ; offset for field 'ENTER'
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'ENTER'
; ERROR: Invalid stack instruction: psh %eax ; Save case value
    mov bx, bp
    sub bx, 1
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; Move match expression value to EBX for comparison
; ERROR: Invalid stack instruction: pop %eax ; Restore case value to EAX for comparison
    cmp ax, bx
    je .L_block_body_162_2
    mov bx, __var_SC
; ERROR: Invalid add instruction: add %ebx 2 ; offset for field 'ESC'
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'ESC'
; ERROR: Invalid stack instruction: psh %eax ; Save case value
    mov bx, bp
    sub bx, 1
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; Move match expression value to EBX for comparison
; ERROR: Invalid stack instruction: pop %eax ; Restore case value to EAX for comparison
    cmp ax, bx
    je .L_block_body_162_3
    jmp .L_match_end_161
.L_block_body_162_0:
    mov bx, __var_MAIN_MENU_COUNT
    mov ax, 0
    mov bx, byte ax
    push ax
    mov ax, 1
    push ax
    mov bx, __var_main_menu_selection
    mov ax, 0
    mov bx, byte ax
    pop bx
    add ax, bx
    pop bx
    ; TODO: Convert div %eax %ebx
; ERROR: Invalid mov instruction: mov %eax %edx ; Remainder is in EDX
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_main_menu_selection
    mov byte bx, ax
    mov ax, 100
    push ax
    call sleep
    add sp, 4
    jmp .L_match_end_161
.L_block_body_162_1:
    mov bx, __var_MAIN_MENU_COUNT
    mov ax, 0
    mov bx, byte ax
    push ax
    mov bx, __var_MAIN_MENU_COUNT
    mov ax, 0
    mov bx, byte ax
    push ax
    mov ax, 1
    push ax
    mov bx, __var_main_menu_selection
    mov ax, 0
    mov bx, byte ax
    pop bx
    ; TODO: Convert not %ebx
    ; TODO: Convert inx %ebx
    add ax, bx
    pop bx
    add ax, bx
    pop bx
    ; TODO: Convert div %eax %ebx
; ERROR: Invalid mov instruction: mov %eax %edx ; Remainder is in EDX
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_main_menu_selection
    mov byte bx, ax
    mov ax, 100
    push ax
    call sleep
    add sp, 4
    jmp .L_match_end_161
.L_block_body_162_2:
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save case value
    mov bx, __var_main_menu_selection
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; Move match expression value to EBX for comparison
; ERROR: Invalid stack instruction: pop %eax ; Restore case value to EAX for comparison
    cmp ax, bx
    je .L_block_body_163_0
    mov ax, 1
; ERROR: Invalid stack instruction: psh %eax ; Save case value
    mov bx, __var_main_menu_selection
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; Move match expression value to EBX for comparison
; ERROR: Invalid stack instruction: pop %eax ; Restore case value to EAX for comparison
    cmp ax, bx
    je .L_block_body_163_1
    mov ax, 2
; ERROR: Invalid stack instruction: psh %eax ; Save case value
    mov bx, __var_main_menu_selection
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; Move match expression value to EBX for comparison
; ERROR: Invalid stack instruction: pop %eax ; Restore case value to EAX for comparison
    cmp ax, bx
    je .L_block_body_163_2
    mov ax, 3
; ERROR: Invalid stack instruction: psh %eax ; Save case value
    mov bx, __var_main_menu_selection
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; Move match expression value to EBX for comparison
; ERROR: Invalid stack instruction: pop %eax ; Restore case value to EAX for comparison
    cmp ax, bx
    je .L_block_body_163_3
    mov ax, 4
; ERROR: Invalid stack instruction: psh %eax ; Save case value
    mov bx, __var_main_menu_selection
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; Move match expression value to EBX for comparison
; ERROR: Invalid stack instruction: pop %eax ; Restore case value to EAX for comparison
    cmp ax, bx
    je .L_block_body_163_4
    jmp .L_match_end_162
.L_block_body_163_0:
    mov bx, __var_VIEW_BOOT
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_current_view
    mov byte bx, ax
    jmp .L_match_end_162
.L_block_body_163_1:
    mov bx, __var_VIEW_SYSINFO
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_current_view
    mov byte bx, ax
    jmp .L_match_end_162
.L_block_body_163_2:
    mov bx, __var_VIEW_RAMCHECK
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_current_view
    mov byte bx, ax
    jmp .L_match_end_162
.L_block_body_163_3:
    mov bx, __var_VIEW_SETTINGS
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_current_view
    mov byte bx, ax
    jmp .L_match_end_162
.L_block_body_163_4:
    call save_settings
    mov ax, 1
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_is_exit
    mov byte bx, ax
    jmp .L_match_end_162
.L_match_end_162:
    mov ax, 150
    push ax
    call sleep
    add sp, 4
    jmp .L_match_end_161
.L_block_body_162_3:
    mov ax, 1
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_is_exit
    mov byte bx, ax
    mov ax, 150
    push ax
    call sleep
    add sp, 4
    jmp .L_match_end_161
.L_match_end_161:
.L_ret_handle_main_menu_input:
; ERROR: Invalid mov instruction: mov %eax 0 ; Default return value
    mov sp, bp
    pop bp
    ret

handle_boot_menu_input:
    push bp
    mov bp, sp
; ERROR: Invalid sub instruction: sub %esp 1 ; Allocate space for ALL local variables
    call getkey
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 1
    mov byte bx, ax
    mov bx, __var_SC
; ERROR: Invalid add instruction: add %ebx 1 ; offset for field 'ARROW_DOWN'
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'ARROW_DOWN'
; ERROR: Invalid stack instruction: psh %eax ; Save case value
    mov bx, bp
    sub bx, 1
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; Move match expression value to EBX for comparison
; ERROR: Invalid stack instruction: pop %eax ; Restore case value to EAX for comparison
    cmp ax, bx
    je .L_block_body_164_0
    mov bx, __var_SC
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'ARROW_UP'
; ERROR: Invalid stack instruction: psh %eax ; Save case value
    mov bx, bp
    sub bx, 1
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; Move match expression value to EBX for comparison
; ERROR: Invalid stack instruction: pop %eax ; Restore case value to EAX for comparison
    cmp ax, bx
    je .L_block_body_164_1
    mov bx, __var_SC
; ERROR: Invalid add instruction: add %ebx 3 ; offset for field 'ENTER'
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'ENTER'
; ERROR: Invalid stack instruction: psh %eax ; Save case value
    mov bx, bp
    sub bx, 1
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; Move match expression value to EBX for comparison
; ERROR: Invalid stack instruction: pop %eax ; Restore case value to EAX for comparison
    cmp ax, bx
    je .L_block_body_164_2
    mov bx, __var_SC
; ERROR: Invalid add instruction: add %ebx 2 ; offset for field 'ESC'
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'ESC'
; ERROR: Invalid stack instruction: psh %eax ; Save case value
    mov bx, bp
    sub bx, 1
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; Move match expression value to EBX for comparison
; ERROR: Invalid stack instruction: pop %eax ; Restore case value to EAX for comparison
    cmp ax, bx
    je .L_block_body_164_3
    jmp .L_match_end_163
.L_block_body_164_0:
    mov ax, 0
    push ax
    mov bx, __var_bootable_disk_count
    mov ax, 0
    mov bx, byte ax
    pop bx
    cmp ax, bx
    jne .L_comp_true_166
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_166
.L_comp_true_166:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_166:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_endif_164 ; Jump to end if condition is false
; --- if-body ---
    mov bx, __var_bootable_disk_count
    mov ax, 0
    mov bx, byte ax
    push ax
    mov ax, 1
    push ax
    mov bx, __var_boot_menu_selection
    mov ax, 0
    mov bx, byte ax
    pop bx
    add ax, bx
    pop bx
    ; TODO: Convert div %eax %ebx
; ERROR: Invalid mov instruction: mov %eax %edx ; Remainder is in EDX
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_boot_menu_selection
    mov byte bx, ax
    mov ax, 100
    push ax
    call sleep
    add sp, 4
; ERROR: Invalid jump instruction: jmp .L_endif_164 ; End of if-body
.L_endif_164:
    jmp .L_match_end_163
.L_block_body_164_1:
    mov ax, 0
    push ax
    mov bx, __var_bootable_disk_count
    mov ax, 0
    mov bx, byte ax
    pop bx
    cmp ax, bx
    jne .L_comp_true_169
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_169
.L_comp_true_169:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_169:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_endif_167 ; Jump to end if condition is false
; --- if-body ---
    mov bx, __var_bootable_disk_count
    mov ax, 0
    mov bx, byte ax
    push ax
    mov bx, __var_bootable_disk_count
    mov ax, 0
    mov bx, byte ax
    push ax
    mov ax, 1
    push ax
    mov bx, __var_boot_menu_selection
    mov ax, 0
    mov bx, byte ax
    pop bx
    ; TODO: Convert not %ebx
    ; TODO: Convert inx %ebx
    add ax, bx
    pop bx
    add ax, bx
    pop bx
    ; TODO: Convert div %eax %ebx
; ERROR: Invalid mov instruction: mov %eax %edx ; Remainder is in EDX
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_boot_menu_selection
    mov byte bx, ax
    mov ax, 100
    push ax
    call sleep
    add sp, 4
; ERROR: Invalid jump instruction: jmp .L_endif_167 ; End of if-body
.L_endif_167:
    jmp .L_match_end_163
.L_block_body_164_2:
    mov ax, 0
    push ax
    mov bx, __var_bootable_disk_count
    mov ax, 0
    mov bx, byte ax
    pop bx
    cmp ax, bx
    jne .L_comp_true_172
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_172
.L_comp_true_172:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_172:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_endif_170 ; Jump to end if condition is false
; --- if-body ---
    mov bx, __var_boot_menu_selection
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 4
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, __var_bootable_disk_ids
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
; ERROR: Invalid memory instruction: ld %ebx %eax ; Load value from address
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_default_boot_disk
    mov word bx, ax
    mov bx, __var_VIEW_MAIN
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_current_view
    mov byte bx, ax
    mov ax, 150
    push ax
    call sleep
    add sp, 4
; ERROR: Invalid jump instruction: jmp .L_endif_170 ; End of if-body
.L_endif_170:
    jmp .L_match_end_163
.L_block_body_164_3:
    mov bx, __var_VIEW_MAIN
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_current_view
    mov byte bx, ax
    mov ax, 150
    push ax
    call sleep
    add sp, 4
    jmp .L_match_end_163
.L_match_end_163:
.L_ret_handle_boot_menu_input:
; ERROR: Invalid mov instruction: mov %eax 0 ; Default return value
    mov sp, bp
    pop bp
    ret

handle_settings_menu_input:
    push bp
    mov bp, sp
; ERROR: Invalid sub instruction: sub %esp 1 ; Allocate space for ALL local variables
    call getkey
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 1
    mov byte bx, ax
    mov bx, __var_SC
; ERROR: Invalid add instruction: add %ebx 1 ; offset for field 'ARROW_DOWN'
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'ARROW_DOWN'
; ERROR: Invalid stack instruction: psh %eax ; Save case value
    mov bx, bp
    sub bx, 1
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; Move match expression value to EBX for comparison
; ERROR: Invalid stack instruction: pop %eax ; Restore case value to EAX for comparison
    cmp ax, bx
    je .L_block_body_174_0
    mov bx, __var_SC
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'ARROW_UP'
; ERROR: Invalid stack instruction: psh %eax ; Save case value
    mov bx, bp
    sub bx, 1
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; Move match expression value to EBX for comparison
; ERROR: Invalid stack instruction: pop %eax ; Restore case value to EAX for comparison
    cmp ax, bx
    je .L_block_body_174_1
    mov bx, __var_SC
; ERROR: Invalid add instruction: add %ebx 3 ; offset for field 'ENTER'
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'ENTER'
; ERROR: Invalid stack instruction: psh %eax ; Save case value
    mov bx, bp
    sub bx, 1
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; Move match expression value to EBX for comparison
; ERROR: Invalid stack instruction: pop %eax ; Restore case value to EAX for comparison
    cmp ax, bx
    je .L_block_body_174_2
    mov bx, __var_SC
; ERROR: Invalid add instruction: add %ebx 2 ; offset for field 'ESC'
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'ESC'
; ERROR: Invalid stack instruction: psh %eax ; Save case value
    mov bx, bp
    sub bx, 1
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; Move match expression value to EBX for comparison
; ERROR: Invalid stack instruction: pop %eax ; Restore case value to EAX for comparison
    cmp ax, bx
    je .L_block_body_174_3
    jmp .L_match_end_173
.L_block_body_174_0:
    mov bx, __var_SETTINGS_MENU_COUNT
    mov ax, 0
    mov bx, byte ax
    push ax
    mov ax, 1
    push ax
    mov bx, __var_settings_menu_selection
    mov ax, 0
    mov bx, byte ax
    pop bx
    add ax, bx
    pop bx
    ; TODO: Convert div %eax %ebx
; ERROR: Invalid mov instruction: mov %eax %edx ; Remainder is in EDX
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_settings_menu_selection
    mov byte bx, ax
    mov ax, 100
    push ax
    call sleep
    add sp, 4
    jmp .L_match_end_173
.L_block_body_174_1:
    mov bx, __var_SETTINGS_MENU_COUNT
    mov ax, 0
    mov bx, byte ax
    push ax
    mov bx, __var_SETTINGS_MENU_COUNT
    mov ax, 0
    mov bx, byte ax
    push ax
    mov ax, 1
    push ax
    mov bx, __var_settings_menu_selection
    mov ax, 0
    mov bx, byte ax
    pop bx
    ; TODO: Convert not %ebx
    ; TODO: Convert inx %ebx
    add ax, bx
    pop bx
    add ax, bx
    pop bx
    ; TODO: Convert div %eax %ebx
; ERROR: Invalid mov instruction: mov %eax %edx ; Remainder is in EDX
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_settings_menu_selection
    mov byte bx, ax
    mov ax, 100
    push ax
    call sleep
    add sp, 4
    jmp .L_match_end_173
.L_block_body_174_2:
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save case value
    mov bx, __var_settings_menu_selection
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; Move match expression value to EBX for comparison
; ERROR: Invalid stack instruction: pop %eax ; Restore case value to EAX for comparison
    cmp ax, bx
    je .L_block_body_175_0
    mov ax, 1
; ERROR: Invalid stack instruction: psh %eax ; Save case value
    mov bx, __var_settings_menu_selection
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; Move match expression value to EBX for comparison
; ERROR: Invalid stack instruction: pop %eax ; Restore case value to EAX for comparison
    cmp ax, bx
    je .L_block_body_175_1
    mov ax, 2
; ERROR: Invalid stack instruction: psh %eax ; Save case value
    mov bx, __var_settings_menu_selection
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; Move match expression value to EBX for comparison
; ERROR: Invalid stack instruction: pop %eax ; Restore case value to EAX for comparison
    cmp ax, bx
    je .L_block_body_175_2
    jmp .L_match_end_174
.L_block_body_175_0:
    mov bx, __var_VIEW_THEME
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_current_view
    mov byte bx, ax
    jmp .L_match_end_174
.L_block_body_175_1:
    mov bx, __var_VIEW_PASSWORD_SETUP
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_current_view
    mov byte bx, ax
    jmp .L_match_end_174
.L_block_body_175_2:
    mov bx, __var_VIEW_MAIN
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_current_view
    mov byte bx, ax
    jmp .L_match_end_174
.L_match_end_174:
    mov ax, 150
    push ax
    call sleep
    add sp, 4
    jmp .L_match_end_173
.L_block_body_174_3:
    mov bx, __var_VIEW_MAIN
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_current_view
    mov byte bx, ax
    mov ax, 150
    push ax
    call sleep
    add sp, 4
    jmp .L_match_end_173
.L_match_end_173:
.L_ret_handle_settings_menu_input:
; ERROR: Invalid mov instruction: mov %eax 0 ; Default return value
    mov sp, bp
    pop bp
    ret

handle_theme_menu_input:
    push bp
    mov bp, sp
; ERROR: Invalid sub instruction: sub %esp 1 ; Allocate space for ALL local variables
    call getkey
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 1
    mov byte bx, ax
    mov bx, __var_SC
; ERROR: Invalid add instruction: add %ebx 1 ; offset for field 'ARROW_DOWN'
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'ARROW_DOWN'
; ERROR: Invalid stack instruction: psh %eax ; Save case value
    mov bx, bp
    sub bx, 1
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; Move match expression value to EBX for comparison
; ERROR: Invalid stack instruction: pop %eax ; Restore case value to EAX for comparison
    cmp ax, bx
    je .L_block_body_176_0
    mov bx, __var_SC
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'ARROW_UP'
; ERROR: Invalid stack instruction: psh %eax ; Save case value
    mov bx, bp
    sub bx, 1
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; Move match expression value to EBX for comparison
; ERROR: Invalid stack instruction: pop %eax ; Restore case value to EAX for comparison
    cmp ax, bx
    je .L_block_body_176_1
    mov bx, __var_SC
; ERROR: Invalid add instruction: add %ebx 3 ; offset for field 'ENTER'
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'ENTER'
; ERROR: Invalid stack instruction: psh %eax ; Save case value
    mov bx, bp
    sub bx, 1
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; Move match expression value to EBX for comparison
; ERROR: Invalid stack instruction: pop %eax ; Restore case value to EAX for comparison
    cmp ax, bx
    je .L_block_body_176_2
    mov bx, __var_SC
; ERROR: Invalid add instruction: add %ebx 2 ; offset for field 'ESC'
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'ESC'
; ERROR: Invalid stack instruction: psh %eax ; Save case value
    mov bx, bp
    sub bx, 1
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; Move match expression value to EBX for comparison
; ERROR: Invalid stack instruction: pop %eax ; Restore case value to EAX for comparison
    cmp ax, bx
    je .L_block_body_176_3
    jmp .L_match_end_175
.L_block_body_176_0:
    mov bx, __var_THEME_MENU_COUNT
    mov ax, 0
    mov bx, byte ax
    push ax
    mov ax, 1
    push ax
    mov bx, __var_theme_menu_selection
    mov ax, 0
    mov bx, byte ax
    pop bx
    add ax, bx
    pop bx
    ; TODO: Convert div %eax %ebx
; ERROR: Invalid mov instruction: mov %eax %edx ; Remainder is in EDX
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_theme_menu_selection
    mov byte bx, ax
    mov ax, 100
    push ax
    call sleep
    add sp, 4
    jmp .L_match_end_175
.L_block_body_176_1:
    mov bx, __var_THEME_MENU_COUNT
    mov ax, 0
    mov bx, byte ax
    push ax
    mov bx, __var_THEME_MENU_COUNT
    mov ax, 0
    mov bx, byte ax
    push ax
    mov ax, 1
    push ax
    mov bx, __var_theme_menu_selection
    mov ax, 0
    mov bx, byte ax
    pop bx
    ; TODO: Convert not %ebx
    ; TODO: Convert inx %ebx
    add ax, bx
    pop bx
    add ax, bx
    pop bx
    ; TODO: Convert div %eax %ebx
; ERROR: Invalid mov instruction: mov %eax %edx ; Remainder is in EDX
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_theme_menu_selection
    mov byte bx, ax
    mov ax, 100
    push ax
    call sleep
    add sp, 4
    jmp .L_match_end_175
.L_block_body_176_2:
    mov bx, __var_theme_menu_selection
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_color_theme
    mov word bx, ax
    call apply_color_theme
    mov bx, __var_VIEW_SETTINGS
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_current_view
    mov byte bx, ax
    mov ax, 150
    push ax
    call sleep
    add sp, 4
    jmp .L_match_end_175
.L_block_body_176_3:
    mov bx, __var_VIEW_SETTINGS
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_current_view
    mov byte bx, ax
    mov ax, 150
    push ax
    call sleep
    add sp, 4
    jmp .L_match_end_175
.L_match_end_175:
.L_ret_handle_theme_menu_input:
; ERROR: Invalid mov instruction: mov %eax 0 ; Default return value
    mov sp, bp
    pop bp
    ret

draw_main_menu:
    push bp
    mov bp, sp
; ERROR: Invalid sub instruction: sub %esp 4 ; Allocate space for ALL local variables
    mov bx, __var_MAIN_BG
    mov ax, 0
    mov bx, byte ax
    push ax
    call set_background_color
    add sp, 4
    call clear_screen
    mov ax, __str_init_19
    push ax
    call draw_header
    add sp, 4
    mov ax, __str_init_20
    push ax
    call draw_footer
    add sp, 4
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
.L_while_start_176:
    mov bx, __var_MAIN_MENU_COUNT
    mov ax, 0
    mov bx, byte ax
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    pop bx
    cmp ax, bx
    jne .L_comp_true_178
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_178
.L_comp_true_178:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_178:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_while_end_176 ; Jump to end if condition is false
; --- while-body ---
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    push ax
    mov ax, 5
    pop bx
    add ax, bx
    push ax
    mov ax, 4
    push ax
    call set_cursor_pos
    add sp, 8
    mov bx, __var_main_menu_selection
    mov ax, 0
    mov bx, byte ax
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    pop bx
    cmp ax, bx
    je .L_comp_true_181
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_181
.L_comp_true_181:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_181:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_else_179 ; Jump to else if condition is false
; --- if-body ---
    mov bx, __var_SELECT_FG
    mov ax, 0
    mov bx, byte ax
    push ax
    call set_character_color
    add sp, 4
    mov bx, __var_SELECT_BG
    mov ax, 0
    mov bx, byte ax
    push ax
    call set_background_color
    add sp, 4
; ERROR: Invalid jump instruction: jmp .L_endif_179 ; End of if-body
.L_else_179:
; --- else-body ---
    mov bx, __var_MAIN_FG
    mov ax, 0
    mov bx, byte ax
    push ax
    call set_character_color
    add sp, 4
    mov bx, __var_MAIN_BG
    mov ax, 0
    mov bx, byte ax
    push ax
    call set_background_color
    add sp, 4
.L_endif_179:
    mov bx, bp
    sub bx, 4
    mov bx, word ax
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 4
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, __var_main_menu_items
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
; ERROR: Invalid memory instruction: ld %ebx %eax ; Load value from address
    push ax
    mov ax, __str_init_21
    push ax
    call printf
    mov ax, 1
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
    jmp .L_while_start_176
.L_while_end_176:
    call screen_flush
.L_ret_draw_main_menu:
; ERROR: Invalid mov instruction: mov %eax 0 ; Default return value
    mov sp, bp
    pop bp
    ret

draw_boot_menu:
    push bp
    mov bp, sp
; ERROR: Invalid sub instruction: sub %esp 4 ; Allocate space for ALL local variables
    mov bx, __var_MAIN_BG
    mov ax, 0
    mov bx, byte ax
    push ax
    call set_background_color
    add sp, 4
    call clear_screen
    mov ax, __str_init_22
    push ax
    call draw_header
    add sp, 4
    mov ax, __str_init_23
    push ax
    call draw_footer
    add sp, 4
    mov ax, 3
    push ax
    mov ax, 4
    push ax
    call set_cursor_pos
    add sp, 8
    mov bx, __var_HIGHLIGHT_FG
    mov ax, 0
    mov bx, byte ax
    push ax
    call set_character_color
    add sp, 4
    mov ax, __str_init_24
    push ax
    call printf
    mov ax, 0
    push ax
    mov bx, __var_bootable_disk_count
    mov ax, 0
    mov bx, byte ax
    pop bx
    cmp ax, bx
    je .L_comp_true_184
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_184
.L_comp_true_184:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_184:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_else_182 ; Jump to else if condition is false
; --- if-body ---
    mov ax, 5
    push ax
    mov ax, 4
    push ax
    call set_cursor_pos
    add sp, 8
    mov bx, __var_VGA_COLORS
; ERROR: Invalid add instruction: add %ebx 11 ; offset for field 'LIGHT_RED'
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'LIGHT_RED'
    push ax
    call set_character_color
    add sp, 4
    mov ax, __str_init_25
    push ax
    call printf
; ERROR: Invalid jump instruction: jmp .L_endif_182 ; End of if-body
.L_else_182:
; --- else-body ---
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
.L_while_start_185:
    mov bx, __var_bootable_disk_count
    mov ax, 0
    mov bx, byte ax
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    pop bx
    cmp ax, bx
    jne .L_comp_true_187
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_187
.L_comp_true_187:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_187:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_while_end_185 ; Jump to end if condition is false
; --- while-body ---
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    push ax
    mov ax, 5
    pop bx
    add ax, bx
    push ax
    mov ax, 4
    push ax
    call set_cursor_pos
    add sp, 8
    mov bx, __var_boot_menu_selection
    mov ax, 0
    mov bx, byte ax
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    pop bx
    cmp ax, bx
    je .L_comp_true_190
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_190
.L_comp_true_190:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_190:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_else_188 ; Jump to else if condition is false
; --- if-body ---
    mov bx, __var_SELECT_FG
    mov ax, 0
    mov bx, byte ax
    push ax
    call set_character_color
    add sp, 4
    mov bx, __var_SELECT_BG
    mov ax, 0
    mov bx, byte ax
    push ax
    call set_background_color
    add sp, 4
; ERROR: Invalid jump instruction: jmp .L_endif_188 ; End of if-body
.L_else_188:
; --- else-body ---
    mov bx, __var_MAIN_FG
    mov ax, 0
    mov bx, byte ax
    push ax
    call set_character_color
    add sp, 4
    mov bx, __var_MAIN_BG
    mov ax, 0
    mov bx, byte ax
    push ax
    call set_background_color
    add sp, 4
.L_endif_188:
    mov bx, bp
    sub bx, 4
    mov bx, word ax
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 4
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, __var_boot_menu_items
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
; ERROR: Invalid memory instruction: ld %ebx %eax ; Load value from address
    push ax
    mov ax, __str_init_26
    push ax
    call printf
    mov bx, __var_default_boot_disk
    mov bx, word ax
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 4
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, __var_bootable_disk_ids
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
; ERROR: Invalid memory instruction: ld %ebx %eax ; Load value from address
    pop bx
    cmp ax, bx
    je .L_comp_true_193
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_193
.L_comp_true_193:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_193:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_endif_191 ; Jump to end if condition is false
; --- if-body ---
    mov ax, __str_init_27
    push ax
    call printf
; ERROR: Invalid jump instruction: jmp .L_endif_191 ; End of if-body
.L_endif_191:
    mov ax, 1
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
    jmp .L_while_start_185
.L_while_end_185:
.L_endif_182:
    call screen_flush
.L_ret_draw_boot_menu:
; ERROR: Invalid mov instruction: mov %eax 0 ; Default return value
    mov sp, bp
    pop bp
    ret

draw_settings_menu:
    push bp
    mov bp, sp
; ERROR: Invalid sub instruction: sub %esp 4 ; Allocate space for ALL local variables
    mov bx, __var_MAIN_BG
    mov ax, 0
    mov bx, byte ax
    push ax
    call set_background_color
    add sp, 4
    call clear_screen
    mov ax, __str_init_28
    push ax
    call draw_header
    add sp, 4
    mov ax, __str_init_29
    push ax
    call draw_footer
    add sp, 4
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
.L_while_start_194:
    mov bx, __var_SETTINGS_MENU_COUNT
    mov ax, 0
    mov bx, byte ax
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    pop bx
    cmp ax, bx
    jne .L_comp_true_196
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_196
.L_comp_true_196:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_196:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_while_end_194 ; Jump to end if condition is false
; --- while-body ---
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    push ax
    mov ax, 5
    pop bx
    add ax, bx
    push ax
    mov ax, 4
    push ax
    call set_cursor_pos
    add sp, 8
    mov bx, __var_settings_menu_selection
    mov ax, 0
    mov bx, byte ax
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    pop bx
    cmp ax, bx
    je .L_comp_true_199
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_199
.L_comp_true_199:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_199:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_else_197 ; Jump to else if condition is false
; --- if-body ---
    mov bx, __var_SELECT_FG
    mov ax, 0
    mov bx, byte ax
    push ax
    call set_character_color
    add sp, 4
    mov bx, __var_SELECT_BG
    mov ax, 0
    mov bx, byte ax
    push ax
    call set_background_color
    add sp, 4
; ERROR: Invalid jump instruction: jmp .L_endif_197 ; End of if-body
.L_else_197:
; --- else-body ---
    mov bx, __var_MAIN_FG
    mov ax, 0
    mov bx, byte ax
    push ax
    call set_character_color
    add sp, 4
    mov bx, __var_MAIN_BG
    mov ax, 0
    mov bx, byte ax
    push ax
    call set_background_color
    add sp, 4
.L_endif_197:
    mov bx, bp
    sub bx, 4
    mov bx, word ax
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 4
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, __var_settings_menu_items
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
; ERROR: Invalid memory instruction: ld %ebx %eax ; Load value from address
    push ax
    mov ax, __str_init_30
    push ax
    call printf
    mov ax, 1
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
    jmp .L_while_start_194
.L_while_end_194:
    call screen_flush
.L_ret_draw_settings_menu:
; ERROR: Invalid mov instruction: mov %eax 0 ; Default return value
    mov sp, bp
    pop bp
    ret

draw_theme_menu:
    push bp
    mov bp, sp
; ERROR: Invalid sub instruction: sub %esp 4 ; Allocate space for ALL local variables
    mov bx, __var_MAIN_BG
    mov ax, 0
    mov bx, byte ax
    push ax
    call set_background_color
    add sp, 4
    call clear_screen
    mov ax, __str_init_31
    push ax
    call draw_header
    add sp, 4
    mov ax, __str_init_32
    push ax
    call draw_footer
    add sp, 4
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
.L_while_start_200:
    mov bx, __var_THEME_MENU_COUNT
    mov ax, 0
    mov bx, byte ax
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    pop bx
    cmp ax, bx
    jne .L_comp_true_202
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_202
.L_comp_true_202:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_202:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_while_end_200 ; Jump to end if condition is false
; --- while-body ---
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    push ax
    mov ax, 5
    pop bx
    add ax, bx
    push ax
    mov ax, 4
    push ax
    call set_cursor_pos
    add sp, 8
    mov bx, __var_theme_menu_selection
    mov ax, 0
    mov bx, byte ax
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    pop bx
    cmp ax, bx
    je .L_comp_true_205
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_205
.L_comp_true_205:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_205:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_else_203 ; Jump to else if condition is false
; --- if-body ---
    mov bx, __var_SELECT_FG
    mov ax, 0
    mov bx, byte ax
    push ax
    call set_character_color
    add sp, 4
    mov bx, __var_SELECT_BG
    mov ax, 0
    mov bx, byte ax
    push ax
    call set_background_color
    add sp, 4
; ERROR: Invalid jump instruction: jmp .L_endif_203 ; End of if-body
.L_else_203:
; --- else-body ---
    mov bx, __var_MAIN_FG
    mov ax, 0
    mov bx, byte ax
    push ax
    call set_character_color
    add sp, 4
    mov bx, __var_MAIN_BG
    mov ax, 0
    mov bx, byte ax
    push ax
    call set_background_color
    add sp, 4
.L_endif_203:
    mov bx, bp
    sub bx, 4
    mov bx, word ax
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 4
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, __var_theme_menu_items
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
; ERROR: Invalid memory instruction: ld %ebx %eax ; Load value from address
    push ax
    mov ax, __str_init_33
    push ax
    call printf
    mov bx, __var_color_theme
    mov bx, word ax
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    pop bx
    cmp ax, bx
    je .L_comp_true_208
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_208
.L_comp_true_208:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_208:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_endif_206 ; Jump to end if condition is false
; --- if-body ---
    mov ax, __str_init_34
    push ax
    call printf
; ERROR: Invalid jump instruction: jmp .L_endif_206 ; End of if-body
.L_endif_206:
    mov ax, 1
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
    jmp .L_while_start_200
.L_while_end_200:
    call screen_flush
.L_ret_draw_theme_menu:
; ERROR: Invalid mov instruction: mov %eax 0 ; Default return value
    mov sp, bp
    pop bp
    ret

display_sys_info:
    push bp
    mov bp, sp
; ERROR: Invalid sub instruction: sub %esp 29 ; Allocate space for ALL local variables
    mov bx, __var_MAIN_BG
    mov ax, 0
    mov bx, byte ax
    push ax
    call set_background_color
    add sp, 4
    call clear_screen
    mov ax, __str_init_35
    push ax
    call draw_header
    add sp, 4
    mov ax, __str_init_36
    push ax
    call draw_footer
    add sp, 4
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 29
    mov word bx, ax
    mov ax, bp
    sub ax, 29
    push ax
    mov ax, bp
    sub ax, 25
    push ax
    call get_hardware_info_safe
    add sp, 8
    mov bx, __var_HIGHLIGHT_FG
    mov ax, 0
    mov bx, byte ax
    push ax
    call set_character_color
    add sp, 4
    mov ax, 5
    push ax
    mov ax, 4
    push ax
    call set_cursor_pos
    add sp, 8
    mov ax, __str_init_37
    push ax
    call printf
    mov bx, __var_MAIN_FG
    mov ax, 0
    mov bx, byte ax
    push ax
    call set_character_color
    add sp, 4
    mov ax, 7
    push ax
    mov ax, 6
    push ax
    call set_cursor_pos
    add sp, 8
    mov ax, bp
    sub ax, 25
    push ax
    mov ax, __str_init_38
    push ax
    call printf
    mov ax, 8
    push ax
    mov ax, 6
    push ax
    call set_cursor_pos
    add sp, 8
    mov ax, __str_init_39
    push ax
    call printf
    mov ax, 10
    push ax
    mov ax, 6
    push ax
    call set_cursor_pos
    add sp, 8
    mov ax, 1024
    push ax
    mov ax, 1024
    push ax
    mov bx, bp
    sub bx, 29
    mov bx, word ax
    pop bx
    ; TODO: Convert div %eax %ebx
    pop bx
    ; TODO: Convert div %eax %ebx
    push ax
    mov ax, __str_init_40
    push ax
    call printf
    mov ax, 12
    push ax
    mov ax, 6
    push ax
    call set_cursor_pos
    add sp, 8
    mov bx, __var_bootable_disk_count
    mov ax, 0
    mov bx, byte ax
    push ax
    mov ax, __str_init_41
    push ax
    call printf
    call screen_flush
    mov ax, 150
    push ax
    call sleep
    add sp, 4
    call getkey
    mov ax, 20
    push ax
    call sleep
    add sp, 4
    mov bx, __var_VIEW_MAIN
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_current_view
    mov byte bx, ax
.L_ret_display_sys_info:
; ERROR: Invalid mov instruction: mov %eax 0 ; Default return value
    mov sp, bp
    pop bp
    ret

password_setup_screen:
    push bp
    mov bp, sp
; ERROR: Invalid sub instruction: sub %esp 34 ; Allocate space for ALL local variables
    mov bx, __var_MAIN_BG
    mov ax, 0
    mov bx, byte ax
    push ax
    call set_background_color
    add sp, 4
    call clear_screen
    mov ax, __str_init_42
    push ax
    call draw_header
    add sp, 4
    mov ax, __str_init_43
    push ax
    call draw_footer
    add sp, 4
    mov ax, 7
    push ax
    mov ax, 5
    push ax
    call set_cursor_pos
    add sp, 8
    mov bx, __var_MAIN_FG
    mov ax, 0
    mov bx, byte ax
    push ax
    call set_character_color
    add sp, 4
    mov ax, __str_init_44
    push ax
    call printf
    call screen_flush
    mov ax, 17
    push ax
    mov ax, bp
    sub ax, 17
    push ax
    call read_masked_input
    add sp, 8
    mov ax, 80
    push ax
    call sleep
    add sp, 4
    mov ax, 9
    push ax
    mov ax, 5
    push ax
    call set_cursor_pos
    add sp, 8
    mov ax, __str_init_45
    push ax
    call printf
    call screen_flush
    mov ax, 17
    push ax
    mov ax, bp
    sub ax, 34
    push ax
    call read_masked_input
    add sp, 8
    mov ax, 12
    push ax
    mov ax, 5
    push ax
    call set_cursor_pos
    add sp, 8
    mov ax, 0
    push ax
    mov ax, bp
    sub ax, 34
    push ax
    mov ax, bp
    sub ax, 17
    push ax
    call string_compare
    add sp, 8
    pop bx
    cmp ax, bx
    je .L_comp_true_211
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_211
.L_comp_true_211:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_211:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_else_209 ; Jump to else if condition is false
; --- if-body ---
    mov ax, bp
    sub ax, 17
    push ax
    mov ax, __var_bios_password
    push ax
    call string_copy
    add sp, 8
    mov ax, __str_init_46
    push ax
    call printf
; ERROR: Invalid jump instruction: jmp .L_endif_209 ; End of if-body
.L_else_209:
; --- else-body ---
    mov ax, __str_init_47
    push ax
    call printf
.L_endif_209:
    mov ax, 14
    push ax
    mov ax, 5
    push ax
    call set_cursor_pos
    add sp, 8
    mov ax, __str_init_48
    push ax
    call printf
    call screen_flush
    mov ax, 150
    push ax
    call sleep
    add sp, 4
    call getkey
    mov ax, 20
    push ax
    call sleep
    add sp, 4
    mov bx, __var_VIEW_SETTINGS
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_current_view
    mov byte bx, ax
.L_ret_password_setup_screen:
; ERROR: Invalid mov instruction: mov %eax 0 ; Default return value
    mov sp, bp
    pop bp
    ret

run_ram_check:
    push bp
    mov bp, sp
; ERROR: Invalid sub instruction: sub %esp 72 ; Allocate space for ALL local variables
    mov bx, __var_VGA_COLORS
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'BLACK'
    push ax
    call set_background_color
    add sp, 4
    call clear_screen
    mov bx, __var_VGA_COLORS
; ERROR: Invalid add instruction: add %ebx 15 ; offset for field 'WHITE'
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'WHITE'
    push ax
    call set_character_color
    add sp, 4
    mov ax, 5
    push ax
    mov ax, 5
    push ax
    call set_cursor_pos
    add sp, 8
    mov ax, __str_init_49
    push ax
    call printf
    call screen_flush
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 8
    mov word bx, ax
    int A
    mov ax, bp
    sub ax, 4
    mov word [4104], ax
    mov word [4104], [4096]
    mov ax, 2863311530
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 12
    mov word bx, ax
    mov ax, 262144
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 16
    mov word bx, ax
    mov ax, 1048576
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 20
    mov word bx, ax
    mov ax, 4194304
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 24
    mov word bx, ax
    mov ax, 5242880
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 28
    mov word bx, ax
    mov ax, 7340032
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 32
    mov word bx, ax
    mov ax, 8388608
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 36
    mov word bx, ax
    mov ax, 15728640
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 40
    mov word bx, ax
    mov ax, 16777216
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 44
    mov word bx, ax
    mov ax, 1048576
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 48
    mov word bx, ax
    mov bx, bp
    sub bx, 48
    mov bx, word ax
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    pop bx
    ; TODO: Convert not %ebx
    ; TODO: Convert inx %ebx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 52
    mov word bx, ax
    mov bx, bp
    sub bx, 20
    mov bx, word ax
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 56
    mov word bx, ax
.L_while_start_212:
    mov bx, bp
    sub bx, 52
    mov bx, word ax
    push ax
    mov bx, bp
    sub bx, 56
    mov bx, word ax
    pop bx
    cmp ax, bx
    jl .L_comp_true_214
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_214
.L_comp_true_214:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_214:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_while_end_212 ; Jump to end if condition is false
; --- while-body ---
    mov ax, 7
    push ax
    mov ax, 5
    push ax
    call set_cursor_pos
    add sp, 8
    mov ax, 1048576
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    pop bx
    ; TODO: Convert div %eax %ebx
    push ax
    mov ax, 1048576
    push ax
    mov bx, bp
    sub bx, 56
    mov bx, word ax
    pop bx
    ; TODO: Convert div %eax %ebx
    push ax
    mov ax, __str_init_50
    push ax
    call printf
    call screen_flush
    mov bx, bp
    sub bx, 28
    mov bx, word ax
    push ax
    mov bx, bp
    sub bx, 56
    mov bx, word ax
    pop bx
    cmp ax, bx
    jl .L_comp_true_217
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_217
.L_comp_true_217:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_217:
    push ax
    mov bx, bp
    sub bx, 24
    mov bx, word ax
    push ax
    mov bx, bp
    sub bx, 56
    mov bx, word ax
    pop bx
    cmp ax, bx
    jl .L_comp_false_220
    jmp .L_comp_true_219
.L_comp_false_220:
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_219
.L_comp_true_219:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_219:
    pop bx
    mov bx, bp
    sub bx, 24
    mov bx, word ax
    push ax
    mov bx, bp
    sub bx, 56
    mov bx, word ax
    pop bx
    cmp ax, bx
    jl .L_comp_false_225
    jmp .L_comp_true_224
.L_comp_false_225:
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_224
.L_comp_true_224:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_224:
    cmp ax, 0
    je .L_logic_false_222
    mov bx, bp
    sub bx, 28
    mov bx, word ax
    push ax
    mov bx, bp
    sub bx, 56
    mov bx, word ax
    pop bx
    cmp ax, bx
    jl .L_comp_true_227
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_227
.L_comp_true_227:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_227:
    cmp ax, 0
    je .L_logic_false_222
    mov ax, 1
    jmp .L_logic_end_221
.L_logic_false_222:
    mov ax, 0
.L_logic_end_221:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_endif_215 ; Jump to end if condition is false
; --- if-body ---
    mov bx, bp
    sub bx, 28
    mov bx, word ax
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 56
    mov word bx, ax
    jmp .L_while_start_212
; ERROR: Invalid jump instruction: jmp .L_endif_215 ; End of if-body
.L_endif_215:
    mov bx, bp
    sub bx, 36
    mov bx, word ax
    push ax
    mov bx, bp
    sub bx, 56
    mov bx, word ax
    pop bx
    cmp ax, bx
    jl .L_comp_true_230
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_230
.L_comp_true_230:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_230:
    push ax
    mov bx, bp
    sub bx, 32
    mov bx, word ax
    push ax
    mov bx, bp
    sub bx, 56
    mov bx, word ax
    pop bx
    cmp ax, bx
    jl .L_comp_false_233
    jmp .L_comp_true_232
.L_comp_false_233:
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_232
.L_comp_true_232:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_232:
    pop bx
    mov bx, bp
    sub bx, 32
    mov bx, word ax
    push ax
    mov bx, bp
    sub bx, 56
    mov bx, word ax
    pop bx
    cmp ax, bx
    jl .L_comp_false_238
    jmp .L_comp_true_237
.L_comp_false_238:
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_237
.L_comp_true_237:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_237:
    cmp ax, 0
    je .L_logic_false_235
    mov bx, bp
    sub bx, 36
    mov bx, word ax
    push ax
    mov bx, bp
    sub bx, 56
    mov bx, word ax
    pop bx
    cmp ax, bx
    jl .L_comp_true_240
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_240
.L_comp_true_240:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_240:
    cmp ax, 0
    je .L_logic_false_235
    mov ax, 1
    jmp .L_logic_end_234
.L_logic_false_235:
    mov ax, 0
.L_logic_end_234:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_endif_228 ; Jump to end if condition is false
; --- if-body ---
    mov bx, bp
    sub bx, 36
    mov bx, word ax
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 56
    mov word bx, ax
    jmp .L_while_start_212
; ERROR: Invalid jump instruction: jmp .L_endif_228 ; End of if-body
.L_endif_228:
    mov bx, bp
    sub bx, 44
    mov bx, word ax
    push ax
    mov bx, bp
    sub bx, 56
    mov bx, word ax
    pop bx
    cmp ax, bx
    jl .L_comp_true_243
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_243
.L_comp_true_243:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_243:
    push ax
    mov bx, bp
    sub bx, 40
    mov bx, word ax
    push ax
    mov bx, bp
    sub bx, 56
    mov bx, word ax
    pop bx
    cmp ax, bx
    jl .L_comp_false_246
    jmp .L_comp_true_245
.L_comp_false_246:
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_245
.L_comp_true_245:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_245:
    pop bx
    mov bx, bp
    sub bx, 40
    mov bx, word ax
    push ax
    mov bx, bp
    sub bx, 56
    mov bx, word ax
    pop bx
    cmp ax, bx
    jl .L_comp_false_251
    jmp .L_comp_true_250
.L_comp_false_251:
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_250
.L_comp_true_250:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_250:
    cmp ax, 0
    je .L_logic_false_248
    mov bx, bp
    sub bx, 44
    mov bx, word ax
    push ax
    mov bx, bp
    sub bx, 56
    mov bx, word ax
    pop bx
    cmp ax, bx
    jl .L_comp_true_253
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_253
.L_comp_true_253:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_253:
    cmp ax, 0
    je .L_logic_false_248
    mov ax, 1
    jmp .L_logic_end_247
.L_logic_false_248:
    mov ax, 0
.L_logic_end_247:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_endif_241 ; Jump to end if condition is false
; --- if-body ---
    mov bx, bp
    sub bx, 44
    mov bx, word ax
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 56
    mov word bx, ax
    jmp .L_while_start_212
; ERROR: Invalid jump instruction: jmp .L_endif_241 ; End of if-body
.L_endif_241:
    mov bx, bp
    sub bx, 16
    mov bx, word ax
    push ax
    mov bx, bp
    sub bx, 56
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 60
    mov word bx, ax
    mov bx, bp
    sub bx, 52
    mov bx, word ax
    push ax
    mov bx, bp
    sub bx, 60
    mov bx, word ax
    pop bx
    cmp ax, bx
    jg .L_comp_true_256
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_256
.L_comp_true_256:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_256:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_endif_254 ; Jump to end if condition is false
; --- if-body ---
    mov bx, bp
    sub bx, 52
    mov bx, word ax
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 60
    mov word bx, ax
; ERROR: Invalid jump instruction: jmp .L_endif_254 ; End of if-body
.L_endif_254:
    mov bx, bp
    sub bx, 56
    mov bx, word ax
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 64
    mov word bx, ax
.L_while_start_257:
    mov bx, bp
    sub bx, 60
    mov bx, word ax
    push ax
    mov bx, bp
    sub bx, 64
    mov bx, word ax
    pop bx
    cmp ax, bx
    jl .L_comp_true_259
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_259
.L_comp_true_259:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_259:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_while_end_257 ; Jump to end if condition is false
; --- while-body ---
    mov bx, bp
    sub bx, 28
    mov bx, word ax
    push ax
    mov bx, bp
    sub bx, 64
    mov bx, word ax
    pop bx
    cmp ax, bx
    jl .L_comp_true_262
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_262
.L_comp_true_262:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_262:
    push ax
    mov bx, bp
    sub bx, 24
    mov bx, word ax
    push ax
    mov bx, bp
    sub bx, 64
    mov bx, word ax
    pop bx
    cmp ax, bx
    jl .L_comp_false_265
    jmp .L_comp_true_264
.L_comp_false_265:
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_264
.L_comp_true_264:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_264:
    pop bx
    mov bx, bp
    sub bx, 24
    mov bx, word ax
    push ax
    mov bx, bp
    sub bx, 64
    mov bx, word ax
    pop bx
    cmp ax, bx
    jl .L_comp_false_270
    jmp .L_comp_true_269
.L_comp_false_270:
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_269
.L_comp_true_269:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_269:
    cmp ax, 0
    je .L_logic_false_267
    mov bx, bp
    sub bx, 28
    mov bx, word ax
    push ax
    mov bx, bp
    sub bx, 64
    mov bx, word ax
    pop bx
    cmp ax, bx
    jl .L_comp_true_272
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_272
.L_comp_true_272:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_272:
    cmp ax, 0
    je .L_logic_false_267
    mov ax, 1
    jmp .L_logic_end_266
.L_logic_false_267:
    mov ax, 0
.L_logic_end_266:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_endif_260 ; Jump to end if condition is false
; --- if-body ---
    mov bx, bp
    sub bx, 28
    mov bx, word ax
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 64
    mov word bx, ax
    jmp .L_while_start_257
; ERROR: Invalid jump instruction: jmp .L_endif_260 ; End of if-body
.L_endif_260:
    mov bx, bp
    sub bx, 36
    mov bx, word ax
    push ax
    mov bx, bp
    sub bx, 64
    mov bx, word ax
    pop bx
    cmp ax, bx
    jl .L_comp_true_275
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_275
.L_comp_true_275:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_275:
    push ax
    mov bx, bp
    sub bx, 32
    mov bx, word ax
    push ax
    mov bx, bp
    sub bx, 64
    mov bx, word ax
    pop bx
    cmp ax, bx
    jl .L_comp_false_278
    jmp .L_comp_true_277
.L_comp_false_278:
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_277
.L_comp_true_277:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_277:
    pop bx
    mov bx, bp
    sub bx, 32
    mov bx, word ax
    push ax
    mov bx, bp
    sub bx, 64
    mov bx, word ax
    pop bx
    cmp ax, bx
    jl .L_comp_false_283
    jmp .L_comp_true_282
.L_comp_false_283:
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_282
.L_comp_true_282:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_282:
    cmp ax, 0
    je .L_logic_false_280
    mov bx, bp
    sub bx, 36
    mov bx, word ax
    push ax
    mov bx, bp
    sub bx, 64
    mov bx, word ax
    pop bx
    cmp ax, bx
    jl .L_comp_true_285
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_285
.L_comp_true_285:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_285:
    cmp ax, 0
    je .L_logic_false_280
    mov ax, 1
    jmp .L_logic_end_279
.L_logic_false_280:
    mov ax, 0
.L_logic_end_279:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_endif_273 ; Jump to end if condition is false
; --- if-body ---
    mov bx, bp
    sub bx, 36
    mov bx, word ax
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 64
    mov word bx, ax
    jmp .L_while_start_257
; ERROR: Invalid jump instruction: jmp .L_endif_273 ; End of if-body
.L_endif_273:
    mov bx, bp
    sub bx, 44
    mov bx, word ax
    push ax
    mov bx, bp
    sub bx, 64
    mov bx, word ax
    pop bx
    cmp ax, bx
    jl .L_comp_true_288
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_288
.L_comp_true_288:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_288:
    push ax
    mov bx, bp
    sub bx, 40
    mov bx, word ax
    push ax
    mov bx, bp
    sub bx, 64
    mov bx, word ax
    pop bx
    cmp ax, bx
    jl .L_comp_false_291
    jmp .L_comp_true_290
.L_comp_false_291:
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_290
.L_comp_true_290:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_290:
    pop bx
    mov bx, bp
    sub bx, 40
    mov bx, word ax
    push ax
    mov bx, bp
    sub bx, 64
    mov bx, word ax
    pop bx
    cmp ax, bx
    jl .L_comp_false_296
    jmp .L_comp_true_295
.L_comp_false_296:
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_295
.L_comp_true_295:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_295:
    cmp ax, 0
    je .L_logic_false_293
    mov bx, bp
    sub bx, 44
    mov bx, word ax
    push ax
    mov bx, bp
    sub bx, 64
    mov bx, word ax
    pop bx
    cmp ax, bx
    jl .L_comp_true_298
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_298
.L_comp_true_298:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_298:
    cmp ax, 0
    je .L_logic_false_293
    mov ax, 1
    jmp .L_logic_end_292
.L_logic_false_293:
    mov ax, 0
.L_logic_end_292:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_endif_286 ; Jump to end if condition is false
; --- if-body ---
    mov bx, bp
    sub bx, 44
    mov bx, word ax
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 64
    mov word bx, ax
    jmp .L_while_start_257
; ERROR: Invalid jump instruction: jmp .L_endif_286 ; End of if-body
.L_endif_286:
    mov bx, bp
    sub bx, 64
    mov bx, word ax
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 68
    mov word bx, ax
    mov bx, bp
    sub bx, 68
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; EBX теперь хранит адрес для чтения
; ERROR: Invalid memory instruction: ld %ebx %eax ; Загружаем значение по адресу из %ebx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 72
    mov word bx, ax
    mov bx, bp
    sub bx, 12
    mov bx, word ax
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, bp
    sub bx, 68
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; %ebx = адрес для записи
; ERROR: Invalid stack instruction: pop %eax ; %eax = значение для записи
; ERROR: Invalid memory instruction: sd %ebx %eax ; Записываем значение по разыменованному указателю
    mov bx, bp
    sub bx, 12
    mov bx, word ax
    push ax
    mov bx, bp
    sub bx, 68
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; EBX теперь хранит адрес для чтения
; ERROR: Invalid memory instruction: ld %ebx %eax ; Загружаем значение по адресу из %ebx
    pop bx
    cmp ax, bx
    jne .L_comp_true_301
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_301
.L_comp_true_301:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_301:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_endif_299 ; Jump to end if condition is false
; --- if-body ---
    mov ax, 1
    push ax
    mov bx, bp
    sub bx, 8
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 8
    mov word bx, ax
; ERROR: Invalid jump instruction: jmp .L_endif_299 ; End of if-body
.L_endif_299:
    mov bx, bp
    sub bx, 72
    mov bx, word ax
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, bp
    sub bx, 68
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; %ebx = адрес для записи
; ERROR: Invalid stack instruction: pop %eax ; %eax = значение для записи
; ERROR: Invalid memory instruction: sd %ebx %eax ; Записываем значение по разыменованному указателю
    mov ax, 4
    push ax
    mov bx, bp
    sub bx, 64
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 64
    mov word bx, ax
    jmp .L_while_start_257
.L_while_end_257:
    mov bx, bp
    sub bx, 16
    mov bx, word ax
    push ax
    mov bx, bp
    sub bx, 56
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 56
    mov word bx, ax
    jmp .L_while_start_212
.L_while_end_212:
    mov ax, 9
    push ax
    mov ax, 5
    push ax
    call set_cursor_pos
    add sp, 8
    mov ax, 0
    push ax
    mov bx, bp
    sub bx, 8
    mov bx, word ax
    pop bx
    cmp ax, bx
    jne .L_comp_true_304
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_304
.L_comp_true_304:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_304:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_else_302 ; Jump to else if condition is false
; --- if-body ---
    mov bx, __var_VGA_COLORS
; ERROR: Invalid add instruction: add %ebx 4 ; offset for field 'RED'
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'RED'
    push ax
    call set_character_color
    add sp, 4
    mov bx, bp
    sub bx, 8
    mov bx, word ax
    push ax
    mov ax, __str_init_51
    push ax
    call printf
    mov bx, __var_VGA_COLORS
; ERROR: Invalid add instruction: add %ebx 15 ; offset for field 'WHITE'
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'WHITE'
    push ax
    call set_character_color
    add sp, 4
; ERROR: Invalid jump instruction: jmp .L_endif_302 ; End of if-body
.L_else_302:
; --- else-body ---
    mov ax, __str_init_52
    push ax
    call printf
.L_endif_302:
    mov ax, 11
    push ax
    mov ax, 5
    push ax
    call set_cursor_pos
    add sp, 8
    mov ax, __str_init_53
    push ax
    call printf
    call screen_flush
    mov ax, 150
    push ax
    call sleep
    add sp, 4
    call getkey
    mov ax, 80
    push ax
    call sleep
    add sp, 4
    mov bx, __var_VIEW_MAIN
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_current_view
    mov byte bx, ax
.L_ret_run_ram_check:
; ERROR: Invalid mov instruction: mov %eax 0 ; Default return value
    mov sp, bp
    pop bp
    ret

load_and_boot:
    push bp
    mov bp, sp
    mov ax, 0
    push ax
    mov bx, __var_bootable_disk_count
    mov ax, 0
    mov bx, byte ax
    pop bx
    cmp ax, bx
    jne .L_comp_true_307
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_307
.L_comp_true_307:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_307:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_endif_305 ; Jump to end if condition is false
; --- if-body ---
    mov bx, bp
    add bx, 8
    mov bx, word ax
    mov word [4104], ax
    mov [4098], word [4104]
    mov si, 00010000
    mov di, 030000
    mov cx, 512
.copy_loop:
    ; TODO: Convert ldds %e9
    mov byte di, ax
    ; TODO: Convert inx %esi
    ; TODO: Convert lp .copy_loop
.boot_start:
    ; TODO: Convert xor %eax %eax
    ; TODO: Convert xor %ebx %ebx
    ; TODO: Convert xor %ecx %ecx
    ; TODO: Convert xor %edx %edx
    ; TODO: Convert xor %esi %esi
    ; TODO: Convert xor %egi %egi
    ; TODO: Convert xor %e8 %e8
    jmp 030000
; ERROR: Invalid jump instruction: jmp .L_endif_305 ; End of if-body
.L_endif_305:
.L_ret_load_and_boot:
; ERROR: Invalid mov instruction: mov %eax 0 ; Default return value
    mov sp, bp
    pop bp
    ret

printf_interrupt:
    push bp
    mov bp, sp
    mov bx, bp
    add bx, 8
    mov bx, word ax
    push ax
    call printf
    mov sp, bp
    pop bp
    ; TODO: Convert irts
.L_ret_printf_interrupt:
; ERROR: Invalid mov instruction: mov %eax 0 ; Default return value
    mov sp, bp
    pop bp
    ret

print_newline_interrupt:
    push bp
    mov bp, sp
    call print_newline
    ; TODO: Convert irts
.L_ret_print_newline_interrupt:
; ERROR: Invalid mov instruction: mov %eax 0 ; Default return value
    mov sp, bp
    pop bp
    ret

clear_screen_interrupt:
    push bp
    mov bp, sp
    call clear_screen
    ; TODO: Convert irts
.L_ret_clear_screen_interrupt:
; ERROR: Invalid mov instruction: mov %eax 0 ; Default return value
    mov sp, bp
    pop bp
    ret

init_interrupts:
    push bp
    mov bp, sp
    mov si, printf_interrupt
    ; TODO: Convert sti $72
    mov si, print_newline_interrupt
    ; TODO: Convert sti $73
    mov si, clear_screen_interrupt
    ; TODO: Convert sti $70
.L_ret_init_interrupts:
; ERROR: Invalid mov instruction: mov %eax 0 ; Default return value
    mov sp, bp
    pop bp
    ret

read_masked_input:
    push bp
    mov bp, sp
; ERROR: Invalid sub instruction: sub %esp 5 ; Allocate space for ALL local variables
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov ax, 0
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 1
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, bp
    add bx, 8
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; %ebx = базовый адрес (значение указателя)
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
; ERROR: Invalid memory instruction: sd %ebx %eax ; Записываем значение по адресу
.L_while_start_308:
    mov ax, 1
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_while_end_308 ; Jump to end if condition is false
; --- while-body ---
    call getkey
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 5
    mov byte bx, ax
    mov ax, 0
    push ax
    mov bx, bp
    sub bx, 5
    mov ax, 0
    mov bx, byte ax
    pop bx
    cmp ax, bx
    jne .L_comp_true_311
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_311
.L_comp_true_311:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_311:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_endif_309 ; Jump to end if condition is false
; --- if-body ---
    mov ax, 20
    push ax
    call sleep
    add sp, 4
    mov bx, __var_SC
; ERROR: Invalid add instruction: add %ebx 3 ; offset for field 'ENTER'
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'ENTER'
    push ax
    mov bx, bp
    sub bx, 5
    mov ax, 0
    mov bx, byte ax
    pop bx
    cmp ax, bx
    je .L_comp_true_314
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_314
.L_comp_true_314:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_314:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_endif_312 ; Jump to end if condition is false
; --- if-body ---
    jmp .L_while_end_308
; ERROR: Invalid jump instruction: jmp .L_endif_312 ; End of if-body
.L_endif_312:
    mov bx, __var_SC
; ERROR: Invalid add instruction: add %ebx 4 ; offset for field 'BACKSPACE'
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'BACKSPACE'
    push ax
    mov bx, bp
    sub bx, 5
    mov ax, 0
    mov bx, byte ax
    pop bx
    cmp ax, bx
    je .L_comp_true_317
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_317
.L_comp_true_317:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_317:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_endif_315 ; Jump to end if condition is false
; --- if-body ---
    mov ax, 0
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    pop bx
    cmp ax, bx
    jne .L_comp_true_320
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_320
.L_comp_true_320:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_320:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_endif_318 ; Jump to end if condition is false
; --- if-body ---
    mov ax, 1
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    pop bx
    ; TODO: Convert not %ebx
    ; TODO: Convert inx %ebx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, bp
    sub bx, 4
    mov bx, word ax
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 1
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, bp
    add bx, 8
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; %ebx = базовый адрес (значение указателя)
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
; ERROR: Invalid memory instruction: sd %ebx %eax ; Записываем значение по адресу
    mov ax, __str_init_54
    push ax
    call printf
; ERROR: Invalid jump instruction: jmp .L_endif_318 ; End of if-body
.L_endif_318:
; ERROR: Invalid jump instruction: jmp .L_endif_315 ; End of if-body
.L_endif_315:
    mov ax, 126
    push ax
    mov bx, bp
    sub bx, 5
    mov ax, 0
    mov bx, byte ax
    pop bx
    cmp ax, bx
    jg .L_comp_false_324
    jmp .L_comp_true_323
.L_comp_false_324:
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_323
.L_comp_true_323:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_323:
    push ax
    mov ax, 32
    push ax
    mov bx, bp
    sub bx, 5
    mov ax, 0
    mov bx, byte ax
    pop bx
    cmp ax, bx
    jl .L_comp_false_327
    jmp .L_comp_true_326
.L_comp_false_327:
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_326
.L_comp_true_326:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_326:
    pop bx
    mov ax, 32
    push ax
    mov bx, bp
    sub bx, 5
    mov ax, 0
    mov bx, byte ax
    pop bx
    cmp ax, bx
    jl .L_comp_false_332
    jmp .L_comp_true_331
.L_comp_false_332:
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_331
.L_comp_true_331:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_331:
    cmp ax, 0
    je .L_logic_false_329
    mov ax, 126
    push ax
    mov bx, bp
    sub bx, 5
    mov ax, 0
    mov bx, byte ax
    pop bx
    cmp ax, bx
    jg .L_comp_false_335
    jmp .L_comp_true_334
.L_comp_false_335:
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_334
.L_comp_true_334:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_334:
    cmp ax, 0
    je .L_logic_false_329
    mov ax, 1
    jmp .L_logic_end_328
.L_logic_false_329:
    mov ax, 0
.L_logic_end_328:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_endif_321 ; Jump to end if condition is false
; --- if-body ---
    mov ax, 1
    push ax
    mov bx, bp
    add bx, 12
    mov bx, word ax
    pop bx
    ; TODO: Convert not %ebx
    ; TODO: Convert inx %ebx
    add ax, bx
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    pop bx
    cmp ax, bx
    jl .L_comp_true_338
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_338
.L_comp_true_338:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_338:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_endif_336 ; Jump to end if condition is false
; --- if-body ---
    mov bx, bp
    sub bx, 5
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, bp
    sub bx, 4
    mov bx, word ax
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 1
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, bp
    add bx, 8
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; %ebx = базовый адрес (значение указателя)
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
; ERROR: Invalid memory instruction: sd %ebx %eax ; Записываем значение по адресу
    mov ax, 1
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, bp
    sub bx, 4
    mov bx, word ax
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 1
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, bp
    add bx, 8
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; %ebx = базовый адрес (значение указателя)
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
; ERROR: Invalid memory instruction: sd %ebx %eax ; Записываем значение по адресу
    mov ax, __str_init_55
    push ax
    call printf
; ERROR: Invalid jump instruction: jmp .L_endif_336 ; End of if-body
.L_endif_336:
; ERROR: Invalid jump instruction: jmp .L_endif_321 ; End of if-body
.L_endif_321:
    call screen_flush
; ERROR: Invalid jump instruction: jmp .L_endif_309 ; End of if-body
.L_endif_309:
    jmp .L_while_start_308
.L_while_end_308:
.L_ret_read_masked_input:
; ERROR: Invalid mov instruction: mov %eax 0 ; Default return value
    mov sp, bp
    pop bp
    ret

run_post_screen:
    push bp
    mov bp, sp
; ERROR: Invalid sub instruction: sub %esp 37 ; Allocate space for ALL local variables
    mov bx, __var_VGA_COLORS
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'BLACK'
    push ax
    call set_background_color
    add sp, 4
    call clear_screen
    mov bx, __var_VGA_COLORS
; ERROR: Invalid add instruction: add %ebx 15 ; offset for field 'WHITE'
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'WHITE'
    push ax
    call set_character_color
    add sp, 4
    mov ax, 5
    push ax
    mov ax, 5
    push ax
    call set_cursor_pos
    add sp, 8
    mov ax, __str_init_56
    push ax
    call printf
    call screen_flush
    mov ax, 200
    push ax
    call sleep
    add sp, 4
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 29
    mov word bx, ax
    mov ax, bp
    sub ax, 29
    push ax
    mov ax, bp
    sub ax, 25
    push ax
    call get_hardware_info_safe
    add sp, 8
    mov ax, 7
    push ax
    mov ax, 5
    push ax
    call set_cursor_pos
    add sp, 8
    mov ax, bp
    sub ax, 25
    push ax
    mov ax, __str_init_57
    push ax
    call printf
    call screen_flush
    mov ax, 200
    push ax
    call sleep
    add sp, 4
    mov ax, 8
    push ax
    mov ax, 5
    push ax
    call set_cursor_pos
    add sp, 8
    mov ax, 1024
    push ax
    mov ax, 1024
    push ax
    mov bx, bp
    sub bx, 29
    mov bx, word ax
    pop bx
    ; TODO: Convert div %eax %ebx
    pop bx
    ; TODO: Convert div %eax %ebx
    push ax
    mov ax, __str_init_58
    push ax
    call printf
    call screen_flush
    mov ax, 200
    push ax
    call sleep
    add sp, 4
    mov ax, 9
    push ax
    mov ax, 5
    push ax
    call set_cursor_pos
    add sp, 8
    mov ax, 0
    push ax
    mov bx, __var_bootable_disk_count
    mov ax, 0
    mov bx, byte ax
    pop bx
    cmp ax, bx
    jne .L_comp_true_341
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_341
.L_comp_true_341:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_341:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_else_339 ; Jump to else if condition is false
; --- if-body ---
    mov bx, __var_VGA_COLORS
; ERROR: Invalid add instruction: add %ebx 15 ; offset for field 'WHITE'
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'WHITE'
    push ax
    call set_character_color
    add sp, 4
    mov bx, __var_bootable_disk_count
    mov ax, 0
    mov bx, byte ax
    push ax
    mov ax, __str_init_59
    push ax
    call printf
; ERROR: Invalid jump instruction: jmp .L_endif_339 ; End of if-body
.L_else_339:
; --- else-body ---
    mov bx, __var_VGA_COLORS
; ERROR: Invalid add instruction: add %ebx 14 ; offset for field 'YELLOW'
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'YELLOW'
    push ax
    call set_character_color
    add sp, 4
    mov ax, __str_init_60
    push ax
    call printf
    mov bx, __var_VGA_COLORS
; ERROR: Invalid add instruction: add %ebx 15 ; offset for field 'WHITE'
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'WHITE'
    push ax
    call set_character_color
    add sp, 4
.L_endif_339:
    call screen_flush
    mov ax, 200
    push ax
    call sleep
    add sp, 4
    mov ax, 5
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 33
    mov word bx, ax
.L_while_start_342:
    mov ax, 0
    push ax
    mov bx, bp
    sub bx, 33
    mov bx, word ax
    pop bx
    cmp ax, bx
    jne .L_comp_true_344
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_344
.L_comp_true_344:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_344:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_while_end_342 ; Jump to end if condition is false
; --- while-body ---
    mov ax, 12
    push ax
    mov ax, 5
    push ax
    call set_cursor_pos
    add sp, 8
    mov bx, bp
    sub bx, 33
    mov bx, word ax
    push ax
    mov ax, __str_init_61
    push ax
    call printf
    call screen_flush
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 37
    mov word bx, ax
.L_while_start_345:
    mov ax, 10
    push ax
    mov bx, bp
    sub bx, 37
    mov bx, word ax
    pop bx
    cmp ax, bx
    jne .L_comp_true_347
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_347
.L_comp_true_347:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_347:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_while_end_345 ; Jump to end if condition is false
; --- while-body ---
    mov ax, 1
    push ax
    mov bx, __var_SC
; ERROR: Invalid add instruction: add %ebx 2 ; offset for field 'ESC'
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'ESC'
    push ax
    call key_in_buffer
    add sp, 4
    pop bx
    cmp ax, bx
    je .L_comp_true_350
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_350
.L_comp_true_350:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_350:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_endif_348 ; Jump to end if condition is false
; --- if-body ---
    mov ax, 1
    jmp .L_ret_run_post_screen
; ERROR: Invalid jump instruction: jmp .L_endif_348 ; End of if-body
.L_endif_348:
    mov ax, 100
    push ax
    call sleep
    add sp, 4
    mov ax, 1
    push ax
    mov bx, bp
    sub bx, 37
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 37
    mov word bx, ax
    jmp .L_while_start_345
.L_while_end_345:
    mov ax, 1
    push ax
    mov bx, bp
    sub bx, 33
    mov bx, word ax
    pop bx
    ; TODO: Convert not %ebx
    ; TODO: Convert inx %ebx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 33
    mov word bx, ax
    jmp .L_while_start_342
.L_while_end_342:
    mov ax, 0
    jmp .L_ret_run_post_screen
.L_ret_run_post_screen:
    mov sp, bp
    pop bp
    ret

get_hardware_info_safe:
    push bp
    mov bp, sp
    mov bx, bp
    add bx, 8
    mov bx, word ax
    mov word [4104], ax
    mov [4108], word [4104]
    int A
    mov word [4108], ax
    mov word [4108], bx
    mov word [4108], cx
    mov word [4108], dx
    mov word [4108], si
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov ax, 20
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 1
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, bp
    add bx, 8
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; %ebx = базовый адрес (значение указателя)
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
; ERROR: Invalid memory instruction: sd %ebx %eax ; Записываем значение по адресу
    int A
    mov bx, bp
    add bx, 12
    mov bx, word ax
    mov word [4104], ax
    mov word [4104], [4096]
.L_ret_get_hardware_info_safe:
; ERROR: Invalid mov instruction: mov %eax 0 ; Default return value
    mov sp, bp
    pop bp
    ret

find_bootable_disks:
    push bp
    mov bp, sp
; ERROR: Invalid sub instruction: sub %esp 12 ; Allocate space for ALL local variables
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_bootable_disk_count
    mov byte bx, ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
.L_while_start_351:
    mov ax, 8
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    pop bx
    cmp ax, bx
    jne .L_comp_true_353
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_353
.L_comp_true_353:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_353:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_while_end_351 ; Jump to end if condition is false
; --- while-body ---
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 8
    mov word bx, ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    mov word [4104], ax
    mov dx, word [4104]
    int 0B
    mov ax, bp
    sub ax, 8
    mov word [4104], ax
    mov word [4104], dx
    mov ax, 0
    push ax
    mov bx, bp
    sub bx, 8
    mov bx, word ax
    pop bx
    cmp ax, bx
    jne .L_comp_true_356
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_356
.L_comp_true_356:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_356:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_endif_354 ; Jump to end if condition is false
; --- if-body ---
    mov ax, 32
    push ax
    mov bx, __var_bootable_disk_count
    mov ax, 0
    mov bx, byte ax
    pop bx
    ; TODO: Convert mul %eax %ebx
    push ax
    mov ax, __var_boot_menu_text_buffer
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 12
    mov word bx, ax
    mov ax, 1024
    push ax
    mov ax, 1024
    push ax
    mov bx, bp
    sub bx, 8
    mov bx, word ax
    pop bx
    ; TODO: Convert div %eax %ebx
    pop bx
    ; TODO: Convert div %eax %ebx
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    push ax
    mov ax, __str_init_62
    push ax
    mov bx, bp
    sub bx, 12
    mov bx, word ax
    push ax
    call sprintf
    mov bx, bp
    sub bx, 12
    mov bx, word ax
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, __var_bootable_disk_count
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 4
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, __var_boot_menu_items
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
; ERROR: Invalid memory instruction: sd %ebx %eax ; Записываем значение по адресу
    mov bx, bp
    sub bx, 4
    mov bx, word ax
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, __var_bootable_disk_count
    mov ax, 0
    mov bx, byte ax
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 4
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, __var_bootable_disk_ids
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
; ERROR: Invalid memory instruction: sd %ebx %eax ; Записываем значение по адресу
    mov ax, 1
    push ax
    mov bx, __var_bootable_disk_count
    mov ax, 0
    mov bx, byte ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_bootable_disk_count
    mov byte bx, ax
; ERROR: Invalid jump instruction: jmp .L_endif_354 ; End of if-body
.L_endif_354:
    mov ax, 1
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
    jmp .L_while_start_351
.L_while_end_351:
.L_ret_find_bootable_disks:
; ERROR: Invalid mov instruction: mov %eax 0 ; Default return value
    mov sp, bp
    pop bp
    ret

draw_header:
    push bp
    mov bp, sp
; ERROR: Invalid sub instruction: sub %esp 16 ; Allocate space for ALL local variables
    mov ax, 0
    push ax
    mov ax, 0
    push ax
    call set_cursor_pos
    add sp, 8
    mov bx, __var_HEADER_BG
    mov ax, 0
    mov bx, byte ax
    push ax
    call set_background_color
    add sp, 4
    mov bx, __var_HEADER_FG
    mov ax, 0
    mov bx, byte ax
    push ax
    call set_character_color
    add sp, 4
    mov bx, bp
    add bx, 8
    mov bx, word ax
    push ax
    call strlen
    add sp, 4
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    push ax
    mov ax, 80
    pop bx
    ; TODO: Convert not %ebx
    ; TODO: Convert inx %ebx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 8
    mov word bx, ax
    mov ax, 2
    push ax
    mov bx, bp
    sub bx, 8
    mov bx, word ax
    pop bx
    ; TODO: Convert div %eax %ebx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 12
    mov word bx, ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 16
    mov word bx, ax
.L_while_start_357:
    mov bx, bp
    sub bx, 12
    mov bx, word ax
    push ax
    mov bx, bp
    sub bx, 16
    mov bx, word ax
    pop bx
    cmp ax, bx
    jne .L_comp_true_359
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_359
.L_comp_true_359:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_359:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_while_end_357 ; Jump to end if condition is false
; --- while-body ---
    mov ax, __str_init_63
    push ax
    call printf
    mov ax, 1
    push ax
    mov bx, bp
    sub bx, 16
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 16
    mov word bx, ax
    jmp .L_while_start_357
.L_while_end_357:
    mov bx, bp
    add bx, 8
    mov bx, word ax
    push ax
    mov ax, __str_init_64
    push ax
    call printf
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 16
    mov word bx, ax
.L_while_start_360:
    mov bx, bp
    sub bx, 12
    mov bx, word ax
    push ax
    mov bx, bp
    sub bx, 8
    mov bx, word ax
    pop bx
    ; TODO: Convert not %ebx
    ; TODO: Convert inx %ebx
    add ax, bx
    push ax
    mov bx, bp
    sub bx, 16
    mov bx, word ax
    pop bx
    cmp ax, bx
    jne .L_comp_true_362
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_362
.L_comp_true_362:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_362:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_while_end_360 ; Jump to end if condition is false
; --- while-body ---
    mov ax, __str_init_65
    push ax
    call printf
    mov ax, 1
    push ax
    mov bx, bp
    sub bx, 16
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 16
    mov word bx, ax
    jmp .L_while_start_360
.L_while_end_360:
.L_ret_draw_header:
; ERROR: Invalid mov instruction: mov %eax 0 ; Default return value
    mov sp, bp
    pop bp
    ret

draw_footer:
    push bp
    mov bp, sp
; ERROR: Invalid sub instruction: sub %esp 8 ; Allocate space for ALL local variables
    mov ax, 58
    push ax
    mov ax, 0
    push ax
    call set_cursor_pos
    add sp, 8
    mov bx, __var_HEADER_BG
    mov ax, 0
    mov bx, byte ax
    push ax
    call set_background_color
    add sp, 4
    mov bx, __var_HEADER_FG
    mov ax, 0
    mov bx, byte ax
    push ax
    call set_character_color
    add sp, 4
    mov bx, bp
    add bx, 8
    mov bx, word ax
    push ax
    call strlen
    add sp, 4
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
    mov bx, bp
    add bx, 8
    mov bx, word ax
    push ax
    mov ax, __str_init_66
    push ax
    call printf
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 8
    mov word bx, ax
.L_while_start_363:
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    push ax
    mov ax, 79
    pop bx
    ; TODO: Convert not %ebx
    ; TODO: Convert inx %ebx
    add ax, bx
    push ax
    mov bx, bp
    sub bx, 8
    mov bx, word ax
    pop bx
    cmp ax, bx
    jne .L_comp_true_365
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_365
.L_comp_true_365:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_365:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_while_end_363 ; Jump to end if condition is false
; --- while-body ---
    mov ax, __str_init_67
    push ax
    call printf
    mov ax, 1
    push ax
    mov bx, bp
    sub bx, 8
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 8
    mov word bx, ax
    jmp .L_while_start_363
.L_while_end_363:
.L_ret_draw_footer:
; ERROR: Invalid mov instruction: mov %eax 0 ; Default return value
    mov sp, bp
    pop bp
    ret

save_settings:
    push bp
    mov bp, sp
; ERROR: Invalid sub instruction: sub %esp 32 ; Allocate space for ALL local variables
    mov ax, 0
    push ax
    mov bx, __var_bootable_disk_count
    mov ax, 0
    mov bx, byte ax
    pop bx
    cmp ax, bx
    je .L_comp_true_368
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_368
.L_comp_true_368:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_368:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_endif_366 ; Jump to end if condition is false
; --- if-body ---
    mov ax, 0
    jmp .L_ret_save_settings
; ERROR: Invalid jump instruction: jmp .L_endif_366 ; End of if-body
.L_endif_366:
    mov ax, 71
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov ax, 0
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 1
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, bp
    sub bx, 32
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
; ERROR: Invalid memory instruction: sb %ebx %eax ; Записываем значение по адресу
    mov ax, 67
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov ax, 1
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 1
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, bp
    sub bx, 32
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
; ERROR: Invalid memory instruction: sb %ebx %eax ; Записываем значение по адресу
    mov ax, 66
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov ax, 2
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 1
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, bp
    sub bx, 32
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
; ERROR: Invalid memory instruction: sb %ebx %eax ; Записываем значение по адресу
    mov ax, 83
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov ax, 3
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 1
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, bp
    sub bx, 32
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
; ERROR: Invalid memory instruction: sb %ebx %eax ; Записываем значение по адресу
    mov ax, 4
    push ax
    mov ax, __var_default_boot_disk
    push ax
    mov ax, 4
    push ax
    mov ax, bp
    sub ax, 32
    pop bx
    add ax, bx
    push ax
    call memory_copy
    add sp, 12
    mov ax, 4
    push ax
    mov ax, __var_color_theme
    push ax
    mov ax, 8
    push ax
    mov ax, bp
    sub ax, 32
    pop bx
    add ax, bx
    push ax
    call memory_copy
    add sp, 12
    mov ax, 17
    push ax
    mov ax, __var_bios_password
    push ax
    mov ax, 12
    push ax
    mov ax, bp
    sub ax, 32
    pop bx
    add ax, bx
    push ax
    call memory_copy
    add sp, 12
    mov word [4098], 0
    mov si, 512
    mov ax, bp
    sub ax, 32
    mov word [4104], ax
    mov di, word [4104]
    mov cx, 32
.save_loop:
    mov di, byte ax
    ; TODO: Convert stds %e9
    ; TODO: Convert inx %esi
    ; TODO: Convert lp .save_loop
.L_ret_save_settings:
; ERROR: Invalid mov instruction: mov %eax 0 ; Default return value
    mov sp, bp
    pop bp
    ret

load_settings:
    push bp
    mov bp, sp
; ERROR: Invalid sub instruction: sub %esp 32 ; Allocate space for ALL local variables
    mov ax, 0
    push ax
    mov bx, __var_bootable_disk_count
    mov ax, 0
    mov bx, byte ax
    pop bx
    cmp ax, bx
    je .L_comp_true_371
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_371
.L_comp_true_371:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_371:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_endif_369 ; Jump to end if condition is false
; --- if-body ---
    mov ax, 0
    push ax
    mov bx, __var_bootable_disk_count
    mov ax, 0
    mov bx, byte ax
    pop bx
    cmp ax, bx
    jne .L_comp_true_374
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_374
.L_comp_true_374:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_374:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_endif_372 ; Jump to end if condition is false
; --- if-body ---
    mov ax, 0
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 4
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, __var_bootable_disk_ids
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
; ERROR: Invalid memory instruction: ld %ebx %eax ; Load value from address
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_default_boot_disk
    mov word bx, ax
; ERROR: Invalid jump instruction: jmp .L_endif_372 ; End of if-body
.L_endif_372:
    mov ax, 0
    jmp .L_ret_load_settings
; ERROR: Invalid jump instruction: jmp .L_endif_369 ; End of if-body
.L_endif_369:
    mov word [4098], 0
    mov si, 512
    mov ax, bp
    sub ax, 32
    mov word [4104], ax
    mov di, word [4104]
    mov cx, 32
.load_loop:
    ; TODO: Convert ldds %e9
    mov byte di, ax
    ; TODO: Convert inx %esi
    ; TODO: Convert lp .load_loop
    mov ax, 83
    push ax
    mov ax, 3
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 1
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, bp
    sub bx, 32
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value from address
    pop bx
    cmp ax, bx
    je .L_comp_true_377
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_377
.L_comp_true_377:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_377:
    push ax
    mov ax, 66
    push ax
    mov ax, 2
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 1
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, bp
    sub bx, 32
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value from address
    pop bx
    cmp ax, bx
    je .L_comp_true_379
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_379
.L_comp_true_379:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_379:
    push ax
    mov ax, 67
    push ax
    mov ax, 1
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 1
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, bp
    sub bx, 32
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value from address
    pop bx
    cmp ax, bx
    je .L_comp_true_381
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_381
.L_comp_true_381:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_381:
    push ax
    mov ax, 71
    push ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 1
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, bp
    sub bx, 32
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value from address
    pop bx
    cmp ax, bx
    je .L_comp_true_383
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_383
.L_comp_true_383:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_383:
    pop bx
    mov ax, 71
    push ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 1
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, bp
    sub bx, 32
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value from address
    pop bx
    cmp ax, bx
    je .L_comp_true_387
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_387
.L_comp_true_387:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_387:
    cmp ax, 0
    je .L_logic_false_385
    mov ax, 67
    push ax
    mov ax, 1
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 1
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, bp
    sub bx, 32
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value from address
    pop bx
    cmp ax, bx
    je .L_comp_true_389
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_389
.L_comp_true_389:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_389:
    cmp ax, 0
    je .L_logic_false_385
    mov ax, 1
    jmp .L_logic_end_384
.L_logic_false_385:
    mov ax, 0
.L_logic_end_384:
    pop bx
    mov ax, 67
    push ax
    mov ax, 1
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 1
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, bp
    sub bx, 32
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value from address
    pop bx
    cmp ax, bx
    je .L_comp_true_393
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_393
.L_comp_true_393:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_393:
    push ax
    mov ax, 71
    push ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 1
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, bp
    sub bx, 32
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value from address
    pop bx
    cmp ax, bx
    je .L_comp_true_395
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_395
.L_comp_true_395:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_395:
    pop bx
    mov ax, 71
    push ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 1
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, bp
    sub bx, 32
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value from address
    pop bx
    cmp ax, bx
    je .L_comp_true_399
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_399
.L_comp_true_399:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_399:
    cmp ax, 0
    je .L_logic_false_397
    mov ax, 67
    push ax
    mov ax, 1
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 1
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, bp
    sub bx, 32
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value from address
    pop bx
    cmp ax, bx
    je .L_comp_true_401
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_401
.L_comp_true_401:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_401:
    cmp ax, 0
    je .L_logic_false_397
    mov ax, 1
    jmp .L_logic_end_396
.L_logic_false_397:
    mov ax, 0
.L_logic_end_396:
    cmp ax, 0
    je .L_logic_false_391
    mov ax, 66
    push ax
    mov ax, 2
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 1
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, bp
    sub bx, 32
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value from address
    pop bx
    cmp ax, bx
    je .L_comp_true_403
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_403
.L_comp_true_403:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_403:
    cmp ax, 0
    je .L_logic_false_391
    mov ax, 1
    jmp .L_logic_end_390
.L_logic_false_391:
    mov ax, 0
.L_logic_end_390:
    pop bx
    mov ax, 66
    push ax
    mov ax, 2
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 1
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, bp
    sub bx, 32
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value from address
    pop bx
    cmp ax, bx
    je .L_comp_true_407
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_407
.L_comp_true_407:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_407:
    push ax
    mov ax, 67
    push ax
    mov ax, 1
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 1
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, bp
    sub bx, 32
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value from address
    pop bx
    cmp ax, bx
    je .L_comp_true_409
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_409
.L_comp_true_409:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_409:
    push ax
    mov ax, 71
    push ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 1
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, bp
    sub bx, 32
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value from address
    pop bx
    cmp ax, bx
    je .L_comp_true_411
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_411
.L_comp_true_411:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_411:
    pop bx
    mov ax, 71
    push ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 1
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, bp
    sub bx, 32
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value from address
    pop bx
    cmp ax, bx
    je .L_comp_true_415
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_415
.L_comp_true_415:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_415:
    cmp ax, 0
    je .L_logic_false_413
    mov ax, 67
    push ax
    mov ax, 1
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 1
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, bp
    sub bx, 32
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value from address
    pop bx
    cmp ax, bx
    je .L_comp_true_417
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_417
.L_comp_true_417:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_417:
    cmp ax, 0
    je .L_logic_false_413
    mov ax, 1
    jmp .L_logic_end_412
.L_logic_false_413:
    mov ax, 0
.L_logic_end_412:
    pop bx
    mov ax, 67
    push ax
    mov ax, 1
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 1
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, bp
    sub bx, 32
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value from address
    pop bx
    cmp ax, bx
    je .L_comp_true_421
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_421
.L_comp_true_421:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_421:
    push ax
    mov ax, 71
    push ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 1
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, bp
    sub bx, 32
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value from address
    pop bx
    cmp ax, bx
    je .L_comp_true_423
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_423
.L_comp_true_423:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_423:
    pop bx
    mov ax, 71
    push ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 1
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, bp
    sub bx, 32
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value from address
    pop bx
    cmp ax, bx
    je .L_comp_true_427
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_427
.L_comp_true_427:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_427:
    cmp ax, 0
    je .L_logic_false_425
    mov ax, 67
    push ax
    mov ax, 1
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 1
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, bp
    sub bx, 32
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value from address
    pop bx
    cmp ax, bx
    je .L_comp_true_429
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_429
.L_comp_true_429:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_429:
    cmp ax, 0
    je .L_logic_false_425
    mov ax, 1
    jmp .L_logic_end_424
.L_logic_false_425:
    mov ax, 0
.L_logic_end_424:
    cmp ax, 0
    je .L_logic_false_419
    mov ax, 66
    push ax
    mov ax, 2
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 1
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, bp
    sub bx, 32
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value from address
    pop bx
    cmp ax, bx
    je .L_comp_true_431
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_431
.L_comp_true_431:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_431:
    cmp ax, 0
    je .L_logic_false_419
    mov ax, 1
    jmp .L_logic_end_418
.L_logic_false_419:
    mov ax, 0
.L_logic_end_418:
    cmp ax, 0
    je .L_logic_false_405
    mov ax, 83
    push ax
    mov ax, 3
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 1
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, bp
    sub bx, 32
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value from address
    pop bx
    cmp ax, bx
    je .L_comp_true_433
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_433
.L_comp_true_433:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_433:
    cmp ax, 0
    je .L_logic_false_405
    mov ax, 1
    jmp .L_logic_end_404
.L_logic_false_405:
    mov ax, 0
.L_logic_end_404:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_else_375 ; Jump to else if condition is false
; --- if-body ---
    mov ax, 4
    push ax
    mov ax, 4
    push ax
    mov ax, bp
    sub ax, 32
    pop bx
    add ax, bx
    push ax
    mov ax, __var_default_boot_disk
    push ax
    call memory_copy
    add sp, 12
    mov ax, 4
    push ax
    mov ax, 8
    push ax
    mov ax, bp
    sub ax, 32
    pop bx
    add ax, bx
    push ax
    mov ax, __var_color_theme
    push ax
    call memory_copy
    add sp, 12
    mov ax, 17
    push ax
    mov ax, 12
    push ax
    mov ax, bp
    sub ax, 32
    pop bx
    add ax, bx
    push ax
    mov ax, __var_bios_password
    push ax
    call memory_copy
    add sp, 12
; ERROR: Invalid jump instruction: jmp .L_endif_375 ; End of if-body
.L_else_375:
; --- else-body ---
    mov ax, 0
    push ax
    mov bx, __var_bootable_disk_count
    mov ax, 0
    mov bx, byte ax
    pop bx
    cmp ax, bx
    jne .L_comp_true_436
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_436
.L_comp_true_436:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_436:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_endif_434 ; Jump to end if condition is false
; --- if-body ---
    mov ax, 0
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 4
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, __var_bootable_disk_ids
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
; ERROR: Invalid memory instruction: ld %ebx %eax ; Load value from address
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_default_boot_disk
    mov word bx, ax
; ERROR: Invalid jump instruction: jmp .L_endif_434 ; End of if-body
.L_endif_434:
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_color_theme
    mov word bx, ax
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov ax, 0
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 1
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, __var_bios_password
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
; ERROR: Invalid memory instruction: sb %ebx %eax ; Записываем значение по адресу
.L_endif_375:
.L_ret_load_settings:
; ERROR: Invalid mov instruction: mov %eax 0 ; Default return value
    mov sp, bp
    pop bp
    ret

apply_color_theme:
    push bp
    mov bp, sp
    mov ax, 1
; ERROR: Invalid stack instruction: psh %eax ; Save case value
    mov bx, __var_color_theme
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; Move match expression value to EBX for comparison
; ERROR: Invalid stack instruction: pop %eax ; Restore case value to EAX for comparison
    cmp ax, bx
    je .L_block_body_438_0
    mov ax, 2
; ERROR: Invalid stack instruction: psh %eax ; Save case value
    mov bx, __var_color_theme
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; Move match expression value to EBX for comparison
; ERROR: Invalid stack instruction: pop %eax ; Restore case value to EAX for comparison
    cmp ax, bx
    je .L_block_body_438_1
    jmp .L_block_body_438_2
.L_block_body_438_0:
    mov bx, __var_VGA_COLORS
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'BLACK'
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_HEADER_BG
    mov byte bx, ax
    mov bx, __var_VGA_COLORS
; ERROR: Invalid add instruction: add %ebx 2 ; offset for field 'GREEN'
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'GREEN'
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_HEADER_FG
    mov byte bx, ax
    mov bx, __var_VGA_COLORS
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'BLACK'
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_MAIN_BG
    mov byte bx, ax
    mov bx, __var_VGA_COLORS
; ERROR: Invalid add instruction: add %ebx 2 ; offset for field 'GREEN'
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'GREEN'
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_MAIN_FG
    mov byte bx, ax
    mov bx, __var_VGA_COLORS
; ERROR: Invalid add instruction: add %ebx 2 ; offset for field 'GREEN'
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'GREEN'
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_SELECT_BG
    mov byte bx, ax
    mov bx, __var_VGA_COLORS
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'BLACK'
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_SELECT_FG
    mov byte bx, ax
    mov bx, __var_VGA_COLORS
; ERROR: Invalid add instruction: add %ebx 9 ; offset for field 'LIGHT_GREEN'
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'LIGHT_GREEN'
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_HIGHLIGHT_FG
    mov byte bx, ax
    jmp .L_match_end_437
.L_block_body_438_1:
    mov bx, __var_VGA_COLORS
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'BLACK'
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_HEADER_BG
    mov byte bx, ax
    mov bx, __var_VGA_COLORS
; ERROR: Invalid add instruction: add %ebx 5 ; offset for field 'BROWN'
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'BROWN'
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_HEADER_FG
    mov byte bx, ax
    mov bx, __var_VGA_COLORS
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'BLACK'
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_MAIN_BG
    mov byte bx, ax
    mov bx, __var_VGA_COLORS
; ERROR: Invalid add instruction: add %ebx 5 ; offset for field 'BROWN'
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'BROWN'
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_MAIN_FG
    mov byte bx, ax
    mov bx, __var_VGA_COLORS
; ERROR: Invalid add instruction: add %ebx 5 ; offset for field 'BROWN'
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'BROWN'
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_SELECT_BG
    mov byte bx, ax
    mov bx, __var_VGA_COLORS
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'BLACK'
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_SELECT_FG
    mov byte bx, ax
    mov bx, __var_VGA_COLORS
; ERROR: Invalid add instruction: add %ebx 14 ; offset for field 'YELLOW'
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'YELLOW'
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_HIGHLIGHT_FG
    mov byte bx, ax
    jmp .L_match_end_437
.L_block_body_438_2:
    mov bx, __var_VGA_COLORS
; ERROR: Invalid add instruction: add %ebx 7 ; offset for field 'DARK_GRAY'
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'DARK_GRAY'
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_HEADER_BG
    mov byte bx, ax
    mov bx, __var_VGA_COLORS
; ERROR: Invalid add instruction: add %ebx 15 ; offset for field 'WHITE'
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'WHITE'
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_HEADER_FG
    mov byte bx, ax
    mov bx, __var_VGA_COLORS
; ERROR: Invalid add instruction: add %ebx 1 ; offset for field 'BLUE'
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'BLUE'
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_MAIN_BG
    mov byte bx, ax
    mov bx, __var_VGA_COLORS
; ERROR: Invalid add instruction: add %ebx 6 ; offset for field 'LIGHT_GRAY'
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'LIGHT_GRAY'
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_MAIN_FG
    mov byte bx, ax
    mov bx, __var_VGA_COLORS
; ERROR: Invalid add instruction: add %ebx 7 ; offset for field 'DARK_GRAY'
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'DARK_GRAY'
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_SELECT_BG
    mov byte bx, ax
    mov bx, __var_VGA_COLORS
; ERROR: Invalid add instruction: add %ebx 15 ; offset for field 'WHITE'
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'WHITE'
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_SELECT_FG
    mov byte bx, ax
    mov bx, __var_VGA_COLORS
; ERROR: Invalid add instruction: add %ebx 14 ; offset for field 'YELLOW'
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Load value of field 'YELLOW'
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, __var_HIGHLIGHT_FG
    mov byte bx, ax
.L_match_end_437:
.L_ret_apply_color_theme:
; ERROR: Invalid mov instruction: mov %eax 0 ; Default return value
    mov sp, bp
    pop bp
    ret

string_compare:
    push bp
    mov bp, sp
.L_while_start_438:
    mov bx, bp
    add bx, 12
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Загружаем значение по адресу из %ebx
    push ax
    mov bx, bp
    add bx, 8
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Загружаем значение по адресу из %ebx
    pop bx
    cmp ax, bx
    je .L_comp_true_440
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_440
.L_comp_true_440:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_440:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_while_end_438 ; Jump to end if condition is false
; --- while-body ---
    mov ax, 0
    push ax
    mov bx, bp
    add bx, 8
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; EBX теперь хранит адрес для чтения
    mov ax, 0
; ERROR: Invalid memory instruction: lb %ebx %eax ; Загружаем значение по адресу из %ebx
    pop bx
    cmp ax, bx
    je .L_comp_true_443
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_443
.L_comp_true_443:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_443:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_endif_441 ; Jump to end if condition is false
; --- if-body ---
    mov ax, 0
    jmp .L_ret_string_compare
; ERROR: Invalid jump instruction: jmp .L_endif_441 ; End of if-body
.L_endif_441:
    mov ax, 1
    push ax
    mov bx, bp
    add bx, 8
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    add bx, 8
    mov word bx, ax
    mov ax, 1
    push ax
    mov bx, bp
    add bx, 12
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    add bx, 12
    mov word bx, ax
    jmp .L_while_start_438
.L_while_end_438:
    mov ax, 1
    jmp .L_ret_string_compare
.L_ret_string_compare:
    mov sp, bp
    pop bp
    ret

string_copy:
    push bp
    mov bp, sp
; ERROR: Invalid sub instruction: sub %esp 4 ; Allocate space for ALL local variables
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
.L_while_start_444:
    mov ax, 1
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_while_end_444 ; Jump to end if condition is false
; --- while-body ---
    mov bx, bp
    sub bx, 4
    mov bx, word ax
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 1
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, bp
    add bx, 12
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; %ebx = базовый адрес (значение указателя)
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
; ERROR: Invalid memory instruction: ld %ebx %eax ; Load value from address
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, bp
    sub bx, 4
    mov bx, word ax
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 1
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, bp
    add bx, 8
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; %ebx = базовый адрес (значение указателя)
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
; ERROR: Invalid memory instruction: sd %ebx %eax ; Записываем значение по адресу
    mov ax, 0
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 1
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, bp
    add bx, 8
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; %ebx = базовый адрес (значение указателя)
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
; ERROR: Invalid memory instruction: ld %ebx %eax ; Load value from address
    pop bx
    cmp ax, bx
    je .L_comp_true_447
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_447
.L_comp_true_447:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_447:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_endif_445 ; Jump to end if condition is false
; --- if-body ---
    jmp .L_while_end_444
; ERROR: Invalid jump instruction: jmp .L_endif_445 ; End of if-body
.L_endif_445:
    mov ax, 1
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
    jmp .L_while_start_444
.L_while_end_444:
.L_ret_string_copy:
; ERROR: Invalid mov instruction: mov %eax 0 ; Default return value
    mov sp, bp
    pop bp
    ret

memory_copy:
    push bp
    mov bp, sp
; ERROR: Invalid sub instruction: sub %esp 4 ; Allocate space for ALL local variables
    mov ax, 0
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
.L_while_start_448:
    mov bx, bp
    add bx, 16
    mov bx, word ax
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    pop bx
    cmp ax, bx
    jne .L_comp_true_450
; ERROR: Invalid mov instruction: mov %eax 0 ; False
    jmp .L_comp_end_450
.L_comp_true_450:
; ERROR: Invalid mov instruction: mov %eax 1 ; True
.L_comp_end_450:
    cmp ax, 0
; ERROR: Invalid jump instruction: je .L_while_end_448 ; Jump to end if condition is false
; --- while-body ---
    mov bx, bp
    sub bx, 4
    mov bx, word ax
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 1
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, bp
    add bx, 12
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; %ebx = базовый адрес (значение указателя)
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
; ERROR: Invalid memory instruction: ld %ebx %eax ; Load value from address
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
    mov bx, bp
    sub bx, 4
    mov bx, word ax
; ERROR: Invalid stack instruction: psh %ebx ; Сохраняем %ebx
    mov bx, 1
    ; TODO: Convert mul %eax %ebx  ; eax = offset
; ERROR: Invalid mov instruction: mov %e8 %eax ; Сохраняем offset в %e8
; ERROR: Invalid stack instruction: pop %ebx ; Восстанавливаем %ebx
    mov bx, bp
    add bx, 8
    mov bx, word ax
; ERROR: Invalid mov instruction: mov %ebx %eax ; %ebx = базовый адрес (значение указателя)
; ERROR: Invalid add instruction: add %ebx %e8 ; %ebx = base_address + offset
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
; ERROR: Invalid memory instruction: sd %ebx %eax ; Записываем значение по адресу
    mov ax, 1
    push ax
    mov bx, bp
    sub bx, 4
    mov bx, word ax
    pop bx
    add ax, bx
; ERROR: Invalid stack instruction: psh %eax ; Save expression result
; ERROR: Invalid stack instruction: pop %eax ; Восстанавливаем результат для записи
    mov bx, bp
    sub bx, 4
    mov word bx, ax
    jmp .L_while_start_448
.L_while_end_448:
.L_ret_memory_copy:
; ERROR: Invalid mov instruction: mov %eax 0 ; Default return value
    mov sp, bp
    pop bp
    ret

; === Data Section ===
    ; TODO: Convert __var_VGA_COLORS: reserve 16 bytes
    ; TODO: Convert __var_text_ptr: reserve 4 bytes
    ; TODO: Convert __var_videomode_ptr: reserve 4 bytes
    ; TODO: Convert __var_color_ptr: reserve 4 bytes
    ; TODO: Convert __var_buffer_length: reserve 4 bytes
    ; TODO: Convert __var_auto_flush: reserve 1 bytes
    ; TODO: Convert __var_cursor_x: reserve 1 bytes
    ; TODO: Convert __var_cursor_y: reserve 1 bytes
    ; TODO: Convert __var__current_character_color: reserve 1 bytes
    ; TODO: Convert __var__current_background_color: reserve 1 bytes
    ; TODO: Convert __var_text_screen_width: reserve 1 bytes
    ; TODO: Convert __var_text_screen_height: reserve 1 bytes
    ; TODO: Convert __var_is_exit: reserve 1 bytes
    ; TODO: Convert __var_current_view: reserve 1 bytes
    ; TODO: Convert __var_main_menu_selection: reserve 1 bytes
    ; TODO: Convert __var_boot_menu_selection: reserve 1 bytes
    ; TODO: Convert __var_settings_menu_selection: reserve 1 bytes
    ; TODO: Convert __var_theme_menu_selection: reserve 1 bytes
    ; TODO: Convert __var_default_boot_disk: reserve 4 bytes
    ; TODO: Convert __var_color_theme: reserve 4 bytes
    ; TODO: Convert __var_bios_password: reserve 17 bytes
    ; TODO: Convert __var_HEADER_BG: reserve 1 bytes
    ; TODO: Convert __var_HEADER_FG: reserve 1 bytes
    ; TODO: Convert __var_MAIN_BG: reserve 1 bytes
    ; TODO: Convert __var_MAIN_FG: reserve 1 bytes
    ; TODO: Convert __var_SELECT_BG: reserve 1 bytes
    ; TODO: Convert __var_SELECT_FG: reserve 1 bytes
    ; TODO: Convert __var_HIGHLIGHT_FG: reserve 1 bytes
    ; TODO: Convert __var_main_menu_items: reserve 20 bytes
    ; TODO: Convert __var_main_item_1: reserve 21 bytes
    ; TODO: Convert __str_init_global_0: bytes "Select Boot Device"  0
    ; TODO: Convert __var_main_item_2: reserve 21 bytes
    ; TODO: Convert __str_init_global_1: bytes "System Information"  0
    ; TODO: Convert __var_main_item_3: reserve 21 bytes
    ; TODO: Convert __str_init_global_2: bytes "Run RAM Check"  0
    ; TODO: Convert __var_main_item_4: reserve 21 bytes
    ; TODO: Convert __str_init_global_3: bytes "BIOS Settings"  0
    ; TODO: Convert __var_main_item_5: reserve 21 bytes
    ; TODO: Convert __str_init_global_4: bytes "Save & Exit"  0
    ; TODO: Convert __var_MAIN_MENU_COUNT: reserve 1 bytes
    ; TODO: Convert __var_settings_menu_items: reserve 12 bytes
    ; TODO: Convert __var_settings_item_1: reserve 21 bytes
    ; TODO: Convert __str_init_global_5: bytes "Change Color Theme"  0
    ; TODO: Convert __var_settings_item_2: reserve 21 bytes
    ; TODO: Convert __str_init_global_6: bytes "Set Supervisor Password"  0
    ; TODO: Convert __var_settings_item_3: reserve 21 bytes
    ; TODO: Convert __str_init_global_7: bytes "Return to Main Menu"  0
    ; TODO: Convert __var_SETTINGS_MENU_COUNT: reserve 1 bytes
    ; TODO: Convert __var_theme_menu_items: reserve 12 bytes
    ; TODO: Convert __var_theme_item_1: reserve 21 bytes
    ; TODO: Convert __str_init_global_8: bytes "Classic Blue"  0
    ; TODO: Convert __var_theme_item_2: reserve 21 bytes
    ; TODO: Convert __str_init_global_9: bytes "Hacker Green"  0
    ; TODO: Convert __var_theme_item_3: reserve 21 bytes
    ; TODO: Convert __str_init_global_10: bytes "Amber Monochrome"  0
    ; TODO: Convert __var_THEME_MENU_COUNT: reserve 1 bytes
    ; TODO: Convert __var_boot_menu_items: reserve 32 bytes
    ; TODO: Convert __var_bootable_disk_count: reserve 1 bytes
    ; TODO: Convert __var_bootable_disk_ids: reserve 32 bytes
    ; TODO: Convert __var_boot_menu_text_buffer: reserve 256 bytes
    ; TODO: Convert __var_SC: reserve 5 bytes
    ; TODO: Convert __var_VIEW_MAIN: reserve 1 bytes
    ; TODO: Convert __var_VIEW_BOOT: reserve 1 bytes
    ; TODO: Convert __var_VIEW_SYSINFO: reserve 1 bytes
    ; TODO: Convert __var_VIEW_RAMCHECK: reserve 1 bytes
    ; TODO: Convert __var_VIEW_SETTINGS: reserve 1 bytes
    ; TODO: Convert __var_VIEW_THEME: reserve 1 bytes
    ; TODO: Convert __var_VIEW_PASSWORD_SETUP: reserve 1 bytes
__var_float_0:
    ; TODO: Convert bytes 0 0 0 0 ; Float value: 0.0
__var_float_1:
    ; TODO: Convert bytes 0 0 128 63 ; Float value: 1.0
__var_float_2:
    ; TODO: Convert bytes 0 80 195 71 ; Float value: 100000.0
__var_float_3:
    ; TODO: Convert bytes 0 0 0 63 ; Float value: 0.5
    ; TODO: Convert __str_init_11: bytes "abcdefghijklmnopqrstuvwxyz1234567890" $0A $1B $7F $09 " -=[]" $5C "`';'`,./"  0
    ; TODO: Convert __str_init_12: bytes "ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%^&*()" $0A $1B $7F $09 " _+{}|~:" $5C $22 "~<>?"  0
    ; TODO: Convert __str_init_13: bytes $13 $E0 $E1 $E2 $E3 $E4 $E5 $E6 $E7 $E8 $E9 $EA $EB $14 $17 $12 $07 $C3 $C2 $FE $B4 $C1 $10 $11 $1F $1E  0
    ; TODO: Convert __str_init_14: bytes "abcdefghijklmnopqrstuvwxyz1234567890" $0A $1B $7F $09 " -=[]" $5C "`';'`,./"  0
    ; TODO: Convert __str_init_15: bytes "ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%^&*()" $0A $1B $7F $09 " _+{}|~:" $5C $22 "~<>?"  0
    ; TODO: Convert __str_init_16: bytes $13 $E0 $E1 $E2 $E3 $E4 $E5 $E6 $E7 $E8 $E9 $EA $EB $14 $17 $12 $07 $C3 $C2 $FE $B4 $C1 $10 $11 $1F $1E  0
    ; TODO: Convert __str_init_17: bytes "Press any key to exit from this program..." 0
    ; TODO: Convert __str_init_18: bytes "FATAL ERROR: No bootable device found or boot failed." $0A $0A 0
    ; TODO: Convert __str_init_19: bytes "GovnoCore32-20020 BIOS Setup Utility" 0
    ; TODO: Convert __str_init_20: bytes "Arrow Keys: Select | Enter: Confirm | ESC: Exit" 0
    ; TODO: Convert __str_init_21: bytes "   %s   " 0
    ; TODO: Convert __str_init_22: bytes "Boot Device Selection" 0
    ; TODO: Convert __str_init_23: bytes "Arrows: Select | Enter: Set Default | ESC: Back" 0
    ; TODO: Convert __str_init_24: bytes "Select a disk to boot from:" 0
    ; TODO: Convert __str_init_25: bytes "No bootable disks found." 0
    ; TODO: Convert __str_init_26: bytes "   %s   " 0
    ; TODO: Convert __str_init_27: bytes " <- Default" 0
    ; TODO: Convert __str_init_28: bytes "BIOS Settings" 0
    ; TODO: Convert __str_init_29: bytes "Enter: Select | ESC: Back" 0
    ; TODO: Convert __str_init_30: bytes "   %s   " 0
    ; TODO: Convert __str_init_31: bytes "Color Theme Selection" 0
    ; TODO: Convert __str_init_32: bytes "Arrows: Select | Enter: Apply | ESC: Back" 0
    ; TODO: Convert __str_init_33: bytes "   %s   " 0
    ; TODO: Convert __str_init_34: bytes " <- Current" 0
    ; TODO: Convert __str_init_35: bytes "System Information" 0
    ; TODO: Convert __str_init_36: bytes "Press any key to return..." 0
    ; TODO: Convert __str_init_37: bytes "System Information:" 0
    ; TODO: Convert __str_init_38: bytes "CPU Type                 : %s" 0
    ; TODO: Convert __str_init_39: bytes "CPU Speed                : 8.5 THz (Holy 2.0)" 0
    ; TODO: Convert __str_init_40: bytes "Total Memory             : %i MB" 0
    ; TODO: Convert __str_init_41: bytes "Bootable Drives Detected : %i" 0
    ; TODO: Convert __str_init_42: bytes "Set Supervisor Password" 0
    ; TODO: Convert __str_init_43: bytes "Enter: Confirm | ESC: Cancel" 0
    ; TODO: Convert __str_init_44: bytes "Enter New Password : " 0
    ; TODO: Convert __str_init_45: bytes "Confirm Password   : " 0
    ; TODO: Convert __str_init_46: bytes "Password has been set successfully!" 0
    ; TODO: Convert __str_init_47: bytes "Error: Passwords do not match." 0
    ; TODO: Convert __str_init_48: bytes "Press any key to continue..." 0
    ; TODO: Convert __str_init_49: bytes "Performing RAM check..." 0
    ; TODO: Convert __str_init_50: bytes "Checked: %i / %i MB " 0
    ; TODO: Convert __str_init_51: bytes "RAM check completed. ERRORS FOUND: %i" 0
    ; TODO: Convert __str_init_52: bytes "RAM check completed. OK. No errors found.         " 0
    ; TODO: Convert __str_init_53: bytes "Press any key to return..." 0
    ; TODO: Convert __str_init_54: bytes "\b \b" 0
    ; TODO: Convert __str_init_55: bytes "*" 0
    ; TODO: Convert __str_init_56: bytes "GovnoCore32-20020 BIOS v2.0" 0
    ; TODO: Convert __str_init_57: bytes "CPU: %s ... OK" 0
    ; TODO: Convert __str_init_58: bytes "RAM: %i MB ... OK" 0
    ; TODO: Convert __str_init_59: bytes "Drives: %i detected ... OK" 0
    ; TODO: Convert __str_init_60: bytes "Drives: 0 detected ... WARNING" 0
    ; TODO: Convert __str_init_61: bytes "Press ESC to enter Setup, booting in %i... " 0
    ; TODO: Convert __str_init_62: bytes "Disk %i: %i MB" 0
    ; TODO: Convert __str_init_63: bytes " " 0
    ; TODO: Convert __str_init_64: bytes "%s" 0
    ; TODO: Convert __str_init_65: bytes " " 0
    ; TODO: Convert __str_init_66: bytes " %s" 0
    ; TODO: Convert __str_init_67: bytes " " 0

section .data
virtual_regs: times 24 dw 0  ; Виртуальные регистры %e8-%e31

; Заполнение до 512 байт (размер сектора)
times 510-($-$$) db 0
dw 0xAA55  ; Boot signature
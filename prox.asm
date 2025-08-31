BITS 16
ORG 0x8000

section .text


init_all_colors_ctructs:
 push bp
 mov bp, sp
 mov ax, 1
 mov ax, 2
 mov ax, 3
 mov ax, 4
 mov ax, 0
 mov ax, 1
 mov ax, 2
 mov ax, 3
 mov ax, 4
 mov ax, 5
 mov ax, 6
 mov ax, 7
 mov ax, 8
 mov ax, 9
 mov ax, 10
 mov ax, 11
 mov ax, 12
 mov ax, 13
 mov ax, 14
 mov ax, 15
.L_ret_init_all_colors_ctructs:
 mov ax, 0 ; Default return value
 mov sp, bp
 pop bp
 ret

init_text_mode:
 push bp
 mov bp, sp
 call init_all_colors_ctructs
 mov %ah $00
 int $21
.L_ret_init_text_mode:
 mov ax, 0 ; Default return value
 mov sp, bp
 pop bp
 ret

clear_screen:
 push bp
 mov bp, sp
 mov %ah $06
 int $21
.L_ret_clear_screen:
 mov ax, 0 ; Default return value
 mov sp, bp
 pop bp
 ret

print_newline:
 push bp
 mov bp, sp
 mov %ah $05
 int $21
.L_ret_print_newline:
 mov ax, 0 ; Default return value
 mov sp, bp
 pop bp
 ret

set_text_color:
 push bp
 mov bp, sp
 mov bx, bp
 add bx, 4
 xor ax, ax
 mov al, [bx]
 psh %eax ; Save kasmf argument
 pop %eax ; Restore kasmf argument
mov %bl %eax
 mov %ah $07
 int $21
.L_ret_set_text_color:
 mov ax, 0 ; Default return value
 mov sp, bp
 pop bp
 ret

print_string:
 push bp
 mov bp, sp
 mov bx, bp
 add bx, 4
 mov ax, word [bx]
 psh %eax ; Save kasmf argument
 pop %eax ; Restore kasmf argument
mov %si %eax
 mov %ah $08
 int $21
.L_ret_print_string:
 mov ax, 0 ; Default return value
 mov sp, bp
 pop bp
 ret

print_white_string:
 push bp
 mov bp, sp
 mov bx, bp
 add bx, 4
 mov ax, word [bx]
 psh %eax ; Save kasmf argument
 pop %eax ; Restore kasmf argument
mov %si %eax
 mov %ah $01
 int $21
.L_ret_print_white_string:
 mov ax, 0 ; Default return value
 mov sp, bp
 pop bp
 ret

init_prox_app:
 push bp
 mov bp, sp
 mov ax, word [__var___argv_pointer]
 psh %eax ; Save kasmf argument
 pop %eax ; Restore kasmf argument
mov %eax %si
.L_ret_init_prox_app:
 mov ax, 0 ; Default return value
 mov sp, bp
 pop bp
 ret

reboot:
 push bp
 mov bp, sp
 int $19
.L_ret_reboot:
 mov ax, 0 ; Default return value
 mov sp, bp
 pop bp
 ret

get_command_argv:
 push bp
 mov bp, sp
.L_ret_get_command_argv:
 mov ax, 0 ; Default return value
 mov sp, bp
 pop bp
 ret

printf:
 push bp
 mov bp, sp
.L_ret_printf:
 mov ax, 0 ; Default return value
 mov sp, bp
 pop bp
 ret

reverse_string:
 push bp
 mov bp, sp
 sub sp, 1
 mov ax, 0
 push ax
 mov bx, bp
 add bx, 4
 mov ax, word [bx]
 pop bx
 add ax, bx
    mov %ebx %eax ; EBX теперь хранит адрес для чтения
    ld %ebx %eax ; Загружаем значение по адресу из %ebx
 mov bx, bp
 sub bx, 1
 mov [bx], al
 mov ax, 12
 push ax
 mov bx, bp
 add bx, 4
 mov ax, word [bx]
 pop bx
 add ax, bx
    mov %ebx %eax ; EBX теперь хранит адрес для чтения
    ld %ebx %eax ; Загружаем значение по адресу из %ebx
 mov bx, bp
 sub bx, 1
 xor ax, ax
 mov al, [bx]
 mov ax, 1
 push ax
 mov bx, bp
 add bx, 4
 mov ax, word [bx]
 pop bx
 add ax, bx
    mov %ebx %eax ; EBX теперь хранит адрес для чтения
    ld %ebx %eax ; Загружаем значение по адресу из %ebx
 mov bx, bp
 sub bx, 1
 mov [bx], al
 mov ax, 11
 push ax
 mov bx, bp
 add bx, 4
 mov ax, word [bx]
 pop bx
 add ax, bx
    mov %ebx %eax ; EBX теперь хранит адрес для чтения
    ld %ebx %eax ; Загружаем значение по адресу из %ebx
 mov bx, bp
 sub bx, 1
 xor ax, ax
 mov al, [bx]
 mov ax, 2
 push ax
 mov bx, bp
 add bx, 4
 mov ax, word [bx]
 pop bx
 add ax, bx
    mov %ebx %eax ; EBX теперь хранит адрес для чтения
    ld %ebx %eax ; Загружаем значение по адресу из %ebx
 mov bx, bp
 sub bx, 1
 mov [bx], al
 mov ax, 10
 push ax
 mov bx, bp
 add bx, 4
 mov ax, word [bx]
 pop bx
 add ax, bx
    mov %ebx %eax ; EBX теперь хранит адрес для чтения
    ld %ebx %eax ; Загружаем значение по адресу из %ebx
 mov bx, bp
 sub bx, 1
 xor ax, ax
 mov al, [bx]
 mov ax, 3
 push ax
 mov bx, bp
 add bx, 4
 mov ax, word [bx]
 pop bx
 add ax, bx
    mov %ebx %eax ; EBX теперь хранит адрес для чтения
    ld %ebx %eax ; Загружаем значение по адресу из %ebx
 mov bx, bp
 sub bx, 1
 mov [bx], al
 mov ax, 9
 push ax
 mov bx, bp
 add bx, 4
 mov ax, word [bx]
 pop bx
 add ax, bx
    mov %ebx %eax ; EBX теперь хранит адрес для чтения
    ld %ebx %eax ; Загружаем значение по адресу из %ebx
 mov bx, bp
 sub bx, 1
 xor ax, ax
 mov al, [bx]
 mov ax, 4
 push ax
 mov bx, bp
 add bx, 4
 mov ax, word [bx]
 pop bx
 add ax, bx
    mov %ebx %eax ; EBX теперь хранит адрес для чтения
    ld %ebx %eax ; Загружаем значение по адресу из %ebx
 mov bx, bp
 sub bx, 1
 mov [bx], al
 mov ax, 8
 push ax
 mov bx, bp
 add bx, 4
 mov ax, word [bx]
 pop bx
 add ax, bx
    mov %ebx %eax ; EBX теперь хранит адрес для чтения
    ld %ebx %eax ; Загружаем значение по адресу из %ebx
 mov bx, bp
 sub bx, 1
 xor ax, ax
 mov al, [bx]
 mov ax, 5
 push ax
 mov bx, bp
 add bx, 4
 mov ax, word [bx]
 pop bx
 add ax, bx
    mov %ebx %eax ; EBX теперь хранит адрес для чтения
    ld %ebx %eax ; Загружаем значение по адресу из %ebx
 mov bx, bp
 sub bx, 1
 mov [bx], al
 mov ax, 7
 push ax
 mov bx, bp
 add bx, 4
 mov ax, word [bx]
 pop bx
 add ax, bx
    mov %ebx %eax ; EBX теперь хранит адрес для чтения
    ld %ebx %eax ; Загружаем значение по адресу из %ebx
 mov bx, bp
 sub bx, 1
 xor ax, ax
 mov al, [bx]
.L_ret_reverse_string:
 mov ax, 0 ; Default return value
 mov sp, bp
 pop bp
 ret

_start:
 push bp
 mov bp, sp
 sub sp, 14
 mov ax, 72
 mov bx, bp
 sub bx, 15
 mov [bx], al
 mov ax, 101
 mov bx, bp
 sub bx, 14
 mov [bx], al
 mov ax, 108
 mov bx, bp
 sub bx, 13
 mov [bx], al
 mov ax, 108
 mov bx, bp
 sub bx, 12
 mov [bx], al
 mov ax, 111
 mov bx, bp
 sub bx, 11
 mov [bx], al
 mov ax, 44
 mov bx, bp
 sub bx, 10
 mov [bx], al
 mov ax, 32
 mov bx, bp
 sub bx, 9
 mov [bx], al
 mov ax, 87
 mov bx, bp
 sub bx, 8
 mov [bx], al
 mov ax, 111
 mov bx, bp
 sub bx, 7
 mov [bx], al
 mov ax, 114
 mov bx, bp
 sub bx, 6
 mov [bx], al
 mov ax, 108
 mov bx, bp
 sub bx, 5
 mov [bx], al
 mov ax, 100
 mov bx, bp
 sub bx, 4
 mov [bx], al
 mov ax, 33
 mov bx, bp
 sub bx, 3
 mov [bx], al
 mov ax, __str_init_0
 push ax
 call print_white_string
 add sp, 2
 mov ax, bp
 sub ax, 15
 push ax
 call print_white_string
 add sp, 2
 call print_newline
 mov ax, bp
 sub ax, 15
 push ax
 call reverse_string
 add sp, 2
 mov ax, __str_init_1
 push ax
 call print_white_string
 add sp, 2
 mov ax, bp
 sub ax, 15
 push ax
 call print_white_string
 add sp, 2
 call print_newline
.L_ret__start:
 mov ax, 0 ; Default return value
 mov sp, bp
 pop bp
 ret


; === Data Section ===
__var_TEXT_COLORS:
    dw 0
__var_VGA_COLORS:
    dw 0
__var___argv_pointer:
    dw 0
__str_init_0:
    db 79, 114, 105, 103, 105, 110, 97, 108, 58, 32, 0
__str_init_1:
    db 82, 101, 118, 101, 114, 115, 101, 100, 58, 32, 0

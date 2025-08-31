BITS 16
ORG 0x8000

section .text

jmp _start
; Struct TextColors defined: size=4 bytes
; Struct VgaColors defined: size=16 bytes
; Struct Test defined: size=6 bytes
init_all_colors_structs:
    push bp
    mov bp, sp
    mov ax, 1
 mov [_var_TEXT_COLORS], al
    mov ax, 2
 mov [_var_TEXT_COLORS+1], al
    mov ax, 3
 mov [_var_TEXT_COLORS+2], al
    mov ax, 4
 mov [_var_TEXT_COLORS+3], al
    mov ax, 0
 mov [_var_VGA_COLORS], al
    mov ax, 1
 mov [_var_VGA_COLORS+1], al
    mov ax, 2
 mov [_var_VGA_COLORS+2], al
    mov ax, 3
 mov [_var_VGA_COLORS+3], al
    mov ax, 4
 mov [_var_VGA_COLORS+4], al
    mov ax, 5
 mov [_var_VGA_COLORS+5], al
    mov ax, 6
 mov [_var_VGA_COLORS+6], al
    mov ax, 7
 mov [_var_VGA_COLORS+7], al
    mov ax, 8
 mov [_var_VGA_COLORS+8], al
    mov ax, 9
 mov [_var_VGA_COLORS+9], al
    mov ax, 10
 mov [_var_VGA_COLORS+10], al
    mov ax, 11
 mov [_var_VGA_COLORS+11], al
    mov ax, 12
 mov [_var_VGA_COLORS+12], al
    mov ax, 13
 mov [_var_VGA_COLORS+13], al
    mov ax, 14
 mov [_var_VGA_COLORS+14], al
    mov ax, 15
 mov [_var_VGA_COLORS+15], al
.init_all_colors_structs_end:
    mov sp, bp
    pop bp
    ret

init_text_mode:
    push bp
    mov bp, sp
    call init_all_colors_structs
; === NASM inline assembly start ===
    mov ah, 0x00
; === NASM inline assembly end ===
; === NASM inline assembly start ===
    int 0x21
; === NASM inline assembly end ===
.init_text_mode_end:
    mov sp, bp
    pop bp
    ret

clear_screen:
    push bp
    mov bp, sp
; === NASM inline assembly start ===
    mov ah, 0x06
; === NASM inline assembly end ===
; === NASM inline assembly start ===
    int 0x21
; === NASM inline assembly end ===
.clear_screen_end:
    mov sp, bp
    pop bp
    ret

print_newline:
    push bp
    mov bp, sp
; === NASM inline assembly start ===
    mov ah, 0x05
; === NASM inline assembly end ===
; === NASM inline assembly start ===
    int 0x21
; === NASM inline assembly end ===
.print_newline_end:
    mov sp, bp
    pop bp
    ret

set_text_color:
    push bp
    mov bp, sp
    mov ax, [bp+4]
 push ax ; Save nasmf arg 0 on stack
 pop ax ; Load nasmf arg 0
; === NASMF v1 inline assembly start ===
mov bx, ax
mov ah, 0x07
int 0x21
; === NASMF v1 inline assembly end ===
.set_text_color_end:
    mov sp, bp
    pop bp
    ret

print_string:
    push bp
    mov bp, sp
    mov ax, [bp+4]
 push ax ; Save nasmf arg 0 on stack
 pop ax ; Load nasmf arg 0
; === NASMF v1 inline assembly start ===
mov si, ax
mov ah, 0x08
int 0x21
; === NASMF v1 inline assembly end ===
.print_string_end:
    mov sp, bp
    pop bp
    ret

print_white_string:
    push bp
    mov bp, sp
    mov ax, [bp+4]
 push ax ; Save nasmf arg 0 on stack
 pop ax ; Load nasmf arg 0
; === NASMF v1 inline assembly start ===
mov si, ax
; === NASMF v1 inline assembly end ===
; === NASM inline assembly start ===
    mov ah, 0x01
; === NASM inline assembly end ===
; === NASM inline assembly start ===
    int 0x21
; === NASM inline assembly end ===
.print_white_string_end:
    mov sp, bp
    pop bp
    ret

init_prox_app:
    push bp
    mov bp, sp
    mov ax, [_var___argv_pointer]
 push ax ; Save nasmf arg 0 on stack
 pop ax ; Load nasmf arg 0
; === NASMF v1 inline assembly start ===
mov ax, si
; === NASMF v1 inline assembly end ===
; === NASM inline assembly start ===
    mov bx, ax
; === NASM inline assembly end ===
; === NASM inline assembly start ===
    mov [bx], si
; === NASM inline assembly end ===
.init_prox_app_end:
    mov sp, bp
    pop bp
    ret

reboot:
    push bp
    mov bp, sp
; === NASM inline assembly start ===
    int 0x19
; === NASM inline assembly end ===
.reboot_end:
    mov sp, bp
    pop bp
    ret

get_command_argv:
    push bp
    mov bp, sp
.get_command_argv_end:
    mov sp, bp
    pop bp
    ret

printf:
    push bp
    mov bp, sp
.printf_end:
    mov sp, bp
    pop bp
    ret

init_string_api:
    push bp
    mov bp, sp
; === NASM inline assembly start ===
    mov ah, 0x00
; === NASM inline assembly end ===
; === NASM inline assembly start ===
    int 0x23
; === NASM inline assembly end ===
.init_string_api_end:
    mov sp, bp
    pop bp
    ret

num_to_str:
    push bp
    mov bp, sp
    mov ax, [bp+4]
 push ax ; Save nasmf arg 0 on stack
 pop ax ; Load nasmf arg 0
; === NASMF v1 inline assembly start ===
mov ax, ax
mov ah, 0x0D
int 0x23
; === NASMF v1 inline assembly end ===
.num_to_str_end:
    mov sp, bp
    pop bp
    ret

create_empty_file:
    push bp
    mov bp, sp
    mov ax, [bp+4]
 push ax ; Save nasmf arg 0 on stack
 pop ax ; Load nasmf arg 0
; === NASMF v1 inline assembly start ===
mov ax, ax
mov ah, 0x05
int 0x22
; === NASMF v1 inline assembly end ===
.create_empty_file_end:
    mov sp, bp
    pop bp
    ret

_start:
    push bp
    mov bp, sp
    sub sp, 20
; --- Initialize array 'hello' from _var_str_init_0 ---
 lea di, [bp-20]
 mov si, _var_str_init_0
 mov cx, 14
 cld ; Clear direction flag
 rep movsb ; Copy string
    call init_all_colors_structs
    mov ax, 72
 push ax ; Save value
    mov ax, 0
 push ax ; Save index
 lea bx, [bp-6]
 pop ax ; Restore index
 add bx, ax ; Calculate element address
 pop ax ; Restore value
 mov [bx], al
    mov ax, 105
 push ax ; Save value
    mov ax, 1
 push ax ; Save index
 lea bx, [bp-6]
 pop ax ; Restore index
 add bx, ax ; Calculate element address
 pop ax ; Restore value
 mov [bx], al
    mov ax, 33
 push ax ; Save value
    mov ax, 2
 push ax ; Save index
 lea bx, [bp-6]
 pop ax ; Restore index
 add bx, ax ; Calculate element address
 pop ax ; Restore value
 mov [bx], al
    mov ax, 9
 mov word [bp-2], ax
 mov ax, [bp-2]
    push ax
    call set_text_color
    add sp, 2
 lea ax, [bp-6]
    push ax
    call print_string
    add sp, 2
    call print_newline
    lea ax, [bp-20]
    push ax
    call print_string
    add sp, 2
    call print_newline
    mov ax, 0
    jmp ._start_end
._start_end:
    mov sp, bp
    pop bp
    ret


; == DATA SECTION ==
_var_TEXT_COLORS: times 4 db 0 ; struct TextColors
_var_VGA_COLORS: times 16 db 0 ; struct VgaColors
_var___argv_pointer: dw 0
_var_str_init_0: db 72, 101, 108, 108, 111, 44, 32, 87, 111, 114, 108, 100, 33, 0

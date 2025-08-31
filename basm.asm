BITS 16
ORG 0x8000

section .text

jmp _start
; Struct TextColors defined: size=4 bytes
; Struct VgaColors defined: size=16 bytes
; Struct Inst defined: size=9 bytes
; Struct OpType defined: size=4 bytes
; Struct Operand defined: size=13 bytes
; Struct Label defined: size=10 bytes
; Struct Define defined: size=10 bytes
; Struct Bytes defined: size=16 bytes
; Struct Reserve defined: size=2 bytes
; Struct Assembly defined: size=5215 bytes
; Struct Test defined: size=5 bytes
; Struct Token defined: size=39 bytes
; Struct Statement defined: size=46 bytes
; Struct InstInfo defined: size=10 bytes
; Struct RegInfo defined: size=2 bytes
init_all_colors_structs:
 push bp
 mov bp, sp
    mov ax, 1
 mov bx, _var_TEXT_COLORS
 mov [bx], al
    mov ax, 2
 lea bx, [_var_TEXT_COLORS+1]
 mov [bx], al
    mov ax, 3
 lea bx, [_var_TEXT_COLORS+2]
 mov [bx], al
    mov ax, 4
 lea bx, [_var_TEXT_COLORS+3]
 mov [bx], al
    mov ax, 0
 mov bx, _var_VGA_COLORS
 mov [bx], al
    mov ax, 1
 lea bx, [_var_VGA_COLORS+1]
 mov [bx], al
    mov ax, 2
 lea bx, [_var_VGA_COLORS+2]
 mov [bx], al
    mov ax, 3
 lea bx, [_var_VGA_COLORS+3]
 mov [bx], al
    mov ax, 4
 lea bx, [_var_VGA_COLORS+4]
 mov [bx], al
    mov ax, 5
 lea bx, [_var_VGA_COLORS+5]
 mov [bx], al
    mov ax, 6
 lea bx, [_var_VGA_COLORS+6]
 mov [bx], al
    mov ax, 7
 lea bx, [_var_VGA_COLORS+7]
 mov [bx], al
    mov ax, 8
 lea bx, [_var_VGA_COLORS+8]
 mov [bx], al
    mov ax, 9
 lea bx, [_var_VGA_COLORS+9]
 mov [bx], al
    mov ax, 10
 lea bx, [_var_VGA_COLORS+10]
 mov [bx], al
    mov ax, 11
 lea bx, [_var_VGA_COLORS+11]
 mov [bx], al
    mov ax, 12
 lea bx, [_var_VGA_COLORS+12]
 mov [bx], al
    mov ax, 13
 lea bx, [_var_VGA_COLORS+13]
 mov [bx], al
    mov ax, 14
 lea bx, [_var_VGA_COLORS+14]
 mov [bx], al
    mov ax, 15
 lea bx, [_var_VGA_COLORS+15]
 mov [bx], al
    mov ax, 15
 mov [_var_STD_CURRENT_COLOR], ax
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
 mov [_var_STD_CURRENT_COLOR], ax

; --- nasmf v1 start ---
mov bx, word [bp+4]
mov ah, 0x07
int 0x21
; --- nasmf v1 end ---
.set_text_color_end:
 mov sp, bp
 pop bp
 ret

print_string:
 push bp
 mov bp, sp

; --- nasmf v1 start ---
mov si, word [bp+4]
mov ah, 0x08
int 0x21
; --- nasmf v1 end ---
.print_string_end:
 mov sp, bp
 pop bp
 ret

print_white_string:
 push bp
 mov bp, sp

; --- nasmf v1 start ---
mov si, word [bp+4]
; --- nasmf v1 end ---
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

print_num:
 push bp
 mov bp, sp
 sub sp, 261
    mov ax, 0
 mov [bp-258], ax
    mov ax, 0
    push ax
    mov ax, [bp+4]
    pop bx
    cmp ax, bx
    je .L_comp_true_2
    mov ax, 0
    jmp .L_comp_end_3
.L_comp_true_2:
    mov ax, 1
.L_comp_end_3:
    cmp ax, 0
    je .L_endif_1
    mov ax, 48
    push ax
    call print_char
    add sp, 2
    mov ax, 0
    jmp .print_num_end
.L_endif_1:
    mov ax, 0
    push ax
    mov ax, [bp+4]
    pop bx
    cmp ax, bx
    jl .L_comp_true_6
    mov ax, 0
    jmp .L_comp_end_7
.L_comp_true_6:
    mov ax, 1
.L_comp_end_7:
    cmp ax, 0
    je .L_endif_5
    mov ax, 45
    push ax
    call print_char
    add sp, 2
    mov ax, 1
    neg ax
 push ax
    mov ax, [bp+4]
 pop bx
 imul ax, bx
 mov [bp+4], ax
.L_endif_5:
.L_while_start_8:
    mov ax, 0
    push ax
    mov ax, [bp+4]
    pop bx
    cmp ax, bx
    jne .L_comp_true_10
    mov ax, 0
    jmp .L_comp_end_11
.L_comp_true_10:
    mov ax, 1
.L_comp_end_11:
    cmp ax, 0
    je .L_while_end_9
    mov ax, 10
 push ax
    mov ax, [bp+4]
 pop bx
 xor dx, dx
 idiv bx
 mov ax, dx ; Remainder
 mov [bp-260], ax
    mov ax, 48
 push ax
    mov ax, [bp-260]
 pop bx
 add ax, bx
 mov [bp-261], al
    mov ax, 10
 push ax
    mov ax, [bp+4]
 pop bx
 xor dx, dx ; Clear upper bits
 idiv bx
 mov [bp+4], ax
    xor ax, ax
    mov al, [bp-261]
 push ax ; Save value
    mov ax, [bp-258]
 lea bx, [bp-256]
 mov si, ax
 pop ax ; Restore value
 mov [bx+si], al
    mov ax, 1
 push ax
    mov ax, [bp-258]
 pop bx
 add ax, bx
 mov [bp-258], ax
    jmp .L_while_start_8
.L_while_end_9:
.L_while_start_12:
    mov ax, 0
    push ax
    mov ax, [bp-258]
    pop bx
    cmp ax, bx
    jne .L_comp_true_14
    mov ax, 0
    jmp .L_comp_end_15
.L_comp_true_14:
    mov ax, 1
.L_comp_end_15:
    cmp ax, 0
    je .L_while_end_13
    mov ax, 1
 push ax
    mov ax, [bp-258]
 pop bx
 sub ax, bx
 mov [bp-258], ax
    mov ax, [bp-258]
 push ax ; Save index
 lea bx, [bp-256]
 pop ax ; Restore index
 mov si, ax
 xor ax, ax
 mov al, [bx+si]
    push ax
    call print_char
    add sp, 2
    jmp .L_while_start_12
.L_while_end_13:
.print_num_end:
 mov sp, bp
 pop bp
 ret

print_char:
 push bp
 mov bp, sp
 sub sp, 1
    mov ax, [_var_STD_CURRENT_COLOR]
 mov [bp-1], al

; --- nasmf v1 start ---
mov ax, word [bp+4]
mov ah, 0x0E
mov bl, byte [bp-1]
cmp al, 0x0A
je .handle_newline
int 0x10
jmp .end_chr
.handle_newline:
mov al, 0x0D
int 0x10
mov al, 0x0A
int 0x10
.end_chr:
; --- nasmf v1 end ---
.print_char_end:
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

strcpy:
 push bp
 mov bp, sp
 sub sp, 2
    mov ax, 0
 mov [bp-2], ax
.L_while_start_16:
    mov ax, 0
    push ax
    mov ax, [bp-2]
 push ax ; Save index
 mov bx, [bp+6]
 pop ax ; Restore index
 mov si, ax
 xor ax, ax
 mov al, [bx+si]
    pop bx
    cmp ax, bx
    jne .L_comp_true_18
    mov ax, 0
    jmp .L_comp_end_19
.L_comp_true_18:
    mov ax, 1
.L_comp_end_19:
    cmp ax, 0
    je .L_while_end_17
    mov ax, [bp-2]
 push ax ; Save index
 mov bx, [bp+6]
 pop ax ; Restore index
 mov si, ax
 xor ax, ax
 mov al, [bx+si]
 push ax ; Save value
    mov ax, [bp-2]
 mov bx, [bp+4]
 mov si, ax
 pop ax ; Restore value
 mov [bx+si], al
    mov ax, 1
 push ax
    mov ax, [bp-2]
 pop bx
 add ax, bx
 mov [bp-2], ax
    jmp .L_while_start_16
.L_while_end_17:
    mov ax, 0
 push ax ; Save value
    mov ax, [bp-2]
 mov bx, [bp+4]
 mov si, ax
 pop ax ; Restore value
 mov [bx+si], al
    mov ax, [bp-2]
    jmp .strcpy_end
.strcpy_end:
 mov sp, bp
 pop bp
 ret

ascii_to_int:
 push bp
 mov bp, sp
 sub sp, 2
    mov ax, 0
 mov [bp-2], ax
    mov ax, 48
 push ax
    mov ax, [bp+4]
 pop bx
 sub ax, bx
 mov [bp-2], ax
    mov ax, [bp-2]
    jmp .ascii_to_int_end
.ascii_to_int_end:
 mov sp, bp
 pop bp
 ret

string_to_int:
 push bp
 mov bp, sp
 sub sp, 7
    mov ax, 0
 mov [bp-2], ax
    mov ax, [bp+4]
 mov [bp-4], ax
    mov ax, [bp-4]
 mov bx, ax ; bx now containts address for read
 xor ax, ax ; clear ax
 mov al, [bx] ; load byte
 mov [bp-5], al
.L_while_start_20:
    mov ax, 0
    push ax
    xor ax, ax
    mov al, [bp-5]
    pop bx
    cmp ax, bx
    jne .L_comp_true_26
    mov ax, 0
    jmp .L_comp_end_27
.L_comp_true_26:
    mov ax, 1
.L_comp_end_27:
 cmp ax, 0
 je .L_logic_false_25
    mov ax, 48
    push ax
    xor ax, ax
    mov al, [bp-5]
    pop bx
    cmp ax, bx
    jge .L_comp_true_28
    mov ax, 0
    jmp .L_comp_end_29
.L_comp_true_28:
    mov ax, 1
.L_comp_end_29:
 cmp ax, 0
 je .L_logic_false_25
 mov ax, 1
 jmp .L_logic_end_24
.L_logic_false_25:
 mov ax, 0
.L_logic_end_24:
 cmp ax, 0
 je .L_logic_false_23
    mov ax, 57
    push ax
    xor ax, ax
    mov al, [bp-5]
    pop bx
    cmp ax, bx
    jle .L_comp_true_30
    mov ax, 0
    jmp .L_comp_end_31
.L_comp_true_30:
    mov ax, 1
.L_comp_end_31:
 cmp ax, 0
 je .L_logic_false_23
 mov ax, 1
 jmp .L_logic_end_22
.L_logic_false_23:
 mov ax, 0
.L_logic_end_22:
    cmp ax, 0
    je .L_while_end_21
    mov ax, 10
 push ax
    mov ax, [bp-2]
 pop bx
 imul ax, bx
 mov [bp-2], ax
    mov ax, 48
 push ax
    xor ax, ax
    mov al, [bp-5]
 pop bx
 sub ax, bx
 mov [bp-7], ax
    mov ax, [bp-7]
 push ax
    mov ax, [bp-2]
 pop bx
 add ax, bx
 mov [bp-2], ax
    mov ax, 1
 push ax
    mov ax, [bp-4]
 pop bx
 add ax, bx
 mov [bp-4], ax
    mov ax, [bp-4]
 mov bx, ax ; bx now containts address for read
 xor ax, ax ; clear ax
 mov al, [bx] ; load byte
 mov [bp-5], al
    jmp .L_while_start_20
.L_while_end_21:
    mov ax, [bp-2]
    jmp .string_to_int_end
.string_to_int_end:
 mov sp, bp
 pop bp
 ret

itoa:
 push bp
 mov bp, sp
 sub sp, 5
    mov ax, 0
 mov [bp-2], ax
    mov ax, 0
 mov [bp-4], ax
    mov ax, 0
    push ax
    mov ax, [bp+4]
    pop bx
    cmp ax, bx
    je .L_comp_true_34
    mov ax, 0
    jmp .L_comp_end_35
.L_comp_true_34:
    mov ax, 1
.L_comp_end_35:
    cmp ax, 0
    je .L_endif_33
    mov ax, 48
 push ax ; Save value
    mov ax, 0
 mov bx, [bp+6]
 mov si, ax
 pop ax ; Restore value
 mov [bx+si], al
    mov ax, 0
 push ax ; Save value
    mov ax, 1
 mov bx, [bp+6]
 mov si, ax
 pop ax ; Restore value
 mov [bx+si], al
    mov ax, 1
    jmp .itoa_end
.L_endif_33:
    mov ax, 0
    push ax
    mov ax, [bp+4]
    pop bx
    cmp ax, bx
    jl .L_comp_true_38
    mov ax, 0
    jmp .L_comp_end_39
.L_comp_true_38:
    mov ax, 1
.L_comp_end_39:
    cmp ax, 0
    je .L_endif_37
    mov ax, 45
 push ax ; Save value
    mov ax, 0
 mov bx, [bp+6]
 mov si, ax
 pop ax ; Restore value
 mov [bx+si], al
    mov ax, 1
 mov [bp-2], ax
    mov ax, 1
 mov [bp-4], ax
    mov ax, [bp+4]
 push ax
    mov ax, 0
 pop bx
 sub ax, bx
 mov [bp+4], ax
.L_endif_37:
.L_while_start_40:
    mov ax, 0
    push ax
    mov ax, [bp+4]
    pop bx
    cmp ax, bx
    jg .L_comp_true_42
    mov ax, 0
    jmp .L_comp_end_43
.L_comp_true_42:
    mov ax, 1
.L_comp_end_43:
    cmp ax, 0
    je .L_while_end_41
    mov ax, 10
 push ax
    mov ax, [bp+4]
 pop bx
 xor dx, dx
 idiv bx
 mov ax, dx ; Remainder
 push ax
    mov ax, 48
 pop bx
 add ax, bx
 push ax ; Save value
    mov ax, [bp-2]
 mov bx, [bp+6]
 mov si, ax
 pop ax ; Restore value
 mov [bx+si], al
    mov ax, 10
 push ax
    mov ax, [bp+4]
 pop bx
 xor dx, dx ; Clear upper bits
 idiv bx
 mov [bp+4], ax
    mov ax, 1
 push ax
    mov ax, [bp-2]
 pop bx
 add ax, bx
 mov [bp-2], ax
    jmp .L_while_start_40
.L_while_end_41:
    mov ax, 0
 push ax ; Save value
    mov ax, [bp-2]
 mov bx, [bp+6]
 mov si, ax
 pop ax ; Restore value
 mov [bx+si], al
    mov ax, 1
 push ax
    mov ax, [bp-2]
 pop bx
 sub ax, bx
 mov [bp-2], ax
.L_while_start_44:
    mov ax, [bp-2]
    push ax
    mov ax, [bp-4]
    pop bx
    cmp ax, bx
    jl .L_comp_true_46
    mov ax, 0
    jmp .L_comp_end_47
.L_comp_true_46:
    mov ax, 1
.L_comp_end_47:
    cmp ax, 0
    je .L_while_end_45
    mov ax, [bp-4]
 push ax ; Save index
 mov bx, [bp+6]
 pop ax ; Restore index
 mov si, ax
 xor ax, ax
 mov al, [bx+si]
 mov [bp-5], al
    mov ax, [bp-2]
 push ax ; Save index
 mov bx, [bp+6]
 pop ax ; Restore index
 mov si, ax
 xor ax, ax
 mov al, [bx+si]
 push ax ; Save value
    mov ax, [bp-4]
 mov bx, [bp+6]
 mov si, ax
 pop ax ; Restore value
 mov [bx+si], al
    xor ax, ax
    mov al, [bp-5]
 push ax ; Save value
    mov ax, [bp-2]
 mov bx, [bp+6]
 mov si, ax
 pop ax ; Restore value
 mov [bx+si], al
    mov ax, 1
 push ax
    mov ax, [bp-4]
 pop bx
 add ax, bx
 mov [bp-4], ax
    mov ax, 1
 push ax
    mov ax, [bp-2]
 pop bx
 sub ax, bx
 mov [bp-2], ax
    jmp .L_while_start_44
.L_while_end_45:
    mov ax, [bp+6]
    push ax
    call strlen
    add sp, 2
    jmp .itoa_end
.itoa_end:
 mov sp, bp
 pop bp
 ret

itoa_base:
 push bp
 mov bp, sp
 sub sp, 21
; --- Initialize array 'digits' from _var_str_init_0 ---
 lea di, [bp-21]
 mov si, _var_str_init_0
 mov cx, 16
 cld ; Clear direction flag
 rep movsb ; Copy string
    mov ax, 0
 mov [bp-2], ax
    mov ax, 0
 mov [bp-4], ax
    mov ax, 2
    push ax
    mov ax, [bp+8]
    pop bx
    cmp ax, bx
    jl .L_comp_true_52
    mov ax, 0
    jmp .L_comp_end_53
.L_comp_true_52:
    mov ax, 1
.L_comp_end_53:
 cmp ax, 0
 jne .L_logic_true_51
    mov ax, 16
    push ax
    mov ax, [bp+8]
    pop bx
    cmp ax, bx
    jg .L_comp_true_54
    mov ax, 0
    jmp .L_comp_end_55
.L_comp_true_54:
    mov ax, 1
.L_comp_end_55:
 cmp ax, 0
 jne .L_logic_true_51
 mov ax, 0
 jmp .L_logic_end_50
.L_logic_true_51:
 mov ax, 1
.L_logic_end_50:
    cmp ax, 0
    je .L_endif_49
    mov ax, 0
 push ax ; Save value
    mov ax, 0
 mov bx, [bp+6]
 mov si, ax
 pop ax ; Restore value
 mov [bx+si], al
    mov ax, 0
    jmp .itoa_base_end
.L_endif_49:
    mov ax, 0
    push ax
    mov ax, [bp+4]
    pop bx
    cmp ax, bx
    je .L_comp_true_58
    mov ax, 0
    jmp .L_comp_end_59
.L_comp_true_58:
    mov ax, 1
.L_comp_end_59:
    cmp ax, 0
    je .L_endif_57
    mov ax, 48
 push ax ; Save value
    mov ax, 0
 mov bx, [bp+6]
 mov si, ax
 pop ax ; Restore value
 mov [bx+si], al
    mov ax, 0
 push ax ; Save value
    mov ax, 1
 mov bx, [bp+6]
 mov si, ax
 pop ax ; Restore value
 mov [bx+si], al
    mov ax, 1
    jmp .itoa_base_end
.L_endif_57:
    mov ax, 0
    push ax
    mov ax, [bp+4]
    pop bx
    cmp ax, bx
    jl .L_comp_true_64
    mov ax, 0
    jmp .L_comp_end_65
.L_comp_true_64:
    mov ax, 1
.L_comp_end_65:
 cmp ax, 0
 je .L_logic_false_63
    mov ax, 10
    push ax
    mov ax, [bp+8]
    pop bx
    cmp ax, bx
    je .L_comp_true_66
    mov ax, 0
    jmp .L_comp_end_67
.L_comp_true_66:
    mov ax, 1
.L_comp_end_67:
 cmp ax, 0
 je .L_logic_false_63
 mov ax, 1
 jmp .L_logic_end_62
.L_logic_false_63:
 mov ax, 0
.L_logic_end_62:
    cmp ax, 0
    je .L_endif_61
    mov ax, 45
 push ax ; Save value
    mov ax, 0
 mov bx, [bp+6]
 mov si, ax
 pop ax ; Restore value
 mov [bx+si], al
    mov ax, 1
 mov [bp-2], ax
    mov ax, 1
 mov [bp-4], ax
    mov ax, [bp+4]
 push ax
    mov ax, 0
 pop bx
 sub ax, bx
 mov [bp+4], ax
.L_endif_61:
.L_while_start_68:
    mov ax, 0
    push ax
    mov ax, [bp+4]
    pop bx
    cmp ax, bx
    jg .L_comp_true_70
    mov ax, 0
    jmp .L_comp_end_71
.L_comp_true_70:
    mov ax, 1
.L_comp_end_71:
    cmp ax, 0
    je .L_while_end_69
    mov ax, [bp+8]
 push ax
    mov ax, [bp+4]
 pop bx
 xor dx, dx
 idiv bx
 mov ax, dx ; Remainder
 push ax ; Save index
 lea bx, [bp-21]
 pop ax ; Restore index
 mov si, ax
 xor ax, ax
 mov al, [bx+si]
 push ax ; Save value
    mov ax, [bp-2]
 mov bx, [bp+6]
 mov si, ax
 pop ax ; Restore value
 mov [bx+si], al
    mov ax, [bp+8]
 push ax
    mov ax, [bp+4]
 pop bx
 xor dx, dx ; Clear upper bits
 idiv bx
 mov [bp+4], ax
    mov ax, 1
 push ax
    mov ax, [bp-2]
 pop bx
 add ax, bx
 mov [bp-2], ax
    jmp .L_while_start_68
.L_while_end_69:
    mov ax, 0
 push ax ; Save value
    mov ax, [bp-2]
 mov bx, [bp+6]
 mov si, ax
 pop ax ; Restore value
 mov [bx+si], al
    mov ax, 1
 push ax
    mov ax, [bp-2]
 pop bx
 sub ax, bx
 mov [bp-2], ax
.L_while_start_72:
    mov ax, [bp-2]
    push ax
    mov ax, [bp-4]
    pop bx
    cmp ax, bx
    jl .L_comp_true_74
    mov ax, 0
    jmp .L_comp_end_75
.L_comp_true_74:
    mov ax, 1
.L_comp_end_75:
    cmp ax, 0
    je .L_while_end_73
    mov ax, [bp-4]
 push ax ; Save index
 mov bx, [bp+6]
 pop ax ; Restore index
 mov si, ax
 xor ax, ax
 mov al, [bx+si]
 mov [bp-5], al
    mov ax, [bp-2]
 push ax ; Save index
 mov bx, [bp+6]
 pop ax ; Restore index
 mov si, ax
 xor ax, ax
 mov al, [bx+si]
 push ax ; Save value
    mov ax, [bp-4]
 mov bx, [bp+6]
 mov si, ax
 pop ax ; Restore value
 mov [bx+si], al
    xor ax, ax
    mov al, [bp-5]
 push ax ; Save value
    mov ax, [bp-2]
 mov bx, [bp+6]
 mov si, ax
 pop ax ; Restore value
 mov [bx+si], al
    mov ax, 1
 push ax
    mov ax, [bp-4]
 pop bx
 add ax, bx
 mov [bp-4], ax
    mov ax, 1
 push ax
    mov ax, [bp-2]
 pop bx
 sub ax, bx
 mov [bp-2], ax
    jmp .L_while_start_72
.L_while_end_73:
    mov ax, [bp+6]
    push ax
    call strlen
    add sp, 2
    jmp .itoa_base_end
.itoa_base_end:
 mov sp, bp
 pop bp
 ret

print_hex_byte_fixed:
 push bp
 mov bp, sp
 sub sp, 21
; --- Initialize array 'digits' from _var_str_init_1 ---
 lea di, [bp-21]
 mov si, _var_str_init_1
 mov cx, 16
 cld ; Clear direction flag
 rep movsb ; Copy string
    mov ax, 48
 push ax ; Save value
    mov ax, 0
 lea bx, [bp-5]
 mov si, ax
 pop ax ; Restore value
 mov [bx+si], al
    mov ax, 120
 push ax ; Save value
    mov ax, 1
 lea bx, [bp-5]
 mov si, ax
 pop ax ; Restore value
 mov [bx+si], al
    mov ax, 15
 push ax
    mov ax, 4
 push ax
    mov ax, [bp+4]
 pop bx
 mov cl, bl ; Use low byte of bx
 sar ax, cl
 pop bx
 and ax, bx
 push ax ; Save index
 lea bx, [bp-21]
 pop ax ; Restore index
 mov si, ax
 xor ax, ax
 mov al, [bx+si]
 push ax ; Save value
    mov ax, 2
 lea bx, [bp-5]
 mov si, ax
 pop ax ; Restore value
 mov [bx+si], al
    mov ax, 15
 push ax
    mov ax, [bp+4]
 pop bx
 and ax, bx
 push ax ; Save index
 lea bx, [bp-21]
 pop ax ; Restore index
 mov si, ax
 xor ax, ax
 mov al, [bx+si]
 push ax ; Save value
    mov ax, 3
 lea bx, [bp-5]
 mov si, ax
 pop ax ; Restore value
 mov [bx+si], al
    mov ax, 0
 push ax ; Save value
    mov ax, 4
 lea bx, [bp-5]
 mov si, ax
 pop ax ; Restore value
 mov [bx+si], al
    lea ax, [bp-5]
    push ax
    call print_string
    add sp, 2
.print_hex_byte_fixed_end:
 mov sp, bp
 pop bp
 ret

print_hex:
 push bp
 mov bp, sp
 sub sp, 19
    mov ax, 48
 push ax ; Save value
    mov ax, 0
 lea bx, [bp-19]
 mov si, ax
 pop ax ; Restore value
 mov [bx+si], al
    mov ax, 120
 push ax ; Save value
    mov ax, 1
 lea bx, [bp-19]
 mov si, ax
 pop ax ; Restore value
 mov [bx+si], al
    mov ax, 16
    push ax
    mov ax, 2
 push ax
    lea ax, [bp-19]
 pop bx
 add ax, bx
    push ax
    mov ax, [bp+4]
    push ax
    call itoa_base
    add sp, 6
    lea ax, [bp-19]
    push ax
    call print_string
    add sp, 2
.print_hex_end:
 mov sp, bp
 pop bp
 ret

print_binary:
 push bp
 mov bp, sp
 sub sp, 19
    mov ax, 48
 push ax ; Save value
    mov ax, 0
 lea bx, [bp-19]
 mov si, ax
 pop ax ; Restore value
 mov [bx+si], al
    mov ax, 98
 push ax ; Save value
    mov ax, 1
 lea bx, [bp-19]
 mov si, ax
 pop ax ; Restore value
 mov [bx+si], al
    mov ax, 2
    push ax
    mov ax, 2
 push ax
    lea ax, [bp-19]
 pop bx
 add ax, bx
    push ax
    mov ax, [bp+4]
    push ax
    call itoa_base
    add sp, 6
    lea ax, [bp-19]
    push ax
    call print_string
    add sp, 2
.print_binary_end:
 mov sp, bp
 pop bp
 ret

strcmp:
 push bp
 mov bp, sp
    mov ax, 0
    jmp .strcmp_end
.strcmp_end:
 mov sp, bp
 pop bp
 ret

strlen:
 push bp
 mov bp, sp
 sub sp, 2
    mov ax, 0
 mov [bp-2], ax
.L_while_start_76:
    mov ax, 0
    push ax
    mov ax, [bp-2]
 push ax ; Save index
 mov bx, [bp+4]
 pop ax ; Restore index
 mov si, ax
 xor ax, ax
 mov al, [bx+si]
    pop bx
    cmp ax, bx
    jne .L_comp_true_78
    mov ax, 0
    jmp .L_comp_end_79
.L_comp_true_78:
    mov ax, 1
.L_comp_end_79:
    cmp ax, 0
    je .L_while_end_77
    mov ax, 1
 push ax
    mov ax, [bp-2]
 pop bx
 add ax, bx
 mov [bp-2], ax
    jmp .L_while_start_76
.L_while_end_77:
    mov ax, [bp-2]
    jmp .strlen_end
.strlen_end:
 mov sp, bp
 pop bp
 ret

get_arg:
 push bp
 mov bp, sp
 sub sp, 4
    mov ax, [bp+4]
 mov [bp-2], ax
    mov ax, 0
 mov [bp-4], ax
.L_while_start_80:
    mov ax, [bp+6]
    push ax
    mov ax, [bp-4]
    pop bx
    cmp ax, bx
    jl .L_comp_true_82
    mov ax, 0
    jmp .L_comp_end_83
.L_comp_true_82:
    mov ax, 1
.L_comp_end_83:
    cmp ax, 0
    je .L_while_end_81
    mov ax, 0
    push ax
    mov ax, [bp-2]
 mov bx, ax ; bx now containts address for read
 xor ax, ax ; clear ax
 mov al, [bx] ; load byte
    pop bx
    cmp ax, bx
    je .L_comp_true_86
    mov ax, 0
    jmp .L_comp_end_87
.L_comp_true_86:
    mov ax, 1
.L_comp_end_87:
    cmp ax, 0
    je .L_endif_85
    mov ax, 0
    jmp .get_arg_end
.L_endif_85:
.L_while_start_88:
    mov ax, 0
    push ax
    mov ax, [bp-2]
 mov bx, ax ; bx now containts address for read
 xor ax, ax ; clear ax
 mov al, [bx] ; load byte
    pop bx
    cmp ax, bx
    jne .L_comp_true_90
    mov ax, 0
    jmp .L_comp_end_91
.L_comp_true_90:
    mov ax, 1
.L_comp_end_91:
    cmp ax, 0
    je .L_while_end_89
    mov ax, 1
 push ax
    mov ax, [bp-2]
 pop bx
 add ax, bx
 mov [bp-2], ax
    jmp .L_while_start_88
.L_while_end_89:
    mov ax, 1
 push ax
    mov ax, [bp-2]
 pop bx
 add ax, bx
 mov [bp-2], ax
    mov ax, 1
 push ax
    mov ax, [bp-4]
 pop bx
 add ax, bx
 mov [bp-4], ax
    jmp .L_while_start_80
.L_while_end_81:
    mov ax, 0
    push ax
    mov ax, [bp-2]
 mov bx, ax ; bx now containts address for read
 xor ax, ax ; clear ax
 mov al, [bx] ; load byte
    pop bx
    cmp ax, bx
    je .L_comp_true_94
    mov ax, 0
    jmp .L_comp_end_95
.L_comp_true_94:
    mov ax, 1
.L_comp_end_95:
    cmp ax, 0
    je .L_endif_93
    mov ax, 0
    jmp .get_arg_end
.L_endif_93:
    mov ax, [bp-2]
    jmp .get_arg_end
.get_arg_end:
 mov sp, bp
 pop bp
 ret

printf:
 push bp
 mov bp, sp
 sub sp, 9
    mov ax, [bp+4]
 mov [bp-2], ax
    mov ax, 2
 push ax
 lea ax, [bp+4] ; Get address of parameter 'str'
 pop bx
 add ax, bx
 mov [bp-4], ax
.L_while_start_96:
    mov ax, 0
    push ax
    mov ax, [bp-2]
 mov bx, ax ; bx now containts address for read
 xor ax, ax ; clear ax
 mov al, [bx] ; load byte
    pop bx
    cmp ax, bx
    jne .L_comp_true_98
    mov ax, 0
    jmp .L_comp_end_99
.L_comp_true_98:
    mov ax, 1
.L_comp_end_99:
    cmp ax, 0
    je .L_while_end_97
    mov ax, 37
    push ax
    mov ax, [bp-2]
 mov bx, ax ; bx now containts address for read
 xor ax, ax ; clear ax
 mov al, [bx] ; load byte
    pop bx
    cmp ax, bx
    je .L_comp_true_102
    mov ax, 0
    jmp .L_comp_end_103
.L_comp_true_102:
    mov ax, 1
.L_comp_end_103:
    cmp ax, 0
    je .L_else_100
    mov ax, 1
 push ax
    mov ax, [bp-2]
 pop bx
 add ax, bx
 mov [bp-2], ax
    mov ax, [bp-2]
 mov bx, ax ; bx now containts address for read
 xor ax, ax ; clear ax
 mov al, [bx] ; load byte
 mov dx, ax ; Save match expression to dx
    mov ax, 105
 cmp dx, ax
 je .L_case_0_105
    mov ax, 115
 cmp dx, ax
 je .L_case_1_106
    mov ax, 99
 cmp dx, ax
 je .L_case_2_107
 jmp .L_case_3_108
.L_case_0_105:
    mov ax, [bp-4]
 mov bx, ax ; bx now containts address for read
 mov ax, [bx] ; load word
 mov [bp-6], ax
    mov ax, [bp-6]
    push ax
    call print_num
    add sp, 2
    mov ax, 2
 push ax
    mov ax, [bp-4]
 pop bx
 add ax, bx
 mov [bp-4], ax
 jmp .L_match_end_104
.L_case_1_106:
    mov ax, [bp-4]
 mov bx, ax ; bx now containts address for read
 mov ax, [bx] ; load word
 mov [bp-8], ax
    mov ax, [bp-8]
    push ax
    call print_string
    add sp, 2
    mov ax, 2
 push ax
    mov ax, [bp-4]
 pop bx
 add ax, bx
 mov [bp-4], ax
 jmp .L_match_end_104
.L_case_2_107:
    mov ax, [bp-4]
 mov bx, ax ; bx now containts address for read
 mov ax, [bx] ; load word
 mov [bp-9], al
    xor ax, ax
    mov al, [bp-9]
    push ax
    call print_char
    add sp, 2
    mov ax, 2
 push ax
    mov ax, [bp-4]
 pop bx
 add ax, bx
 mov [bp-4], ax
 jmp .L_match_end_104
.L_case_3_108:
    mov ax, 37
    push ax
    call print_char
    add sp, 2
    mov ax, [bp-2]
 mov bx, ax ; bx now containts address for read
 xor ax, ax ; clear ax
 mov al, [bx] ; load byte
    push ax
    call print_char
    add sp, 2
 jmp .L_match_end_104
.L_match_end_104:
    jmp .L_endif_101
.L_else_100:
    mov ax, [bp-2]
 mov bx, ax ; bx now containts address for read
 xor ax, ax ; clear ax
 mov al, [bx] ; load byte
    push ax
    call print_char
    add sp, 2
.L_endif_101:
    mov ax, 1
 push ax
    mov ax, [bp-2]
 pop bx
 add ax, bx
 mov [bp-2], ax
    jmp .L_while_start_96
.L_while_end_97:
.printf_end:
 mov sp, bp
 pop bp
 ret

create_empty_file:
 push bp
 mov bp, sp

; --- nasmf v1 start ---
mov si, word [bp+4]
mov ah, 0x05
int 0x22
; --- nasmf v1 end ---
.create_empty_file_end:
 mov sp, bp
 pop bp
 ret

load_file:
 push bp
 mov bp, sp
 sub sp, 2
    mov ax, 0
 mov [bp-2], ax

; --- nasmf v1 start ---
mov si, word [bp+4]
mov cx, word [bp+6]
mov ah, 0x02
int 0x22
mov word [bp-2], bx
; --- nasmf v1 end ---
    mov ax, [bp-2]
    jmp .load_file_end
.load_file_end:
 mov sp, bp
 pop bp
 ret

_tokenize:
 push bp
 mov bp, sp
 sub sp, 35
    mov ax, 0
 mov bx, [bp+4]
 add bx, 5194
 mov [bx], al
    mov ax, 0
 mov bx, [bp+4]
 add bx, 5195
 mov [bx], al
    mov ax, 0
 mov bx, [bp+4]
 add bx, 5196
 mov [bx], al
    mov ax, 0
 push ax ; Save index
 mov bx, [bp+4]
 add bx, 4 ; Add field offset to get array base
 pop ax ; Restore index
 mov si, ax
 xor ax, ax ; Zero-out register to avoid sign extension
 mov al, [bx+si]   ; Load byte
 mov bx, [bp+4]
 add bx, 5193
 mov [bx], al
.L_while_start_109:
 mov bx, [bp+4]
 add bx, 4
 mov ax, bx
    push ax
    call strlen
    add sp, 2
    push ax
 mov bx, [bp+4]
 add bx, 5194
 xor ax, ax
 mov al, [bx]
    pop bx
    cmp ax, bx
    jl .L_comp_true_111
    mov ax, 0
    jmp .L_comp_end_112
.L_comp_true_111:
    mov ax, 1
.L_comp_end_112:
    cmp ax, 0
    je .L_while_end_110
    mov ax, [bp+4]
    push ax
    call skip_whitespace
    add sp, 2
    mov ax, 1
    neg ax
    push ax
 mov bx, [bp+4]
 add bx, 5193
 xor ax, ax
 mov al, [bx]
    pop bx
    cmp ax, bx
    je .L_comp_true_115
    mov ax, 0
    jmp .L_comp_end_116
.L_comp_true_115:
    mov ax, 1
.L_comp_end_116:
    cmp ax, 0
    je .L_endif_114
    mov ax, 0
    jmp ._tokenize_end
.L_endif_114:
 mov bx, [bp+4]
 add bx, 5193
 xor ax, ax
 mov al, [bx]
 mov [bp-1], al
    mov ax, 44
    push ax
    xor ax, ax
    mov al, [bp-1]
    pop bx
    cmp ax, bx
    je .L_comp_true_119
    mov ax, 0
    jmp .L_comp_end_120
.L_comp_true_119:
    mov ax, 1
.L_comp_end_120:
    cmp ax, 0
    je .L_else_117
 mov ax, 5 ; enum TokenType.COMMA
    push ax
    mov ax, [bp+4]
    push ax
    call register_token_simple
    add sp, 4
    mov ax, [bp+4]
    push ax
    call lexer_advance
    add sp, 2
    jmp .L_endif_118
.L_else_117:
    mov ax, 10
    push ax
    xor ax, ax
    mov al, [bp-1]
    pop bx
    cmp ax, bx
    je .L_comp_true_123
    mov ax, 0
    jmp .L_comp_end_124
.L_comp_true_123:
    mov ax, 1
.L_comp_end_124:
    cmp ax, 0
    je .L_else_121
    mov ax, [bp+4]
    push ax
    call lexer_advance
    add sp, 2
    jmp .L_endif_122
.L_else_121:
    mov ax, 13
    push ax
    xor ax, ax
    mov al, [bp-1]
    pop bx
    cmp ax, bx
    je .L_comp_true_127
    mov ax, 0
    jmp .L_comp_end_128
.L_comp_true_127:
    mov ax, 1
.L_comp_end_128:
    cmp ax, 0
    je .L_else_125
    mov ax, [bp+4]
    push ax
    call lexer_advance
    add sp, 2
    mov ax, 10
    push ax
 mov bx, [bp+4]
 add bx, 5193
 xor ax, ax
 mov al, [bx]
    pop bx
    cmp ax, bx
    je .L_comp_true_131
    mov ax, 0
    jmp .L_comp_end_132
.L_comp_true_131:
    mov ax, 1
.L_comp_end_132:
    cmp ax, 0
    je .L_endif_130
    mov ax, [bp+4]
    push ax
    call lexer_advance
    add sp, 2
.L_endif_130:
    jmp .L_endif_126
.L_else_125:
    mov ax, 43
    push ax
    xor ax, ax
    mov al, [bp-1]
    pop bx
    cmp ax, bx
    je .L_comp_true_135
    mov ax, 0
    jmp .L_comp_end_136
.L_comp_true_135:
    mov ax, 1
.L_comp_end_136:
    cmp ax, 0
    je .L_else_133
 mov ax, 6 ; enum TokenType.PLUS
    push ax
    mov ax, [bp+4]
    push ax
    call register_token_simple
    add sp, 4
    mov ax, [bp+4]
    push ax
    call lexer_advance
    add sp, 2
    jmp .L_endif_134
.L_else_133:
    mov ax, 91
    push ax
    xor ax, ax
    mov al, [bp-1]
    pop bx
    cmp ax, bx
    je .L_comp_true_139
    mov ax, 0
    jmp .L_comp_end_140
.L_comp_true_139:
    mov ax, 1
.L_comp_end_140:
    cmp ax, 0
    je .L_else_137
 mov ax, 7 ; enum TokenType.LBRACKET
    push ax
    mov ax, [bp+4]
    push ax
    call register_token_simple
    add sp, 4
    mov ax, [bp+4]
    push ax
    call lexer_advance
    add sp, 2
    jmp .L_endif_138
.L_else_137:
    mov ax, 93
    push ax
    xor ax, ax
    mov al, [bp-1]
    pop bx
    cmp ax, bx
    je .L_comp_true_143
    mov ax, 0
    jmp .L_comp_end_144
.L_comp_true_143:
    mov ax, 1
.L_comp_end_144:
    cmp ax, 0
    je .L_else_141
 mov ax, 8 ; enum TokenType.RBRACKET
    push ax
    mov ax, [bp+4]
    push ax
    call register_token_simple
    add sp, 4
    mov ax, [bp+4]
    push ax
    call lexer_advance
    add sp, 2
    jmp .L_endif_142
.L_else_141:
    mov ax, 59
    push ax
    xor ax, ax
    mov al, [bp-1]
    pop bx
    cmp ax, bx
    je .L_comp_true_147
    mov ax, 0
    jmp .L_comp_end_148
.L_comp_true_147:
    mov ax, 1
.L_comp_end_148:
    cmp ax, 0
    je .L_else_145
    mov ax, [bp+4]
    push ax
    call skip_comment
    add sp, 2
    jmp .L_endif_146
.L_else_145:
    xor ax, ax
    mov al, [bp-1]
    push ax
    call isdigit
    add sp, 2
    cmp ax, 0
    je .L_else_149
    mov ax, [bp+4]
    push ax
    call read_number
    add sp, 2
 mov [bp-3], ax
    mov ax, [bp-3]
    push ax
 mov ax, 2 ; enum TokenType.NUMBER
    push ax
    mov ax, [bp+4]
    push ax
    call register_token_number
    add sp, 6
    jmp .L_endif_150
.L_else_149:
    xor ax, ax
    mov al, [bp-1]
    push ax
    call isalpha
    add sp, 2
 cmp ax, 0
 jne .L_logic_true_154
    mov ax, 95
    push ax
    xor ax, ax
    mov al, [bp-1]
    pop bx
    cmp ax, bx
    je .L_comp_true_155
    mov ax, 0
    jmp .L_comp_end_156
.L_comp_true_155:
    mov ax, 1
.L_comp_end_156:
 cmp ax, 0
 jne .L_logic_true_154
 mov ax, 0
 jmp .L_logic_end_153
.L_logic_true_154:
 mov ax, 1
.L_logic_end_153:
    cmp ax, 0
    je .L_else_151
    lea ax, [bp-35]
    push ax
    mov ax, [bp+4]
    push ax
    call read_identifier
    add sp, 4
    mov ax, 58
    push ax
 mov bx, [bp+4]
 add bx, 5193
 xor ax, ax
 mov al, [bx]
    pop bx
    cmp ax, bx
    je .L_comp_true_159
    mov ax, 0
    jmp .L_comp_end_160
.L_comp_true_159:
    mov ax, 1
.L_comp_end_160:
    cmp ax, 0
    je .L_else_157
    mov ax, [bp+4]
    push ax
    call lexer_advance
    add sp, 2
    lea ax, [bp-35]
    push ax
 mov ax, 3 ; enum TokenType.LABEL
    push ax
    mov ax, [bp+4]
    push ax
    call register_token_string
    add sp, 6
    jmp .L_endif_158
.L_else_157:
    mov ax, 1
    push ax
    lea ax, [bp-35]
    push ax
    call is_instruction
    add sp, 2
    pop bx
    cmp ax, bx
    je .L_comp_true_163
    mov ax, 0
    jmp .L_comp_end_164
.L_comp_true_163:
    mov ax, 1
.L_comp_end_164:
    cmp ax, 0
    je .L_else_161
    lea ax, [bp-35]
    push ax
 mov ax, 0 ; enum TokenType.INSTRUCTION
    push ax
    mov ax, [bp+4]
    push ax
    call register_token_string
    add sp, 6
    jmp .L_endif_162
.L_else_161:
    mov ax, 1
    push ax
    lea ax, [bp-35]
    push ax
    call is_register_16
    add sp, 2
    pop bx
    cmp ax, bx
    je .L_comp_true_169
    mov ax, 0
    jmp .L_comp_end_170
.L_comp_true_169:
    mov ax, 1
.L_comp_end_170:
 cmp ax, 0
 jne .L_logic_true_168
    mov ax, 1
    push ax
    lea ax, [bp-35]
    push ax
    call is_register_8
    add sp, 2
    pop bx
    cmp ax, bx
    je .L_comp_true_171
    mov ax, 0
    jmp .L_comp_end_172
.L_comp_true_171:
    mov ax, 1
.L_comp_end_172:
 cmp ax, 0
 jne .L_logic_true_168
 mov ax, 0
 jmp .L_logic_end_167
.L_logic_true_168:
 mov ax, 1
.L_logic_end_167:
    cmp ax, 0
    je .L_else_165
    lea ax, [bp-35]
    push ax
 mov ax, 1 ; enum TokenType.REGISTER
    push ax
    mov ax, [bp+4]
    push ax
    call register_token_string
    add sp, 6
    jmp .L_endif_166
.L_else_165:
    lea ax, [bp-35]
    push ax
 mov ax, 4 ; enum TokenType.IDENTIFIER
    push ax
    mov ax, [bp+4]
    push ax
    call register_token_string
    add sp, 6
.L_endif_166:
.L_endif_162:
.L_endif_158:
    jmp .L_endif_152
.L_else_151:
    xor ax, ax
    mov al, [bp-1]
    push ax
 mov ax, _str_2
    push ax
    call printf
    add sp, 4

; --- exit statement --- 
; --- Restore original segments ---
 cli          ; Disable interrupts
 mov ax, [_orig_ds]
 mov ds, ax   ; Restore DS
 mov ax, [_orig_es]
 mov es, ax   ; Restore ES
 mov ax, [_orig_ss]
 mov ss, ax   ; Restore SS
 sti          ; Re-enable interrupts
    mov ax, 22
 mov bx, ax ; Save exit code
 mov bp, [_start_bp]
 mov sp, bp
 pop bp
 mov ax, bx
 ret

.L_endif_152:
.L_endif_150:
.L_endif_146:
.L_endif_142:
.L_endif_138:
.L_endif_134:
.L_endif_126:
.L_endif_122:
.L_endif_118:
    jmp .L_while_start_109
.L_while_end_110:
 mov ax, 10 ; enum TokenType.EOF
    push ax
    mov ax, [bp+4]
    push ax
    call register_token_simple
    add sp, 4
._tokenize_end:
 mov sp, bp
 pop bp
 ret

register_token_simple:
 push bp
 mov bp, sp
 sub sp, 39
    mov ax, [bp+6]
 lea bx, [bp-39]
 mov [bx], al
 mov bx, [bp+4]
 add bx, 5195
 xor ax, ax
 mov al, [bx]
 lea bx, [bp-4]
 mov word [bx], ax
 mov bx, [bp+4]
 add bx, 5196
 xor ax, ax
 mov al, [bx]
 lea bx, [bp-2]
 mov word [bx], ax
    mov ax, [bp-39]
 push ax ; Save value
 mov bx, [bp+4]
 add bx, 5191
 mov ax, [bx]
 push ax ; Save index
 mov bx, [bp+4]
 add bx, 4167
 pop ax ; Restore index
 imul ax, 39
 add bx, ax ; Calculate element address
 pop ax ; Restore value
 mov word [bx], ax
    mov ax, 1
 push ax
 mov bx, [bp+4]
 add bx, 5191
 mov ax, [bx]
 pop bx
 add ax, bx
 mov bx, [bp+4]
 add bx, 5191
 mov word [bx], ax
.register_token_simple_end:
 mov sp, bp
 pop bp
 ret

register_token_string:
 push bp
 mov bp, sp
 sub sp, 39
    mov ax, [bp+6]
 lea bx, [bp-39]
 mov [bx], al
 mov bx, [bp+4]
 add bx, 5195
 xor ax, ax
 mov al, [bx]
 lea bx, [bp-4]
 mov word [bx], ax
 mov bx, [bp+4]
 add bx, 5196
 xor ax, ax
 mov al, [bx]
 lea bx, [bp-2]
 mov word [bx], ax
    mov ax, [bp+8]
    push ax
 lea ax, [bp-38]
    push ax
    call strcpy
    add sp, 4
    mov ax, [bp-39]
 push ax ; Save value
 mov bx, [bp+4]
 add bx, 5191
 mov ax, [bx]
 push ax ; Save index
 mov bx, [bp+4]
 add bx, 4167
 pop ax ; Restore index
 imul ax, 39
 add bx, ax ; Calculate element address
 pop ax ; Restore value
 mov word [bx], ax
    mov ax, 1
 push ax
 mov bx, [bp+4]
 add bx, 5191
 mov ax, [bx]
 pop bx
 add ax, bx
 mov bx, [bp+4]
 add bx, 5191
 mov word [bx], ax
.register_token_string_end:
 mov sp, bp
 pop bp
 ret

register_token_number:
 push bp
 mov bp, sp
 sub sp, 39
    mov ax, [bp+6]
 lea bx, [bp-39]
 mov [bx], al
 mov bx, [bp+4]
 add bx, 5195
 xor ax, ax
 mov al, [bx]
 lea bx, [bp-4]
 mov word [bx], ax
 mov bx, [bp+4]
 add bx, 5196
 xor ax, ax
 mov al, [bx]
 lea bx, [bp-2]
 mov word [bx], ax
    mov ax, [bp+8]
 lea bx, [bp-6]
 mov word [bx], ax
    mov ax, [bp-39]
 push ax ; Save value
 mov bx, [bp+4]
 add bx, 5191
 mov ax, [bx]
 push ax ; Save index
 mov bx, [bp+4]
 add bx, 4167
 pop ax ; Restore index
 imul ax, 39
 add bx, ax ; Calculate element address
 pop ax ; Restore value
 mov word [bx], ax
    mov ax, 1
 push ax
 mov bx, [bp+4]
 add bx, 5191
 mov ax, [bx]
 pop bx
 add ax, bx
 mov bx, [bp+4]
 add bx, 5191
 mov word [bx], ax
.register_token_number_end:
 mov sp, bp
 pop bp
 ret

isspace:
 push bp
 mov bp, sp
    mov ax, 32
    push ax
    mov ax, [bp+4]
    pop bx
    cmp ax, bx
    je .L_comp_true_177
    mov ax, 0
    jmp .L_comp_end_178
.L_comp_true_177:
    mov ax, 1
.L_comp_end_178:
 cmp ax, 0
 jne .L_logic_true_176
    mov ax, 9
    push ax
    mov ax, [bp+4]
    pop bx
    cmp ax, bx
    je .L_comp_true_179
    mov ax, 0
    jmp .L_comp_end_180
.L_comp_true_179:
    mov ax, 1
.L_comp_end_180:
 cmp ax, 0
 jne .L_logic_true_176
 mov ax, 0
 jmp .L_logic_end_175
.L_logic_true_176:
 mov ax, 1
.L_logic_end_175:
    cmp ax, 0
    je .L_endif_174
    mov ax, 1
    jmp .isspace_end
.L_endif_174:
    mov ax, 0
    jmp .isspace_end
.isspace_end:
 mov sp, bp
 pop bp
 ret

lexer_advance:
 push bp
 mov bp, sp
    mov ax, 10
    push ax
 mov bx, [bp+4]
 add bx, 5193
 xor ax, ax
 mov al, [bx]
    pop bx
    cmp ax, bx
    je .L_comp_true_183
    mov ax, 0
    jmp .L_comp_end_184
.L_comp_true_183:
    mov ax, 1
.L_comp_end_184:
    cmp ax, 0
    je .L_endif_182
    mov ax, 1
 push ax
 mov bx, [bp+4]
 add bx, 5195
 xor ax, ax
 mov al, [bx]
 pop bx
 add ax, bx
 mov bx, [bp+4]
 add bx, 5195
 mov [bx], al
    mov ax, 0
 mov bx, [bp+4]
 add bx, 5196
 mov [bx], al
.L_endif_182:
    mov ax, 1
 push ax
 mov bx, [bp+4]
 add bx, 5194
 xor ax, ax
 mov al, [bx]
 pop bx
 add ax, bx
 mov bx, [bp+4]
 add bx, 5194
 mov [bx], al
    mov ax, 1
 push ax
 mov bx, [bp+4]
 add bx, 4
 mov ax, bx
    push ax
    call strlen
    add sp, 2
 pop bx
 sub ax, bx
    push ax
 mov bx, [bp+4]
 add bx, 5194
 xor ax, ax
 mov al, [bx]
    pop bx
    cmp ax, bx
    jg .L_comp_true_189
    mov ax, 0
    jmp .L_comp_end_190
.L_comp_true_189:
    mov ax, 1
.L_comp_end_190:
 cmp ax, 0
 jne .L_logic_true_188
    mov ax, 0
    push ax
 mov bx, [bp+4]
 add bx, 5193
 xor ax, ax
 mov al, [bx]
    pop bx
    cmp ax, bx
    je .L_comp_true_191
    mov ax, 0
    jmp .L_comp_end_192
.L_comp_true_191:
    mov ax, 1
.L_comp_end_192:
 cmp ax, 0
 jne .L_logic_true_188
 mov ax, 0
 jmp .L_logic_end_187
.L_logic_true_188:
 mov ax, 1
.L_logic_end_187:
    cmp ax, 0
    je .L_else_185
    mov ax, 1
    neg ax
 mov bx, [bp+4]
 add bx, 5193
 mov [bx], al
    jmp .L_endif_186
.L_else_185:
 mov bx, [bp+4]
 add bx, 5194
 xor ax, ax
 mov al, [bx]
 push ax ; Save index
 mov bx, [bp+4]
 add bx, 4 ; Add field offset to get array base
 pop ax ; Restore index
 mov si, ax
 xor ax, ax ; Zero-out register to avoid sign extension
 mov al, [bx+si]   ; Load byte
 mov bx, [bp+4]
 add bx, 5193
 mov [bx], al
    mov ax, 1
 push ax
 mov bx, [bp+4]
 add bx, 5196
 xor ax, ax
 mov al, [bx]
 pop bx
 add ax, bx
 mov bx, [bp+4]
 add bx, 5196
 mov [bx], al
.L_endif_186:
.lexer_advance_end:
 mov sp, bp
 pop bp
 ret

skip_whitespace:
 push bp
 mov bp, sp
.L_while_start_193:
    mov ax, 1
    neg ax
    push ax
 mov bx, [bp+4]
 add bx, 5193
 xor ax, ax
 mov al, [bx]
    pop bx
    cmp ax, bx
    jne .L_comp_true_197
    mov ax, 0
    jmp .L_comp_end_198
.L_comp_true_197:
    mov ax, 1
.L_comp_end_198:
 cmp ax, 0
 je .L_logic_false_196
    mov ax, 1
    push ax
 mov bx, [bp+4]
 add bx, 5193
 xor ax, ax
 mov al, [bx]
    push ax
    call isspace
    add sp, 2
    pop bx
    cmp ax, bx
    je .L_comp_true_199
    mov ax, 0
    jmp .L_comp_end_200
.L_comp_true_199:
    mov ax, 1
.L_comp_end_200:
 cmp ax, 0
 je .L_logic_false_196
 mov ax, 1
 jmp .L_logic_end_195
.L_logic_false_196:
 mov ax, 0
.L_logic_end_195:
    cmp ax, 0
    je .L_while_end_194
    mov ax, [bp+4]
    push ax
    call lexer_advance
    add sp, 2
    jmp .L_while_start_193
.L_while_end_194:
.skip_whitespace_end:
 mov sp, bp
 pop bp
 ret

skip_comment:
 push bp
 mov bp, sp
    mov ax, 59
    push ax
 mov bx, [bp+4]
 add bx, 5193
 xor ax, ax
 mov al, [bx]
    pop bx
    cmp ax, bx
    je .L_comp_true_203
    mov ax, 0
    jmp .L_comp_end_204
.L_comp_true_203:
    mov ax, 1
.L_comp_end_204:
    cmp ax, 0
    je .L_endif_202
.L_while_start_205:
    mov ax, 1
    neg ax
    push ax
 mov bx, [bp+4]
 add bx, 5193
 xor ax, ax
 mov al, [bx]
    pop bx
    cmp ax, bx
    jne .L_comp_true_209
    mov ax, 0
    jmp .L_comp_end_210
.L_comp_true_209:
    mov ax, 1
.L_comp_end_210:
 cmp ax, 0
 je .L_logic_false_208
    mov ax, 10
    push ax
 mov bx, [bp+4]
 add bx, 5193
 xor ax, ax
 mov al, [bx]
    pop bx
    cmp ax, bx
    jne .L_comp_true_211
    mov ax, 0
    jmp .L_comp_end_212
.L_comp_true_211:
    mov ax, 1
.L_comp_end_212:
 cmp ax, 0
 je .L_logic_false_208
 mov ax, 1
 jmp .L_logic_end_207
.L_logic_false_208:
 mov ax, 0
.L_logic_end_207:
    cmp ax, 0
    je .L_while_end_206
    mov ax, [bp+4]
    push ax
    call lexer_advance
    add sp, 2
    jmp .L_while_start_205
.L_while_end_206:
.L_endif_202:
.skip_comment_end:
 mov sp, bp
 pop bp
 ret

read_number:
 push bp
 mov bp, sp
 sub sp, 5
    mov ax, 0
 mov [bp-2], ax
    mov ax, 0
 mov [bp-4], ax
    mov ax, 36
    push ax
 mov bx, [bp+4]
 add bx, 5193
 xor ax, ax
 mov al, [bx]
    pop bx
    cmp ax, bx
    je .L_comp_true_215
    mov ax, 0
    jmp .L_comp_end_216
.L_comp_true_215:
    mov ax, 1
.L_comp_end_216:
    cmp ax, 0
    je .L_endif_214
    mov ax, 1
 mov [bp-4], ax
    mov ax, [bp+4]
    push ax
    call lexer_advance
    add sp, 2
.L_endif_214:
    mov ax, 1
    push ax
    mov ax, [bp-4]
    pop bx
    cmp ax, bx
    je .L_comp_true_219
    mov ax, 0
    jmp .L_comp_end_220
.L_comp_true_219:
    mov ax, 1
.L_comp_end_220:
    cmp ax, 0
    je .L_else_217
.L_while_start_221:
    mov ax, 1
    neg ax
    push ax
 mov bx, [bp+4]
 add bx, 5193
 xor ax, ax
 mov al, [bx]
    pop bx
    cmp ax, bx
    jne .L_comp_true_225
    mov ax, 0
    jmp .L_comp_end_226
.L_comp_true_225:
    mov ax, 1
.L_comp_end_226:
 cmp ax, 0
 je .L_logic_false_224
 mov bx, [bp+4]
 add bx, 5193
 xor ax, ax
 mov al, [bx]
    push ax
    call ishexnum
    add sp, 2
 cmp ax, 0
 je .L_logic_false_224
 mov ax, 1
 jmp .L_logic_end_223
.L_logic_false_224:
 mov ax, 0
.L_logic_end_223:
    cmp ax, 0
    je .L_while_end_222
    mov ax, 16
 push ax
    mov ax, [bp-2]
 pop bx
 imul ax, bx
 mov [bp-2], ax
 mov bx, [bp+4]
 add bx, 5193
 xor ax, ax
 mov al, [bx]
 mov [bp-5], al
    mov ax, 65
    push ax
    xor ax, ax
    mov al, [bp-5]
    pop bx
    cmp ax, bx
    jge .L_comp_true_229
    mov ax, 0
    jmp .L_comp_end_230
.L_comp_true_229:
    mov ax, 1
.L_comp_end_230:
    cmp ax, 0
    je .L_else_227
    mov ax, 10
 push ax
    mov ax, 65
 push ax
    xor ax, ax
    mov al, [bp-5]
 pop bx
 sub ax, bx
 pop bx
 add ax, bx
 push ax
    mov ax, [bp-2]
 pop bx
 add ax, bx
 mov [bp-2], ax
    jmp .L_endif_228
.L_else_227:
    mov ax, 48
 push ax
    xor ax, ax
    mov al, [bp-5]
 pop bx
 sub ax, bx
 push ax
    mov ax, [bp-2]
 pop bx
 add ax, bx
 mov [bp-2], ax
.L_endif_228:
    mov ax, [bp+4]
    push ax
    call lexer_advance
    add sp, 2
    jmp .L_while_start_221
.L_while_end_222:
    jmp .L_endif_218
.L_else_217:
.L_while_start_231:
    mov ax, 1
    neg ax
    push ax
 mov bx, [bp+4]
 add bx, 5193
 xor ax, ax
 mov al, [bx]
    pop bx
    cmp ax, bx
    jne .L_comp_true_235
    mov ax, 0
    jmp .L_comp_end_236
.L_comp_true_235:
    mov ax, 1
.L_comp_end_236:
 cmp ax, 0
 je .L_logic_false_234
 mov bx, [bp+4]
 add bx, 5193
 xor ax, ax
 mov al, [bx]
    push ax
    call isdigit
    add sp, 2
 cmp ax, 0
 je .L_logic_false_234
 mov ax, 1
 jmp .L_logic_end_233
.L_logic_false_234:
 mov ax, 0
.L_logic_end_233:
    cmp ax, 0
    je .L_while_end_232
    mov ax, 10
 push ax
    mov ax, [bp-2]
 pop bx
 imul ax, bx
 mov [bp-2], ax
    mov ax, 48
 push ax
 mov bx, [bp+4]
 add bx, 5193
 xor ax, ax
 mov al, [bx]
 pop bx
 sub ax, bx
 push ax
    mov ax, [bp-2]
 pop bx
 add ax, bx
 mov [bp-2], ax
    mov ax, [bp+4]
    push ax
    call lexer_advance
    add sp, 2
    jmp .L_while_start_231
.L_while_end_232:
.L_endif_218:
    mov ax, [bp-2]
    jmp .read_number_end
.read_number_end:
 mov sp, bp
 pop bp
 ret

read_identifier:
 push bp
 mov bp, sp
 sub sp, 1
    mov ax, 0
 mov [bp-1], al
.L_while_start_237:
    mov ax, 1
    neg ax
    push ax
 mov bx, [bp+4]
 add bx, 5193
 xor ax, ax
 mov al, [bx]
    pop bx
    cmp ax, bx
    jne .L_comp_true_241
    mov ax, 0
    jmp .L_comp_end_242
.L_comp_true_241:
    mov ax, 1
.L_comp_end_242:
 cmp ax, 0
 je .L_logic_false_240
    mov ax, 1
    push ax
 mov bx, [bp+4]
 add bx, 5193
 xor ax, ax
 mov al, [bx]
    push ax
    call isalnum
    add sp, 2
    pop bx
    cmp ax, bx
    je .L_comp_true_243
    mov ax, 0
    jmp .L_comp_end_244
.L_comp_true_243:
    mov ax, 1
.L_comp_end_244:
 cmp ax, 0
 je .L_logic_false_240
 mov ax, 1
 jmp .L_logic_end_239
.L_logic_false_240:
 mov ax, 0
.L_logic_end_239:
    cmp ax, 0
    je .L_while_end_238
 mov bx, [bp+4]
 add bx, 5193
 xor ax, ax
 mov al, [bx]
 push ax ; Save value
    xor ax, ax
    mov al, [bp-1]
 mov bx, [bp+6]
 mov si, ax
 pop ax ; Restore value
 mov [bx+si], al
    mov ax, 1
 push ax
    xor ax, ax
    mov al, [bp-1]
 pop bx
 add ax, bx
 mov [bp-1], al
    mov ax, [bp+4]
    push ax
    call lexer_advance
    add sp, 2
    jmp .L_while_start_237
.L_while_end_238:
    mov ax, 0
 push ax ; Save value
    xor ax, ax
    mov al, [bp-1]
 mov bx, [bp+6]
 mov si, ax
 pop ax ; Restore value
 mov [bx+si], al
.read_identifier_end:
 mov sp, bp
 pop bp
 ret

is_instruction:
 push bp
 mov bp, sp
 mov ax, _str_3
    push ax
    mov ax, [bp+4]
    push ax
    call strcmp_3
    add sp, 4
 cmp ax, 0
 jne .L_logic_true_254
 mov ax, _str_4
    push ax
    mov ax, [bp+4]
    push ax
    call strcmp_3
    add sp, 4
 cmp ax, 0
 jne .L_logic_true_254
 mov ax, 0
 jmp .L_logic_end_253
.L_logic_true_254:
 mov ax, 1
.L_logic_end_253:
 cmp ax, 0
 jne .L_logic_true_252
 mov ax, _str_5
    push ax
    mov ax, [bp+4]
    push ax
    call strcmp_3
    add sp, 4
 cmp ax, 0
 jne .L_logic_true_252
 mov ax, 0
 jmp .L_logic_end_251
.L_logic_true_252:
 mov ax, 1
.L_logic_end_251:
 cmp ax, 0
 jne .L_logic_true_250
 mov ax, _str_6
    push ax
    mov ax, [bp+4]
    push ax
    call strcmp_3
    add sp, 4
 cmp ax, 0
 jne .L_logic_true_250
 mov ax, 0
 jmp .L_logic_end_249
.L_logic_true_250:
 mov ax, 1
.L_logic_end_249:
 cmp ax, 0
 jne .L_logic_true_248
 mov ax, _str_7
    push ax
    mov ax, [bp+4]
    push ax
    call strcmp_3
    add sp, 4
 cmp ax, 0
 jne .L_logic_true_248
 mov ax, 0
 jmp .L_logic_end_247
.L_logic_true_248:
 mov ax, 1
.L_logic_end_247:
    cmp ax, 0
    je .L_endif_246
    mov ax, 1
    jmp .is_instruction_end
.L_endif_246:
    mov ax, 0
    jmp .is_instruction_end
.is_instruction_end:
 mov sp, bp
 pop bp
 ret

parse:
 push bp
 mov bp, sp
    mov ax, 0
 mov bx, [bp+4]
 add bx, 5194
 mov [bx], al
    mov ax, 0
 push ax ; Save index
 mov bx, [bp+4]
 add bx, 4167 ; Add field offset to get array base
 pop ax ; Restore index
 imul ax, 2
 mov si, ax
 mov ax, word [bx+si]
 mov bx, [bp+4]
 add bx, 5197
 mov word [bx], ax
 mov ax, _str_8
 mov bx, [bp+4]
 add bx, 5199
 mov word [bx], ax
.parse_end:
 mov sp, bp
 pop bp
 ret

parser_advance:
 push bp
 mov bp, sp
    mov ax, 1
 push ax
 mov bx, [bp+4]
 add bx, 5194
 xor ax, ax
 mov al, [bx]
 pop bx
 add ax, bx
 mov bx, [bp+4]
 add bx, 5194
 mov [bx], al
    mov ax, 512
    push ax
 mov bx, [bp+4]
 add bx, 5194
 xor ax, ax
 mov al, [bx]
    pop bx
    cmp ax, bx
    jl .L_comp_true_257
    mov ax, 0
    jmp .L_comp_end_258
.L_comp_true_257:
    mov ax, 1
.L_comp_end_258:
    cmp ax, 0
    je .L_else_255
 mov bx, [bp+4]
 add bx, 5194
 xor ax, ax
 mov al, [bx]
 push ax ; Save index
 mov bx, [bp+4]
 add bx, 4167 ; Add field offset to get array base
 pop ax ; Restore index
 imul ax, 2
 mov si, ax
 mov ax, word [bx+si]
 mov bx, [bp+4]
 add bx, 5197
 mov word [bx], ax
    jmp .L_endif_256
.L_else_255:
    mov ax, 1
    neg ax
 mov bx, [bp+4]
 add bx, 5197
 mov word [bx], ax
.L_endif_256:
.parser_advance_end:
 mov sp, bp
 pop bp
 ret

except:
 push bp
 mov bp, sp
    mov ax, 1
    neg ax
    push ax
 mov bx, [bp+4]
 add bx, 5197
 mov ax, [bx]
    pop bx
    cmp ax, bx
    je .L_comp_true_263
    mov ax, 0
    jmp .L_comp_end_264
.L_comp_true_263:
    mov ax, 1
.L_comp_end_264:
 cmp ax, 0
 jne .L_logic_true_262
    mov ax, [bp+6]
    push ax
 mov bx, [bp+4]
 add bx, 5197
 xor ax, ax
 mov al, [bx]
    pop bx
    cmp ax, bx
    jne .L_comp_true_265
    mov ax, 0
    jmp .L_comp_end_266
.L_comp_true_265:
    mov ax, 1
.L_comp_end_266:
 cmp ax, 0
 jne .L_logic_true_262
 mov ax, 0
 jmp .L_logic_end_261
.L_logic_true_262:
 mov ax, 1
.L_logic_end_261:
    cmp ax, 0
    je .L_endif_260
 xor ax, ax
 mov al, [_var_VGA_COLORS+12]
    push ax
    call set_text_color
    add sp, 2
 mov bx, [bp+4]
 add bx, 5197
 xor ax, ax
 mov al, [bx]
    push ax
    mov ax, [bp+6]
    push ax
 mov ax, _str_9
    push ax
    call printf
    add sp, 6
 xor ax, ax
 mov al, [_var_VGA_COLORS+15]
    push ax
    call set_text_color
    add sp, 2
.L_endif_260:
    mov ax, [bp+4]
    push ax
    call parser_advance
    add sp, 2
.except_end:
 mov sp, bp
 pop bp
 ret

generate_binary:
 push bp
 mov bp, sp
    mov ax, [bp+6]
    push ax
    call print_string
    add sp, 2
    call print_newline
.generate_binary_end:
 mov sp, bp
 pop bp
 ret

generate_instruction:
 push bp
 mov bp, sp
 sub sp, 1
    mov ax, [bp+6]
    push ax
    call is_register_16
    add sp, 2
 cmp ax, 0
 je .L_logic_false_270
    mov ax, [bp+8]
    push ax
    call is_register_16
    add sp, 2
 cmp ax, 0
 je .L_logic_false_270
 mov ax, 1
 jmp .L_logic_end_269
.L_logic_false_270:
 mov ax, 0
.L_logic_end_269:
    cmp ax, 0
    je .L_endif_268
    mov ax, [bp+10]
    push ax
    mov ax, [bp+8]
    push ax
    mov ax, [bp+6]
    push ax
    mov ax, [bp+4]
    push ax
    call gen_reg16_reg16
    add sp, 8
 mov [bp-1], al
    mov ax, 0
    push ax
    xor ax, ax
    mov al, [bp-1]
    pop bx
    cmp ax, bx
    jg .L_comp_true_273
    mov ax, 0
    jmp .L_comp_end_274
.L_comp_true_273:
    mov ax, 1
.L_comp_end_274:
    cmp ax, 0
    je .L_endif_272
    xor ax, ax
    mov al, [bp-1]
    jmp .generate_instruction_end
.L_endif_272:
.L_endif_268:
    mov ax, 1
    neg ax
    jmp .generate_instruction_end
.generate_instruction_end:
 mov sp, bp
 pop bp
 ret

gen_reg16_reg16:
 push bp
 mov bp, sp
 sub sp, 3
    mov ax, 20
    push ax
    mov ax, [bp+6]
    push ax
    call is_register_16
    add sp, 2
    pop bx
    cmp ax, bx
    je .L_comp_true_279
    mov ax, 0
    jmp .L_comp_end_280
.L_comp_true_279:
    mov ax, 1
.L_comp_end_280:
 cmp ax, 0
 jne .L_logic_true_278
    mov ax, 20
    push ax
    mov ax, [bp+8]
    push ax
    call is_register_16
    add sp, 2
    pop bx
    cmp ax, bx
    je .L_comp_true_281
    mov ax, 0
    jmp .L_comp_end_282
.L_comp_true_281:
    mov ax, 1
.L_comp_end_282:
 cmp ax, 0
 jne .L_logic_true_278
 mov ax, 0
 jmp .L_logic_end_277
.L_logic_true_278:
 mov ax, 1
.L_logic_end_277:
    cmp ax, 0
    je .L_endif_276
    mov ax, 1
    neg ax
    jmp .gen_reg16_reg16_end
.L_endif_276:
    mov ax, [bp+6]
    push ax
    call get_register_code_16
    add sp, 2
 mov [bp-1], al
    mov ax, [bp+8]
    push ax
    call get_register_code_16
    add sp, 2
 mov [bp-2], al
    mov ax, [bp+4]
    push ax
    call get_mnemonic_index
    add sp, 2
 mov [bp-3], al
 mov ax, _str_10
    push ax
    mov ax, [bp+4]
    push ax
    call strcmp_3
    add sp, 4
    cmp ax, 0
    je .L_else_283
    xor ax, ax
    mov al, [bp-3]
 push ax ; Save index
 mov bx, _arr_INSTRUCTION_TABLE
 pop ax ; Restore index
 mov cx, 10
 imul ax, cx
 add bx, ax
 add bx, 4
 xor ax, ax
 mov al, [bx]
 push ax ; Save value
    mov ax, 0
 mov bx, [bp+10]
 mov si, ax
 pop ax ; Restore value
 mov [bx+si], al
    xor ax, ax
    mov al, [bp-2]
 push ax
    mov ax, 3
 push ax
    xor ax, ax
    mov al, [bp-1]
 pop bx
 mov cl, bl ; Use low byte of bx
 shl ax, cl
 push ax
    mov ax, 192
 pop bx
 or ax, bx
 pop bx
 or ax, bx
 push ax ; Save value
    mov ax, 1
 mov bx, [bp+10]
 mov si, ax
 pop ax ; Restore value
 mov [bx+si], al
    mov ax, 2
    jmp .gen_reg16_reg16_end
    jmp .L_endif_284
.L_else_283:
    xor ax, ax
    mov al, [bp-3]
 push ax ; Save index
 mov bx, _arr_INSTRUCTION_TABLE
 pop ax ; Restore index
 mov cx, 10
 imul ax, cx
 add bx, ax
 add bx, 6
 xor ax, ax
 mov al, [bx]
 push ax ; Save value
    mov ax, 0
 mov bx, [bp+10]
 mov si, ax
 pop ax ; Restore value
 mov [bx+si], al
    xor ax, ax
    mov al, [bp-1]
 push ax
    mov ax, 3
 push ax
    xor ax, ax
    mov al, [bp-2]
 pop bx
 mov cl, bl ; Use low byte of bx
 shl ax, cl
 push ax
    mov ax, 192
 pop bx
 or ax, bx
 pop bx
 or ax, bx
 push ax ; Save value
    mov ax, 1
 mov bx, [bp+10]
 mov si, ax
 pop ax ; Restore value
 mov [bx+si], al
    mov ax, 2
    jmp .gen_reg16_reg16_end
.L_endif_284:
.gen_reg16_reg16_end:
 mov sp, bp
 pop bp
 ret

gen_reg8_reg8:
 push bp
 mov bp, sp
 sub sp, 3
    mov ax, 20
    push ax
    mov ax, [bp+6]
    push ax
    call is_register_8
    add sp, 2
    pop bx
    cmp ax, bx
    je .L_comp_true_289
    mov ax, 0
    jmp .L_comp_end_290
.L_comp_true_289:
    mov ax, 1
.L_comp_end_290:
 cmp ax, 0
 jne .L_logic_true_288
    mov ax, 20
    push ax
    mov ax, [bp+8]
    push ax
    call is_register_8
    add sp, 2
    pop bx
    cmp ax, bx
    je .L_comp_true_291
    mov ax, 0
    jmp .L_comp_end_292
.L_comp_true_291:
    mov ax, 1
.L_comp_end_292:
 cmp ax, 0
 jne .L_logic_true_288
 mov ax, 0
 jmp .L_logic_end_287
.L_logic_true_288:
 mov ax, 1
.L_logic_end_287:
    cmp ax, 0
    je .L_endif_286
    mov ax, 1
    neg ax
    jmp .gen_reg8_reg8_end
.L_endif_286:
    mov ax, [bp+6]
    push ax
    call get_register_code_8
    add sp, 2
 mov [bp-1], al
    mov ax, [bp+8]
    push ax
    call get_register_code_8
    add sp, 2
 mov [bp-2], al
    mov ax, [bp+4]
    push ax
    call get_mnemonic_index
    add sp, 2
 mov [bp-3], al
 mov ax, _str_11
    push ax
    mov ax, [bp+4]
    push ax
    call strcmp_3
    add sp, 4
    cmp ax, 0
    je .L_else_293
 mov ax, _str_12
    push ax
    call get_mnemonic_index
    add sp, 2
 push ax ; Save index
 mov bx, _arr_INSTRUCTION_TABLE
 pop ax ; Restore index
 mov cx, 10
 imul ax, cx
 add bx, ax
 add bx, 3
 xor ax, ax
 mov al, [bx]
 push ax ; Save value
    mov ax, 0
 mov bx, [bp+10]
 mov si, ax
 pop ax ; Restore value
 mov [bx+si], al
    xor ax, ax
    mov al, [bp-2]
 push ax
    mov ax, 3
 push ax
    xor ax, ax
    mov al, [bp-1]
 pop bx
 mov cl, bl ; Use low byte of bx
 shl ax, cl
 push ax
    mov ax, 192
 pop bx
 or ax, bx
 pop bx
 or ax, bx
 push ax ; Save value
    mov ax, 1
 mov bx, [bp+10]
 mov si, ax
 pop ax ; Restore value
 mov [bx+si], al
    mov ax, 2
    jmp .gen_reg8_reg8_end
    jmp .L_endif_294
.L_else_293:
    xor ax, ax
    mov al, [bp-3]
 push ax ; Save index
 mov bx, _arr_INSTRUCTION_TABLE
 pop ax ; Restore index
 mov cx, 10
 imul ax, cx
 add bx, ax
 add bx, 5
 xor ax, ax
 mov al, [bx]
 push ax ; Save value
    mov ax, 0
 mov bx, [bp+10]
 mov si, ax
 pop ax ; Restore value
 mov [bx+si], al
    xor ax, ax
    mov al, [bp-1]
 push ax
    mov ax, 3
 push ax
    xor ax, ax
    mov al, [bp-2]
 pop bx
 mov cl, bl ; Use low byte of bx
 shl ax, cl
 push ax
    mov ax, 192
 pop bx
 or ax, bx
 pop bx
 or ax, bx
 push ax ; Save value
    mov ax, 1
 mov bx, [bp+10]
 mov si, ax
 pop ax ; Restore value
 mov [bx+si], al
    mov ax, 2
    jmp .gen_reg8_reg8_end
.L_endif_294:
.gen_reg8_reg8_end:
 mov sp, bp
 pop bp
 ret

gen_reg16_imm:
 push bp
 mov bp, sp
 sub sp, 1
    mov ax, 20
    push ax
    mov ax, [bp+6]
    push ax
    call is_register_16
    add sp, 2
    pop bx
    cmp ax, bx
    je .L_comp_true_299
    mov ax, 0
    jmp .L_comp_end_300
.L_comp_true_299:
    mov ax, 1
.L_comp_end_300:
 cmp ax, 0
 jne .L_logic_true_298
    mov ax, 1
    neg ax
    push ax
    mov ax, [bp+8]
    push ax
    call is_immediate
    add sp, 2
    pop bx
    cmp ax, bx
    je .L_comp_true_301
    mov ax, 0
    jmp .L_comp_end_302
.L_comp_true_301:
    mov ax, 1
.L_comp_end_302:
 cmp ax, 0
 jne .L_logic_true_298
 mov ax, 0
 jmp .L_logic_end_297
.L_logic_true_298:
 mov ax, 1
.L_logic_end_297:
    cmp ax, 0
    je .L_endif_296
    mov ax, 1
    neg ax
    jmp .gen_reg16_imm_end
.L_endif_296:
    mov ax, [bp+6]
    push ax
    call get_register_code_16
    add sp, 2
 mov [bp-1], al
.gen_reg16_imm_end:
 mov sp, bp
 pop bp
 ret

init_instruction_table:
 push bp
 mov bp, sp
 mov ax, _str_13
 push ax ; Save value
    mov ax, 0
 push ax ; Save index
 mov bx, _arr_INSTRUCTION_TABLE
 pop ax ; Restore index
 mov cx, 10
 imul ax, cx
 mov si, ax
 add bx, si
 pop ax ; Restore value
 mov word [bx], ax
    mov ax, 138
 push ax ; Save value
    mov ax, 0
 push ax ; Save index
 mov bx, _arr_INSTRUCTION_TABLE
 pop ax ; Restore index
 mov cx, 10
 imul ax, cx
 mov si, ax
 add bx, si
 add bx, 3
 pop ax ; Restore value
 mov [bx], al
    mov ax, 139
 push ax ; Save value
    mov ax, 0
 push ax ; Save index
 mov bx, _arr_INSTRUCTION_TABLE
 pop ax ; Restore index
 mov cx, 10
 imul ax, cx
 mov si, ax
 add bx, si
 add bx, 4
 pop ax ; Restore value
 mov [bx], al
    mov ax, 136
 push ax ; Save value
    mov ax, 0
 push ax ; Save index
 mov bx, _arr_INSTRUCTION_TABLE
 pop ax ; Restore index
 mov cx, 10
 imul ax, cx
 mov si, ax
 add bx, si
 add bx, 5
 pop ax ; Restore value
 mov [bx], al
    mov ax, 137
 push ax ; Save value
    mov ax, 0
 push ax ; Save index
 mov bx, _arr_INSTRUCTION_TABLE
 pop ax ; Restore index
 mov cx, 10
 imul ax, cx
 mov si, ax
 add bx, si
 add bx, 6
 pop ax ; Restore value
 mov [bx], al
    mov ax, 176
 push ax ; Save value
    mov ax, 0
 push ax ; Save index
 mov bx, _arr_INSTRUCTION_TABLE
 pop ax ; Restore index
 mov cx, 10
 imul ax, cx
 mov si, ax
 add bx, si
 add bx, 7
 pop ax ; Restore value
 mov [bx], al
    mov ax, 184
 push ax ; Save value
    mov ax, 0
 push ax ; Save index
 mov bx, _arr_INSTRUCTION_TABLE
 pop ax ; Restore index
 mov cx, 10
 imul ax, cx
 mov si, ax
 add bx, si
 add bx, 8
 pop ax ; Restore value
 mov [bx], al
    mov ax, 0
 push ax ; Save value
    mov ax, 0
 push ax ; Save index
 mov bx, _arr_INSTRUCTION_TABLE
 pop ax ; Restore index
 mov cx, 10
 imul ax, cx
 mov si, ax
 add bx, si
 add bx, 9
 pop ax ; Restore value
 mov [bx], al
 mov ax, _str_14
 push ax ; Save value
    mov ax, 1
 push ax ; Save index
 mov bx, _arr_INSTRUCTION_TABLE
 pop ax ; Restore index
 mov cx, 10
 imul ax, cx
 mov si, ax
 add bx, si
 pop ax ; Restore value
 mov word [bx], ax
    mov ax, 2
 push ax ; Save value
    mov ax, 1
 push ax ; Save index
 mov bx, _arr_INSTRUCTION_TABLE
 pop ax ; Restore index
 mov cx, 10
 imul ax, cx
 mov si, ax
 add bx, si
 add bx, 3
 pop ax ; Restore value
 mov [bx], al
    mov ax, 3
 push ax ; Save value
    mov ax, 1
 push ax ; Save index
 mov bx, _arr_INSTRUCTION_TABLE
 pop ax ; Restore index
 mov cx, 10
 imul ax, cx
 mov si, ax
 add bx, si
 add bx, 4
 pop ax ; Restore value
 mov [bx], al
    mov ax, 0
 push ax ; Save value
    mov ax, 1
 push ax ; Save index
 mov bx, _arr_INSTRUCTION_TABLE
 pop ax ; Restore index
 mov cx, 10
 imul ax, cx
 mov si, ax
 add bx, si
 add bx, 5
 pop ax ; Restore value
 mov [bx], al
    mov ax, 1
 push ax ; Save value
    mov ax, 1
 push ax ; Save index
 mov bx, _arr_INSTRUCTION_TABLE
 pop ax ; Restore index
 mov cx, 10
 imul ax, cx
 mov si, ax
 add bx, si
 add bx, 6
 pop ax ; Restore value
 mov [bx], al
    mov ax, 4
 push ax ; Save value
    mov ax, 1
 push ax ; Save index
 mov bx, _arr_INSTRUCTION_TABLE
 pop ax ; Restore index
 mov cx, 10
 imul ax, cx
 mov si, ax
 add bx, si
 add bx, 7
 pop ax ; Restore value
 mov [bx], al
    mov ax, 5
 push ax ; Save value
    mov ax, 1
 push ax ; Save index
 mov bx, _arr_INSTRUCTION_TABLE
 pop ax ; Restore index
 mov cx, 10
 imul ax, cx
 mov si, ax
 add bx, si
 add bx, 8
 pop ax ; Restore value
 mov [bx], al
    mov ax, 0
 push ax ; Save value
    mov ax, 1
 push ax ; Save index
 mov bx, _arr_INSTRUCTION_TABLE
 pop ax ; Restore index
 mov cx, 10
 imul ax, cx
 mov si, ax
 add bx, si
 add bx, 9
 pop ax ; Restore value
 mov [bx], al
 mov ax, _str_15
 push ax ; Save value
    mov ax, 2
 push ax ; Save index
 mov bx, _arr_INSTRUCTION_TABLE
 pop ax ; Restore index
 mov cx, 10
 imul ax, cx
 mov si, ax
 add bx, si
 pop ax ; Restore value
 mov word [bx], ax
    mov ax, 42
 push ax ; Save value
    mov ax, 2
 push ax ; Save index
 mov bx, _arr_INSTRUCTION_TABLE
 pop ax ; Restore index
 mov cx, 10
 imul ax, cx
 mov si, ax
 add bx, si
 add bx, 3
 pop ax ; Restore value
 mov [bx], al
    mov ax, 43
 push ax ; Save value
    mov ax, 2
 push ax ; Save index
 mov bx, _arr_INSTRUCTION_TABLE
 pop ax ; Restore index
 mov cx, 10
 imul ax, cx
 mov si, ax
 add bx, si
 add bx, 4
 pop ax ; Restore value
 mov [bx], al
    mov ax, 40
 push ax ; Save value
    mov ax, 2
 push ax ; Save index
 mov bx, _arr_INSTRUCTION_TABLE
 pop ax ; Restore index
 mov cx, 10
 imul ax, cx
 mov si, ax
 add bx, si
 add bx, 5
 pop ax ; Restore value
 mov [bx], al
    mov ax, 41
 push ax ; Save value
    mov ax, 2
 push ax ; Save index
 mov bx, _arr_INSTRUCTION_TABLE
 pop ax ; Restore index
 mov cx, 10
 imul ax, cx
 mov si, ax
 add bx, si
 add bx, 6
 pop ax ; Restore value
 mov [bx], al
    mov ax, 44
 push ax ; Save value
    mov ax, 2
 push ax ; Save index
 mov bx, _arr_INSTRUCTION_TABLE
 pop ax ; Restore index
 mov cx, 10
 imul ax, cx
 mov si, ax
 add bx, si
 add bx, 7
 pop ax ; Restore value
 mov [bx], al
    mov ax, 45
 push ax ; Save value
    mov ax, 2
 push ax ; Save index
 mov bx, _arr_INSTRUCTION_TABLE
 pop ax ; Restore index
 mov cx, 10
 imul ax, cx
 mov si, ax
 add bx, si
 add bx, 8
 pop ax ; Restore value
 mov [bx], al
    mov ax, 5
 push ax ; Save value
    mov ax, 2
 push ax ; Save index
 mov bx, _arr_INSTRUCTION_TABLE
 pop ax ; Restore index
 mov cx, 10
 imul ax, cx
 mov si, ax
 add bx, si
 add bx, 9
 pop ax ; Restore value
 mov [bx], al
.init_instruction_table_end:
 mov sp, bp
 pop bp
 ret

mnemonic_exists:
 push bp
 mov bp, sp
 sub sp, 2
    mov ax, 0
 mov [bp-2], ax
.L_while_start_303:
    mov ax, 32
    push ax
    mov ax, [bp-2]
    pop bx
    cmp ax, bx
    jl .L_comp_true_305
    mov ax, 0
    jmp .L_comp_end_306
.L_comp_true_305:
    mov ax, 1
.L_comp_end_306:
    cmp ax, 0
    je .L_while_end_304
    mov ax, [bp+4]
    push ax
    mov ax, [bp-2]
 push ax ; Save index
 mov bx, _arr_INSTRUCTION_TABLE
 pop ax ; Restore index
 mov cx, 10
 imul ax, cx
 add bx, ax
 mov ax, word [bx]
    push ax
    call strcmp_3
    add sp, 4
    cmp ax, 0
    je .L_endif_308
    mov ax, 1
    jmp .mnemonic_exists_end
.L_endif_308:
    mov ax, 1
 push ax
    mov ax, [bp-2]
 pop bx
 add ax, bx
 mov [bp-2], ax
    jmp .L_while_start_303
.L_while_end_304:
    mov ax, 0
    jmp .mnemonic_exists_end
.mnemonic_exists_end:
 mov sp, bp
 pop bp
 ret

get_mnemonic_index:
 push bp
 mov bp, sp
 sub sp, 2
    mov ax, 0
 mov [bp-2], ax
.L_while_start_309:
    mov ax, 32
    push ax
    mov ax, [bp-2]
    pop bx
    cmp ax, bx
    jl .L_comp_true_311
    mov ax, 0
    jmp .L_comp_end_312
.L_comp_true_311:
    mov ax, 1
.L_comp_end_312:
    cmp ax, 0
    je .L_while_end_310
    mov ax, [bp+4]
    push ax
    mov ax, [bp-2]
 push ax ; Save index
 mov bx, _arr_INSTRUCTION_TABLE
 pop ax ; Restore index
 mov cx, 10
 imul ax, cx
 add bx, ax
 mov ax, word [bx]
    push ax
    call strcmp_3
    add sp, 4
    cmp ax, 0
    je .L_endif_314
    mov ax, [bp-2]
    jmp .get_mnemonic_index_end
.L_endif_314:
    mov ax, 1
 push ax
    mov ax, [bp-2]
 pop bx
 add ax, bx
 mov [bp-2], ax
    jmp .L_while_start_309
.L_while_end_310:
    mov ax, 0
    jmp .get_mnemonic_index_end
.get_mnemonic_index_end:
 mov sp, bp
 pop bp
 ret

get_register_code_16:
 push bp
 mov bp, sp
    mov ax, 1
    push ax
 mov ax, _str_16
    push ax
    mov ax, [bp+4]
    push ax
    call strcmp_2
    add sp, 4
    pop bx
    cmp ax, bx
    je .L_comp_true_317
    mov ax, 0
    jmp .L_comp_end_318
.L_comp_true_317:
    mov ax, 1
.L_comp_end_318:
    cmp ax, 0
    je .L_endif_316
 mov ax, 0 ; enum reg16.AX
    jmp .get_register_code_16_end
.L_endif_316:
    mov ax, 1
    push ax
 mov ax, _str_17
    push ax
    mov ax, [bp+4]
    push ax
    call strcmp_2
    add sp, 4
    pop bx
    cmp ax, bx
    je .L_comp_true_321
    mov ax, 0
    jmp .L_comp_end_322
.L_comp_true_321:
    mov ax, 1
.L_comp_end_322:
    cmp ax, 0
    je .L_endif_320
 mov ax, 1 ; enum reg16.CX
    jmp .get_register_code_16_end
.L_endif_320:
    mov ax, 1
    push ax
 mov ax, _str_18
    push ax
    mov ax, [bp+4]
    push ax
    call strcmp_2
    add sp, 4
    pop bx
    cmp ax, bx
    je .L_comp_true_325
    mov ax, 0
    jmp .L_comp_end_326
.L_comp_true_325:
    mov ax, 1
.L_comp_end_326:
    cmp ax, 0
    je .L_endif_324
 mov ax, 2 ; enum reg16.DX
    jmp .get_register_code_16_end
.L_endif_324:
    mov ax, 1
    push ax
 mov ax, _str_19
    push ax
    mov ax, [bp+4]
    push ax
    call strcmp_2
    add sp, 4
    pop bx
    cmp ax, bx
    je .L_comp_true_329
    mov ax, 0
    jmp .L_comp_end_330
.L_comp_true_329:
    mov ax, 1
.L_comp_end_330:
    cmp ax, 0
    je .L_endif_328
 mov ax, 3 ; enum reg16.BX
    jmp .get_register_code_16_end
.L_endif_328:
    mov ax, 1
    push ax
 mov ax, _str_20
    push ax
    mov ax, [bp+4]
    push ax
    call strcmp_2
    add sp, 4
    pop bx
    cmp ax, bx
    je .L_comp_true_333
    mov ax, 0
    jmp .L_comp_end_334
.L_comp_true_333:
    mov ax, 1
.L_comp_end_334:
    cmp ax, 0
    je .L_endif_332
 mov ax, 4 ; enum reg16.SP
    jmp .get_register_code_16_end
.L_endif_332:
    mov ax, 1
    push ax
 mov ax, _str_21
    push ax
    mov ax, [bp+4]
    push ax
    call strcmp_2
    add sp, 4
    pop bx
    cmp ax, bx
    je .L_comp_true_337
    mov ax, 0
    jmp .L_comp_end_338
.L_comp_true_337:
    mov ax, 1
.L_comp_end_338:
    cmp ax, 0
    je .L_endif_336
 mov ax, 5 ; enum reg16.BP
    jmp .get_register_code_16_end
.L_endif_336:
    mov ax, 1
    push ax
 mov ax, _str_22
    push ax
    mov ax, [bp+4]
    push ax
    call strcmp_2
    add sp, 4
    pop bx
    cmp ax, bx
    je .L_comp_true_341
    mov ax, 0
    jmp .L_comp_end_342
.L_comp_true_341:
    mov ax, 1
.L_comp_end_342:
    cmp ax, 0
    je .L_endif_340
 mov ax, 6 ; enum reg16.SI
    jmp .get_register_code_16_end
.L_endif_340:
    mov ax, 1
    push ax
 mov ax, _str_23
    push ax
    mov ax, [bp+4]
    push ax
    call strcmp_2
    add sp, 4
    pop bx
    cmp ax, bx
    je .L_comp_true_345
    mov ax, 0
    jmp .L_comp_end_346
.L_comp_true_345:
    mov ax, 1
.L_comp_end_346:
    cmp ax, 0
    je .L_endif_344
 mov ax, 7 ; enum reg16.DI
    jmp .get_register_code_16_end
.L_endif_344:
    mov ax, 20
    jmp .get_register_code_16_end
.get_register_code_16_end:
 mov sp, bp
 pop bp
 ret

get_register_code_8:
 push bp
 mov bp, sp
 mov ax, _str_24
    push ax
    mov ax, [bp+4]
    push ax
    call strcmp_2
    add sp, 4
    cmp ax, 0
    je .L_endif_348
 mov ax, 0 ; enum reg8.AL
    jmp .get_register_code_8_end
.L_endif_348:
 mov ax, _str_25
    push ax
    mov ax, [bp+4]
    push ax
    call strcmp_2
    add sp, 4
    cmp ax, 0
    je .L_endif_350
 mov ax, 1 ; enum reg8.CL
    jmp .get_register_code_8_end
.L_endif_350:
 mov ax, _str_26
    push ax
    mov ax, [bp+4]
    push ax
    call strcmp_2
    add sp, 4
    cmp ax, 0
    je .L_endif_352
 mov ax, 2 ; enum reg8.DL
    jmp .get_register_code_8_end
.L_endif_352:
 mov ax, _str_27
    push ax
    mov ax, [bp+4]
    push ax
    call strcmp_2
    add sp, 4
    cmp ax, 0
    je .L_endif_354
 mov ax, 3 ; enum reg8.BL
    jmp .get_register_code_8_end
.L_endif_354:
 mov ax, _str_28
    push ax
    mov ax, [bp+4]
    push ax
    call strcmp_2
    add sp, 4
    cmp ax, 0
    je .L_endif_356
 mov ax, 4 ; enum reg8.AH
    jmp .get_register_code_8_end
.L_endif_356:
 mov ax, _str_29
    push ax
    mov ax, [bp+4]
    push ax
    call strcmp_2
    add sp, 4
    cmp ax, 0
    je .L_endif_358
 mov ax, 5 ; enum reg8.CH
    jmp .get_register_code_8_end
.L_endif_358:
 mov ax, _str_30
    push ax
    mov ax, [bp+4]
    push ax
    call strcmp_2
    add sp, 4
    cmp ax, 0
    je .L_endif_360
 mov ax, 6 ; enum reg8.DH
    jmp .get_register_code_8_end
.L_endif_360:
 mov ax, _str_31
    push ax
    mov ax, [bp+4]
    push ax
    call strcmp_2
    add sp, 4
    cmp ax, 0
    je .L_endif_362
 mov ax, 7 ; enum reg8.BH
    jmp .get_register_code_8_end
.L_endif_362:
    mov ax, 20
    jmp .get_register_code_8_end
.get_register_code_8_end:
 mov sp, bp
 pop bp
 ret

strcpy_3:
 push bp
 mov bp, sp
    mov ax, 0
 push ax ; Save index
 mov bx, [bp+6]
 pop ax ; Restore index
 mov si, ax
 xor ax, ax
 mov al, [bx+si]
 push ax ; Save value
    mov ax, 0
 mov bx, [bp+4]
 mov si, ax
 pop ax ; Restore value
 mov [bx+si], al
    mov ax, 1
 push ax ; Save index
 mov bx, [bp+6]
 pop ax ; Restore index
 mov si, ax
 xor ax, ax
 mov al, [bx+si]
 push ax ; Save value
    mov ax, 1
 mov bx, [bp+4]
 mov si, ax
 pop ax ; Restore value
 mov [bx+si], al
    mov ax, 2
 push ax ; Save index
 mov bx, [bp+6]
 pop ax ; Restore index
 mov si, ax
 xor ax, ax
 mov al, [bx+si]
 push ax ; Save value
    mov ax, 2
 mov bx, [bp+4]
 mov si, ax
 pop ax ; Restore value
 mov [bx+si], al
.strcpy_3_end:
 mov sp, bp
 pop bp
 ret

strcpy_2:
 push bp
 mov bp, sp
    mov ax, 0
 push ax ; Save index
 mov bx, [bp+6]
 pop ax ; Restore index
 mov si, ax
 xor ax, ax
 mov al, [bx+si]
 push ax ; Save value
    mov ax, 0
 mov bx, [bp+4]
 mov si, ax
 pop ax ; Restore value
 mov [bx+si], al
    mov ax, 1
 push ax ; Save index
 mov bx, [bp+6]
 pop ax ; Restore index
 mov si, ax
 xor ax, ax
 mov al, [bx+si]
 push ax ; Save value
    mov ax, 1
 mov bx, [bp+4]
 mov si, ax
 pop ax ; Restore value
 mov [bx+si], al
.strcpy_2_end:
 mov sp, bp
 pop bp
 ret

strcmp_3:
 push bp
 mov bp, sp
    mov ax, 0
 push ax ; Save index
 mov bx, [bp+6]
 pop ax ; Restore index
 mov si, ax
 xor ax, ax
 mov al, [bx+si]
    push ax
    mov ax, 0
 push ax ; Save index
 mov bx, [bp+4]
 pop ax ; Restore index
 mov si, ax
 xor ax, ax
 mov al, [bx+si]
    pop bx
    cmp ax, bx
    je .L_comp_true_365
    mov ax, 0
    jmp .L_comp_end_366
.L_comp_true_365:
    mov ax, 1
.L_comp_end_366:
    cmp ax, 0
    je .L_endif_364
    mov ax, 1
 push ax ; Save index
 mov bx, [bp+6]
 pop ax ; Restore index
 mov si, ax
 xor ax, ax
 mov al, [bx+si]
    push ax
    mov ax, 1
 push ax ; Save index
 mov bx, [bp+4]
 pop ax ; Restore index
 mov si, ax
 xor ax, ax
 mov al, [bx+si]
    pop bx
    cmp ax, bx
    je .L_comp_true_369
    mov ax, 0
    jmp .L_comp_end_370
.L_comp_true_369:
    mov ax, 1
.L_comp_end_370:
    cmp ax, 0
    je .L_endif_368
    mov ax, 2
 push ax ; Save index
 mov bx, [bp+6]
 pop ax ; Restore index
 mov si, ax
 xor ax, ax
 mov al, [bx+si]
    push ax
    mov ax, 2
 push ax ; Save index
 mov bx, [bp+4]
 pop ax ; Restore index
 mov si, ax
 xor ax, ax
 mov al, [bx+si]
    pop bx
    cmp ax, bx
    je .L_comp_true_373
    mov ax, 0
    jmp .L_comp_end_374
.L_comp_true_373:
    mov ax, 1
.L_comp_end_374:
    cmp ax, 0
    je .L_endif_372
    mov ax, 1
    jmp .strcmp_3_end
.L_endif_372:
.L_endif_368:
.L_endif_364:
    mov ax, 0
    jmp .strcmp_3_end
.strcmp_3_end:
 mov sp, bp
 pop bp
 ret

strcmp_2:
 push bp
 mov bp, sp
    mov ax, 0
 push ax ; Save index
 mov bx, [bp+6]
 pop ax ; Restore index
 mov si, ax
 xor ax, ax
 mov al, [bx+si]
    push ax
    mov ax, 0
 push ax ; Save index
 mov bx, [bp+4]
 pop ax ; Restore index
 mov si, ax
 xor ax, ax
 mov al, [bx+si]
    pop bx
    cmp ax, bx
    je .L_comp_true_377
    mov ax, 0
    jmp .L_comp_end_378
.L_comp_true_377:
    mov ax, 1
.L_comp_end_378:
    cmp ax, 0
    je .L_endif_376
    mov ax, 1
 push ax ; Save index
 mov bx, [bp+6]
 pop ax ; Restore index
 mov si, ax
 xor ax, ax
 mov al, [bx+si]
    push ax
    mov ax, 1
 push ax ; Save index
 mov bx, [bp+4]
 pop ax ; Restore index
 mov si, ax
 xor ax, ax
 mov al, [bx+si]
    pop bx
    cmp ax, bx
    je .L_comp_true_381
    mov ax, 0
    jmp .L_comp_end_382
.L_comp_true_381:
    mov ax, 1
.L_comp_end_382:
    cmp ax, 0
    je .L_endif_380
    mov ax, 1
    jmp .strcmp_2_end
.L_endif_380:
.L_endif_376:
    mov ax, 0
    jmp .strcmp_2_end
.strcmp_2_end:
 mov sp, bp
 pop bp
 ret

is_register_16:
 push bp
 mov bp, sp
 mov ax, _str_32
    push ax
    mov ax, [bp+4]
    push ax
    call strcmp_2
    add sp, 4
    cmp ax, 0
    je .L_endif_384
    mov ax, 1
    jmp .is_register_16_end
.L_endif_384:
 mov ax, _str_33
    push ax
    mov ax, [bp+4]
    push ax
    call strcmp_2
    add sp, 4
    cmp ax, 0
    je .L_endif_386
    mov ax, 1
    jmp .is_register_16_end
.L_endif_386:
 mov ax, _str_34
    push ax
    mov ax, [bp+4]
    push ax
    call strcmp_2
    add sp, 4
    cmp ax, 0
    je .L_endif_388
    mov ax, 1
    jmp .is_register_16_end
.L_endif_388:
 mov ax, _str_35
    push ax
    mov ax, [bp+4]
    push ax
    call strcmp_2
    add sp, 4
    cmp ax, 0
    je .L_endif_390
    mov ax, 1
    jmp .is_register_16_end
.L_endif_390:
 mov ax, _str_36
    push ax
    mov ax, [bp+4]
    push ax
    call strcmp_2
    add sp, 4
    cmp ax, 0
    je .L_endif_392
    mov ax, 1
    jmp .is_register_16_end
.L_endif_392:
 mov ax, _str_37
    push ax
    mov ax, [bp+4]
    push ax
    call strcmp_2
    add sp, 4
    cmp ax, 0
    je .L_endif_394
    mov ax, 1
    jmp .is_register_16_end
.L_endif_394:
 mov ax, _str_38
    push ax
    mov ax, [bp+4]
    push ax
    call strcmp_2
    add sp, 4
    cmp ax, 0
    je .L_endif_396
    mov ax, 1
    jmp .is_register_16_end
.L_endif_396:
 mov ax, _str_39
    push ax
    mov ax, [bp+4]
    push ax
    call strcmp_2
    add sp, 4
    cmp ax, 0
    je .L_endif_398
    mov ax, 1
    jmp .is_register_16_end
.L_endif_398:
    mov ax, 0
    jmp .is_register_16_end
.is_register_16_end:
 mov sp, bp
 pop bp
 ret

is_register_8:
 push bp
 mov bp, sp
 mov ax, _str_40
    push ax
    mov ax, [bp+4]
    push ax
    call strcmp_2
    add sp, 4
    cmp ax, 0
    je .L_endif_400
    mov ax, 1
    jmp .is_register_8_end
.L_endif_400:
 mov ax, _str_41
    push ax
    mov ax, [bp+4]
    push ax
    call strcmp_2
    add sp, 4
    cmp ax, 0
    je .L_endif_402
    mov ax, 1
    jmp .is_register_8_end
.L_endif_402:
 mov ax, _str_42
    push ax
    mov ax, [bp+4]
    push ax
    call strcmp_2
    add sp, 4
    cmp ax, 0
    je .L_endif_404
    mov ax, 1
    jmp .is_register_8_end
.L_endif_404:
 mov ax, _str_43
    push ax
    mov ax, [bp+4]
    push ax
    call strcmp_2
    add sp, 4
    cmp ax, 0
    je .L_endif_406
    mov ax, 1
    jmp .is_register_8_end
.L_endif_406:
 mov ax, _str_44
    push ax
    mov ax, [bp+4]
    push ax
    call strcmp_2
    add sp, 4
    cmp ax, 0
    je .L_endif_408
    mov ax, 1
    jmp .is_register_8_end
.L_endif_408:
 mov ax, _str_45
    push ax
    mov ax, [bp+4]
    push ax
    call strcmp_2
    add sp, 4
    cmp ax, 0
    je .L_endif_410
    mov ax, 1
    jmp .is_register_8_end
.L_endif_410:
 mov ax, _str_46
    push ax
    mov ax, [bp+4]
    push ax
    call strcmp_2
    add sp, 4
    cmp ax, 0
    je .L_endif_412
    mov ax, 1
    jmp .is_register_8_end
.L_endif_412:
 mov ax, _str_47
    push ax
    mov ax, [bp+4]
    push ax
    call strcmp_2
    add sp, 4
    cmp ax, 0
    je .L_endif_414
    mov ax, 1
    jmp .is_register_8_end
.L_endif_414:
    mov ax, 0
    jmp .is_register_8_end
.is_register_8_end:
 mov sp, bp
 pop bp
 ret

is_immediate:
 push bp
 mov bp, sp
    mov ax, 48
    push ax
    mov ax, 0
 push ax ; Save index
 mov bx, [bp+4]
 pop ax ; Restore index
 mov si, ax
 xor ax, ax
 mov al, [bx+si]
    pop bx
    cmp ax, bx
    jge .L_comp_true_421
    mov ax, 0
    jmp .L_comp_end_422
.L_comp_true_421:
    mov ax, 1
.L_comp_end_422:
 cmp ax, 0
 je .L_logic_false_420
    mov ax, 57
    push ax
    mov ax, 0
 push ax ; Save index
 mov bx, [bp+4]
 pop ax ; Restore index
 mov si, ax
 xor ax, ax
 mov al, [bx+si]
    pop bx
    cmp ax, bx
    jle .L_comp_true_423
    mov ax, 0
    jmp .L_comp_end_424
.L_comp_true_423:
    mov ax, 1
.L_comp_end_424:
 cmp ax, 0
 je .L_logic_false_420
 mov ax, 1
 jmp .L_logic_end_419
.L_logic_false_420:
 mov ax, 0
.L_logic_end_419:
 cmp ax, 0
 jne .L_logic_true_418
    mov ax, 48
    push ax
    mov ax, 0
 push ax ; Save index
 mov bx, [bp+4]
 pop ax ; Restore index
 mov si, ax
 xor ax, ax
 mov al, [bx+si]
    pop bx
    cmp ax, bx
    je .L_comp_true_427
    mov ax, 0
    jmp .L_comp_end_428
.L_comp_true_427:
    mov ax, 1
.L_comp_end_428:
 cmp ax, 0
 je .L_logic_false_426
    mov ax, 120
    push ax
    mov ax, 1
 push ax ; Save index
 mov bx, [bp+4]
 pop ax ; Restore index
 mov si, ax
 xor ax, ax
 mov al, [bx+si]
    pop bx
    cmp ax, bx
    je .L_comp_true_429
    mov ax, 0
    jmp .L_comp_end_430
.L_comp_true_429:
    mov ax, 1
.L_comp_end_430:
 cmp ax, 0
 je .L_logic_false_426
 mov ax, 1
 jmp .L_logic_end_425
.L_logic_false_426:
 mov ax, 0
.L_logic_end_425:
 cmp ax, 0
 jne .L_logic_true_418
 mov ax, 0
 jmp .L_logic_end_417
.L_logic_true_418:
 mov ax, 1
.L_logic_end_417:
    cmp ax, 0
    je .L_endif_416
    mov ax, 1
    jmp .is_immediate_end
.L_endif_416:
    mov ax, 0
    jmp .is_immediate_end
.is_immediate_end:
 mov sp, bp
 pop bp
 ret

set_error:
 push bp
 mov bp, sp
    mov ax, [bp+6]
    push ax
 mov bx, [bp+4]
 add bx, 4102
 mov ax, bx
    push ax
    call strcpy
    add sp, 4
    mov ax, 1
 mov bx, [bp+4]
 add bx, 4166
 mov [bx], al
.set_error_end:
 mov sp, bp
 pop bp
 ret

in_registered_symbols:
 push bp
 mov bp, sp
 sub sp, 43
; --- Initialize array 'sym' from _var_str_init_48 ---
 lea di, [bp-41]
 mov si, _var_str_init_48
 mov cx, 41
 cld ; Clear direction flag
 rep movsb ; Copy string
    mov ax, 0
 mov [bp-43], ax
.L_while_start_431:
 mov ax, 41
    push ax
    mov ax, [bp-43]
    pop bx
    cmp ax, bx
    jl .L_comp_true_433
    mov ax, 0
    jmp .L_comp_end_434
.L_comp_true_433:
    mov ax, 1
.L_comp_end_434:
    cmp ax, 0
    je .L_while_end_432
    mov ax, [bp-43]
 push ax ; Save index
 lea bx, [bp-41]
 pop ax ; Restore index
 mov si, ax
 xor ax, ax
 mov al, [bx+si]
    push ax
    mov ax, [bp+4]
    pop bx
    cmp ax, bx
    je .L_comp_true_437
    mov ax, 0
    jmp .L_comp_end_438
.L_comp_true_437:
    mov ax, 1
.L_comp_end_438:
    cmp ax, 0
    je .L_endif_436
    mov ax, 1
    jmp .in_registered_symbols_end
.L_endif_436:
    mov ax, 1
 push ax
    mov ax, [bp-43]
 pop bx
 add ax, bx
 mov [bp-43], ax
    jmp .L_while_start_431
.L_while_end_432:
    mov ax, 0
    jmp .in_registered_symbols_end
.in_registered_symbols_end:
 mov sp, bp
 pop bp
 ret

isalnum:
 push bp
 mov bp, sp
 sub sp, 38
; --- Initialize array 'sym' from _var_str_init_49 ---
 lea di, [bp-37]
 mov si, _var_str_init_49
 mov cx, 37
 cld ; Clear direction flag
 rep movsb ; Copy string
    mov ax, 0
 mov [bp-38], al
.L_while_start_439:
 mov ax, 37
    push ax
    xor ax, ax
    mov al, [bp-38]
    pop bx
    cmp ax, bx
    jl .L_comp_true_441
    mov ax, 0
    jmp .L_comp_end_442
.L_comp_true_441:
    mov ax, 1
.L_comp_end_442:
    cmp ax, 0
    je .L_while_end_440
    xor ax, ax
    mov al, [bp-38]
 push ax ; Save index
 lea bx, [bp-37]
 pop ax ; Restore index
 mov si, ax
 xor ax, ax
 mov al, [bx+si]
    push ax
    mov ax, [bp+4]
    pop bx
    cmp ax, bx
    je .L_comp_true_445
    mov ax, 0
    jmp .L_comp_end_446
.L_comp_true_445:
    mov ax, 1
.L_comp_end_446:
    cmp ax, 0
    je .L_endif_444
    mov ax, 1
    jmp .isalnum_end
.L_endif_444:
    mov ax, 1
 push ax
    xor ax, ax
    mov al, [bp-38]
 pop bx
 add ax, bx
 mov [bp-38], al
    jmp .L_while_start_439
.L_while_end_440:
    mov ax, 0
    jmp .isalnum_end
.isalnum_end:
 mov sp, bp
 pop bp
 ret

ishexnum:
 push bp
 mov bp, sp
 sub sp, 18
; --- Initialize array 'hex' from _var_str_init_50 ---
 lea di, [bp-17]
 mov si, _var_str_init_50
 mov cx, 17
 cld ; Clear direction flag
 rep movsb ; Copy string
    mov ax, 0
 mov [bp-18], al
.L_while_start_447:
 mov ax, 17
    push ax
    xor ax, ax
    mov al, [bp-18]
    pop bx
    cmp ax, bx
    jl .L_comp_true_449
    mov ax, 0
    jmp .L_comp_end_450
.L_comp_true_449:
    mov ax, 1
.L_comp_end_450:
    cmp ax, 0
    je .L_while_end_448
    xor ax, ax
    mov al, [bp-18]
 push ax ; Save index
 lea bx, [bp-17]
 pop ax ; Restore index
 mov si, ax
 xor ax, ax
 mov al, [bx+si]
    push ax
    mov ax, [bp+4]
    pop bx
    cmp ax, bx
    je .L_comp_true_453
    mov ax, 0
    jmp .L_comp_end_454
.L_comp_true_453:
    mov ax, 1
.L_comp_end_454:
    cmp ax, 0
    je .L_endif_452
    mov ax, 1
    jmp .ishexnum_end
.L_endif_452:
    mov ax, 1
 push ax
    xor ax, ax
    mov al, [bp-18]
 pop bx
 add ax, bx
 mov [bp-18], al
    jmp .L_while_start_447
.L_while_end_448:
    mov ax, 0
    jmp .ishexnum_end
.ishexnum_end:
 mov sp, bp
 pop bp
 ret

isdigit:
 push bp
 mov bp, sp
 sub sp, 12
; --- Initialize array 'dig' from _var_str_init_51 ---
 lea di, [bp-11]
 mov si, _var_str_init_51
 mov cx, 11
 cld ; Clear direction flag
 rep movsb ; Copy string
    mov ax, 0
 mov [bp-12], al
.L_while_start_455:
 mov ax, 11
    push ax
    xor ax, ax
    mov al, [bp-12]
    pop bx
    cmp ax, bx
    jl .L_comp_true_457
    mov ax, 0
    jmp .L_comp_end_458
.L_comp_true_457:
    mov ax, 1
.L_comp_end_458:
    cmp ax, 0
    je .L_while_end_456
    xor ax, ax
    mov al, [bp-12]
 push ax ; Save index
 lea bx, [bp-11]
 pop ax ; Restore index
 mov si, ax
 xor ax, ax
 mov al, [bx+si]
    push ax
    mov ax, [bp+4]
    pop bx
    cmp ax, bx
    je .L_comp_true_461
    mov ax, 0
    jmp .L_comp_end_462
.L_comp_true_461:
    mov ax, 1
.L_comp_end_462:
    cmp ax, 0
    je .L_endif_460
    mov ax, 1
    jmp .isdigit_end
.L_endif_460:
    mov ax, 1
 push ax
    xor ax, ax
    mov al, [bp-12]
 pop bx
 add ax, bx
 mov [bp-12], al
    jmp .L_while_start_455
.L_while_end_456:
    mov ax, 0
    jmp .isdigit_end
.isdigit_end:
 mov sp, bp
 pop bp
 ret

isalpha:
 push bp
 mov bp, sp
 sub sp, 28
; --- Initialize array 'sym' from _var_str_init_52 ---
 lea di, [bp-27]
 mov si, _var_str_init_52
 mov cx, 27
 cld ; Clear direction flag
 rep movsb ; Copy string
    mov ax, 0
 mov [bp-28], al
.L_while_start_463:
 mov ax, 27
    push ax
    xor ax, ax
    mov al, [bp-28]
    pop bx
    cmp ax, bx
    jl .L_comp_true_465
    mov ax, 0
    jmp .L_comp_end_466
.L_comp_true_465:
    mov ax, 1
.L_comp_end_466:
    cmp ax, 0
    je .L_while_end_464
    xor ax, ax
    mov al, [bp-28]
 push ax ; Save index
 lea bx, [bp-27]
 pop ax ; Restore index
 mov si, ax
 xor ax, ax
 mov al, [bx+si]
    push ax
    mov ax, [bp+4]
    pop bx
    cmp ax, bx
    je .L_comp_true_469
    mov ax, 0
    jmp .L_comp_end_470
.L_comp_true_469:
    mov ax, 1
.L_comp_end_470:
    cmp ax, 0
    je .L_endif_468
    mov ax, 1
    jmp .isalpha_end
.L_endif_468:
    mov ax, 1
 push ax
    xor ax, ax
    mov al, [bp-28]
 pop bx
 add ax, bx
 mov [bp-28], al
    jmp .L_while_start_463
.L_while_end_464:
    mov ax, 0
    jmp .isalpha_end
.isalpha_end:
 mov sp, bp
 pop bp
 ret

isalnum_str:
 push bp
 mov bp, sp
 sub sp, 40
; --- Initialize array 'sym' from _var_str_init_53 ---
 lea di, [bp-37]
 mov si, _var_str_init_53
 mov cx, 37
 cld ; Clear direction flag
 rep movsb ; Copy string
    mov ax, 0
 mov [bp-38], al
    mov ax, 0
 mov [bp-39], al
.L_while_start_471:
    mov ax, 0
    push ax
    xor ax, ax
    mov al, [bp-38]
    pop bx
    cmp ax, bx
    jne .L_comp_true_473
    mov ax, 0
    jmp .L_comp_end_474
.L_comp_true_473:
    mov ax, 1
.L_comp_end_474:
    cmp ax, 0
    je .L_while_end_472
    xor ax, ax
    mov al, [bp-38]
 push ax ; Save index
 mov bx, [bp+4]
 pop ax ; Restore index
 mov si, ax
 xor ax, ax
 mov al, [bx+si]
 mov [bp-40], al
.L_while_start_475:
 mov ax, 37
    push ax
    xor ax, ax
    mov al, [bp-39]
    pop bx
    cmp ax, bx
    jl .L_comp_true_477
    mov ax, 0
    jmp .L_comp_end_478
.L_comp_true_477:
    mov ax, 1
.L_comp_end_478:
    cmp ax, 0
    je .L_while_end_476
    xor ax, ax
    mov al, [bp-39]
 push ax ; Save index
 lea bx, [bp-37]
 pop ax ; Restore index
 mov si, ax
 xor ax, ax
 mov al, [bx+si]
    push ax
    xor ax, ax
    mov al, [bp-40]
    pop bx
    cmp ax, bx
    jne .L_comp_true_481
    mov ax, 0
    jmp .L_comp_end_482
.L_comp_true_481:
    mov ax, 1
.L_comp_end_482:
    cmp ax, 0
    je .L_endif_480
    mov ax, 0
    jmp .isalnum_str_end
.L_endif_480:
    mov ax, 1
 push ax
    xor ax, ax
    mov al, [bp-39]
 pop bx
 add ax, bx
 mov [bp-39], al
    jmp .L_while_start_475
.L_while_end_476:
    mov ax, 1
 push ax
    xor ax, ax
    mov al, [bp-38]
 pop bx
 add ax, bx
 mov [bp-38], al
    jmp .L_while_start_471
.L_while_end_472:
    mov ax, 1
    jmp .isalnum_str_end
.isalnum_str_end:
 mov sp, bp
 pop bp
 ret

_start:
 push bp
 mov bp, sp
 mov [_start_bp], bp ; Save _start's base pointer
; --- Save original segments ---
; --- Setup flat memory model ---
 mov [_orig_ds], ds ; Save original DS
 mov [_orig_es], es ; Save original ES
 mov [_orig_ss], ss ; Save original SS
 cli          ; Disable interrupts
 mov ax, ds   ; Use current DS as base
 mov es, ax   ; ES = DS
 mov ss, ax   ; SS = DS
 sti          ; Re-enable interrupts
 sub sp, 5231

; --- Injected by compiler: argc/argv handling for x16-PRos ---
 mov word [bp+6], si
 mov di, si
 xor cx, cx
 test di, di
 jz .argc_done_argc_argv_483
.arg_loop_argc_argv_483:
 cmp byte [di], 0
 je .argc_done_argc_argv_483
 inc cx
.scan_loop_argc_argv_483:
 cmp byte [di], 0
 je .found_null_argc_argv_483
 inc di
 jmp .scan_loop_argc_argv_483
.found_null_argc_argv_483:
 inc di
 jmp .arg_loop_argc_argv_483
.argc_done_argc_argv_483:
 mov word [bp+4], cx
; --- End of injected code ---

    call init_all_colors_structs
 xor ax, ax
 mov al, [_var_VGA_COLORS+15]
    push ax
    call set_text_color
    add sp, 2
 mov ax, _str_54
    push ax
    call print_string
    add sp, 2
    mov ax, [bp+4]
    push ax
    call print_hex_byte_fixed
    add sp, 2
 mov ax, _str_55
    push ax
    call print_string
    add sp, 2
    mov ax, [bp+6]
    push ax
    call print_string
    add sp, 2
    call print_newline
    mov ax, 1
    push ax
    mov ax, [bp+4]
    pop bx
    cmp ax, bx
    je .L_comp_true_486
    mov ax, 0
    jmp .L_comp_end_487
.L_comp_true_486:
    mov ax, 1
.L_comp_end_487:
    cmp ax, 0
    je .L_endif_485
    mov ax, 0
    push ax
    mov ax, [bp+6]
    push ax
    call get_arg
    add sp, 4
 mov [bp-5217], ax
    mov ax, 1
    push ax
    mov ax, [bp+6]
    push ax
    call get_arg
    add sp, 4
 mov [bp-5219], ax
 mov ax, _str_56
    push ax
    call print_string
    add sp, 2
    mov ax, [bp-5217]
    push ax
    call print_string
    add sp, 2
    call print_newline
 mov ax, _str_57
    push ax
    call print_string
    add sp, 2
    mov ax, [bp-5219]
    push ax
    call print_string
    add sp, 2
    call print_newline
 lea ax, [bp-5211]
    push ax
    mov ax, [bp-5217]
    push ax
    call load_file
    add sp, 4
.L_endif_485:
    mov ax, 0
 lea bx, [bp-1115]
 mov word [bx], ax
    mov ax, 0
 lea bx, [bp-1049]
 mov [bx], al
    mov ax, 1
    push ax
    mov ax, [bp+4]
    pop bx
    cmp ax, bx
    jl .L_comp_true_490
    mov ax, 0
    jmp .L_comp_end_491
.L_comp_true_490:
    mov ax, 1
.L_comp_end_491:
    cmp ax, 0
    je .L_endif_489
 mov ax, _str_58
 lea bx, [bp-5211]
 mov word [bx], ax
.L_endif_489:
 mov ax, _str_59
 lea bx, [bp-5215]
 mov word [bx], ax
    call init_instruction_table
    mov ax, 0
 mov [bp-5228], al
    mov ax, 0
 mov [bp-5231], al
    lea ax, [bp-5227]
    push ax
 mov ax, _str_60
    push ax
 mov ax, _str_61
    push ax
 mov ax, _str_62
    push ax
    call generate_instruction
    add sp, 8
 mov [bp-5228], al
.L_while_start_492:
    mov ax, 8
    push ax
    xor ax, ax
    mov al, [bp-5231]
    pop bx
    cmp ax, bx
    jl .L_comp_true_494
    mov ax, 0
    jmp .L_comp_end_495
.L_comp_true_494:
    mov ax, 1
.L_comp_end_495:
    cmp ax, 0
    je .L_while_end_493
    xor ax, ax
    mov al, [bp-5231]
 push ax ; Save index
 lea bx, [bp-5227]
 pop ax ; Restore index
 mov si, ax
 xor ax, ax
 mov al, [bx+si]
 mov [bp-5230], al
    xor ax, ax
    mov al, [bp-5230]
    push ax
    call print_hex_byte_fixed
    add sp, 2
 mov ax, _str_63
    push ax
    call print_string
    add sp, 2
    mov ax, 1
 push ax
    xor ax, ax
    mov al, [bp-5231]
 pop bx
 add ax, bx
 mov [bp-5231], al
    jmp .L_while_start_492
.L_while_end_493:
    call print_newline
    mov ax, 0
 mov [bp-5231], al
 mov bx, [bp-5215]
 mov ax, word [bx]
    push ax
 mov ax, _str_64
    push ax
    call printf
    add sp, 4
 lea ax, [bp-5215] ; Get address of local var 'basm'
    push ax
    call _tokenize
    add sp, 2
 mov ax, _str_65
    push ax
 lea ax, [bp-5215] ; Get address of local var 'basm'
    push ax
    call generate_binary
    add sp, 4
 mov ax, _str_66
    push ax
    call print_string
    add sp, 2
; --- Restore original segments ---
 cli          ; Disable interrupts
 mov ax, [_orig_ds]
 mov ds, ax   ; Restore DS
 mov ax, [_orig_es]
 mov es, ax   ; Restore ES
 mov ax, [_orig_ss]
 mov ss, ax   ; Restore SS
 sti          ; Re-enable interrupts
._start_end:
 mov sp, bp
 pop bp
 ret


; == DATA SECTION ==
_start_bp: dw 0
_var_TEXT_COLORS: times 4 db 0 ; struct TextColors
_var_VGA_COLORS: times 16 db 0 ; struct VgaColors
_var_STD_CURRENT_COLOR: dw 0
_arr_INSTRUCTION_TABLE: times 32 dd 0
_var_str_init_0: db 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 65, 66, 67, 68, 69, 70, 0
_var_str_init_1: db 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 65, 66, 67, 68, 69, 70, 0
_str_2: db 76, 101, 120, 101, 114, 32, 69, 114, 114, 111, 114, 58, 32, 117, 110, 100, 101, 102, 105, 110, 101, 100, 32, 115, 121, 109, 98, 111, 108, 32, 39, 37, 99, 39, 10, 0
_str_3: db 77, 79, 86, 0
_str_4: db 65, 68, 68, 0
_str_5: db 83, 85, 66, 0
_str_6: db 88, 79, 82, 0
_str_7: db 65, 78, 68, 0
_str_8: db 0, 0, 0, 0, 0, 0, 0, 0, 0
_str_9: db 69, 120, 99, 101, 112, 116, 101, 100, 32, 116, 111, 107, 101, 110, 58, 32, 37, 105, 44, 32, 103, 111, 116, 58, 32, 37, 105, 10, 0
_str_10: db 77, 79, 86, 0
_str_11: db 77, 79, 86, 0
_str_12: db 77, 79, 86, 0
_str_13: db 77, 79, 86, 0
_str_14: db 65, 68, 68, 0
_str_15: db 83, 85, 66, 0
_str_16: db 65, 88, 0
_str_17: db 67, 88, 0
_str_18: db 68, 88, 0
_str_19: db 66, 88, 0
_str_20: db 83, 80, 0
_str_21: db 66, 80, 0
_str_22: db 83, 73, 0
_str_23: db 68, 73, 0
_str_24: db 65, 76, 0
_str_25: db 67, 76, 0
_str_26: db 68, 76, 0
_str_27: db 66, 76, 0
_str_28: db 65, 72, 0
_str_29: db 67, 72, 0
_str_30: db 68, 72, 0
_str_31: db 66, 72, 0
_str_32: db 65, 88, 0
_str_33: db 66, 88, 0
_str_34: db 67, 88, 0
_str_35: db 68, 88, 0
_str_36: db 83, 73, 0
_str_37: db 68, 73, 0
_str_38: db 83, 80, 0
_str_39: db 66, 80, 0
_str_40: db 65, 76, 0
_str_41: db 66, 76, 0
_str_42: db 67, 76, 0
_str_43: db 68, 76, 0
_str_44: db 65, 72, 0
_str_45: db 66, 72, 0
_str_46: db 67, 72, 0
_str_47: db 68, 72, 0
_var_str_init_48: db 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 69, 83, 84, 85, 86, 87, 88, 89, 90, 49, 50, 51, 52, 53, 54, 55, 56, 57, 48, 95, 39, 91, 93, 0
_var_str_init_49: db 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 67, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 49, 50, 51, 52, 53, 54, 55, 56, 57, 48, 0
_var_str_init_50: db 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 65, 66, 67, 68, 69, 70, 0
_var_str_init_51: db 49, 50, 51, 52, 53, 54, 55, 56, 57, 48, 0
_var_str_init_52: db 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 0
_var_str_init_53: db 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 67, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 49, 50, 51, 52, 53, 54, 55, 56, 57, 48, 0
_orig_ds: dw 0
_orig_es: dw 0
_orig_ss: dw 0
_str_54: db 97, 114, 103, 99, 58, 32, 0
_str_55: db 32, 97, 114, 103, 118, 58, 32, 0
_str_56: db 105, 110, 112, 117, 116, 58, 32, 0
_str_57: db 111, 117, 116, 112, 117, 116, 58, 32, 0
_str_58: db 77, 79, 86, 32, 65, 88, 44, 32, 49, 10, 65, 68, 68, 32, 66, 88, 44, 32, 65, 88, 10, 88, 79, 82, 32, 65, 88, 44, 32, 65, 88, 0
_str_59: db 116, 101, 115, 116, 0
_str_60: db 66, 88, 0
_str_61: db 68, 88, 0
_str_62: db 83, 85, 66, 0
_str_63: db 32, 0
_str_64: db 115, 116, 114, 117, 99, 116, 46, 115, 116, 114, 117, 99, 116, 32, 116, 101, 115, 116, 58, 32, 37, 115, 0
_str_65: db 111, 117, 116, 112, 117, 116, 46, 98, 105, 110, 0
_str_66: db 65, 115, 115, 101, 109, 98, 108, 121, 32, 99, 111, 109, 112, 108, 101, 116, 101, 100, 33, 0

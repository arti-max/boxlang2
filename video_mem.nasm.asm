BITS 16

section .text

    jmp _start



; _start label handled by compiler
    push bp
    mov bp, sp
    sub sp, 8

; --- BEGIN Global Variable Initialization ---
    mov ax, 31775
    push ax
    pop ax
    mov bx, __var_COLOR
    mov word [bx], ax
    mov ax, 0
    push ax
    pop ax
    mov bx, __var_index
    mov word [bx], ax
; --- END Global Initialization ---

    mov ax, 1
    push ax
    mov bx, __var_COLOR
    mov ax, 0
    mov ax, word [bx]
    push ax
    call set_color_to_table
    add sp, 8
    mov ax, 0
    push ax
    pop ax
    mov bx, bp
    sub bx, 4
    mov word [bx], ax
    mov ax, 0
    push ax
    pop ax
    mov bx, bp
    sub bx, 8
    mov word [bx], ax
.L_while_start_0:
    mov ax, 100000
    push ax
    mov bx, __var_index
    mov ax, word [bx]
    pop bx
    cmp ax, bx
    jl .L_comp_true_2
    mov ax, 0
    jmp .L_comp_end_2
.L_comp_true_2:
    mov ax, 1
.L_comp_end_2:
    cmp ax, 0
    je .L_while_end_0
; --- while-body ---
    mov ax, 1
    push ax
    mov bx, bp
    sub bx, 8
    mov ax, word [bx]
    push ax
    mov bx, bp
    sub bx, 4
    mov ax, word [bx]
    push ax
    call draw_pixel
    add sp, 12
    mov ax, 1
    push ax
    mov bx, bp
    sub bx, 4
    mov ax, word [bx]
    pop bx
    add ax, bx
    push ax
    pop ax
    mov bx, bp
    sub bx, 4
    mov word [bx], ax
    mov ax, 1
    push ax
    mov bx, __var_index
    mov ax, word [bx]
    pop bx
    add ax, bx
    push ax
    pop ax
    mov bx, __var_index
    mov word [bx], ax
    jmp .L_while_start_0
.L_while_end_0:
    call VIDEO_FLUSH
    int 00
    hlt

get_coordinate:
    push bp
    mov bp, sp
    sub sp, 8
    mov ax, 640
    push ax
    mov bx, bp
    add bx, 12
    mov ax, word [bx]
    pop bx
    mov ax, ax
    imul ax, bx
    mov ax, ax
    push ax
    pop ax
    mov bx, bp
    sub bx, 4
    mov word [bx], ax
    mov bx, bp
    add bx, 8
    mov ax, word [bx]
    push ax
    mov bx, bp
    sub bx, 4
    mov ax, word [bx]
    pop bx
    add ax, bx
    push ax
    pop ax
    mov bx, bp
    sub bx, 8
    mov word [bx], ax
    mov bx, bp
    sub bx, 8
    mov ax, word [bx]
    jmp .L_ret_get_coordinate
.L_ret_get_coordinate:
    mov sp, bp
    pop bp
    ret

set_color_to_table:
    push bp
    mov bp, sp
    sub sp, 8
    mov ax, 2
    push ax
    mov bx, bp
    add bx, 12
    mov ax, word [bx]
    pop bx
    mov ax, ax
    imul ax, bx
    mov ax, ax
    push ax
    pop ax
    mov bx, bp
    sub bx, 4
    mov word [bx], ax
    mov bx, bp
    sub bx, 4
    mov ax, word [bx]
    push ax
    mov ax, 4849664
    pop bx
    add ax, bx
    push ax
    pop ax
    mov bx, bp
    sub bx, 8
    mov word [bx], ax
    mov bx, bp
    add bx, 8
    mov ax, 0
    mov ax, word [bx]
    push ax
    mov bx, bp
    sub bx, 8
    mov ax, word [bx]
    mov bx, ax
    pop ax
    mov word [bx], ax
.L_ret_set_color_to_table:
    mov ax, 0
    mov sp, bp
    pop bp
    ret

draw_pixel:
    push bp
    mov bp, sp
    sub sp, 4
    mov bx, bp
    add bx, 12
    mov ax, word [bx]
    push ax
    mov bx, bp
    add bx, 8
    mov ax, word [bx]
    push ax
    call get_coordinate
    add sp, 8
    push ax
    mov ax, 4194304
    pop bx
    add ax, bx
    push ax
    pop ax
    mov bx, bp
    sub bx, 4
    mov word [bx], ax
    mov bx, bp
    add bx, 16
    mov ax, 0
    mov ax, byte [bx]
    push ax
    mov bx, bp
    sub bx, 4
    mov ax, word [bx]
    mov bx, ax
    pop ax
    mov byte [bx], ax
.L_ret_draw_pixel:
    mov ax, 0
    mov sp, bp
    pop bp
    ret

init_graphics_mode:
    push bp
    mov bp, sp
    sub sp, 4
    mov ax, 4849408
    push ax
    pop ax
    mov bx, bp
    sub bx, 4
    mov word [bx], ax
    mov ax, 1
    push ax
    mov bx, bp
    sub bx, 4
    mov ax, word [bx]
    mov bx, ax
    pop ax
    mov byte [bx], ax
.L_ret_init_graphics_mode:
    mov ax, 0
    mov sp, bp
    pop bp
    ret

; === Data Section ===
__var_COLOR:
    times reserve db 0
__var_index:
    times reserve db 0

section .data
; Виртуальные регистры %e8-%e31 по адресу 0x1000
virtual_regs: times 24 dw 0  ; Виртуальные регистры %e8-%e31 (16-bit)
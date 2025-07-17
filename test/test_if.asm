jmp _start

; stdprint.asm - Simple text output for GovnoCore32X
; Исправленная и оптимизированная версия

; Указатель на текущую позицию текста в видеопамяти
text_ptr: reserve 4 bytes

; void init_text_mode()
; Инициализирует текстовый видеорежим 80x60
init_text_mode:
    psh %ebp
    mov %ebp %esp
    add %ebp 1
    psh %eax
    psh %esi
    
    ; Установить видеорежим 2 (текстовый)
    mov %esi $49FF00
    mov %eax 2
    sb %esi %eax
    
    ; Установить простую палитру (черный и белый)
    mov %esi $4A0000
    mov %eax $0000
    sw %esi %eax
    mov %eax $7FFF
    sw %esi %eax
    
    ; Инициализировать указатель на начало видеопамяти
    mov %eax $4F0000
    mov %esi text_ptr
    sd %esi %eax
    
    ; Обновить экран
    int $11
    
    pop %esi
    pop %eax
    mov %esp %ebp
    sub %esp 1
    pop %ebp
    rts

; void print_char(char c)
; Параметры: [ebp+8] = символ
; ВАЖНО: Эта функция была полностью переписана для исправления ошибки
print_char:
    psh %ebp
    mov %ebp %esp
    add %ebp 1
    psh %eax
    psh %ebx
    psh %esi
    
    ; Получить символ из стека
    mov %ebx %ebp
    add %ebx 8
    ld %ebx %eax
    
    ; Проверка на символ новой строки (код 10)
    cmp %eax 10
    je .char_newline
    
    ; --- Основная логика вывода символа ---
    
    ; Получить текущий адрес в видеопамяти
    mov %esi text_ptr
    ld %esi %ebx       ; %ebx теперь содержит адрес для записи
    
    ; Объединяем символ (младший байт) и атрибут (старший байт) в одно 16-битное слово.
    ; Атрибут 1 - белый на черном.
    ; Например, для символа 'A' (0x41) результат в %eax будет 0x0141.
    add %eax $0100
    
    ; Записываем 16-битное слово (символ + атрибут) в видеопамять.
    ; Инструкция 'sw' атомарно записывает 2 байта и автоматически увеличивает указатель в %ebx на 2.
    sw %ebx %eax
    
    ; Проверяем, не вышли ли мы за пределы экрана
    cmp %ebx $4F2580
    jl .no_wrap
    mov %ebx $4F0000 ; Если да, переносим указатель в начало
.no_wrap:
    
    ; Сохраняем новый, уже увеличенный указатель
    mov %esi text_ptr
    sd %esi %ebx
    
    ; Обновляем экран, чтобы показать изменения
    int $11
    jmp .char_done

.char_newline:
    ; Логика переноса строки (осталась без изменений)
    mov %esi text_ptr
    ld %esi %ebx
    sub %ebx $4F0000
    div %ebx 160
    add %ebx 1
    mul %ebx 160
    add %ebx $4F0000
    cmp %ebx $4F2580
    jl .newline_ok
    mov %ebx $4F0000
.newline_ok:
    mov %esi text_ptr
    sd %esi %ebx
    int $11

.char_done:
    pop %esi
    pop %ebx
    pop %eax
    mov %esp %ebp
    sub %esp 1
    pop %ebp
    rts

; void print(char* str)
; Параметры: [ebp+8] = адрес строки
; Эта функция вызывает print_char и теперь будет работать корректно
print:
    psh %ebp
    mov %ebp %esp
    add %ebp 1
    psh %eax
    psh %ebx
    
    ; Получить адрес строки
    mov %ebx %ebp
    add %ebx 8
    ld %ebx %ebx
    
.print_loop:
    lb %ebx %eax
    cmp %eax 0
    je .print_end
    
    ; Преобразовать '$' в символ новой строки (код 10) для print_char
    cmp %eax 36
    jne .not_newline
    mov %eax 10
.not_newline:
    
    ; Вызвать исправленную print_char
    psh %eax
    jsr print_char
    add %esp 4
    
    jmp .print_loop
    
.print_end:
    pop %ebx
    pop %eax
    mov %esp %ebp
    sub %esp 1
    pop %ebp
    rts

; void print_num(num32 number)
; Вывод числа, остался без изменений, т.к. использует print_char
print_num:
    psh %ebp
    mov %ebp %esp
    add %ebp 1
    psh %eax
    psh %ebx
    psh %ecx
    psh %edx
    
    mov %ebx %ebp
    add %ebx 8
    ld %ebx %eax
    
    cmp %eax 0
    jne .not_zero
    mov %eax 48
    psh %eax
    jsr print_char
    add %esp 4
    jmp .num_done
    
.not_zero:
    cmp %eax 0
    jg .positive
    
    psh %eax
    mov %eax 45
    psh %eax
    jsr print_char
    add %esp 4
    pop %eax
    
    not %eax
    add %eax 1
    
.positive:
    mov %ebx 0
    
.extract_loop:
    mov %edx 0
    mov %ecx 10
    div %eax %ecx
    add %edx 48
    psh %edx
    add %ebx 1
    cmp %eax 0
    jne .extract_loop
    
.print_digits:
    cmp %ebx 0
    je .num_done
    pop %eax
    psh %eax
    jsr print_char
    add %esp 4
    sub %ebx 1
    jmp .print_digits
    
.num_done:
    pop %edx
    pop %ecx
    pop %ebx
    pop %eax
    mov %esp %ebp
    sub %esp 1
    pop %ebp
    rts

; void clear_screen()
; Очистка экрана, осталась без изменений
clear_screen:
    psh %ebp
    mov %ebp %esp
    add %ebp 1
    psh %eax
    psh %ebx
    psh %ecx
    
    mov %ebx $4F0000
    mov %ecx $0120      ; Символ пробела с атрибутом 1
    
.clear_loop:
    sw %ebx %ecx
    cmp %ebx $4F2580
    jl .clear_loop
    
    mov %eax $4F0000
    mov %ebx text_ptr
    sd %ebx %eax
    
    int $11
    
    pop %ecx
    pop %ebx
    pop %eax
    mov %esp %ebp
    sub %esp 1
    pop %ebp
    rts

; stdio.asm - Basic I/O functions for BoxLang
; Contains: exit, trapf, and utility functions

; void exit(num32 code)
; Terminates program with exit code
; Parameters: [ebp+8] = exit code
exit:
    psh %ebp
    mov %ebp %esp
    add %ebp 1
    
    ; Get exit code from stack
    mov %ebx %ebp
    add %ebx 8
    ld %ebx %eax
    
    ; Exit with code
    hlt
    
    mov %esp %ebp
    sub %esp 1
    pop %ebp
    rts

; void trapf()
; Debugging trap function
trapf:
    psh %ebp
    mov %ebp %esp
    add %ebp 1
    
    trap
    
    mov %esp %ebp
    sub %esp 1
    pop %ebp
    rts



_start:
    add %ebp 1
    sub %esp 12 ; Allocate space for local variables and arrays
    jsr init_text_mode
    jsr clear_screen
    mov %eax 15
    psh %eax ; Save expression result
    mov %eax 0
    psh %eax ; Save index
    mov %ebx 2
    mul %eax %ebx ; eax = index * size
    mov %e8 %eax ; Save final offset to e8
    mov %ebx %ebp
    sub %ebx 4 ; ebx = base address of local array
    add %ebx %e8 ; ebx = base_address + offset
    pop %eax ; Restore index (and clean stack)
    pop %eax ; Restore expression result
    sw %ebx %eax ; Store value at address
    mov %eax 10
    psh %eax ; Save expression result
    mov %eax 1
    psh %eax ; Save index
    mov %ebx 2
    mul %eax %ebx ; eax = index * size
    mov %e8 %eax ; Save final offset to e8
    mov %ebx %ebp
    sub %ebx 4 ; ebx = base address of local array
    add %ebx %e8 ; ebx = base_address + offset
    pop %eax ; Restore index (and clean stack)
    pop %eax ; Restore expression result
    sw %ebx %eax ; Store value at address
    mov %eax 5
    psh %eax ; Save expression result
    pop %eax ; Restore expression result
    mov %ebx %ebp
    sub %ebx 8
    sd %ebx %eax
    mov %eax 10
    psh %eax ; Save expression result
    pop %eax ; Restore expression result
    mov %ebx %ebp
    sub %ebx 12
    sd %ebx %eax
    mov %eax 1
    psh %eax ; Save index
    mov %ebx 2
    mul %eax %ebx ; eax = index * size
    mov %e8 %eax ; Save final offset to e8
    mov %ebx %ebp
    sub %ebx 4 ; ebx = base address of local array
    add %ebx %e8 ; ebx = base_address + offset
    pop %eax ; Restore index (and clean stack)
    mov %eax 0
    lw %ebx %eax ; Load value from address
        psh %eax
    mov %eax 0
    psh %eax ; Save index
    mov %ebx 2
    mul %eax %ebx ; eax = index * size
    mov %e8 %eax ; Save final offset to e8
    mov %ebx %ebp
    sub %ebx 4 ; ebx = base address of local array
    add %ebx %e8 ; ebx = base_address + offset
    pop %eax ; Restore index (and clean stack)
    mov %eax 0
    lw %ebx %eax ; Load value from address
        pop %ebx
        cmp %eax %ebx
        jl .L_comp_true_1
        mov %eax 0 ; False
        jmp .L_comp_end_1
.L_comp_true_1:
        mov %eax 1 ; True
.L_comp_end_1:
        cmp %eax 0
        je .L_else_0 ; Jump to else if condition is false
        ; --- if-body ---
    mov %eax __str_0
    psh %eax
    jsr print
    add %esp 4
        jmp .L_endif_0 ; End of if-body
.L_else_0:
        ; --- else-body ---
    mov %eax __str_1
    psh %eax
    jsr print
    add %esp 4
.L_endif_0:
    mov %eax 0
    psh %eax ; Save index
    mov %ebx 2
    mul %eax %ebx ; eax = index * size
    mov %e8 %eax ; Save final offset to e8
    mov %ebx %ebp
    sub %ebx 4 ; ebx = base address of local array
    add %ebx %e8 ; ebx = base_address + offset
    pop %eax ; Restore index (and clean stack)
    mov %eax 0
    lw %ebx %eax ; Load value from address
        psh %eax
    mov %eax 1
    psh %eax ; Save index
    mov %ebx 2
    mul %eax %ebx ; eax = index * size
    mov %e8 %eax ; Save final offset to e8
    mov %ebx %ebp
    sub %ebx 4 ; ebx = base address of local array
    add %ebx %e8 ; ebx = base_address + offset
    pop %eax ; Restore index (and clean stack)
    mov %eax 0
    lw %ebx %eax ; Load value from address
        pop %ebx
        cmp %eax %ebx
        jg .L_comp_true_3
        mov %eax 0 ; False
        jmp .L_comp_end_3
.L_comp_true_3:
        mov %eax 1 ; True
.L_comp_end_3:
        cmp %eax 0
        je .L_endif_2 ; Jump to end if condition is false
        ; --- if-body ---
    mov %eax __str_2
    psh %eax
    jsr print
    add %esp 4
        jmp .L_endif_2 ; End of if-body
.L_endif_2:
    mov %eax 5
        psh %eax
    mov %eax 0
    psh %eax ; Save index
    mov %ebx 2
    mul %eax %ebx ; eax = index * size
    mov %e8 %eax ; Save final offset to e8
    mov %ebx %ebp
    sub %ebx 4 ; ebx = base address of local array
    add %ebx %e8 ; ebx = base_address + offset
    pop %eax ; Restore index (and clean stack)
    mov %eax 0
    lw %ebx %eax ; Load value from address
        pop %ebx
        cmp %eax %ebx
        je .L_comp_true_5
        mov %eax 0 ; False
        jmp .L_comp_end_5
.L_comp_true_5:
        mov %eax 1 ; True
.L_comp_end_5:
        cmp %eax 0
        je .L_else_4 ; Jump to else if condition is false
        ; --- if-body ---
    mov %eax __str_3
    psh %eax
    jsr print
    add %esp 4
        jmp .L_endif_4 ; End of if-body
.L_else_4:
        ; --- else-body ---
    mov %eax __str_4
    psh %eax
    jsr print
    add %esp 4
.L_endif_4:
    mov %eax 10
        psh %eax
    mov %eax 1
    psh %eax ; Save index
    mov %ebx 2
    mul %eax %ebx ; eax = index * size
    mov %e8 %eax ; Save final offset to e8
    mov %ebx %ebp
    sub %ebx 4 ; ebx = base address of local array
    add %ebx %e8 ; ebx = base_address + offset
    pop %eax ; Restore index (and clean stack)
    mov %eax 0
    lw %ebx %eax ; Load value from address
        pop %ebx
        cmp %eax %ebx
        jne .L_comp_true_7
        mov %eax 0 ; False
        jmp .L_comp_end_7
.L_comp_true_7:
        mov %eax 1 ; True
.L_comp_end_7:
        cmp %eax 0
        je .L_else_6 ; Jump to else if condition is false
        ; --- if-body ---
    mov %eax __str_5
    psh %eax
    jsr print
    add %esp 4
        jmp .L_endif_6 ; End of if-body
.L_else_6:
        ; --- else-body ---
    mov %eax __str_6
    psh %eax
    jsr print
    add %esp 4
.L_endif_6:
    jsr trapf
    hlt ; Program end

; === Data Section ===
__str_0: bytes "a is less than b$" 0
__str_1: bytes "a is NOT less than b$" 0
__str_2: bytes "b is greater than a$" 0
__str_3: bytes "a is 5!$" 0
__str_4: bytes "Error in logic!$" 0
__str_5: bytes "Error in logic 2!$" 0
__str_6: bytes "b is indeed 10!$" 0

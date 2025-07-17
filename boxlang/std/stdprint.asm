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

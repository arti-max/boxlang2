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
 je .L_comp_true_1
 mov %eax 0 ; False
 jmp .L_comp_end_1
.L_comp_true_1:
 mov %eax 1 ; True
.L_comp_end_1:
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
.L_for_start_2:
    mov %ebx __var_buffer_length
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_true_3
 mov %eax 0 ; False
 jmp .L_comp_end_3
.L_comp_true_3:
 mov %eax 1 ; True
.L_comp_end_3:
        cmp %eax 0
        je .L_for_end_2
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
        jmp .L_for_start_2
.L_for_end_2:
    mov %eax 1
 psh %eax
    mov %ebx __var_auto_flush
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_5
 mov %eax 0 ; False
 jmp .L_comp_end_5
.L_comp_true_5:
 mov %eax 1 ; True
.L_comp_end_5:
        cmp %eax 0
        je .L_endif_4 ; Jump to end if condition is false
        ; --- if-body ---
 jsr screen_flush
        jmp .L_endif_4 ; End of if-body
.L_endif_4:
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
 jg .L_comp_true_7
 mov %eax 0 ; False
 jmp .L_comp_end_7
.L_comp_true_7:
 mov %eax 1 ; True
.L_comp_end_7:
        cmp %eax 0
        je .L_endif_6 ; Jump to end if condition is false
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
        jmp .L_endif_6 ; End of if-body
.L_endif_6:
    mov %ebx __var_text_screen_height
    mov %eax 0
    lb %ebx %eax
 psh %eax
    mov %ebx __var_cursor_y
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jg .L_comp_true_9
 mov %eax 0 ; False
 jmp .L_comp_end_9
.L_comp_true_9:
 mov %eax 1 ; True
.L_comp_end_9:
        cmp %eax 0
        je .L_endif_8 ; Jump to end if condition is false
        ; --- if-body ---
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx __var_cursor_y
    sb %ebx %eax
        jmp .L_endif_8 ; End of if-body
.L_endif_8:
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
 je .L_comp_true_11
 mov %eax 0 ; False
 jmp .L_comp_end_11
.L_comp_true_11:
 mov %eax 1 ; True
.L_comp_end_11:
        cmp %eax 0
        je .L_else_10 ; Jump to else if condition is false
        ; --- if-body ---
 jsr print_newline
        jmp .L_endif_10 ; End of if-body
.L_else_10:
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
.L_endif_10:
    mov %eax 1
 psh %eax
    mov %ebx __var_auto_flush
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_13
 mov %eax 0 ; False
 jmp .L_comp_end_13
.L_comp_true_13:
 mov %eax 1 ; True
.L_comp_end_13:
        cmp %eax 0
        je .L_endif_12 ; Jump to end if condition is false
        ; --- if-body ---
 jsr screen_flush
        jmp .L_endif_12 ; End of if-body
.L_endif_12:
.L_ret_print_char:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

print:
    psh %ebp
    mov %ebp %esp
.L_while_start_14:
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
 jne .L_comp_true_15
 mov %eax 0 ; False
 jmp .L_comp_end_15
.L_comp_true_15:
 mov %eax 1 ; True
.L_comp_end_15:
        cmp %eax 0
        je .L_while_end_14 ; Jump to end if condition is false
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
        jmp .L_while_start_14
.L_while_end_14:
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
 je .L_comp_true_17
 mov %eax 0 ; False
 jmp .L_comp_end_17
.L_comp_true_17:
 mov %eax 1 ; True
.L_comp_end_17:
        cmp %eax 0
        je .L_endif_16 ; Jump to end if condition is false
        ; --- if-body ---
    mov %eax 48
 psh %eax
 jsr print_char
 add %esp 4
    mov %eax 0
    jmp .L_ret_print_num
        jmp .L_endif_16 ; End of if-body
.L_endif_16:
    mov %eax 0
 psh %eax
    mov %ebx %ebp
    add %ebx 8
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_true_19
 mov %eax 0 ; False
 jmp .L_comp_end_19
.L_comp_true_19:
 mov %eax 1 ; True
.L_comp_end_19:
        cmp %eax 0
        je .L_endif_18 ; Jump to end if condition is false
        ; --- if-body ---
    mov %eax 45
 psh %eax
 jsr print_char
 add %esp 4
    mov %eax 1
 not %eax
 inx %eax ; Emulated unary minus (negation)
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
        jmp .L_endif_18 ; End of if-body
.L_endif_18:
.L_while_start_20:
    mov %eax 0
 psh %eax
    mov %ebx %ebp
    add %ebx 8
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jne .L_comp_true_21
 mov %eax 0 ; False
 jmp .L_comp_end_21
.L_comp_true_21:
 mov %eax 1 ; True
.L_comp_end_21:
        cmp %eax 0
        je .L_while_end_20 ; Jump to end if condition is false
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
        jmp .L_while_start_20
.L_while_end_20:
.L_while_start_22:
    mov %eax 0
 psh %eax
    mov %ebx %ebp
    sub %ebx 258
    mov %eax 0
    lw %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jne .L_comp_true_23
 mov %eax 0 ; False
 jmp .L_comp_end_23
.L_comp_true_23:
 mov %eax 1 ; True
.L_comp_end_23:
        cmp %eax 0
        je .L_while_end_22 ; Jump to end if condition is false
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
        jmp .L_while_start_22
.L_while_end_22:
.L_ret_print_num:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    pop %ebp
    rts

exit:
    psh %ebp
    mov %ebp %esp
    mov %ebx %ebp
    add %ebx 8
    ld %ebx %eax
 mov %e8 %eax
 psh %e8
 int $00
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
.L_for_start_24:
    mov %ebx %ebp
    add %ebx 12
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_true_25
 mov %eax 0 ; False
 jmp .L_comp_end_25
.L_comp_true_25:
 mov %eax 1 ; True
.L_comp_end_25:
        cmp %eax 0
        je .L_for_end_24
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
        jmp .L_for_start_24
.L_for_end_24:
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
.L_for_start_26:
    mov %ebx %ebp
    add %ebx 12
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_true_27
 mov %eax 0 ; False
 jmp .L_comp_end_27
.L_comp_true_27:
 mov %eax 1 ; True
.L_comp_end_27:
        cmp %eax 0
        je .L_for_end_26
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
        jmp .L_for_start_26
.L_for_end_26:
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
.L_for_start_28:
    mov %ebx %ebp
    add %ebx 12
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 8
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
        je .L_for_end_28
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
        jmp .L_for_start_28
.L_for_end_28:
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
.L_while_start_30:
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
 jne .L_comp_true_31
 mov %eax 0 ; False
 jmp .L_comp_end_31
.L_comp_true_31:
 mov %eax 1 ; True
.L_comp_end_31:
        cmp %eax 0
        je .L_while_end_30 ; Jump to end if condition is false
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
 je .L_comp_true_33
 mov %eax 0 ; False
 jmp .L_comp_end_33
.L_comp_true_33:
 mov %eax 1 ; True
.L_comp_end_33:
        cmp %eax 0
        je .L_else_32 ; Jump to else if condition is false
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
        je .L_block_body_35_0
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
        je .L_block_body_35_1
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
        je .L_block_body_35_2
        jmp .L_block_body_35_3
.L_block_body_35_0:
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
        jmp .L_match_end_34
.L_block_body_35_1:
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
        jmp .L_match_end_34
.L_block_body_35_2:
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
        jmp .L_match_end_34
.L_block_body_35_3:
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
.L_match_end_34:
        jmp .L_endif_32 ; End of if-body
.L_else_32:
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
.L_endif_32:
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
        jmp .L_while_start_30
.L_while_end_30:
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
.L_while_start_35:
    mov %eax 0
 psh %eax
    mov %ebx %ebp
    sub %ebx 6
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 cmp %eax %ebx
 je .L_comp_true_36
 mov %eax 0 ; False
 jmp .L_comp_end_36
.L_comp_true_36:
 mov %eax 1 ; True
.L_comp_end_36:
        cmp %eax 0
        je .L_while_end_35 ; Jump to end if condition is false
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
.L_for_start_37:
    mov %eax 6
 psh %eax
    mov %ebx %ebp
    sub %ebx 8
    mov %eax 0
    lw %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_true_38
 mov %eax 0 ; False
 jmp .L_comp_end_38
.L_comp_true_38:
 mov %eax 1 ; True
.L_comp_end_38:
        cmp %eax 0
        je .L_for_end_37
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
 jne .L_comp_true_40
 mov %eax 0 ; False
 jmp .L_comp_end_40
.L_comp_true_40:
 mov %eax 1 ; True
.L_comp_end_40:
        cmp %eax 0
        je .L_endif_39 ; Jump to end if condition is false
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
 jne .L_comp_true_42
 mov %eax 0 ; False
 jmp .L_comp_end_42
.L_comp_true_42:
 mov %eax 1 ; True
.L_comp_end_42:
        cmp %eax 0
        je .L_endif_41 ; Jump to end if condition is false
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
 jne .L_comp_true_44
 mov %eax 0 ; False
 jmp .L_comp_end_44
.L_comp_true_44:
 mov %eax 1 ; True
.L_comp_end_44:
        cmp %eax 0
        je .L_endif_43 ; Jump to end if condition is false
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
        jmp .L_endif_43 ; End of if-body
.L_endif_43:
        jmp .L_endif_41 ; End of if-body
.L_endif_41:
        jmp .L_endif_39 ; End of if-body
.L_endif_39:
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
        jmp .L_for_start_37
.L_for_end_37:
        jmp .L_while_start_35
.L_while_end_35:
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
.L_for_start_45:
    mov %eax 6
 psh %eax
    mov %ebx %ebp
    sub %ebx 6
    mov %eax 0
    lw %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_true_46
 mov %eax 0 ; False
 jmp .L_comp_end_46
.L_comp_true_46:
 mov %eax 1 ; True
.L_comp_end_46:
        cmp %eax 0
        je .L_for_end_45
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
        je .L_block_body_48_0
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
        je .L_block_body_48_1
        jmp .L_match_end_47
.L_block_body_48_0:
    mov %eax 1
    jmp .L_ret_is_shift_pressed
        jmp .L_match_end_47
.L_block_body_48_1:
    mov %eax 1
    jmp .L_ret_is_shift_pressed
        jmp .L_match_end_47
.L_match_end_47:
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
        jmp .L_for_start_45
.L_for_end_45:
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
.L_for_start_48:
    mov %eax 6
 psh %eax
    mov %ebx %ebp
    sub %ebx 7
    mov %eax 0
    lw %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_true_49
 mov %eax 0 ; False
 jmp .L_comp_end_49
.L_comp_true_49:
 mov %eax 1 ; True
.L_comp_end_49:
        cmp %eax 0
        je .L_for_end_48
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
 je .L_comp_true_51
 mov %eax 0 ; False
 jmp .L_comp_end_51
.L_comp_true_51:
 mov %eax 1 ; True
.L_comp_end_51:
        cmp %eax 0
        je .L_endif_50 ; Jump to end if condition is false
        ; --- if-body ---
    mov %eax 1
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 5
    sb %ebx %eax
        jmp .L_endif_50 ; End of if-body
.L_endif_50:
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
        jmp .L_for_start_48
.L_for_end_48:
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
.L_strcpy_52:
 lb %egi %eax
 sb %esi %eax
 lp .L_strcpy_52
 ; --- Initialize array 'shifted_chars' from __str_init_1 ---
 mov %esi %ebp
 sub %esi 114
 mov %egi __str_init_1
 mov %ecx 54
.L_strcpy_53:
 lb %egi %eax
 sb %esi %eax
 lp .L_strcpy_53
 ; --- Initialize array 'extra' from __str_init_2 ---
 mov %esi %ebp
 sub %esi 140
 mov %egi __str_init_2
 mov %ecx 26
.L_strcpy_54:
 lb %egi %eax
 sb %esi %eax
 lp .L_strcpy_54
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
.L_for_start_55:
    mov %eax 57 ; .length of layout_chars
 psh %eax
    mov %ebx %ebp
    sub %ebx 150
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_true_56
 mov %eax 0 ; False
 jmp .L_comp_end_56
.L_comp_true_56:
 mov %eax 1 ; True
.L_comp_end_56:
        cmp %eax 0
        je .L_for_end_55
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
 je .L_comp_true_58
 mov %eax 0 ; False
 jmp .L_comp_end_58
.L_comp_true_58:
 mov %eax 1 ; True
.L_comp_end_58:
        cmp %eax 0
        je .L_endif_57 ; Jump to end if condition is false
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
        jmp .L_endif_57 ; End of if-body
.L_endif_57:
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
        jmp .L_for_start_55
.L_for_end_55:
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 150
    sd %ebx %eax
.L_for_start_59:
    mov %eax 26 ; .length of extra
 psh %eax
    mov %ebx %ebp
    sub %ebx 150
    ld %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_true_60
 mov %eax 0 ; False
 jmp .L_comp_end_60
.L_comp_true_60:
 mov %eax 1 ; True
.L_comp_end_60:
        cmp %eax 0
        je .L_for_end_59
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
 je .L_comp_true_62
 mov %eax 0 ; False
 jmp .L_comp_end_62
.L_comp_true_62:
 mov %eax 1 ; True
.L_comp_end_62:
        cmp %eax 0
        je .L_endif_61 ; Jump to end if condition is false
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
        jmp .L_endif_61 ; End of if-body
.L_endif_61:
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
        jmp .L_for_start_59
.L_for_end_59:
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
 je .L_comp_true_64
 mov %eax 0 ; False
 jmp .L_comp_end_64
.L_comp_true_64:
 mov %eax 1 ; True
.L_comp_end_64:
        cmp %eax 0
        je .L_else_63 ; Jump to else if condition is false
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
        jmp .L_endif_63 ; End of if-body
.L_else_63:
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
.L_endif_63:
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
.L_strcpy_65:
 lb %egi %eax
 sb %esi %eax
 lp .L_strcpy_65
 ; --- Initialize array 'shifted_chars' from __str_init_4 ---
 mov %esi %ebp
 sub %esi 116
 mov %egi __str_init_4
 mov %ecx 54
.L_strcpy_66:
 lb %egi %eax
 sb %esi %eax
 lp .L_strcpy_66
 ; --- Initialize array 'extra' from __str_init_5 ---
 mov %esi %ebp
 sub %esi 142
 mov %egi __str_init_5
 mov %ecx 26
.L_strcpy_67:
 lb %egi %eax
 sb %esi %eax
 lp .L_strcpy_67
    mov %eax 57
 psh %eax
    mov %ebx %ebp
    sub %ebx 1
    mov %eax 0
    lb %ebx %eax
 pop %ebx
 cmp %eax %ebx
 jl .L_comp_true_69
 mov %eax 0 ; False
 jmp .L_comp_end_69
.L_comp_true_69:
 mov %eax 1 ; True
.L_comp_end_69:
        cmp %eax 0
        je .L_else_68 ; Jump to else if condition is false
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
 je .L_comp_true_71
 mov %eax 0 ; False
 jmp .L_comp_end_71
.L_comp_true_71:
 mov %eax 1 ; True
.L_comp_end_71:
        cmp %eax 0
        je .L_else_70 ; Jump to else if condition is false
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
        jmp .L_endif_70 ; End of if-body
.L_else_70:
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
.L_endif_70:
        jmp .L_endif_68 ; End of if-body
.L_else_68:
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
.L_endif_68:
    mov %ebx %ebp
    sub %ebx 2
    mov %eax 0
    lb %ebx %eax
    jmp .L_ret_getchar
.L_ret_getchar:
    mov %esp %ebp
    pop %ebp
    rts

_start:
    psh %ebp
    mov %ebp %esp
    sub %esp 1 ; Allocate space for ALL local variables
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
    mov %eax 1
 psh %eax
 jsr set_auto_flush
 add %esp 4
 jsr getchar
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 1
    sb %ebx %eax
    mov %ebx %ebp
    sub %ebx 1
    mov %eax 0
    lb %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 1
    mov %eax 0
    lb %ebx %eax
 psh %eax
 mov %eax __str_init_6
 psh %eax
 jsr printf
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
__str_init_0: bytes "abcdefghijklmnopqrstuvwxyz1234567890" $0A $1B $7F $09 " -=[]" $5C "`';'`,./"  0
__str_init_1: bytes "ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%^&*()" $0A $1B $7F $09 " _+{}|~:" $5C $22 "~<>?"  0
__str_init_2: bytes $13 $E0 $E1 $E2 $E3 $E4 $E5 $E6 $E7 $E8 $E9 $EA $EB $14 $17 $12 $07 $C3 $C2 $FE $B4 $C1 $10 $11 $1F $1E  0
__str_init_3: bytes "abcdefghijklmnopqrstuvwxyz1234567890" $0A $1B $7F $09 " -=[]" $5C "`';'`,./"  0
__str_init_4: bytes "ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%^&*()" $0A $1B $7F $09 " _+{}|~:" $5C $22 "~<>?"  0
__str_init_5: bytes $13 $E0 $E1 $E2 $E3 $E4 $E5 $E6 $E7 $E8 $E9 $EA $EB $14 $17 $12 $07 $C3 $C2 $FE $B4 $C1 $10 $11 $1F $1E  0
__str_init_6: bytes "character: %c, number: %i" 0

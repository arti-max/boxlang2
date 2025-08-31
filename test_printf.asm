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



exit:
    psh %ebp
    mov %ebp %esp
    add %ebp 1
    mov %ebx %ebp
    add %ebx 8
    ld %ebx %eax
 mov %e8 %eax
 psh %e8
 int $00
.L_ret_exit:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    sub %esp 1
    pop %ebp
    rts

trapf:
    psh %ebp
    mov %ebp %esp
    add %ebp 1
 trap
.L_ret_trapf:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    sub %esp 1
    pop %ebp
    rts

sum_n32:
    psh %ebp
    mov %ebp %esp
    add %ebp 1
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
.L_for_start_0:
    mov %ebx %ebp
    add %ebx 12
    ld %ebx %eax
        psh %eax
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
        pop %ebx
        cmp %eax %ebx
        jl .L_comp_true_1
        mov %eax 0 ; False
        jmp .L_comp_end_1
.L_comp_true_1:
        mov %eax 1 ; True
.L_comp_end_1:
        cmp %eax 0
        je .L_for_end_0
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    psh %eax
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
    mov %ebx %eax
    pop %eax
    add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 4
    sd %ebx %eax
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
    psh %eax
    mov %eax 1
    mov %ebx %eax
    pop %eax
    add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 8
    sd %ebx %eax
        jmp .L_for_start_0
.L_for_end_0:
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    jmp .L_ret_sum_n32
.L_ret_sum_n32:
    mov %esp %ebp
    sub %esp 1
    pop %ebp
    rts

sum_n16:
    psh %ebp
    mov %ebp %esp
    add %ebp 1
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
.L_for_start_2:
    mov %ebx %ebp
    add %ebx 12
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
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    psh %eax
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
    mov %ebx %eax
    pop %eax
    add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 4
    sd %ebx %eax
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
    psh %eax
    mov %eax 1
    mov %ebx %eax
    pop %eax
    add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 8
    sd %ebx %eax
        jmp .L_for_start_2
.L_for_end_2:
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    jmp .L_ret_sum_n16
.L_ret_sum_n16:
    mov %esp %ebp
    sub %esp 1
    pop %ebp
    rts

sum_char:
    psh %ebp
    mov %ebp %esp
    add %ebp 1
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
.L_for_start_4:
    mov %ebx %ebp
    add %ebx 12
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
        je .L_for_end_4
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    psh %eax
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
    mov %ebx %eax
    pop %eax
    add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 4
    sd %ebx %eax
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
    psh %eax
    mov %eax 1
    mov %ebx %eax
    pop %eax
    add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 8
    sd %ebx %eax
        jmp .L_for_start_4
.L_for_end_4:
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    jmp .L_ret_sum_char
.L_ret_sum_char:
    mov %esp %ebp
    sub %esp 1
    pop %ebp
    rts

printf:
    psh %ebp
    mov %ebp %esp
    add %ebp 1
    sub %esp 17 ; Allocate space for ALL local variables
    mov %ebx %ebp
    add %ebx 8
    ld %ebx %eax
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 4
    sd %ebx %eax
    mov %eax %ebp
    add %eax 8
    psh %eax
    mov %eax 4
    mov %ebx %eax
    pop %eax
    add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 8
    sd %ebx %eax
.L_while_start_6:
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
        jne .L_comp_true_7
        mov %eax 0 ; False
        jmp .L_comp_end_7
.L_comp_true_7:
        mov %eax 1 ; True
.L_comp_end_7:
        cmp %eax 0
        je .L_while_end_6 ; Jump to end if condition is false
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
        je .L_comp_true_9
        mov %eax 0 ; False
        jmp .L_comp_end_9
.L_comp_true_9:
        mov %eax 1 ; True
.L_comp_end_9:
        cmp %eax 0
        je .L_else_8 ; Jump to else if condition is false
        ; --- if-body ---
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    psh %eax
    mov %eax 1
    mov %ebx %eax
    pop %eax
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
        je .L_block_body_11_0
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
        je .L_block_body_11_1
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
        je .L_block_body_11_2
        jmp .L_block_body_11_3
.L_block_body_11_0:
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
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
    psh %eax
    mov %eax 4
    mov %ebx %eax
    pop %eax
    add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 8
    sd %ebx %eax
        jmp .L_match_end_10
.L_block_body_11_1:
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
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
    psh %eax
    mov %eax 4
    mov %ebx %eax
    pop %eax
    add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 8
    sd %ebx %eax
        jmp .L_match_end_10
.L_block_body_11_2:
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
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
    psh %eax
    mov %eax 4
    mov %ebx %eax
    pop %eax
    add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 8
    sd %ebx %eax
        jmp .L_match_end_10
.L_block_body_11_3:
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
.L_match_end_10:
        jmp .L_endif_8 ; End of if-body
.L_else_8:
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
.L_endif_8:
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
    psh %eax
    mov %eax 1
    mov %ebx %eax
    pop %eax
    add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 4
    sd %ebx %eax
        jmp .L_while_start_6
.L_while_end_6:
.L_ret_printf:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    sub %esp 1
    pop %ebp
    rts

wait:
    psh %ebp
    mov %ebp %esp
    add %ebp 1
    mov %ebx %ebp
    add %ebx 8
    ld %ebx %eax
 mov %e8 %eax
 mov %edx %e8
 int $22
.L_ret_wait:
    mov %eax 0 ; Default return value
    mov %esp %ebp
    sub %esp 1
    pop %ebp
    rts

getkey:
    psh %ebp
    mov %ebp %esp
    add %ebp 1
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
.L_while_start_11:
    mov %eax 0
        psh %eax
    mov %ebx %ebp
    sub %ebx 6
    mov %eax 0
    lb %ebx %eax
        pop %ebx
        cmp %eax %ebx
        je .L_comp_true_12
        mov %eax 0 ; False
        jmp .L_comp_end_12
.L_comp_true_12:
        mov %eax 1 ; True
.L_comp_end_12:
        cmp %eax 0
        je .L_while_end_11 ; Jump to end if condition is false
        ; --- while-body ---
    mov %eax 10
 psh %eax
 jsr wait
 add %esp 4
    mov %eax 0
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 8
    sw %ebx %eax
.L_for_start_13:
    mov %eax 6
        psh %eax
    mov %ebx %ebp
    sub %ebx 8
    mov %eax 0
    lw %ebx %eax
        pop %ebx
        cmp %eax %ebx
        jl .L_comp_true_14
        mov %eax 0 ; False
        jmp .L_comp_end_14
.L_comp_true_14:
        mov %eax 1 ; True
.L_comp_end_14:
        cmp %eax 0
        je .L_for_end_13
    mov %eax 4718597
    psh %eax
    mov %ebx %ebp
    sub %ebx 8
    mov %eax 0
    lw %ebx %eax
    mov %ebx %eax
    pop %eax
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
        jne .L_comp_true_16
        mov %eax 0 ; False
        jmp .L_comp_end_16
.L_comp_true_16:
        mov %eax 1 ; True
.L_comp_end_16:
        cmp %eax 0
        je .L_endif_15 ; Jump to end if condition is false
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
        jne .L_comp_true_18
        mov %eax 0 ; False
        jmp .L_comp_end_18
.L_comp_true_18:
        mov %eax 1 ; True
.L_comp_end_18:
        cmp %eax 0
        je .L_endif_17 ; Jump to end if condition is false
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
        jne .L_comp_true_20
        mov %eax 0 ; False
        jmp .L_comp_end_20
.L_comp_true_20:
        mov %eax 1 ; True
.L_comp_end_20:
        cmp %eax 0
        je .L_endif_19 ; Jump to end if condition is false
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
        jmp .L_endif_19 ; End of if-body
.L_endif_19:
        jmp .L_endif_17 ; End of if-body
.L_endif_17:
        jmp .L_endif_15 ; End of if-body
.L_endif_15:
    mov %ebx %ebp
    sub %ebx 8
    mov %eax 0
    lw %ebx %eax
    psh %eax
    mov %eax 1
    mov %ebx %eax
    pop %eax
    add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 8
    sw %ebx %eax
        jmp .L_for_start_13
.L_for_end_13:
        jmp .L_while_start_11
.L_while_end_11:
    mov %ebx %ebp
    sub %ebx 5
    mov %eax 0
    lb %ebx %eax
    jmp .L_ret_getkey
.L_ret_getkey:
    mov %esp %ebp
    sub %esp 1
    pop %ebp
    rts

is_shift_pressed:
    psh %ebp
    mov %ebp %esp
    add %ebp 1
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
.L_for_start_21:
    mov %eax 6
        psh %eax
    mov %ebx %ebp
    sub %ebx 6
    mov %eax 0
    lw %ebx %eax
        pop %ebx
        cmp %eax %ebx
        jl .L_comp_true_22
        mov %eax 0 ; False
        jmp .L_comp_end_22
.L_comp_true_22:
        mov %eax 1 ; True
.L_comp_end_22:
        cmp %eax 0
        je .L_for_end_21
    mov %eax 4718597
    psh %eax
    mov %ebx %ebp
    sub %ebx 6
    mov %eax 0
    lw %ebx %eax
    mov %ebx %eax
    pop %eax
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
        je .L_block_body_24_0
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
        je .L_block_body_24_1
        jmp .L_match_end_23
.L_block_body_24_0:
    mov %eax 1
    jmp .L_ret_is_shift_pressed
        jmp .L_match_end_23
.L_block_body_24_1:
    mov %eax 1
    jmp .L_ret_is_shift_pressed
        jmp .L_match_end_23
.L_match_end_23:
    mov %ebx %ebp
    sub %ebx 6
    mov %eax 0
    lw %ebx %eax
    psh %eax
    mov %eax 1
    mov %ebx %eax
    pop %eax
    add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 6
    sw %ebx %eax
        jmp .L_for_start_21
.L_for_end_21:
    mov %eax 0
    jmp .L_ret_is_shift_pressed
.L_ret_is_shift_pressed:
    mov %esp %ebp
    sub %esp 1
    pop %ebp
    rts

key_in_buffer:
    psh %ebp
    mov %ebp %esp
    add %ebp 1
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
.L_for_start_24:
    mov %eax 6
        psh %eax
    mov %ebx %ebp
    sub %ebx 6
    mov %eax 0
    lw %ebx %eax
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
    mov %eax 4718598
    psh %eax
    mov %ebx %ebp
    sub %ebx 6
    mov %eax 0
    lw %ebx %eax
    mov %ebx %eax
    pop %eax
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
        je .L_comp_true_27
        mov %eax 0 ; False
        jmp .L_comp_end_27
.L_comp_true_27:
        mov %eax 1 ; True
.L_comp_end_27:
        cmp %eax 0
        je .L_endif_26 ; Jump to end if condition is false
        ; --- if-body ---
    mov %eax 1
    jmp .L_ret_key_in_buffer
        jmp .L_endif_26 ; End of if-body
.L_endif_26:
    mov %ebx %ebp
    sub %ebx 6
    mov %eax 0
    lw %ebx %eax
    psh %eax
    mov %eax 1
    mov %ebx %eax
    pop %eax
    add %eax %ebx
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 6
    sw %ebx %eax
        jmp .L_for_start_24
.L_for_end_24:
    mov %eax 0
    jmp .L_ret_key_in_buffer
.L_ret_key_in_buffer:
    mov %esp %ebp
    sub %esp 1
    pop %ebp
    rts

getchar:
    psh %ebp
    mov %ebp %esp
    add %ebp 1
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
 ; --- Initialize array 'layout_chars' from __str_init_0 ---
 mov %esi %ebp
 sub %esi 59
 mov %egi __str_init_0
 mov %ecx 54
.L_strcpy_28:
 lb %egi %eax
 sb %esi %eax
 lp .L_strcpy_28
 ; --- Initialize array 'shifted_chars' from __str_init_1 ---
 mov %esi %ebp
 sub %esi 116
 mov %egi __str_init_1
 mov %ecx 54
.L_strcpy_29:
 lb %egi %eax
 sb %esi %eax
 lp .L_strcpy_29
 ; --- Initialize array 'extra' from __str_init_2 ---
 mov %esi %ebp
 sub %esi 142
 mov %egi __str_init_2
 mov %ecx 26
.L_strcpy_30:
 lb %egi %eax
 sb %esi %eax
 lp .L_strcpy_30
    mov %eax 57
        psh %eax
    mov %ebx %ebp
    sub %ebx 1
    mov %eax 0
    lb %ebx %eax
        pop %ebx
        cmp %eax %ebx
        jl .L_comp_true_32
        mov %eax 0 ; False
        jmp .L_comp_end_32
.L_comp_true_32:
        mov %eax 1 ; True
.L_comp_end_32:
        cmp %eax 0
        je .L_else_31 ; Jump to else if condition is false
        ; --- if-body ---
    mov %ebx %ebp
    sub %ebx 1
    mov %eax 0
    lb %ebx %eax
    psh %eax
    mov %eax 4
    mov %ebx %eax
    pop %eax
    sub %eax %ebx
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
        je .L_comp_true_34
        mov %eax 0 ; False
        jmp .L_comp_end_34
.L_comp_true_34:
        mov %eax 1 ; True
.L_comp_end_34:
        cmp %eax 0
        je .L_else_33 ; Jump to else if condition is false
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
        jmp .L_endif_33 ; End of if-body
.L_else_33:
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
.L_endif_33:
        jmp .L_endif_31 ; End of if-body
.L_else_31:
        ; --- else-body ---
    mov %ebx %ebp
    sub %ebx 1
    mov %eax 0
    lb %ebx %eax
    psh %eax
    mov %eax 57
    mov %ebx %eax
    pop %eax
    sub %eax %ebx
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
.L_endif_31:
    mov %ebx %ebp
    sub %ebx 2
    mov %eax 0
    lb %ebx %eax
    jmp .L_ret_getchar
.L_ret_getchar:
    mov %esp %ebp
    sub %esp 1
    pop %ebp
    rts

_start:
    psh %ebp
    mov %ebp %esp
    add %ebp 1
    sub %esp 8 ; Allocate space for ALL local variables
 jsr init_text_mode
 jsr clear_screen
    mov %eax 233
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 4
    sd %ebx %eax
    mov %eax 454
    psh %eax ; Save expression result
    pop %eax ; Восстанавливаем результат для записи
    mov %ebx %ebp
    sub %ebx 8
    sd %ebx %eax
 mov %eax __str_init_3
 psh %eax
 jsr print
 add %esp 4
    mov %ebx %ebp
    sub %ebx 8
    ld %ebx %eax
 psh %eax
    mov %ebx %ebp
    sub %ebx 4
    ld %ebx %eax
 psh %eax
 mov %eax __str_init_4
 psh %eax
 jsr printf
 jsr trapf
    hlt ; Program end

; === Data Section ===
__str_init_0: bytes "abcdefghijklmnopqrstuvwxyz1234567890" $0A $1B $7F $09 " -=[]" $5C "`';'`,./"  0
__str_init_1: bytes "ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%^&*()" $0A $1B $7F $09 " _+{}|~:" $5C $22 "~<>?"  0
__str_init_2: bytes $13 $E0 $E1 $E2 $E3 $E4 $E5 $E6 $E7 $E8 $E9 $EA $EB $14 $17 $12 $07 $C3 $C2 $FE $B4 $C1 $10 $11 $1F $1E  0
__str_init_3: bytes "test$" 0
__str_init_4: bytes "n1 : %i, n2: %i" 0

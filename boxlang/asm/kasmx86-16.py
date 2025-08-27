#!/usr/bin/python3

import sys
import re
import argparse
from typing import Dict, List, Tuple, Optional

class KasmToX86Converter:
    def __init__(self):
        self.labels = set()
        self.data_section = []
        self.code_section = []
        self.base_offset = 0x0000
        self.global_offset = None
        self.use_32bit_regs = False
        self.virtual_reg_base = 0x1000
        self.stack_depth = 0  # ### НОВОЕ: Отслеживание глубины стека
        
        # Маппинг регистров kasm -> x86
        self.reg_map_16bit = {
            'eax': 'ax', 'ebx': 'bx', 'ecx': 'cx', 'edx': 'dx',
            'esi': 'si', 'edi': 'di', 'egi': 'di', 'esp': 'sp', 'ebp': 'bp',
            'ax': 'ax', 'bx': 'bx', 'cx': 'cx', 'dx': 'dx',
            'ah': 'ah', 'al': 'al', 'bh': 'bh', 'bl': 'bl',
            'ch': 'ch', 'cl': 'cl', 'dh': 'dh', 'dl': 'dl'
        }
        
        self.reg_map_32bit = {
            'eax': 'eax', 'ebx': 'ebx', 'ecx': 'ecx', 'edx': 'edx',
            'esi': 'esi', 'egi': 'edi', 'esp': 'esp', 'ebp': 'ebp',
            'ax': 'ax', 'bx': 'bx', 'cx': 'cx', 'dx': 'dx',
            'ah': 'ah', 'al': 'al', 'bh': 'bh', 'bl': 'bl',
            'ch': 'ch', 'cl': 'cl', 'dh': 'dh', 'dl': 'dl'
        }
        
        # Виртуальные регистры %e8-%e31
        self.virtual_regs = [f'e{i}' for i in range(8, 32)]
        
    def get_reg_mapping(self, kasm_reg: str) -> str:
        """Конвертирует kasm регистр в x86 представление"""
        reg_map = self.reg_map_32bit if self.use_32bit_regs else self.reg_map_16bit
        
        if kasm_reg in reg_map:
            return reg_map[kasm_reg]
        elif kasm_reg in self.virtual_regs:
            # ### ИСПРАВЛЕНИЕ: Возвращаем специальный маркер для виртуальных регистров
            reg_idx = int(kasm_reg[1:]) - 8
            offset = reg_idx * (4 if self.use_32bit_regs else 2)
            return f'VREG:{offset}'  # Специальный маркер для последующей обработки
        else:
            return kasm_reg
    
    def load_virtual_reg_address(self, vreg_spec: str) -> List[str]:
        """
        ### НОВОЕ: Загружает адрес виртуального регистра в di с правильной 16-битной адресацией
        """
        if not vreg_spec.startswith('VREG:'):
            return []
        
        offset = int(vreg_spec[5:])
        result = []
        
        if offset == 0:
            # Базовый адрес virtual_regs
            result.append("    mov di, virtual_regs")
        else:
            # Базовый адрес + смещение
            result.append("    mov di, virtual_regs")
            result.append(f"    add di, {offset}")
        
        return result
    
    def get_safe_temp_reg(self) -> str:
        """### НОВОЕ: Возвращает безопасный временный регистр"""
        return 'di'  # Используем di как основной временный регистр
    
    def add_stack_protection(self, instruction: str) -> List[str]:
        """### НОВОЕ: Добавляет защиту стека для критических операций"""
        result = []
        
        if instruction in ['push', 'psh']:
            self.stack_depth += 1
            if self.stack_depth > 10:  # Защита от переполнения стека
                result.append("    ; WARNING: Deep stack usage detected")
        elif instruction in ['pop', 'ret', 'rts']:
            if self.stack_depth > 0:
                self.stack_depth -= 1
        
        return result

    def get_byte_reg(self, reg: str) -> str:
        # si/di не имеют 8-битных имён; для словарных ax/bx/cx/dx — их низкие байты
        low8_map = {'ax':'al','bx':'bl','cx':'cl','dx':'dl'}
        if reg in low8_map:
            return low8_map[reg]
        # если пришёл 8-битный (al/bl/cl/dl/ah/bh/ch/dh) — вернуть как есть
        if reg in ['al','ah','bl','bh','cl','ch','dl','dh']:
            return reg
        # для иных (si/di/sp/bp/виртуальные) — требуйте явную загрузку байта через AL выше по коду
        return 'al'  # безопасное значение-умолчание, но лучше не попадать сюда
    
    def parse_operand(self, operand: str) -> str:
        """Парсит операнд и конвертирует его"""
        operand = operand.strip()
        
        if ';' in operand:
            operand = operand.split(';')[0].strip()
        
        # Если операнд пустой после обработки комментария, возвращаем пустую строку
        if not operand:
            return ""
        
        if operand.startswith('$'):
            hex_part = operand[1:]
            try:
                hex_value = int(hex_part, 16)
                return f"0x{hex_value:02X}" if hex_value < 256 else f"0x{hex_value:04X}"
            except ValueError:
                return operand
        
        if operand.startswith('%'):
            reg_name = operand[1:]
            return self.get_reg_mapping(reg_name)
        
        if operand.startswith('0x'):
            return operand
        
        if operand.replace('_', '').replace('.', '').isalnum():
            return operand
            
        return operand
    
    def process_directive(self, line: str) -> str:
        """Обрабатывает специальные директивы"""
        line = line.strip()
        
        if line.startswith('reg32'):
            return "; Using 32-bit registers"
        elif line.startswith('reg16'):
            return "; Using 16-bit registers"
        elif line.startswith('org ') or line.startswith('ORG '):
            offset = line.split()[1]
            self.base_offset = int(offset, 16) if offset.startswith('0x') else int(offset)
            return f"ORG {offset}"
        elif line.startswith('gorg ') or line.startswith('GORG '):
            offset = line.split()[1]
            return f"; Global offset set to {offset}"
        
        return line
    
    def convert_mov(self, parts: List[str]) -> List[str]:
        """Конвертирует инструкцию mov с учетом размеров регистров и виртуальных регистров"""
        if len(parts) < 3:
            return [f"; ERROR: Invalid mov instruction: {' '.join(parts)}"]

        dst = self.parse_operand(parts[1])
        src = self.parse_operand(parts[2])

        result = []

        def get_reg_size(reg_name: str) -> int:
            """Возвращает размер регистра: 1=byte, 2=word, 4=dword; для памяти/иммов возвращаем 0"""
            if reg_name in ['al', 'ah', 'bl', 'bh', 'cl', 'ch', 'dl', 'dh']:
                return 1
            elif reg_name in ['ax', 'bx', 'cx', 'dx', 'si', 'di', 'sp', 'bp']:
                return 2
            elif reg_name in ['eax', 'ebx', 'ecx', 'edx', 'esi', 'edi', 'esp', 'ebp']:
                return 4
            # для памяти/иммов/меток — 0 (размер берём из второго операнда или оставляем NASM решать)
            return 0

        def get_size_prefix(size: int) -> str:
            return {1: 'byte', 2: 'word', 4: 'dword'}.get(size, 'word')

        dst_is_virtual = isinstance(dst, str) and dst.startswith('VREG:')
        src_is_virtual = isinstance(src, str) and src.startswith('VREG:')

        # Виртуальный регистр → обычный регистр
        if src_is_virtual and not dst_is_virtual:
            dst_size = get_reg_size(dst) or (4 if self.use_32bit_regs else 2)
            size_prefix = get_size_prefix(dst_size)
            result.extend(self.load_virtual_reg_address(src))
            result.append(f" mov {dst}, {size_prefix} [di]")
            return result

        # Обычный регистр → виртуальный регистр
        if dst_is_virtual and not src_is_virtual:
            src_size = get_reg_size(src) or (4 if self.use_32bit_regs else 2)
            size_prefix = get_size_prefix(src_size)
            result.extend(self.load_virtual_reg_address(dst))
            result.append(f" mov {size_prefix} [di], {src}")
            return result

        # Виртуальный -> виртуальный (копия через временный регистр)
        if dst_is_virtual and src_is_virtual:
            result.extend(self.load_virtual_reg_address(src))
            # используем CX как временный (размер 16 бит в 16-битной цели)
            if self.use_32bit_regs:
                result.append(" mov ecx, dword [di]")
            else:
                result.append(" mov cx, word [di]")
            result.extend(self.load_virtual_reg_address(dst))
            if self.use_32bit_regs:
                result.append(" mov dword [di], ecx")
            else:
                result.append(" mov word [di], cx")
            return result

        # НОРМАЛЬНЫЙ mov между невиртуальными операндами, но контролируем размеры:
        dst_size = get_reg_size(dst)
        src_size = get_reg_size(src)

        # Запретить r8 <- r16 напрямую (например, bl <- si). Исправить на использование низкого байта.
        if dst_size == 1 and src_size == 2:
            # У 16-битных регистров есть 8-битный только у AX/BX/CX/DX
            low8_map = {'ax': 'al', 'bx': 'bl', 'cx': 'cl', 'dx': 'dl'}
            if src in low8_map:
                result.append(f" mov {dst}, {low8_map[src]}")
            else:
                # У SI/DI/BP/SP нет 8-битных версий — ожидаем, что нужный байт уже в AL,
                # либо его загрузят заранее (например, через 'xor ax,ax' + 'mov al, [mem]').
                # Чтобы не падать, сделаем безопасную копию через AL:
                # Если целевой r8 не AL, то копируем AL -> dst
                if dst != 'al':
                    result.append(f" mov {dst}, al")
                else:
                    # mov al, si нельзя — оставляем как комментарий подсказку
                    result.append(" ; WARN: cannot move byte from SI directly; expected AL already holds low byte")
            return result

        # Разрешить r16 <- r8, r16 <- r16, r8 <- r8, r32 в 16-битной цели мы не используем.
        # В остальных случаях просто выдать mov как есть.
        result.append(f" mov {dst}, {src}")
        return result
    
    def convert_arithmetic(self, instruction: str, parts: List[str]) -> List[str]:
        """Конвертирует арифметические инструкции"""
        if len(parts) < 3:
            return [f"; ERROR: Invalid {instruction} instruction: {' '.join(parts)}"]
        
        dst = self.parse_operand(parts[1])
        src = self.parse_operand(parts[2])
        
        result = []
        
        if instruction == 'mul':
            if self.use_32bit_regs:
                result.append(f"    mov eax, {dst}")
                result.append(f"    imul eax, {src}")
                result.append(f"    mov {dst}, eax")
            else:
                result.append(f"    mov ax, {dst}")
                result.append(f"    imul ax, {src}")
                result.append(f"    mov {dst}, ax")
        elif instruction == 'div':
            if self.use_32bit_regs:
                result.append(f"    mov eax, {dst}")
                result.append(f"    xor edx, edx")
                result.append(f"    idiv {src}")
                result.append(f"    mov {dst}, eax")
            else:
                result.append(f"    mov ax, {dst}")
                result.append(f"    xor dx, dx")
                result.append(f"    idiv {src}")
                result.append(f"    mov {dst}, ax")
        else:
            # add, sub и другие
            if dst.startswith('VREG:'):
                result.extend(self.load_virtual_reg_address(dst))
                result.append(f"    {instruction} word [di], {src}")
            else:
                result.append(f"    {instruction} {dst}, {src}")
        
        return result
    
    def convert_stack_ops(self, instruction: str, parts: List[str]) -> List[str]:
        """### ИСПРАВЛЕННЫЙ: Конвертирует операции со стеком с защитой"""
        if len(parts) < 2:
            return [f"; ERROR: Invalid stack instruction: {' '.join(parts)}"]
        
        operand = self.parse_operand(parts[1])
        result = []
        
        # Добавляем защиту стека
        result.extend(self.add_stack_protection(instruction))
        
        if instruction == 'psh':
            if operand.startswith('VREG:'):
                result.extend(self.load_virtual_reg_address(operand))
                result.append(f"    push word [di]")
            else:
                result.append(f"    push {operand}")
        elif instruction == 'pop':
            if operand.startswith('VREG:'):
                temp_reg = "ax"
                result.append(f"    pop {temp_reg}")
                result.extend(self.load_virtual_reg_address(operand))
                result.append(f"    mov word [di], {temp_reg}")
            else:
                result.append(f"    pop {operand}")
        
        return result
    
    def convert_memory_ops(self, instruction: str, parts: List[str]) -> List[str]:
        """Полностью исправленный: конвертирует lb/lw/ld и sb/sw/sd с корректной 16-битной семантикой"""
        if len(parts) < 3:
            return [f"; ERROR: Invalid memory instruction: {' '.join(parts)}"]

        addr_reg = self.parse_operand(parts[1])
        data_reg = self.parse_operand(parts[2])

        result = []

        def is_vreg(x: str) -> bool:
            return isinstance(x, str) and x.startswith('VREG:')

        def byte_reg_of(reg: str) -> str:
            # Возвращает нижний байт 16-битного регистра, если возможно
            low8_map = {'ax': 'al', 'bx': 'bl', 'cx': 'cl', 'dx': 'dl'}
            if reg in low8_map:
                return low8_map[reg]
            # Если пришёл уже 8-битный (al/bl/cl/dl/ah/bh/ch/dh), вернуть как есть
            if reg in ['al', 'ah', 'bl', 'bh', 'cl', 'ch', 'dl', 'dh']:
                return reg
            # Для si/di/bp/sp — нет 8-битных имён. Будем работать через AL на месте вызова.
            return 'al'

        # Загрузка: lb/lw/ld
        if instruction in ['lb', 'lw', 'ld']:

            if instruction == 'lb':
                # грузим байт в AL, нулевое расширение через AX (без movzx)
                if data_reg == 'al':
                    result.append(" xor ax, ax")  # Только если целевой регистр AL
                if is_vreg(addr_reg):
                    result.extend(self.load_virtual_reg_address(addr_reg))
                    result.append(" mov si, word [di]")
                    result.append(f" mov {data_reg}, [si]")
                else:
                    result.append(f" mov {data_reg}, [{addr_reg}]")

                # распаковываем в data_reg
                if is_vreg(data_reg):
                    result.extend(self.load_virtual_reg_address(data_reg))
                    result.append(" mov [di], al")
                else:
                    # если принимающий — 16-битный регистр, то переносим через AX
                    if data_reg in ['ax', 'bx', 'cx', 'dx', 'si', 'di', 'bp', 'sp']:
                        result.append(f" mov {data_reg}, ax")
                    else:
                        # если 8-битный — прямой mov
                        result.append(f" mov {data_reg}, al")

            elif instruction == 'lw':
                # грузим слово (16 бит)
                if is_vreg(addr_reg):
                    result.extend(self.load_virtual_reg_address(addr_reg))
                    result.append(" mov si, word [di] ; Загружаем адрес")
                    if is_vreg(data_reg):
                        result.append(" mov cx, word [si]")
                        result.extend(self.load_virtual_reg_address(data_reg))
                        result.append(" mov word [di], cx")
                    else:
                        result.append(f" mov {data_reg}, word [si]")
                else:
                    if is_vreg(data_reg):
                        result.append(f" mov cx, word [{addr_reg}]")
                        result.extend(self.load_virtual_reg_address(data_reg))
                        result.append(" mov word [di], cx")
                    else:
                        result.append(f" mov {data_reg}, word [{addr_reg}]")

            else:  # ld
                # в 16-битной цели трактуем как загрузку слова (если не используем 32-битные регистры)
                if is_vreg(addr_reg):
                    result.extend(self.load_virtual_reg_address(addr_reg))
                    result.append(" mov si, word [di] ; Загружаем адрес")
                    if self.use_32bit_regs:
                        result.append(f" mov {data_reg}, dword [si]")
                    else:
                        if is_vreg(data_reg):
                            result.append(" mov cx, word [si]")
                            result.extend(self.load_virtual_reg_address(data_reg))
                            result.append(" mov word [di], cx")
                        else:
                            result.append(f" mov {data_reg}, word [si]")
                else:
                    if self.use_32bit_regs:
                        result.append(f" mov {data_reg}, dword [{addr_reg}]")
                    else:
                        if is_vreg(data_reg):
                            result.append(f" mov cx, word [{addr_reg}]")
                            result.extend(self.load_virtual_reg_address(data_reg))
                            result.append(" mov word [di], cx")
                        else:
                            result.append(f" mov {data_reg}, word [{addr_reg}]")

            return result

        # Сохранение: sb/sw/sd
        if instruction in ['sb', 'sw', 'sd']:

            if instruction == 'sb':
                # пишем один байт
                if is_vreg(addr_reg):
                    result.extend(self.load_virtual_reg_address(addr_reg))
                    result.append(" mov si, word [di] ; Загружаем адрес")
                    if is_vreg(data_reg):
                        result.append(" push si")
                        result.extend(self.load_virtual_reg_address(data_reg))
                        result.append(" mov al, [di]")
                        result.append(" pop si")
                        result.append(" mov [si], al")
                    else:
                        low8 = byte_reg_of(data_reg)
                        result.append(f" mov [si], {low8}")
                else:
                    if is_vreg(data_reg):
                        result.extend(self.load_virtual_reg_address(data_reg))
                        result.append(" mov al, [di]")
                        result.append(f" mov [{addr_reg}], al")
                    else:
                        low8 = byte_reg_of(data_reg)
                        result.append(f" mov [{addr_reg}], {low8}")

            elif instruction == 'sw':
                # пишем слово (16 бит)
                if is_vreg(addr_reg):
                    result.extend(self.load_virtual_reg_address(addr_reg))
                    result.append(" mov si, word [di] ; Загружаем адрес")
                    if is_vreg(data_reg):
                        result.append(" push si")
                        result.extend(self.load_virtual_reg_address(data_reg))
                        result.append(" mov cx, word [di]")
                        result.append(" pop si")
                        result.append(" mov word [si], cx")
                    else:
                        result.append(f" mov word [si], {data_reg}")
                else:
                    if is_vreg(data_reg):
                        result.extend(self.load_virtual_reg_address(data_reg))
                        result.append(" mov cx, word [di]")
                        result.append(f" mov word [{addr_reg}], cx")
                    else:
                        result.append(f" mov word [{addr_reg}], {data_reg}")

            else:  # sd
                # в 16-битной цели трактуем как запись слова (если не используем 32-битные регистры)
                if is_vreg(addr_reg):
                    result.extend(self.load_virtual_reg_address(addr_reg))
                    result.append(" mov si, word [di] ; Загружаем адрес")
                    if self.use_32bit_regs:
                        result.append(f" mov dword [si], {data_reg}")
                    else:
                        if is_vreg(data_reg):
                            result.append(" push si")
                            result.extend(self.load_virtual_reg_address(data_reg))
                            result.append(" mov cx, word [di]")
                            result.append(" pop si")
                            result.append(" mov word [si], cx")
                        else:
                            result.append(f" mov word [si], {data_reg}")
                else:
                    if self.use_32bit_regs:
                        result.append(f" mov dword [{addr_reg}], {data_reg}")
                    else:
                        if is_vreg(data_reg):
                            result.extend(self.load_virtual_reg_address(data_reg))
                            result.append(" mov cx, word [di]")
                            result.append(f" mov word [{addr_reg}], cx")
                        else:
                            result.append(f" mov word [{addr_reg}], {data_reg}")

            return result

        return [f"; ERROR: Unknown memory instruction: {instruction}"]
    
    def convert_jump(self, instruction: str, parts: List[str]) -> List[str]:
        """Конвертирует инструкции прыжков"""
        if len(parts) < 2:
            return [f"; ERROR: Invalid jump instruction: {' '.join(parts)}"]
        
        target = self.parse_operand(parts[1])
        
        jump_map = {
            'jmp': 'jmp', 'je': 'je', 'jne': 'jne', 'jz': 'je', 'jnz': 'jne',
            'jg': 'jg', 'jl': 'jl', 'jc': 'jc', 'jnc': 'jnc',
            'js': 'js', 'jn': 'jns', 'ji': 'jo', 'jni': 'jno'
        }
        
        x86_jump = jump_map.get(instruction, instruction)
        return [f"    {x86_jump} {target}"]
    
    def convert_reserve(self, parts: List[str]) -> List[str]:
        """Конвертирует директиву reserve правильно"""
        if len(parts) < 3:
            return [f"; ERROR: Invalid reserve directive: {' '.join(parts)}"]
        
        try:
            size = int(parts[1])
            unit = parts[2]
            
            if unit == 'bytes':
                return [f"    times {size} db 0"]
            elif unit == 'words':
                return [f"    times {size} dw 0"]
            elif unit == 'dwords':
                return [f"    times {size} dd 0"]
            else:
                return [f"    times {size} db 0"]
        except (ValueError, IndexError):
            return [f"; ERROR: Cannot parse reserve directive: {' '.join(parts)}"]
    
    def convert_instruction(self, line: str) -> List[str]:
        """Конвертирует одну инструкцию"""
        line = line.strip()
        
        if not line or line.startswith(';'):
            return [line]
        
        directive_result = self.process_directive(line)
        if directive_result != line:
            return [directive_result]
        
        if line.endswith(':'):
            label = line[:-1]
            self.labels.add(label)
            return [f"{label}:"]
        
        # Reserve директива
        if ': reserve ' in line:
            label_part, reserve_part = line.split(':', 1)
            label = label_part.strip()
            reserve_parts = reserve_part.strip().split()
            result = [f"{label}:"]
            result.extend(self.convert_reserve(reserve_parts))
            return result
        elif line.startswith('reserve '):
            parts = line.split()
            return self.convert_reserve(parts)
        
        # Bytes директива
        if ': bytes ' in line:
            label_part, bytes_part = line.split(':', 1)
            label = label_part.strip()
            bytes_content = bytes_part.replace('bytes ', '').strip()
            result = [f"{label}:"]
            
            if bytes_content.startswith('"') and bytes_content.endswith(' 0'):
                string_part = bytes_content[:-2]
                result.append(f"    db {string_part}, 0")
            else:
                result.append(f"    db {bytes_content}")
            
            return result
        
        # Разбираем инструкцию
        parts = line.split()
        if not parts:
            return [line]
        
        instruction = parts[0].lower()

        if line.startswith('lp '):
            target = line.split(None, 1)[1].strip()
            if self.use_32bit_regs:
                return [ " inc esi", " inc edi", " dec ecx", f" jnz {target}" ]
            else:
                return [ " inc si", " inc di", " dec cx", f" jnz {target}" ]
        
        # Конвертируем основные инструкции
        if instruction == 'mov':
            return self.convert_mov(parts)
        elif instruction in ['add', 'sub', 'mul', 'and', 'or', 'xor']:
            return self.convert_arithmetic(instruction, parts)
        elif instruction == 'div':
            if len(parts) >= 3:
                # div dst src - разделить dst на src
                dst = self.parse_operand(parts[1])
                src = self.parse_operand(parts[2])
                if self.use_32bit_regs:
                    result = []
                    result.append(f"    mov eax, {dst}")
                    result.append(f"    xor edx, edx")
                    result.append(f"    idiv {src}")
                    result.append(f"    mov {dst}, eax")
                    return result
                else:
                    result = []
                    result.append(f"    mov ax, {dst}")
                    result.append(f"    xor dx, dx")
                    result.append(f"    idiv {src}")
                    result.append(f"    mov {dst}, ax")
                    return result
            elif len(parts) >= 2:
                # div src - разделить AX на src (KASM: div %ecx означает AX / %ecx)
                print(f"DEBUG: div parts={parts}, parts[1]='{parts[1]}'")
                src = self.parse_operand(parts[1])
                print(f"DEBUG: parsed src='{src}'")
                if not src:  # Если src пустой, это div без операнда
                    if self.use_32bit_regs:
                        return [f"    xor edx, edx", f"    idiv eax"]
                    else:
                        return [f"    xor dx, dx", f"    idiv ax"]
                if self.use_32bit_regs:
                    result = []
                    result.append(f"    xor edx, edx")
                    result.append(f"    idiv {src}")
                    return result
                else:
                    result = []
                    result.append(f"    xor dx, dx")
                    result.append(f"    idiv {src}")
                    return result
            else:
                # div без операнда - деление на регистр в AX
                if self.use_32bit_regs:
                    return [f"    xor edx, edx", f"    idiv eax"]
                else:
                    return [f"    xor dx, dx", f"    idiv ax"]
        elif instruction == 'idiv':
            if len(parts) >= 2:
                operand = self.parse_operand(parts[1])
                return [f"    idiv {operand}"]
            else:
                # idiv без операнда означает деление на регистр в AX
                return [f"    idiv ax"]
        elif instruction == 'inx':
            if len(parts) >= 2:
                operand = self.parse_operand(parts[1])
                return [f"    inc {operand}"]
        elif instruction == 'dex':
            if len(parts) >= 2:
                operand = self.parse_operand(parts[1])
                return [f"    dec {operand}"]
        elif instruction == 'cmp':
            if len(parts) >= 3:
                dst = self.parse_operand(parts[1])
                src = self.parse_operand(parts[2])
                return [f"    cmp {dst}, {src}"]
        elif instruction in ['jmp', 'je', 'jne', 'jz', 'jnz', 'jg', 'jl', 'jc', 'jnc', 'js', 'jn', 'ji', 'jni']:
            return self.convert_jump(instruction, parts)
        elif instruction in ['psh', 'pop']:
            return self.convert_stack_ops(instruction, parts)
        elif instruction in ['lb', 'lw', 'ld', 'sb', 'sw', 'sd']:
            return self.convert_memory_ops(instruction, parts)
        elif instruction == 'hlt':
            return ["    hlt"]
        elif instruction == 'nop':
            return ["    nop"]
        elif instruction == 'int':
            if len(parts) >= 2:
                operand = self.parse_operand(parts[1])
                return [f"    int {operand}"]
        elif instruction == 'rts':
            self.add_stack_protection('ret')
            return ["    ret"]
        elif instruction == 'jsr':
            if len(parts) >= 2:
                target = self.parse_operand(parts[1])
                return [f"    call {target}"]
        elif instruction == 'ret':
            self.add_stack_protection('ret')
            return ["    ret"]
        else:
            return [f"    ; TODO: Convert {line}"]
        
        return [line]
    
    def generate_header(self) -> List[str]:
        """Генерирует заголовок nasm файла"""
        header = []
        
        if self.use_32bit_regs:
            header.append("BITS 32")
        else:
            header.append("BITS 16")
        
        offset_to_use = self.global_offset if self.global_offset is not None else self.base_offset
        if offset_to_use != 0:
            header.append(f"ORG 0x{offset_to_use:04X}")
        
        header.extend([
            "",
            "section .text",
            ""
        ])
        
        return header
    
    def generate_virtual_regs_data(self) -> List[str]:
        """Генерирует секцию данных для виртуальных регистров"""
        data = [
            "",
            f"; Виртуальные регистры %e8-%e31"
        ]
        
        if self.use_32bit_regs:
            data.append(f"virtual_regs: times 24 dd 0  ; Виртуальные регистры %e8-%e31 (32-bit)")
        else:
            data.append(f"virtual_regs: times 24 dw 0  ; Виртуальные регистры %e8-%e31 (16-bit)")
        
        return data
    
    def convert_file(self, input_file: str, output_file: str, offset: int = 0):
        """Конвертирует kasm файл в nasm файл"""
        self.base_offset = offset
        
        try:
            with open(input_file, 'r', encoding='utf-8') as f:
                lines = f.readlines()
        except FileNotFoundError:
            print(f"Error: Input file '{input_file}' not found")
            return
        
        # Предварительный проход для поиска директив GORG и REG32/REG16
        for line in lines:
            line = line.strip()
            if line.startswith('gorg ') or line.startswith('GORG '):
                offset_str = line.split()[1]
                self.global_offset = int(offset_str, 16) if offset_str.startswith('0x') else int(offset_str)
            elif line.startswith('reg32'):
                self.use_32bit_regs = True
            elif line.startswith('reg16'):
                self.use_32bit_regs = False
        
        # Генерируем заголовок ПОСЛЕ обработки всех директив
        output_lines = self.generate_header()
        
        # Конвертируем каждую строку
        for line in lines:
            converted = self.convert_instruction(line)
            output_lines.extend(converted)
        
        # Добавляем секцию данных для виртуальных регистров
        output_lines.extend(self.generate_virtual_regs_data())
        
        # Записываем результат
        try:
            with open(output_file, 'w', encoding='utf-8') as f:
                f.write('\n'.join(output_lines))
            print(f"Conversion completed: {input_file} -> {output_file}")
            print(f"Using {'32-bit' if self.use_32bit_regs else '16-bit'} registers")
            print(f"Max stack depth: {self.stack_depth}")
            if self.global_offset is not None:
                print(f"Global offset (GORG): 0x{self.global_offset:04X}")
            elif self.base_offset != 0:
                print(f"Base offset: 0x{self.base_offset:04X}")
        except Exception as e:
            print(f"Error writing output file: {e}")


def main():
    parser = argparse.ArgumentParser(description='Convert KASM assembly to x86-16/32 NASM assembly')
    parser.add_argument('input_file', help='Input KASM assembly file')
    parser.add_argument('output_file', help='Output NASM assembly file')
    parser.add_argument('-o', '--offset', type=str, default='0', 
                      help='Base offset for code (hex or decimal, e.g., 0x1000 or 4096)')
    parser.add_argument('--reg32', action='store_true', 
                      help='Use 32-bit registers instead of 16-bit')
    
    args = parser.parse_args()
    
    # Парсим offset
    offset = 0
    if args.offset.startswith('0x'):
        offset = int(args.offset, 16)
    else:
        offset = int(args.offset)
    
    converter = KasmToX86Converter()
    if args.reg32:
        converter.use_32bit_regs = True
    
    converter.convert_file(args.input_file, args.output_file, offset)


if __name__ == "__main__":
    main()

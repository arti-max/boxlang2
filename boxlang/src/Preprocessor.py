#!/usr/bin/python3

import os
import re
from typing import Set

class Preprocessor:
    def __init__(self, base_dir: str = ".", std_dir: str = "boxlang/std"):
        self.base_dir = base_dir
        self.std_dir = std_dir
        self.processed_files: Set[str] = set()
        self.library_code = ""

    def process_file(self, filepath: str) -> str:
        """Обрабатывает файл, рекурсивно вставляя содержимое @incl."""
        abs_path = os.path.abspath(filepath)
        if abs_path in self.processed_files:
            return "" # Защита от циклических включений

        self.processed_files.add(abs_path)
        
        try:
            with open(filepath, 'r', encoding='utf-8') as f:
                content = f.read()
        except FileNotFoundError:
            raise FileNotFoundError(f"Файл не найден: {filepath}")
        
        incl_pattern = r'@incl\s+([<"])(.*?)[>"]'
        
        def replace_incl(match):
            bracket_type = match.group(1)
            lib_name = match.group(2)
            
            if bracket_type == '<':
                # Стандартная библиотека, путь относительно std_dir
                target_path = os.path.join(self.std_dir, lib_name)
                # Проверяем наличие .asm, если файл не найден
                if not os.path.exists(target_path):
                    if os.path.exists(target_path + '.asm'):
                        target_path += '.asm'
                    elif os.path.exists(target_path + '.box'):
                        target_path += '.box'
                    else:
                        raise FileNotFoundError(f"Стандартная библиотека не найдена: {lib_name}")
            else:
                # Пользовательский файл, путь относительно текущего файла
                current_dir = os.path.dirname(filepath)
                target_path = os.path.join(current_dir, lib_name)

            if not os.path.exists(target_path):
                 raise FileNotFoundError(f"Файл для включения не найден: {lib_name} (по пути {target_path})")

            # --- ИСПРАВЛЕННАЯ ЛОГИКА ---
            if target_path.endswith('.asm'):
                # .asm-файлы добавляются в отдельный буфер с кодом библиотек
                with open(target_path, 'r', encoding='utf-8') as f:
                    self.library_code += f.read() + "\n"
                # Директиву @incl нужно просто убрать из кода
                return ""
            else:
                # .box-файлы (или любые другие) вставляются прямо в код.
                # Рекурсивно обрабатываем их, чтобы обработать вложенные @incl.
                return self.process_file(target_path)
        
        # Заменяем все @incl директивы
        processed_content = re.sub(incl_pattern, replace_incl, content)
        
        return processed_content
    
    def get_library_code(self):
        """Возвращает накопленный код библиотек."""
        return self.library_code

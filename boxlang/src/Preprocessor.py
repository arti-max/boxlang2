# boxlang/src/Preprocessor.py

import os
import re
from typing import Set, Dict

class Preprocessor:
    def __init__(self, base_dir: str = ".", std_dir: str = "boxlang/std"):
        self.base_dir = base_dir
        self.std_dir = std_dir
        self.processed_files: Set[str] = set()
        self.library_code = ""  # Накапливаем код библиотек отдельно
        
    def process_file(self, filepath: str) -> str:
        """Обрабатывает файл и возвращает только BoxLang код"""
        abs_path = os.path.abspath(filepath)
        if abs_path in self.processed_files:
            return ""
        
        self.processed_files.add(abs_path)
        
        try:
            with open(filepath, 'r', encoding='utf-8') as f:
                content = f.read()
        except FileNotFoundError:
            raise FileNotFoundError(f"Файл не найден: {filepath}")
        
        # Ищем директивы @incl
        incl_pattern = r'@incl\s+([<"])(.*?)[>"]'
        
        def replace_incl(match):
            bracket_type = match.group(1)
            lib_name = match.group(2)
            
            if bracket_type == '<':
                # Встроенная библиотека
                target_path = os.path.join(self.std_dir, lib_name)
                if not os.path.exists(target_path):
                    if os.path.exists(target_path + '.asm'):
                        target_path += '.asm'
                    else:
                        raise FileNotFoundError(f"Библиотека не найдена: {lib_name}")
            else:
                # Пользовательский файл
                current_dir = os.path.dirname(filepath)
                target_path = os.path.join(current_dir, lib_name)
            
            # Читаем файл и добавляем в библиотеки
            with open(target_path, 'r', encoding='utf-8') as f:
                lib_content = f.read()
                
            # Для .asm файлов просто добавляем в library_code
            if target_path.endswith('.asm'):
                self.library_code += lib_content + "\n"
            
            # Убираем @incl из основного кода
            return ""
        
        # Заменяем все @incl на пустые строки
        processed_content = re.sub(incl_pattern, replace_incl, content)
        
        return processed_content
    
    def get_library_code(self):
        """Возвращает накопленный код библиотек"""
        return self.library_code

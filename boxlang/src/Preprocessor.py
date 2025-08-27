# src/Preprocessor.py

import os
import re
from typing import Set, List, Tuple

class Preprocessor:
    def __init__(self, base_dir: str = ".", std_dir: str = "boxlang/std"):
        self.base_dir = os.path.abspath(base_dir)
        self.std_dir = os.path.abspath(std_dir)
        self.processed_files: Set[str] = set()
        self.library_code = ""
        # ### НОВОЕ: Флаг битности архитектуры ###
        self.target_bits = 32  # По умолчанию 32-бит для обратной совместимости

    def process_file(self, filepath: str) -> List[Tuple[str, int, str]]:
        """
        Обрабатывает файл и возвращает список кортежей (имя_файла, номер_строки, содержимое_строки).
        Директивы @incl и @bits обрабатываются и заменяются содержимым файлов или удаляются.
        """
        abs_path = os.path.abspath(filepath)
        if abs_path in self.processed_files:
            return [] # Защита от циклических включений

        self.processed_files.add(abs_path)

        try:
            with open(filepath, 'r', encoding='utf-8') as f:
                lines = f.readlines()
        except FileNotFoundError:
            raise FileNotFoundError(f"Файл для препроцессора не найден: {filepath}")

        output_lines = []

        # Паттерны для поиска директив
        incl_pattern = re.compile(r'^\s*@incl\s+(<|")(.*?)(>|")')
        bits_pattern = re.compile(r'^\s*@bits\s+(\d+)')  # ### НОВЫЙ ПАТТЕРН
        kasmf_pattern = re.compile(r'^\s*@kasmf\s+(\d+)')
        define_pattern = re.compile(r'^\s*@define\s+(\w+)\s+(.+?)(?:\s*##.*)?$')
        
        if not hasattr(self, 'defines'):
            self.defines = {}

        for line_num, line_content in enumerate(lines, 1):
            # ### НОВОЕ: Обработка @bits ###
            kasmf_match = kasmf_pattern.search(line_content)
            if kasmf_match:
                kasmf_version = int(kasmf_match.group(1))
                if kasmf_version not in [1, 2]:
                    raise ValueError(f"Директива @kasmf поддерживает только версии 1 или 2. Получено: {kasmf_version}")
                
                self.kasmf_version = kasmf_version
                print(f"Preprocessor: Установлена версия kasmf: {kasmf_version}")
                continue
            
            bits_match = bits_pattern.search(line_content)
            if bits_match:
                bits_value = int(bits_match.group(1))
                if bits_value not in [16, 32]:
                    raise ValueError(f"Директива @bits поддерживает только 16 или 32 бита. Получено: {bits_value}")
                self.target_bits = bits_value
                print(f"Preprocessor: Установлена битность архитектуры: {bits_value}-bit")
                # Директиву @bits НЕ добавляем в вывод, она обрабатывается только препроцессором
                continue
            
            
            define_match = define_pattern.search(line_content)
            if define_match:
                define_name = define_match.group(1)
                define_value = define_match.group(2).strip()
                self.defines[define_name] = define_value
                print(f"Preprocessor: Defined {define_name} = {define_value}")
                continue

            # Обработка @incl (без изменений)
            incl_match = incl_pattern.search(line_content)
            if incl_match:
                bracket_type = incl_match.group(1)
                lib_name = incl_match.group(2)
                
                if bracket_type == '<':
                    target_path = os.path.join(self.std_dir, lib_name + '.box')
                else:
                    current_dir = os.path.dirname(abs_path)
                    target_path = os.path.join(current_dir, lib_name)

                if not os.path.exists(target_path):
                    raise FileNotFoundError(f"Файл для включения '{lib_name}' не найден. Ожидался по пути: {target_path}")

                included_lines = self.process_file(target_path)
                output_lines.extend(included_lines)
            else:
                # Обычная строка
                processed_line = line_content
                for define_name, define_value in self.defines.items():
                    # Заменяем только целые слова (не части других слов)
                    processed_line = re.sub(r'\b' + re.escape(define_name) + r'\b', 
                                    define_value, processed_line)
                
                output_lines.append((filepath, line_num, processed_line))

        return output_lines

    def get_target_bits(self) -> int:
        """### НОВЫЙ МЕТОД: Возвращает целевую битность архитектуры"""
        return self.target_bits

    def get_library_code(self) -> str:
        """Возвращает накопленный ассемблерный код из библиотек (если будет)."""
        return self.library_code
    
    def get_kasmf_version(self) -> int:
        """### НОВЫЙ МЕТОД: Возвращает версию kasmf (1 или 2)"""
        return getattr(self, 'kasmf_version', 1)

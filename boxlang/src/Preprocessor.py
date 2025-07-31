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

    def process_file(self, filepath: str) -> List[Tuple[str, int, str]]:
        """
        Обрабатывает файл и возвращает список кортежей (имя_файла, номер_строки, содержимое_строки).
        Директивы @incl рекурсивно обрабатываются и заменяются содержимым файлов.
        """
        abs_path = os.path.abspath(filepath)
        if abs_path in self.processed_files:
            return []  # Защита от циклических включений

        self.processed_files.add(abs_path)
        
        try:
            with open(filepath, 'r', encoding='utf-8') as f:
                lines = f.readlines()
        except FileNotFoundError:
            raise FileNotFoundError(f"Файл для препроцессора не найден: {filepath}")

        output_lines = []
        # Паттерн для поиска @incl <lib> или @incl "file" в начале строки
        incl_pattern = re.compile(r'^\s*@incl\s+(<|")(.*?)(>|")')

        for line_num, line_content in enumerate(lines, 1):
            match = incl_pattern.search(line_content)
            if match:
                # Если нашли @incl, рекурсивно обрабатываем включение
                bracket_type = match.group(1)
                lib_name = match.group(2)
                
                if bracket_type == '<':
                    # Стандартная библиотека
                    target_path = os.path.join(self.std_dir, lib_name + '.box')
                else:  # bracket_type == '"'
                    # Пользовательский файл, относительно текущего файла
                    current_dir = os.path.dirname(abs_path)
                    target_path = os.path.join(current_dir, lib_name)

                if not os.path.exists(target_path):
                    raise FileNotFoundError(f"Файл для включения '{lib_name}' не найден. Ожидался по пути: {target_path}")

                # Заменяем строку @incl на содержимое файла
                included_lines = self.process_file(target_path)
                output_lines.extend(included_lines)
            else:
                # Если это обычная строка, добавляем ее вместе с метаданными
                output_lines.append((filepath, line_num, line_content))
                
        return output_lines

    def get_library_code(self) -> str:
        """Возвращает накопленный ассемблерный код из библиотек (если будет)."""
        return self.library_code


#!/usr/bin/python3

import sys
import os

from src.Preprocessor import Preprocessor
from src.Lexer import Lexer
from src.Parser import Parser
from src.Compiler import Compiler
from src.CompilerNasm import CompilerNasm  # Новый импорт
from src.ErrorHandler import ErrorHandler, CompilerError

def main():
    if len(sys.argv) < 2:
        print("Usage: python main.py <input_file.box> [output_file] [TARGET]")
        print("Targets:")
        print("  -kasm    Generate KASM assembly (default)")
        print("  -nasm    Generate NASM assembly")
        print("  -bin     Compile to binary via KASM")
        return

    filepath = sys.argv[1]
    output_filename = sys.argv[2] if len(sys.argv) > 2 and not sys.argv[2].startswith('-') else None
    base_name = ""
    
    # Определяем целевой формат
    target = "kasm"
    for arg in sys.argv[2:]:
        if arg in ["-kasm", "-nasm", "-bin"]:
            target = arg[1:]
            break
    
    # Имя выходного файла по умолчанию
    if not output_filename:
        base_name = os.path.splitext(os.path.basename(filepath))[0]
        if target == "kasm":
            output_filename = f"{base_name}.asm"
        elif target == "nasm":
            output_filename = f"{base_name}.nasm.asm"
        elif target == "bin":
            output_filename = f"{base_name}.bin"

    try:
        # Препроцессинг
        preprocessor = Preprocessor(base_dir=os.path.dirname(filepath))
        processed_lines = preprocessor.process_file(filepath)
        library_code = preprocessor.get_library_code()
        target_bits = preprocessor.get_target_bits()
        
        print("--- Preprocessing completed ---")

        # Парсинг
        error_handler = ErrorHandler(filename=filepath)
        lexer = Lexer(processed_lines)
        parser = Parser(lexer, error_handler)
        
        print("--- Parsing source code ---")
        ast = parser.parse()

        # Компиляция
        if target == "kasm":
            print("--- Compiling AST to KASM ---")
            compiler = Compiler(error_handler=error_handler, target_bits=target_bits)
            assembly_code = compiler.compile(ast, std_lib_code=library_code)
            
        elif target == "nasm":
            print("--- Compiling AST to NASM ---")
            compiler = CompilerNasm(error_handler=error_handler, target_bits=target_bits)
            assembly_code = compiler.compile(ast, std_lib_code=library_code)
            
        elif target == "bin":
            print("--- Compiling to binary via KASM ---")
            compiler = Compiler(error_handler=error_handler, target_bits=target_bits)
            kasm_code = compiler.compile(ast, std_lib_code=library_code)
            
            # Сохраняем во временный файл и компилируем
            temp_asm = f"{os.path.splitext(output_filename)[0]}_temp.asm"
            with open(temp_asm, "w", encoding="UTF-8") as f:
                f.write(kasm_code)
            
            # Вызываем KASM компилятор
            kasm_path = os.path.join(os.path.dirname(__file__), "asm", "kasm.py")
            exit_code = os.system(f"python {kasm_path} {temp_asm} {output_filename}")
            os.remove(temp_asm)
            
            if exit_code == 0:
                print(f"--- BoxLang compiled to binary {output_filename} ---")
            else:
                print("Binary compilation failed")
            return

        # Сохранение результата
        with open(output_filename, "w", encoding="UTF-8") as f:
            f.write(assembly_code)

        print(f"--- BoxLang compiled to {output_filename} ---")

    except CompilerError as e:
        print(str(e), file=sys.stderr)
        sys.exit(1)

if __name__ == "__main__":
    main()

# main.py

import sys
import os
from src.Preprocessor import Preprocessor
from src.Lexer import Lexer
from src.Parser import Parser
from src.Compiler import Compiler

def main():
    if len(sys.argv) != 2:
        print("Usage: python main.py <source_file.box>")
        return

    filepath = sys.argv[1]
    
    # 1. Препроцессинг
    preprocessor = Preprocessor(base_dir=os.path.dirname(filepath))
    try:
        processed_source = preprocessor.process_file(filepath)
        library_code = preprocessor.get_library_code()
        print("--- Preprocessing completed ---")
        
        # Отладочный вывод
        print("=== Processed source ===")
        print(processed_source[:200] + "..." if len(processed_source) > 200 else processed_source)
        print("=== Library code ===")
        print(library_code[:200] + "..." if len(library_code) > 200 else library_code)
        
    except Exception as e:
        print(f"Ошибка препроцессинга: {e}")
        return

    # 2. Компиляция только BoxLang кода
    lexer = Lexer(processed_source)
    parser = Parser(lexer)
    ast = parser.parse()
    
    compiler = Compiler()
    kasm_code = compiler.compile(ast, std_lib_code=library_code)
    
    # 3. Сохранение
    with open("output.asm", "w", encoding="UTF-8") as f:
        f.write(kasm_code)
    print("--- BoxLang compiled to output.asm ---")
    
    # Показываем результат
    print("=== Generated kasm code ===")
    print(kasm_code)

if __name__ == "__main__":
    main()

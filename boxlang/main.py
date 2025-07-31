#!/usr/bin/python3
import sys
import os
from src.Preprocessor import Preprocessor
from src.Lexer import Lexer
from src.Parser import Parser
from src.Compiler import Compiler
from src.ErrorHandler import ErrorHandler, CompilerError

def main():
    if len(sys.argv) < 2:
        print("Usage: python main.py <source_file.box> [output_file.asm]")
        return

    filepath = sys.argv[1]
    output_filename = sys.argv[2] if len(sys.argv) > 2 else "output.asm"
    
    try:
        # 1. Preprocessing
        preprocessor = Preprocessor(base_dir=os.path.dirname(filepath))
        processed_lines = preprocessor.process_file(filepath)
        library_code = preprocessor.get_library_code()
        print("--- Preprocessing completed ---")

        # 2. Initialize error handler, lexer, and parser
        error_handler = ErrorHandler(filename=filepath)
        lexer = Lexer(processed_lines)
        parser = Parser(lexer, error_handler)
        
        # 3. Parsing
        print("--- Parsing source code ---")
        ast = parser.parse()
        
        # 4. Compiling
        print("--- Compiling AST to kasm ---")
        compiler = Compiler(error_handler=error_handler)
        kasm_code = compiler.compile(ast, std_lib_code=library_code)
        
        # 5. Saving
        with open(output_filename, "w", encoding="UTF-8") as f:
            f.write(kasm_code)
        print(f"--- BoxLang compiled to {output_filename} ---")
        print("\n=== Generated kasm code (first 500 chars) ===")
        print(kasm_code[:500] + "..." if len(kasm_code) > 500 else kasm_code)

    except CompilerError as e:
        # Catch our custom error and print it beautifully
        print(str(e), file=sys.stderr)
        sys.exit(1)
    except FileNotFoundError as e:
        print(f"File Error: {e}", file=sys.stderr)
        sys.exit(1)
    except Exception as e:
        # Catch all other unexpected errors
        print(f"\n[Critical Compiler Error]: {e}", file=sys.stderr)
        import traceback
        traceback.print_exc()
        sys.exit(1)

if __name__ == "__main__":
    main()

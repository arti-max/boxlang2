CC = gcc
CFLAGS = -Wall -Wextra -std=c99

all: asm

asm: main.o parser.o codegen.o
	$(CC) $(CFLAGS) -o asm main.o parser.o codegen.o

main.o: main.c asm.h
	$(CC) $(CFLAGS) -c main.c

parser.o: parser.c asm.h
	$(CC) $(CFLAGS) -c parser.c

codegen.o: codegen.c asm.h
	$(CC) $(CFLAGS) -c codegen.c

clean:
	rm -f *.o asm

.PHONY: all clean

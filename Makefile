all: mandalart_x64

bin_x64:
	mkdir -p bin/x64

bin_x86:
	mkdir -p bin/x86

mandalart_x64: bin_x64 mandalart_x64.o
	ld -m elf_x86_64 -s -o bin/x64/mandalart mandalart_x64.o src/display.o src/string.o

mandalart_x64.o: mandalart_x64.asm src/display.asm src/string.asm
	nasm -f elf64 mandalart_x64.asm -o mandalart_x64.o
	nasm -f elf64 src/display.asm -o src/display.o
	nasm -f elf64 src/string.asm -o src/string.o

mandalart_x86: bin_x86 mandalart_x86.o
	ld -m elf_i386 -s -o bin/x86/mandalart mandalart_x86.o

mandalart_x86.o: mandalart_x86.asm
	nasm -f elf mandalart_x86.asm -o mandalart_x86.o

clean:
	rm -f mandalart_x64.o mandalart_x86.o
	rm -f src/display.o src/string.o
	rm -rf bin

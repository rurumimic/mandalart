all: mandalart_x64 mandalart_x86

bin_x64:
	mkdir -p bin/x64

bin_x86:
	mkdir -p bin/x86

mandalart_x64: bin_x64 mandalart_x64.o
	ld -m elf_x86_64 -s -o bin/x64/mandalart \
		mandalart_x64.o \
		src/x64/display.o \
		src/x64/string.o \
		src/x64/fileio.o

mandalart_x64.o: mandalart_x64.asm \
								src/x64/display.asm \
								src/x64/string.asm \
								src/x64/fileio.asm
	nasm -f elf64 mandalart_x64.asm -o mandalart_x64.o
	nasm -f elf64 src/x64/display.asm -o src/x64/display.o
	nasm -f elf64 src/x64/string.asm -o src/x64/string.o
	nasm -f elf64 src/x64/fileio.asm -o src/x64/fileio.o

mandalart_x86: bin_x86 mandalart_x86.o
	ld -m elf_i386 -s -o bin/x86/mandalart \
		mandalart_x86.o \
		src/x86/display.o \
		src/x86/string.o \
		src/x86/fileio.o

mandalart_x86.o: mandalart_x86.asm \
								src/x86/display.asm \
								src/x86/string.asm \
								src/x86/fileio.asm
	nasm -f elf mandalart_x86.asm -o mandalart_x86.o
	nasm -f elf src/x86/display.asm -o src/x86/display.o
	nasm -f elf src/x86/string.asm -o src/x86/string.o
	nasm -f elf src/x86/fileio.asm -o src/x86/fileio.o

clean:
	rm -f mandalart_x64.o mandalart_x86.o
	rm -f src/x64/*.o src/x86/*.o
	rm -rf bin

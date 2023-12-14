# Mandalart

- [mandalart_x64.asm](mandalart_x64.asm), [mandalart_x86.asm](mandalart_x86.asm)
- [examples](examples): [helloworld.asm](examples/helloworld.asm)

## Install

```bash
sudo apt install nasm
```

## Usage

### Compile

#### 64-bit

```bash
make

mkdir -p bin/x64
nasm -f elf64 mandalart_x64.asm -o mandalart_x64.o
ld -m elf_x86_64 -s -o bin/x64/mandalart mandalart_x64.o
```

#### 32-bit

```bash
make mandalart_x86

mkdir -p bin/x86
nasm -f elf mandalart_x86.asm -o mandalart_x86.o
ld -m elf_i386 -s -o bin/x86/mandalart mandalart_x86.o
```

### Run

```bash
./bin/x64/mandalart
./bin/x86/mandalart
```

### Clean

```bash
make clean
```

---

## Refs

- [Netwide Assembler](https://www.nasm.us/)
  - github: [nasm](https://github.com/netwide-assembler/nasm)
  - [docs](https://www.nasm.us/docs.php)

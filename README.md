# Mandalart

- [mandalart.asm](mandalart.asm)
- [examples](examples): [helloworld.asm](examples/helloworld.asm)

## Install

```bash
sudo apt install nasm
```

## Compile

```bash
# 32-bit
nasm -f elf mandalart.asm
ld -m elf_i386 -s -o mandalart mandalart.o

# 64-bit
nasm -f elf64 mandalart.asm
ld -m elf_x86_64 -s -o mandalart mandalart.o
```

## Run

```bash
./mandalart
```

---

## Refs

- [Netwide Assembler](https://www.nasm.us/)
  - github: [nasm](https://github.com/netwide-assembler/nasm)
  - [docs](https://www.nasm.us/docs.php)


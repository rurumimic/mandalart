# Examples

## Hello, World

- [helloworld.asm](helloworld.asm)

### Compile Hello, World

```bash
# 32-bit
nasm -f elf helloworld.asm
ld -m elf_i386 -s -o helloworld helloworld.o

# 64-bit
nasm -f elf64 helloworld.asm
ld -m elf_x86_64 -s -o helloworld helloworld.o
```

### Run Hello, World

```bash
./helloworld

Hello, World!
```


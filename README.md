# Mandalart

- [mandalart_x64.asm](mandalart_x64.asm), [mandalart_x86.asm](mandalart_x86.asm)
- [examples](examples): [helloworld.asm](examples/helloworld.asm)

## Install

```bash
sudo apt install nasm
```

## Usage

### Compile

```bash
# 64-bit + 32-bit
make
make all

# 64-bit
make mandalart_x64

# 32-bit
make mandalart_x86
```

### Run

```bash
./bin/x64/mandalart [data/template.txt]
./bin/x86/mandalart [data/template.txt]
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

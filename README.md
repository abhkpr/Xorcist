# CAUTION: This tool is not secure for real-world cryptography.
# Xorcist-
Minimal x86_64 assembly implementation a simple XOR-based block cipher for encrypting/decrypting input strings from the Linux command line. Symmetric, stateless, and blazing fast.

## XOR-Cipher-x86_64

A minimalist XOR-based block cipher implemented in x86_64 Assembly (NASM) for Linux. Encrypts and decrypts strings directly from the command line using Linux syscalls only. Lightweight, fast, and stateless — perfect for educational and low-level systems programming.

## Features

- XOR-based symmetric encryption
- Encrypts/decrypts any string from stdin
- Assembly-only implementation using Linux syscall interface
- Works directly in terminal
- No external libraries or dependencies

## Build

You need [NASM](https://www.nasm.us/) and `ld` (linker):

```bash
nasm -f elf64 xor_cipher.asm -o xor_cipher.o
ld xor_cipher.o -o xor_cipher

```
## Usage
`./xor_cipher`

### Input example
`Enter string:
hello world`

### Output
`Encrypted:
ÊßÖÖÕZÕÖÚÖÞ`

## NOTE: Run the program again and input the encrypted text to decrypt

## How it Works
This XOR cipher uses a fixed key (`0x5A`) to XOR each byte of the input. Since XOR is reversible, running the cipher twice returns the original data.

## Limitations
- Only supports terminal (stdin/stdout) I/O
- XOR key is hardcoded
- No file encryption (yet)



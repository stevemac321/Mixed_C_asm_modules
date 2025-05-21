# Mixed_C_asm_modules

## Overview
This project explores the seamless integration of **C and Assembly** in a RISC-V environment. It focuses on:
- Function calls between C and Assembly (`test_func.c` & `test_func.s`)
- UART output for debugging (`main.c`)
- GPIO memory-mapped register access (`test_func.c`)
- Setting up basic embedded functionality, including ADC and interrupts
- Debugging sorting algorithms (`isort.s`) and ensuring correct memory access

## Setup
### **Prerequisites**
- RISC-V toolchain (`riscv64-unknown-elf-gcc`)
- QEMU RISC-V emulator (`qemu-system-riscv64`)

### **Build & Run**
Compile and link all files:
```bash
riscv64-unknown-elf-gcc -c main.c -o main.o
riscv64-unknown-elf-gcc -c test_func.c -o test_func.o
riscv64-unknown-elf-gcc -c test_func.s -o test_func.o
riscv64-unknown-elf-gcc main.o test_func.o test_func.o -o main.elf

Or use the Makefile

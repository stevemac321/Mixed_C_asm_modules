
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
You can use the Makefile
make clean
make
make run
make run-debug  (open a bash shell, gdb-multiarch -x debug.gdb main.elf)

Compile and link all files:
```bash
riscv64-unknown-elf-gcc -c main.c -o main.o
riscv64-unknown-elf-gcc -c test_func.c -o test_func.o
riscv64-unknown-elf-gcc -c test_func.s -o test_func.o
riscv64-unknown-elf-gcc main.o test_func.o test_func.o -o main.elf
```
Run in QEMU:
```bash
qemu-system-riscv64 -M virt -nographic -bios none -kernel main.elf
```

## File Structure
| File          | Purpose |
|--------------|--------------------------------|
| `main.c`     | Handles UART output, calls `test_func.c` functions |
| `test_func.c` | Contains `int_less()` and `print_gpio()` |
| `test_func.s` | Assembly module linked to C for direct execution |
| `common.h`   | Shared function declarations for modularity |
| `isort.s`    | Sorting function (currently under debugging) |

## Debugging & Validation
- **Validated function calls from C to assembly (`print_int_array` works perfectly)**
- **Confirmed UART output (`uart_putc()` and `uart_puts()`)**
- **Tested GPIO access (`print_gpio() still under investigation`)**
- **Verified timer reads (`CLINT register checks successful, but values were `0`)**
Licence: GPL Version 2.

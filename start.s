.section .text
.global _start
.extern main

_start:
    li sp, 0x80010000   # Explicitly set stack pointer
    call main           # Jump to main
    j .                 # Infinite loop

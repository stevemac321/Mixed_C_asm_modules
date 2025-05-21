#ifndef COMMON_H
#define COMMON_H

#include <stddef.h>
#include <stdbool.h>
#include <stdint.h>

#define UART_BASE 0x10000000  // QEMU's emulated UART

int int_less(const int *v1, const int *v2);
void print_int_array(const int a[], const int len);
void print_timer();

void uart_putc(char c);
void uart_puts(const char *s);
void uart_put_int(int x);

#endif // COMMON_H
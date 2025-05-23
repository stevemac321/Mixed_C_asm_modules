#ifndef COMMON_H
#define COMMON_H

#include <stddef.h>
#include <stdbool.h>
#include <stdint.h>

#define UART_BASE 0x10000000  // QEMU's emulated UART
#define GPIO_BASE 0x10012000
#define GPIO_INPUT (*(volatile uint32_t *)GPIO_BASE)

// CLINT Timer Base Address
#define CLINT_TIMER_BASE  0x02000000

int int_less(const int v1, const int v2);
void print_int_array(const int a[], const int len);
void print_timer();

void uart_putc(char c);
void uart_puts(const char *s);
void uart_put_int(int x);
void insertion_sort(int *a, const size_t count, int (*pred)(const int, const int));

#endif // COMMON_H
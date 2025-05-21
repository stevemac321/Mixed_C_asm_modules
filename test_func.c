#include "common.h"

// test_func.c
#define GPIO_BASE 0x10012000
#define GPIO_INPUT (*(volatile uint32_t *)GPIO_BASE)

void print_timer() {
   uint32_t timer_val = *((volatile uint32_t *)0x02000000);
    uart_puts("Timer Low Bits: ");
    uart_putc((timer_val & 0xFF) + '0');  
    uart_putc('\n');
}

int int_less(const int *v1, const int *v2) {
    if (!v1 || !v2) 
        return 0;  // Prevent dereferencing null pointers
    
        return *v1 < *v2;
}

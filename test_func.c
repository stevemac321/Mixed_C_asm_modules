#include "common.h"

// test_func.c

void print_timer() 
{
   uint32_t timer_val = *((volatile uint32_t *)CLINT_TIMER_BASE);
    uart_puts("Timer Low Bits: ");
    uart_putc((timer_val & 0xFF) + '0');  
    uart_putc('\n');
}

int int_less(const int v1, const int v2) 
{
        return v1 < v2;
}
void insertion_sort(int *a, const size_t count, int (*pred)(const int, const int)) 
{
    for (int* key = (a + 1); key != (a + count); key++) {
        while (key > a && pred(*key, *(key - 1))) {
            // Inline swap
            int temp = *key;
            *key = *(key - 1);
            *(key - 1) = temp;

            --key;
        }
    }
}

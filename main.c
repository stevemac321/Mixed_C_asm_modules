
#include "common.h"
struct pair {
    int first;
    int second;
} pairs[] = {
    {4, 5}, 
    {5, 1}
};

int main(int argc, char *argv[])
{
    for(int i=0; i < 2; i++) {
        int_less(&pairs[i].first, &pairs[i].second) > 0 
            ? uart_putc(pairs[i].first + '0') 
            : uart_putc(pairs[i].second + '0');
        
            uart_putc('\n');
    }

    
    int a[] = {7, 2, 9, 0, 4, 1, 8, 5, 3, 6}; // Unsorted arrangement
    print_int_array(a, 10);
    uart_putc('\n');

    insertion_sort(a, 10, int_less);
    print_int_array(a, 10);
    uart_putc('\n');
    
    print_timer();
    uart_putc('\n');

    while (1);  // Prevent returning (since there's no OS)
}
void uart_putc(char c) {
    *(volatile char *)UART_BASE = c;
}

void uart_put_int(int x) {
    uart_putc(x + '0');
}

void uart_puts(const char *s) {
    while (*s) {
        uart_putc(*s++);
    }
}

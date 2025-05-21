.section .text
.global print_int_array

print_int_array:
    addi sp, sp, -56        # Allocate stack space
    sw s1, 4(sp)            # Save registers
    sw s2, 8(sp)
    sw s3, 12(sp)
    sw s4, 16(sp)
    sw s5, 20(sp)
    sw s6, 24(sp)
    sw s7, 28(sp)
    sd ra, 40(sp)           # Save return address

    mv s1, a0               # Base address (array pointer)
    mv s2, a1               # Number of elements
    li s3, 0                # Loop counter

loop:
    bge s3, s2, end         # If counter >= length, exit
    slli t0, s3, 2          # Compute offset (index * 4)
    add t0, s1, t0          # Effective address: base + offset
    lw a0, 0(t0)            # Load integer element
    jal uart_put_int        # Call UART printing function
    addi s3, s3, 1          # Increment counter
    j loop

end:
    ld ra, 40(sp)           # Restore return address
    lw s1, 4(sp)            # Restore registers
    lw s2, 8(sp)
    lw s3, 12(sp)
    lw s4, 16(sp)
    lw s5, 20(sp)
    lw s6, 24(sp)
    lw s7, 28(sp)
    addi sp, sp, 56         # Clean up stack
    ret

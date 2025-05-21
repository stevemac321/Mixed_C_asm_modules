ENTRY(_start)

SECTIONS {
    /* Define program entry point */
    . = 0x80000000;

    /* Code section: Executable and Read-Only */
    .text 0x80000000 : { *(.text) }

    /* Read-Only Data */
    .rodata 0x80002000 : { *(.rodata) }

    /* Writable Data Section */
    .data 0x80003000 : { *(.data) }

    /* Uninitialized Data Section */
    .bss 0x80004000 : { *(.bss) }

    /* Move to the stack base */
    . = 0x80010000;

    /* Stack Section: Writable, Non-Loadable */
    .stack (NOLOAD) : {
        . += 0x4000; /* Reserve 16KB for stack */
    }
}

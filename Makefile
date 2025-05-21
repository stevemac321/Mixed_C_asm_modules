# Compiler & Linker
RISCV_DIR := /home/steve/riscv/riscv32-unknown-elf
LIB_DIR := $(RISCV_DIR)/lib
INCLUDE_DIR := $(RISCV_DIR)/include

CC := riscv64-unknown-elf-gcc
LD := riscv64-unknown-elf-ld

# Flags
CFLAGS := -g -O0 -I$(INCLUDE_DIR) -mcmodel=medany
LDFLAGS := -g -T link.ld -L$(LIB_DIR) -lc

# Output Binary
TARGET := main.elf
OBJ := start.o main.o test_func.o print_array.o 

# Ensure Build Process Starts
all: $(TARGET)

# Compile Individual Files
start.o: start.s
	$(CC) $(CFLAGS) -c -o $@ $<

main.o: main.c
	$(CC) $(CFLAGS) -c -o $@ $<

test_func.o: test_func.c  
	$(CC) $(CFLAGS) -c -o $@ $<

print_array.o: print_array.s  
	$(CC) $(CFLAGS) -c -o $@ $<

# Linking
$(TARGET): $(OBJ)
	$(LD) $(LDFLAGS) -o $@ $(OBJ)

# Run in QEMU
run:
	qemu-system-riscv64 -M virt -nographic -bios none -kernel $(TARGET)

run-debug:
	qemu-system-riscv64 -M virt -nographic -bios none -kernel $(TARGET) -s -S

# Clean Build Artifacts
clean:
	rm -f $(OBJ) $(TARGET)

CC = riscv64-unknown-elf-gcc
AS = riscv64-unknown-elf-as
QEMU = qemu-riscv64

CFLAGS = -Wall -Wextra -nostdlib -ffreestanding
ASFLAGS = -march=rv64gc -mabi=lp64d
LDFLAGS = -nostdlib -T link.ld -static

SRC = src/accerman.s
TEST = tests/test_accerman.c
TARGET = test_accerman

all: $(TARGET)

$(TARGET): $(TEST) $(SRC)
	$(CC) $(CFLAGS) $(LDFLAGS) $^ -o $@

run: $(TARGET)
	$(QEMU) $(TARGET)

clean:
	rm -f $(TARGET)

.PHONY: all run clean
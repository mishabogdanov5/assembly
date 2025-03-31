# Компилятор и утилиты
CC = riscv64-unknown-elf-gcc
AS = riscv64-unknown-elf-as
LD = riscv64-unknown-elf-ld
QEMU = qemu-riscv64

TARGET = amd64

all: $(TARGET)

$(TARGET).o: $(TARGET).s
	$(AS) -o $@ $<

$(TARGET): $(TARGET).o
	$(LD) -o $@ $<

run: $(TARGET)
	$(QEMU) $<

clean:
	rm -f *.o $(TARGET)
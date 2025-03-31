AS = riscv64-unknown-elf-as
LD = riscv64-unknown-elf-ld
QEMU = qemu-riscv64

SRCS = accerman.s rv_runtime.s
OBJS = $(SRCS:.s=.o) 
TARGET = prog  

all: $(TARGET)

%.o: %.s
	$(AS) -o $@ $<

$(TARGET): $(OBJS)
	$(LD) -o $@ $^

run: $(TARGET)
	$(QEMU) $(TARGET)

clean:
	rm -f $(OBJS) $(TARGET)

.PHONY: all run clean
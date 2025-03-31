ENTRY(_start)

SECTIONS {
    . = 0x10000; 
    .text : { *(.text) }
    .data : { *(.data) }
    .bss : { *(.bss) }
    
    _stack_bottom = .;
    . += 0x20000;
    _stack_top = .;
}
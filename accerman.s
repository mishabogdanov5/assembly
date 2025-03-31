.text
.global _start

_start:
    li a0, 3
    li a1, 10

    jal ra, accerman

    call print_int  

    li a7, 93  
    li a0, 0  
    ecall

accerman:
    bnez a0, second
    addi a0, a1, 1
    ret

second:
    bnez a1, default
    addi sp, sp, -4    
    sw ra, 0(sp)       
    
    addi a0, a0, -1      
    li a1, 1             
    jal ra, accerman   
    
    lw ra, 0(sp)    
    addi sp, sp, 4  
    ret

default:
    addi sp, sp, -8  
    sw ra, 0(sp) 
    sw a0, 4(sp)   
    
    addi a1, a1, -1
    jal ra, accerman
    
    mv a1, a0             
    lw a0, 4(sp)         
    addi a0, a0, -1    
    
    jal ra, accerman   
    
    lw ra, 0(sp)
    addi sp, sp, 8
    ret

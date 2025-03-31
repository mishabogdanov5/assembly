.global _start

.section .text
_start:
    li a0, 7         
    jal ra, factorial  
    
    jal ra, print_int  

    li a7, 93  
    li a0, 0  
    ecall
factorial:
    li t0, 1
    beq a0, t0, end 
    beqz a0, end  
    addi sp, sp, -8
    sw ra, 0(sp)
    sw a0, 4(sp)
    addi a0, a0, -1
    jal ra, factorial
    lw t1, 4(sp)
    mul a0, a0, t1
    lw ra, 0(sp)
    addi sp, sp, 8
end:
    ret


print_int:

    addi sp, sp, -12  
    mv t0, sp  

    li t2, 10   
    li t3, 0

convert_loop:
    rem t1, a0, t2    
    div a0, a0, t2  
    addi t1, t1, '0'  
    sb t1, 0(t0)   
    addi t0, t0, 1   
    addi t3, t3, 1  
    bnez a0, convert_loop

    mv t1, sp          
    addi t0, t0, -1  

reverse_loop:
    bge t1, t0, end_reverse
    lb t4, 0(t1) 
    lb t5, 0(t0)   
    sb t5, 0(t1)    
    sb t4, 0(t0)
    addi t1, t1, 1
    addi t0, t0, -1
    j reverse_loop

end_reverse:

    li a7, 64    
    li a0, 1   
    mv a1, sp      
    mv a2, t3       
    ecall

    addi sp, sp, 12
    ret
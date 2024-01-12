    .data
pressaoDesejada: .word 0
pressaoLida: .word 0
dif: .word 0
output: .asciiz "\n"
    .text
main:
    #saves the desirable pressure value into the designed variable
    li		$v0, 5		
    syscall
    sw		$v0, pressaoDesejada

    #saves the visible pressure value into the designed variable
    li		$v0, 5		
    syscall
    sw		$v0, pressaoLida

    #arithmetic operations only occur between registers, so we must load the variables values into them and the do the subtraction of the values
    lw		$t0, pressaoDesejada		
    lw      $t1, pressaoLida
    sub	    $s0, $t0, $t1   
    sw      $s0, dif	
    
    #prints the result
    #OBS: la != lw
    li      $v0, 1      
    lw      $a0, dif
    syscall

    #prints a new line so it gets easier to see the result
    li      $v0, 4
    la      $a0, output
    syscall

    #standard practice, syscall code for finishing the program
    li		$v0, 10
    syscall
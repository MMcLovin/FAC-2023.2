    .data
valorDiaria:      .word 0
acrescimoDiaria:  .word 0
dataChegada:      .word 0
total:            .word 0
diasNoHotel:      .word 0
estadiaMaxima:    .word 32
#ambiguo, dia 1 pode ser o primeiro dia da promocao ou o ultimo
#32 = estadia maxima
#total = (32 - dataChegada) * {valorDiaria + [acrescimoDiaria*(dataChegada - 1) ]}

newLine: .asciiz "\n"

    .text
main:
    #saves the input of increment to daily value into the designed variable
    li		$v0, 5		
    syscall
    sw		$v0, valorDiaria

    #saves the input of increment to daily value input into the designed variable
    li		$v0, 5		
    syscall
    sw		$v0, acrescimoDiaria

    #saves the date of arrival input value into the designed variable
    li		$v0, 5		
    syscall
    sw		$v0, dataChegada
    #----------------Termina Leitura de Dados---------------
    

    #                                                           $t3
    #               $t0                 $t4            $t2              $t1
    #total = (32 - dataChegada) * {valorDiaria + [acrescimoDiaria*(dataChegada - 1) ]}
    
    # dias no hotel($t0) = 31($t0) - datachegada($t1)
    lw      $t1, estadiaMaxima
    lw      $t2, dataChegada
    sub     $t0, $t1, $t2 
    sw      $t0, diasNoHotel

    #acrescimoDiaria*(dataChegada - 1)
    lw      $t1, dataChegada
    lw      $t2, acrescimoDiaria
    addi	$t1, $t1, -1	
    mul     $t3, $t2, $t1

    #valorDiaria + [acrescimoDiaria*(dataChegada - 1) ]
    lw      $t4, valorDiaria
    add     $t5, $t3, $t4

    #(31 - dataChegada) * {valorDiaria + [acrescimoDiaria*(dataChegada - 1) ]}
    mul     $s0, $t0, $t5
    sw      $s0, total

    #1 = syscall for printing an integer
    li      $v0, 1  
    lw      $a0, total
    syscall

    #-----------------------------------------------------------------------------------------
    #prints a new line so it gets easier to see the result
    li      $v0, 4
    la      $a0, newLine
    syscall

    #standard practice, syscall code for finishing the program
    li		$v0, 10
    syscall
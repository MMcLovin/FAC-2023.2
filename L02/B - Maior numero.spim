.data
newLine: .asciiz    "\n"
.text
main:
    #le o numero de entradas
    li      $v0, 5
    syscall
    move    $s0, $v0

    #assumo o primeiro elemento como o maior
    li      $v0, 5
    syscall
    move    $s1, $v0

    addi     $s0, $s0, -1
    
    jal Loop

    #encerra o programa
    li      $v0, 10
    syscall 
Loop:
    beq     $s0, $zero, Exit

    #le o numero digitado
    li      $v0, 5
    syscall
    move    $t0, $v0

    #verifica se o input eh menor que o maior previamente salvo em $s1
    slt     $t1, $s1, $t0
    bne     $t1, $zero, mudaMaior
    
    addi    $s0, $s0, -1
    j Loop
Exit:
    li      $v0, 1
    add     $a0, $s1, $zero
    syscall

    li      $v0, 4
    la      $a0, newLine
    syscall

    jr      $ra

mudaMaior:
    add     $s1, $t0, $zero
    addi    $s0, $s0, -1
    j Loop
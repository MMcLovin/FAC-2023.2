.data
    newLine: .asciiz "\n"
.text
main:
    li      $v0, 5
    syscall
    move    $s0, $v0    #guarda pressao desejada em $s0

    li      $v0, 5
    syscall
    move    $s1, $v0    #guarda pressao lida em $s1

    sub     $t0,$s0,$s1 #guarda a diferença em $t0

    li      $v0, 1
    move    $a0, $t0
    syscall #imprime a diferença

    li      $v0, 4
    la      $a0, newLine
    syscall #imprime um \n

    li $v0, 10
    syscall #encerra o programa
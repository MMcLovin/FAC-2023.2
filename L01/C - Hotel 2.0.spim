.data
    newLine: .asciiz    "\n"
.text
main:
    li      $v0, 5
    syscall
    move    $s0, $v0    #guarda D, o valor da diária

    li      $v0, 5
    syscall
    move    $s1,$v0    #incremento A diário da diária

    li      $v0, 5
    syscall
    move    $s2, $v0    #guarda o N, dia de chegada no hotel

    #Do dia 1 ao 31 são 31 dias, mais o dia 1 do prox mes = 32 dias de estadia máxima
    #total = [(32 - N) * {D + (N - 1)*A}]

    li      $t0, 32
    sub     $t0, $t0, $s2 #(32 - N)
    
    addi	$t1, $s2, -1	#(N - 1)
    
    mul     $t2, $t1, $s1   #(N - 1)*A

    add     $t1, $s0, $t2   #{D + (N - 1)*A}
    mul     $s3, $t0, $t1    #total = [(32 - N) * {D + (N - 1)*A}]

    li      $v0, 1
    move    $a0, $s3
    syscall #imprime o resultado

    li      $v0, 4
    la      $a0, newLine
    syscall #imprime um \n

    li      $v0, 10
    syscall #encerra o programa
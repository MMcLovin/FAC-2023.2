.data
    newline:    .asciiz     "\n"
	
.text
	
main:
	
    li      $v0, 5          # 5 = codigo para ler integers
    syscall
    move    $t0, $v0        # $t0 = numeros a serem lidos para a media
	
    mtc1    $zero, $f3     # acumulado da soma dos valores, calculados com o peso
    mtc1    $zero, $f2     # vai ser o acumulado da soma dos pesos
	
    jal     leNumeros
	
    li      $v0, 10
    syscall
	
leNumeros:
	
    beq     $t0, $zero, calculaMedia
	
    # primeiro lemos o peso e depois o valor parar fazer as operações
    li      $v0, 6          # 6 = codigo para ler floats
    syscall
    mov.s   $f1, $f0
    add.s   $f2, $f2, $f0   # atualiza a soma acumulado dos pesos
	
    # o numero que deve ser multiplicado pelo o peso lido
    li      $v0, 6          # 5 = codigo para ler floats
    syscall
    mul.s   $f1, $f1, $f0   # valor multiplicado pelo o seu peso
    add.s   $f3, $f3, $f1   # atualiza a soma acumulado dos valores com os pesos
	
    addi    $t0, $t0, -1    # decrementando o contador
	
    j       leNumeros
	
calculaMedia:
	
    div.s   $f4, $f3, $f2   # divisão do acumulado dos valoress com peso pelo o acumulado dos pesos
    
    li      $v0, 2
    mov.s   $f12, $f4
    syscall 
	
    li      $v0, 4
    lw      $a0, newline
    syscall
    
    jr      $ra
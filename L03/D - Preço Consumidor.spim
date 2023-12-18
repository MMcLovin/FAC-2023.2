.data
    newline:        .asciiz      "\n"
    porcentagem:    .double      100.0
.text
	
main:

    l.d     $f8, porcentagem

    li      $v0, 7
    syscall
    mov.d   $f2, $f0        # le o preco de fabrica

    li      $v0, 7
    syscall
    mov.d   $f4, $f0        # le a porcentagem de lucro da distribuidora

    li      $v0, 7
    syscall
    mov.d   $f6, $f0        # le a porcentagem dos impostos

    div.d   $f4, $f4, $f8   # passa o valor do lucro para porcentagem
    div.d   $f6, $f6, $f8   # passa valor dos impostos para porcentagem 
    mul.d   $f4, $f4, $f2   # pega a parcela do lucro
    mul.d   $f6, $f6, $f2   # pega a parcela do imposto

    add.d   $f2, $f4, $f2   # soma o lucro ao custo de fabrica 
    add.d   $f2, $f6, $f2   # soma o imposto ao custo de fabrica

    li      $v0, 3          # 2 = codigo para imprimir float
    mov.d   $f12, $f2       # movendo para o reg usada na syscall
    syscall
	
    # imprime um nova linha
    li      $v0, 4
    la      $a0, newline
    syscall
    
    # encerra o programa
    li      $v0, 10
    syscall
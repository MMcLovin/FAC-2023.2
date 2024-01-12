.data
overflowText:       .asciiz     "overflow\n"
newLine:            .asciiz     "\n"
.text
main:
    li      $v0, 5                  #codigo para leitura de int
    syscall                 
    add     $t0, $v0, $zero         #$t0 = opcao de operacao

    li      $v0, 5                  #codigo para leitura de int
    syscall                 
    add     $a1, $v0, $zero         #$a1 = primeiro operando

    li      $v0, 5                  #codigo para leitura de int
    syscall                 
    add     $a2, $v0, $zero         #$a2 = segundo operando

    beq     $t0, $zero, semSinal    #opcao de operacao = 0, sem sinal
    j       comSinal                #opcao de operacao = 1, com sinal

semSinal:
    nor     $t0, $a1, $zero         #pega a negacao do primeiro operando
    sltu    $t1, $t0, $a2           #se o segundo operando for maior que o complemento de 2 obtido, tem overflow
    bne     $t1, $zero, Overflow

    addu    $a0, $a1, $a2           #nao tem overflow, entao calcula a soma sem sinal

    j       imprimeResultado

comSinal:
    addu    $t0, $a1, $a2       #soma sem gerar excecao
    xor     $t1, $a1, $a2       #o xor gera um numero positivo se os sinais dos dois operandos forem iguais e negativo se eles forem diferentes
    slt     $t1, $t1, $zero     #$t1 < 0 = eh negativo e $t1 = 1, ou seja, os sinais sao diferentes e nao eh possivel um overflow
    bne     $t1, $zero, soma    #se $t1 eh positivo, os sinais sao iguais, ent ainda temos de verificar se ocorre overflow por meio da analise do sinal da soma "addu"
    xor     $t0, $t0, $a1       #sinal de $a1 = sinal de $a2, ent tanto faz qm escolhemos para comparar com o sinal do resultado
    slt     $t0, $t0, $zero     #$t0 eh positivo se os sinais forem iguais (nao houve overflow) e eh negativo se forem diferentes (houve overflow), ent slt retorna 1 se tiver overflow e 0 caso contrario
    bne     $t0, $zero, Overflow
soma:
    add     $a0, $a1, $a2           #nao tem overflow, entao calcula a soma

    j       imprimeResultado

Overflow:
    li      $v0, 4              #codigo pra imprimir string
    la      $a0, overflowText   #prompt de overflow
    syscall

    j       Exit
imprimeResultado:
    li      $v0, 1                  #codigo pra imprimir int
    syscall     

    li      $v0, 4                  #codigo pra imprimir string
    la      $a0, newLine            
    syscall
    
Exit:
    li      $v0, 10
    syscall
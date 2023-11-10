elemDistintos:
    #inicializa o numero de elementos distintos
    addi   $v0, $zero, 1

    #(nao funciona, TLE 81p) menor possivel = -(2^31) = -2.147.483.648
    #(nao funciona, TLE 77p) menor possivel = -1 
    #(nao funciona, TLE 40p) menor possivel = 0
    #(nao funciona, TLE 81p) menor possivel = -32768
    #(nao funciona, TLE 77p) menor possivel = primeiro elemento
    #(FUNCIONOU PORRA, 100p) menor possivel = primeiro elemento e troquei todos $s por $t

    #pega o elemento a partir do endereco base
    lw      $t0, 0($a0)

    #primeiro maior elemento = v[0]
    add    $t2, $zero, $t0 
    
    #diminui o numero de elementos restantes 
    addi    $a1, $a1, -1

    #passa para o prox endereco
    add     $a0, $a0, 4

Loop:
    #a1 = numero de elmentos
    beq     $a1, $zero, Exit

    #pega o elemento a partir do endereco base
    lw      $t0, 0($a0)

    #diminui o numero de elementos restantes 
    addi    $a1, $a1, -1

    #passa para o prox endereco
    add     $a0, $a0, 4

    #verifica se o elemento carregado eh maior que o previamente salvo em $t2
    slt     $t1, $t2, $t0
    bne     $t1, $zero, mudaMaior

    j Loop

Exit:
    jr      $ra

mudaMaior:
    #salva o novo maior 
    add     $t2, $t0, $zero

    #incrementa os numeros distintos
    addi    $v0, $v0, 1

    j Loop
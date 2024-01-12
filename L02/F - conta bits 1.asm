contaBits:
    #inicia $v0 com 0
    li       $v0, 0
Loop:
    #faz uma copia do valor em $a0
    addu     $t0, $a0, $zero
    
    #se $a0 for zero, nao ha mais bits 1 para contar
    beq     $t0, $zero, Exit

    #fazendo um and com a copia de $a0, pegamos o valor do bit menos significativo
    andi    $t0, $t0, 1    

    #"deletamos" o bit menos significativo contabilizado
    srl     $a0, $a0, 1

    #se ele for 0, volta pro loop
    beq     $t0, $zero, Loop

    #se for 1, jogamos no $v0
    add    $v0, $v0, $t0

    #repete
    j Loop

Exit:
    #volta pro caller
    jr      $ra
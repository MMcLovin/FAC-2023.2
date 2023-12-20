.data
    errorMessage:       .asciiz         "Entradas invalidas.\n"
    successMessage1:    .asciiz         "A raiz quadrada de "
    successMessage2:    .asciiz         " eh "
    successMessage3:    .asciiz         ", calculada em "
    successMessage4:    .asciiz         " iteracoes.\n"
    exceededMessage1:   .asciiz         "Nao foi possivel calcular sqrt("
    exceededMessage2:   .asciiz         ").\n"

.text

main:
    li      $v0, 5
    syscall
    move    $s0, $v0                    # numero que devemos calcular a sqrt()

    li      $v0, 5
    syscall
    move    $s1, $v0                    # precisao da minha sqrt()

    jal     confereEntradas

    li      $v0, 10                     # codigo de encerramento do programa
    syscall

confereEntradas:
    addi    $t0, $t0, 1                # 1 <= precisao <= 16
    li      $t1, 16                    # evita hazard de dados e verifica se precisao <= 16, == < 17
    slt     $t0, $s1, $t0              # se menor q o limite inferior (isto eh, == 0 ou < 0), $t0 = 1
    bne     $t0, $zero, entradasInvalidas # precisao menor que 1
    
    sgt     $t1,  $s1, $t1              # se maior que o limite superior, $t1 = 1
    bne     $t1, $zero, entradasInvalidas

    li      $t1, 1
    sgt     $t1, $s0, $t1 
    beq     $t1, $zero, entradasInvalidas # x = 1

    li      $t0, 1                      # inicializando o meu contador para acha_limites
    
    add     $t1, $zero, $zero           # contador do meu loop para precisao
    li      $t2, 10                     # nao tem como fzr sll, ent vamos de div.d pra calcular a precisao. 10 = precisao de uma casa
    mtc1.d  $t2, $f10                   # carrega o 10 como um PF de precisao simples
    cvt.d.w $f10, $f10                  # converte o 10 para PF duplo
    li      $t2, 1                      # contador que vai servir para achar os quadrados que limitam x
    mtc1.d  $t2, $f12                   # carrega o 10 como um PF de precisao simples
    cvt.d.w $f12, $f12                  # converte o 10 para PF duplo

precisaoDouble:
    beq     $t1, $s1, acha_limites      # confere se atingiu a precisao 
    div.d   $f12, $f12, $f10            # 10^x / 10
    addi    $t1, $t1, 1                 # contador++
    j       precisaoDouble

acha_limites:
    mul     $t2, $t0, $t0               # $t2 = contador * contador
    sgt     $t1, $t2, $s0               # cmp(meuContador^2, x)
    bne     $t1, $zero, carregaDados1    # contador^2 eh maior q x? se nao ($t1 = 0), volta pro loop
    addi    $t0, $t0, 1                 # contador++
    j       acha_limites

carregaDados1:
    add     $s3, $zero, $t0             # $t2 = primeiro numero com ^2 maior q x, = b0 = lim_superior
    addi    $s2, $t0, -1                # numero imediatamente anterior a b0, = a0 = lim_inferior
    mul     $t6, $s2, $s2               # a0^2
    sub     $t6, $s0, $t6               # a0^2 - x == 0, tem que trocar a0
    bne     $t6, $zero, carregaDados2   # a0^2 PRECISA ser menor que x, pega $s2 - 1

corrige_a0:
    addi    $s2, $s2, -1                

carregaDados2:
    addi    $t0, $zero, 2               # contador de bisection = 2, pois 1ª it. eh manualmente feita
    addi    $t1, $zero, 99              # $t1 = meu limite de iteracoes 

    mtc1.d  $s3, $f2                    # passa o limite_superior para PF simples
    cvt.d.w $f2, $f2                    # converte o limite_superior para PF duplo

    mtc1.d  $s2, $f0                    # passa o limite_inferior para PF simples
    cvt.d.w $f0, $f0                    # converte o limite_inferior para PF duplo

    li      $t2, 2                      # nao tem como fzr slr, ent vamos de div.d
    mtc1.d  $t2, $f4                    # carrega o 2 como um PF de precisao simples
    cvt.d.w $f4, $f4                    # converte o 2 para PF duplo
    
    mtc1.d  $s0, $f6                    # carrega x como double, ele eh usado para atualizar b0
    cvt.d.w $f6, $f6                    # converte x para PF duplo

bisection1:
    # a primeira iteracao tem a1 = a0, so atualizando b
    # essa eh a segunda iteracao
    div.d   $f2, $f6, $f0               # atualiza b1, b1 = x / a1 (a1  = a0)

bisection2:
    sgt     $t2, $t0, $t1               # n eh a centesima iteracao? continua
    bne     $t2, $zero, nao_achou_raiz
    add.d   $f0, $f0, $f2               # atualiza a -> (ai-1) + (bi-1)
    div.d   $f0, $f0, $f4               # atualiza a -> (ai-1) + (bi-1) / 2
    div.d   $f2, $f6, $f0               # atualiza b -> bi = x / ai
    sub.d   $f8, $f0, $f2               # diferenca entre ai e bi = precisao
    abs.d   $f8, $f8
    c.le.d  $f8, $f12                   # precisao >= que a precisao pedida, printa ssamerda
    bc1t    achouRaiz
    addi    $t0, $t0, 1                 # contador++
    j       bisection2

entradasInvalidas:
    li      $v0, 4
    la      $a0, errorMessage
    syscall

    jr      $ra

nao_achou_raiz:
    li      $v0, 4                      # codigo para imprimir strings
    la      $a0, exceededMessage1       # primeira parte da mensagem
    syscall

    li      $v0, 1                      # codigo para imprimir integer
    add     $a0, $zero, $s0             # imprime valor de x
    syscall

    li      $v0, 4                      # codigo para imprimir strings
    la      $a0, exceededMessage2       # resto da mensagem
    syscall

    jr      $ra

achouRaiz:
    # msg = "A raiz quadrada de 78 eh 8.8317608669559462, calculada em 4 iteracoes."
    
    li      $v0, 4                      # codigo para imprimir strings
    la      $a0, successMessage1        # primeira parte da mensagem
    syscall

    li      $v0, 1                      # codigo para imprimir integer
    add     $a0, $zero, $s0             # passa o valor de x para o reg usado na syscall
    syscall

    li      $v0, 4                      # codigo para imprimir strings
    la      $a0, successMessage2        # segunda parte da mensagem
    syscall

    li      $v0, 3                      # codigo para imprimir double                     
    mov.d   $f12, $f0                   # passa ai (lim_inferior) para o reg usado na syscall
    syscall

    li      $v0, 4                      # codigo para imprimir strings
    la      $a0, successMessage3        # terceira parte da mensagem
    syscall

    li      $v0, 1                      # codigo para imprimir integer
    add     $a0, $t0, $zero             # a0 = contador de iteracoes no bisection 
    syscall

    li      $v0, 4                      # segunda parte da mensagem
    la      $a0, successMessage4        # terceira parte da mensagem
    syscall

    jr      $ra
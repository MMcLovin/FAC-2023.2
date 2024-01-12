
    li		$v0, 5
    syscall         
    move	$t0, $v0    #guarda o input de i em $t0
    sll     $t0,$t0,2   #i = i * 4

    li		$v0, 5		
    syscall           
    move	$t1, $v0    #guarda o input de j em $t1
    sll     $t1,$t1,2   #j = j * 4

    li		$v0, 5	 
    syscall           
    move	$t2, $v0    #guarda o input de N em $t2
    
    #A[i] = A[j] + N
    add     $t3, $t1, $s0   #$t3 = offset do endereco base de A[j]
    lw      $t4, 0($t3)     #guarda em $t4 o valor de A[j]
    add     $t5, $t4, $t2   #guarda em $t5 a soma A[j] + N
    
    add     $t6, $t0, $s0  #$t4 = offset do endereco base de A[i]
    sw      $t5, 0($t6)    #guarda o que esta em $t0 em A[i]

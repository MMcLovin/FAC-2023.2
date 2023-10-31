.data

    msg: .asciiz "Ola Mundo\n"

.text

main:

    li		$v0, 4		# $v0 = 4, codigo para a syscall de print 
    la		$a0, msg	# 
    syscall
    
    li		$v0, 10 	# Sv0 = 10, codigo da syscall que encerra o programa 
    syscall
#Kyle Dilbeck 
#practice problem 10 

.data 
	array: .word -74, -30, -1, 0, 6, 8, 12, 23, 85, 99
	array_len: .word 10
	sum: .word 0


.text

main: 
	li $t0, 0 #index
	li $t3, 
	#li $t4, 0 #sum
	la $s0, array
while:
	lw $t1, array_len
	beq $t0, $t1, endwhile

	#get offset 
	mul $t2, 
	 
 
	addi $t0, $t0, 1 # i++;
	j while
endwhile:

exit:
	li $v0, 10 
	syscall
 
	
	
#Kyle Dilbeck 
#practice problem 2

.data 
	
.text

main: 
	li $t0, 3 #t0 = 3
	li $t1, 7 #t1 = 7
	li $t3, 1 #t3 = 1
	li $t4, 0
	slt $t2, $t0, $t1
	
	beq $t2, $t3, if
	
	beq $t2, $t4, else
	
if:
	add $t5, $t1, $t0
	beq $t2, $t3, end
else:
	add $t5, $t0, $t0
	beq $t2, $t4, end
	
end:
	li $v0, 1
	move $a0, $t5
	syscall
exit:# exit cleanly
	li $v0, 10  #exit code for MARS
	syscall
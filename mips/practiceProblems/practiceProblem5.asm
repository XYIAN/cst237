#Kyle Dilbeck 
#practice problem 5 

.data 

.text 

main: 
	li $t0, 10 # $t0 = I(i)->10 
	li $t1, 10 # $t0 = J(j)->10
	li $t2, 10 # $t0 = K(k)->10
	li $t3, 1  # I/J++/--
	
	bne $t0, $t1, subMe
	beq $t0, $t1, match
match:
	beq $t0, $t2, addMe
addMe:
	add $t0, $t0, $t3 
	j exit
	  
	    
subMe:
	sub $t1, $t1, $t3
	j exit 

exit:# exit cleanly
	li $v0, 10  #exit code for MARS
	syscall  
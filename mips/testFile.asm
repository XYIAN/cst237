.data

.text
	li $t5, 16
Main:
	beq $a0, $s0, Main
	sll, $v0, $t3, 10 
	andi $s0, $s3, 255

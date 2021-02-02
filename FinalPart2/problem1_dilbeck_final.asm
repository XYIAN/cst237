#Kyle Dilbeck
#final exam part2 problem 1
#even or odd program

.data
	evenMsg: .asciiz "\nYour number is even!\n"
	oddMsg: .asciiz "\nYour number is odd!\n"
	greet1: .asciiz "\nWelcome to final part2 problem 1 - Kyle Dilbeck"
	greet2: .asciiz "\nPlease enter a number here:"
	greet3: .asciiz "\nWould you like to continue?(Y=0/N=1)"
.text



main:
	#greeting1 
	li $v0, 4
	la $a0, greet1
	syscall
	while:
		#greeting2 
		li $v0, 4
		la $a0, greet2
		syscall	
		#take num input 
		li $v0, 5 
		syscall
		move $t0, $v0 #move input num into register t0
		#add $a0, $v0, $zero
		#jal isEven
		j isEven
		continue:
		#greeting3 
		li $v0, 4
		la $a0, greet3
		syscall
		li $v0, 5 
		syscall
		move $t2, $v0 #move continue num into register t2
		beq $t2, $zero, while
	endwhile:
#########
exit:
	li $v0, 10 
	syscall
#########
isEven:#iseven(int num)
	addi $t4 , $zero, 1
	#test remainder if 0 or 1
	addi $t3, $zero, 2
	div $t0, $t3
	mfhi $t0 #reserved for accessing remainder 
	beq $t0,$zero,evenCase 
	bne $t0,$zero, oddCase
	oddCase:
		#oddMsg 
		li $v0, 4
		la $a0, oddMsg
		syscall
		j continue	
	evenCase:
		#even
		li $v0, 4
		la $a0, evenMsg
		syscall	
		j continue

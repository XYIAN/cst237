#Kyle Dilbeck lab4 cst237
#10/15/20
#M[R[rs]+Sign
#

.data 
	message1: .asciiz "Hello Mr  "
	message2: .asciiz "I like coffee and  "
	message3: .asciiz "We need coffee to "
	message4: .asciiz "secs untill I get caffinated. "
	userInput1: .space 20 
	userInput2: .space 20
	userInput3: .space 20
	userInput4: .space 20
.text
	main:
	#get input as text
	li $v0, 8 # Prepare to take input
	la $a0, userInput1 # Store input into userInput1
	li $a1, 20 # Take in 20 bytes of input
	syscall # Execute
	#get input as text
	li $v0, 8 
	la $a0, userInput2 
	li $a1, 20
	syscall
	#get input as text
	li $v0, 8
	la $a0, userInput3 
	li $a1, 20
	syscall
	#get input as num
	li $v0, 5 
	syscall
	move $t0, $v0 #move input num into register
	#syscall 
	
	#display msg1 
	li $v0, 4
	la $a0, message1
	syscall
	#display input as msgs
	li $v0, 4
	la $a0, userInput1
	syscall
	
	#display msg2 
	li $v0, 4
	la $a0, message2
	syscall
	#display msg input
	li $v0, 4
	la $a0, userInput2
	syscall
	
	#display msg3
	li $v0, 4
	la $a0, message3
	syscall
	#display msg input
	li $v0, 4
	la $a0, userInput3
	syscall
	
	#display num input
	li $v0, 1
	move $a0, $t0
	syscall
	#display msg4 
	li $v0, 4
	la $a0, message4
	syscall
	#end main @ v0 syscall(exec)
	li $v0, 10
	syscall 

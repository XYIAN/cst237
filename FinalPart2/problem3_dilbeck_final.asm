#Kyle Dilbeck
#final exam part2 problem 1
#even or odd program

.data
	triPerimMsg: .asciiz "\nThe perimeter of the triangle is\n"
	triAreaMsg: .asciiz "\nThe area of the triangle is\n"
	squarePerimMsg: .asciiz "\nThe perimeter of the square is\n"
	squareAreaMsg: .asciiz "\nThe area of the square is\n"
	cirCirMsg: .asciiz "\nThe circumference of the circle is"
	cirAreaMsg: .asciiz "\nThe area of the circle is"
	greet1: .asciiz "\nWelcome to final part2 problem 1 - Kyle Dilbeck"
	greet2: .asciiz "\nPlease enter a shape(1=Circle, 2=Triangle, 3=Square):"
	greet3: .asciiz "\nWould you like to continue?(Y=0/N=1)"
	greet4: .asciiz "\nPlease enter a value:"
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
		move $s0, $v0 #move input num into register t0
		beq $s0, 1, circCir
		beq $s0, 2, triPerim
		beq $s0, 3, squarePerim
		
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
squarePerim:
	addi $s1, $zero, 0
	#use add.d
	add $s1, $s0, $s0
	add $s1, $s0, $s0
	li $v0, 4
	la $a0, squarePerimMsg
	syscall
	li $v0, 1       
	li $s1, 5       # $integer to print
	syscall 
	j squareArea
squareArea:
	#area = bxh 
	#lb $s3, $t0
	#mult $s3, $t0
	li $v0, 4
	la $a0, squareAreaMsg
	syscall
	li $v0, 1       
	li $s1, 5       # $integer to print
	syscall 
	j continue
circCir:
	
	li $v0, 4
	la $a0, cirCirMsg
	syscall
	li $v0, 1       
	li $s1, 5       # $integer to print
	syscall 
	j circArea
circArea:
	
	li $v0, 4
	la $a0, cirAreaMsg
	syscall
	li $v0, 1       
	li $s1, 5       # $integer to print
	syscall 
	j continue
triPerim:
	
	li $v0, 4
	la $a0, triPerimMsg
	syscall
	li $v0, 1       
	li $s1, 5       # $integer to print
	syscall 
	j triArea
triArea:
	
	li $v0, 4
	la $a0, triPerimMsg
	syscall
	li $v0, 1       
	li $s1, 5       # $integer to print
	syscall 
	j continue
	

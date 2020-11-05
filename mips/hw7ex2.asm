# Kyle Dilbeck 10/24/20
# hw7ex2.asm--  
# ******************** Homework 7 Exercise 2 ******************** # 
# This program will collect the following user information and 
# display it back to the user in this format. 
# Each string will allow for 32 characters: 
# First Name: yourfirstname 
# Last Name: yourlastname 
# Date of Birth: 1/1/1911 #
# ******************** User Profile ******************** # 


.data   				# GLOBAL VARIABLES go in the data segment     
	message1: .asciiz "   First Name: "
	message2: .asciiz "    Last Name: "
	message3: .asciiz "Date of Birth: "
	message4: .asciiz "/"
	firstName: .space 20
	lastName: .space 20  
	

.text   				# All instructions go in the text segment 



# ***Begin the Main Program*** 

main:   

# Collect the user’s first name 
	li $v0, 8 # Prepare to take input
	la $a0, firstName # Store input into firstName
	li $a1, 20 # Take in 20 bytes of input
	syscall # Execute
   
# Collect the user’s last name
	li $v0, 8 # Prepare to take input
	la $a0, lastName # Store input into lastName
	li $a1, 20 # Take in 20 bytes of input
	syscall # Execute

# Collect the month number of the user’s birthday
	li $v0, 5 
	syscall
	move $t0, $v0 
# Collect the day number of the user’s birthday
	li $v0, 5 
	syscall
	move $t1, $v0 #move input num into register

# Collect the year number of the user’s birthday
	li $v0, 5 
	syscall
	move $t2, $v0 #move input num into register

# Print out the user’s first name
	li $v0, 4
	la $a0, message1
	syscall
	li $v0, 4
	la $a0, firstName
	syscall

# Print out the user’s last name
	li $v0, 4
	la $a0, message2
	syscall
	li $v0, 4
	la $a0, lastName
	syscall

# Print out the user’s birthday
	li $v0, 4
	la $a0, message3
	syscall
	li $v0, 1
	move $a0, $t0
	syscall
	li $v0, 4
	la $a0, message4
	syscall
	li $v0, 1
	move $a0, $t1
	syscall
	li $v0, 4
	la $a0, message4
	syscall
	li $v0, 1
	move $a0, $t2
	syscall

 
# ** terminate program **  
li $v0, 10     
syscall 
# ***End the Main Program*** 

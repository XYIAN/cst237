# Kyle Dilbeck 10/24/20 
# hw7ex1.asm--  
# ******************** Homework 7 Exercise 1 ******************** # 
# Program performs the following mathematical operation: 
#  f = (g + h) - (j - 12) 
# where: g = 12, h = 3, j = 27 
# 
# --Global Variables: # * print = Print out message - "f = " 
# ******************** Math Operations ******************** # 

.data   			# GLOBAL VARIABLES go in the data segment     
   message1: .asciiz "f = "
   
.text   			# All instructions go in the text segment 
	

# ***Begin the Main Program*** 

main:  
# f =  $s0  
# g = 12 -> g = $t0 
# h = 3 -> h = $t1  
# j = 27 -> j = $t2
# f = (g + h) - (j - 12)
li $t0, 12
li $t1, 3
li $t2, 27 
# $t3 = (j - 12)    
sub $t3, $t2, $t0
# $t4 =  (g + h)    
add $t4, $t0, $t1
# f = $t4 - $t3    
sub $s0, $t4, $t3
# print out "f = " and $s0 
li $v0, 4
la $a0, message1
syscall
li $v0, 1
move $a0, $s0
syscall

# ** terminate program ** 
li $v0, 10     
syscall 
# ***End the Main Program***

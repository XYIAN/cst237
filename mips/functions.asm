#KYle Dilbeck 
#inclass notes - functions in mips 

.data 
	array: .word 1,2,3,4,5,6,7,8 
	comma: .asciiz ", "
	grt: .asciiz "OUTPUT: "
	array_length: .word 8
	print_length: .word 7
.text 
# $ra = return address 
#link used for function call vs jump 
#
main: #int main(){ 
# Collect user input number to convert 
	li $v0, 5 
	syscall
	move $t0, $v0 
# Collect the users input for base number 
	li $v0, 5 
	syscall
	move $t1, $v0 
li $s0, 10#int d = 10;
move $a0, $s0 
jal convert #foo(d) 
#$ra #return address
add $s0, $v0, $zero #d=foo(d)

convert:
#int foobar
#return foobar
	
jr $ra 
.globl _start
.text

#result should be 0x3 = (3)10
_start:
	addi a0, zero, 12
	addi a1, zero, 9
	jal ra, ggt
	ebreak

ggt:
	# your code goes here
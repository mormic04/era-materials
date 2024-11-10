.globl _start
.text

#result should be 0x3 = (3)10
_start:
	addi a0, zero, 12
	addi a1, zero, 9
	jal ra, ggt
	ebreak

ggt:
	beq a0, a1, return_a
	bltu a0, a1, smaller
	sub a0, a0, a1
	jal zero, ggt

smaller:
	sub a1, a1, a0
	jal zero, ggt

return_a:
	jalr zero, 0(ra)
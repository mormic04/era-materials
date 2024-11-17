.globl _start
.text

#result should be 0x3 = (3)10
_start:
	addi a0, zero, 12
	addi a1, zero, 9
	jal ra, ggt
	ebreak

ggT:
	beq a0, a1, finished
	bltu a0, a1, lt
	sub a0, a0, a1
	j cont

lt:
	sub a1, a1, a0

cont:
	addi sp, sp, -16
	sw ra, 0(sp)
	jal ra, ggT
	lw ra, 0(sp)
	addi sp, sp, 16

finished:
	jalr zero, 0(ra)
.globl _start
.text

#should return 0x179 = (377)10
_start:
	addi a0, zero, 5
	jal ra, folge
	ebreak

folge:
	beq a0, zero, break
	addi sp, sp, -16
	sw ra, 0(sp)
	sw a0, 4(sp)
	addi a0, a0, -1
	jal ra, folge
	slli a0, a0, 1
	lw t0, 4(sp)
	add a0, a0, t0
	lw ra, 0(sp)
	addi sp, sp, 16
	jalr zero, 0(ra)

break:
	addi a0, zero, 10
	jalr zero, 0(ra)
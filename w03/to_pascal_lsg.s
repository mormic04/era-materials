#pragma qtrvsim show registers
#pragma qtrvsim show program
#pragma qtrvsim show memory
#pragma qtrvsim focus memory 0x400

.org 0x400
.data

example: .asciz "I <3 ERA!"

.org 0x200
.text
# load startaddr of example
la a0, example

# your code starts here

to_pascal:
	add t2, zero, zero ; t2: previous element
	addi t1, zero, 0 ; length counter
	add t3, zero, a0 ; store start address
	lb t0, 0(t3) ; current element
loop:
	sb t2, 0(t3) ; store previous element at current place
	beq t0, zero, finished ; if 0 goto finished
	addi t1, t1, 1 ; not zero => length+=1
	addi t3, t3, 1 ; increment pointer
	addi t2, t0, 0 ; old current is now previous
	lb t0, 0(t3) ; get new current element
	j loop
finished:
	sb t1, 0(a0) ; store length at 0. byte
	jalr zero, 0(ra) ; return
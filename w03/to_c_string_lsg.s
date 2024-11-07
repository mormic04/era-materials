#pragma qtrvsim show registers
#pragma qtrvsim show program
#pragma qtrvsim show memory
#pragma qtrvsim focus memory 0x400

.org 0x400
.data

example: .byte 0x9 
		 .ascii "I <3 ERA!"

.org 0x200
.text
# load startaddr of example
la a0, example

# your code starts here

to_c_string:
	; Länge in nulltem Byte (unsigned)
	lbu t0, 0(a0) ; loop counter in t0
	addi a0, a0, 1 # increment byte address
loop:
	beq t0, zero, finished # lenght is zero
	lb t1, 0(a0) # load nth byte
	sb t1, -1(a0) # save it to n-1
	addi a0, a0, 1 # increment byte addr
	addi t0, t0, -1 # decrement loop counter (str len)
	j loop
finished:
	sb zero, -1(a0) # write NULL-Byte to the end
	jalr zero, 0(ra)
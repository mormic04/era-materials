.globl _start
.text

#should return 0x179 = (377)10
_start:
	addi a0, zero, 5
	jal ra, folge
	ebreak
    
folge:
	#your code goes here
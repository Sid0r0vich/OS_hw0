.data

msg: .asciz "Sum is %d\n"

.text
.global main

main:
	li a7, 22
	li a0, 1
	li a1, 2
	ecall

	move a1, a0
	la a0, msg
	call printf

	li a7, 2
	li a0, 0
	ecall

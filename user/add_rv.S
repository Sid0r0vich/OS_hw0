.data

#define BUFF_LEN 22
#define SPACE 32
#define STREND 0
#define SYS_exit 2

buff: .zero BUFF_LEN

error1_msg: .asciz "There is no space!\n"
error2_msg: .asciz "Arguments must be integers!\n"
error3_msg: .asciz "Arguments must be integers separated with space!\n"
error4_msg: .asciz "Function get more than two arguments!\n"
strdigit: .asciz "%d\n"
debug_msg: .asciz "debug\n"

.text
.global main

main:
    la a0, buff
    li a1, BUFF_LEN
    call gets

    la a0, buff
    li a1, SPACE
    call strchr
    move s3, a0

    # errors
	bne s3, x0, pass_error1
	li a0, 2
	la a1, error1_msg
	call fprintf
	jal exit
	
pass_error1:

	move s5, s3
	move s0, s3
	addi s0, s0, 1
	move a0, s0
	call strlen
	move s0, a0

	li s1, 10
	blt s1, s0, throw_error2

	la s0, buff
	sub s5, s5, s0
	blt s1, s5, throw_error2

	jal pass_error2

throw_error2:

	li a0, 2
	la a1, error2_msg
	call fprintf
	jal exit

pass_error2:

	la s1, buff
	jal loop1

loop_incr:

	addi s1, s1, 1
	
loop1:

	lb s2, 0(s1)
	beq s2, x0, break
		
	li s0, 32
	beq s0, s2, loop_incr

	li s0, 10
	beq s0, s2, loop_incr
	
	li s0, 57
	blt s0, s2, throw_error3

	li s0, 48
	blt s2, s0, throw_error3

	jal loop_incr

throw_error3:

	li a0, 2
	la a1, error3_msg
	call fprintf
	jal exit
	
break:

	move s0, s3
	addi s0, s0, 1
	move a0, s0
	li a1, 32
	call strchr

	beq a0, x0, pass_error4
	li a0, 2
	la a1, error4_msg
	call fprintf
	jal exit

pass_error4:
    
    li s4, STREND
    sb s4, 0(s3)
    addi s3, s3, 1

    la a0, buff
    call atoi
    move s0, a0

    move a0, s3
    call atoi
    move s1, a0

    add s2, s1, s0

    la a0, strdigit
    move a1, s2
    call printf

    li a7, 2
    li a0, 0
    ecall

exit:
    li a7, SYS_exit
    ecall

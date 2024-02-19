.data

#define BUFF_LEN 22
#define SPACE 32
#define STREND 0

buff: .zero BUFF_LEN

error1_msg: .asciz "There is no space!\n"
error2_msg: .asciz "Arguments must be integers!\n"
error3_msg: .asciz "Arguments must be integers separated with space!\n"
error4_msg: .asciz "Function get more than two arguments!\n"
strdigit: .asciz "%d\n"

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
	
pass_error1:
    
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

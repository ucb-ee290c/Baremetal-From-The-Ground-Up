	.file	"main.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.type	simpleDelay, @function
simpleDelay:
	addi	sp,sp,-32
	sd	s0,24(sp)
	addi	s0,sp,32
	sw	zero,-20(s0)
	j	.L2
.L3:
 #APP
# 16 "./main.c" 1
	nop
# 0 "" 2
 #NO_APP
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L2:
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,999424
	addi	a5,a5,575
	ble	a4,a5,.L3
	nop
	nop
	ld	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	simpleDelay, .-simpleDelay
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-16
	sd	ra,8(sp)
	sd	s0,0(sp)
	addi	s0,sp,16
	li	a5,268500992
	li	a4,1
	sw	a4,0(a5)
.L5:
	li	a5,268500992
	lw	a5,0(a5)
	sext.w	a4,a5
	li	a5,268500992
	ori	a4,a4,1
	sext.w	a4,a4
	sw	a4,0(a5)
	call	simpleDelay
	li	a5,268500992
	lw	a5,0(a5)
	sext.w	a4,a5
	li	a5,268500992
	andi	a4,a4,-2
	sext.w	a4,a4
	sw	a4,0(a5)
	call	simpleDelay
	j	.L5
	.size	main, .-main
	.ident	"GCC: (SiFive GCC-Metal 10.2.0-2020.12.8) 10.2.0"

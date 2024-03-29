	.file	"main.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.globl	GPIO_PIN
	.section	.srodata,"a"
	.align	2
	.type	GPIO_PIN, @object
	.size	GPIO_PIN, 4
GPIO_PIN:
	.word	1
	.globl	counter
	.section	.sbss,"aw",@nobits
	.align	2
	.type	counter, @object
	.size	counter, 4
counter:
	.zero	4
	.text
	.align	1
	.globl	delay
	.type	delay, @function
delay:
	addi	sp,sp,-48
	sd	s0,40(sp)
	addi	s0,sp,48
	mv	a5,a0
	sw	a5,-36(s0)
	nop
.L2:
	li	a5,33603584
	addi	a5,a5,-8
	lw	a5,0(a5)
	sext.w	a4,a5
	lw	a5,-20(s0)
	subw	a5,a4,a5
# ...
# more contents omitted
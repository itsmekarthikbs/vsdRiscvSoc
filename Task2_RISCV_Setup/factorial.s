	.file	"factorial.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	factorial
	.type	factorial, @function
factorial:
	li	a4,0
	blt	a0,zero,.L1
	beq	a0,zero,.L5
	li	a5,1
	li	a4,1
.L3:
	mul	a4,a4,a5
	addi	a5,a5,1
	sext.w	a3,a5
	bge	a0,a3,.L3
.L1:
	mv	a0,a4
	ret
.L5:
	li	a4,1
	j	.L1
	.size	factorial, .-factorial
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-16
	sd	ra,8(sp)
	li	a5,1
	li	a2,1
	li	a4,11
.L9:
	mul	a2,a2,a5
	addi	a5,a5,1
	bne	a5,a4,.L9
	lui	a0,%hi(.LC0)
	li	a1,10
	addi	a0,a0,%lo(.LC0)
	call	printf
	lui	a1,%hi(.LC1)
	lui	a0,%hi(.LC2)
	addi	a1,a1,%lo(.LC1)
	addi	a0,a0,%lo(.LC2)
	call	printf
	lui	a1,%hi(.LC3)
	lui	a0,%hi(.LC4)
	addi	a1,a1,%lo(.LC3)
	addi	a0,a0,%lo(.LC4)
	call	printf
	lui	a1,%hi(.LC5)
	lui	a0,%hi(.LC6)
	addi	a1,a1,%lo(.LC5)
	addi	a0,a0,%lo(.LC6)
	call	printf
	lui	a1,%hi(.LC7)
	lui	a0,%hi(.LC8)
	addi	a1,a1,%lo(.LC7)
	addi	a0,a0,%lo(.LC8)
	call	printf
	lui	a1,%hi(.LC9)
	lui	a0,%hi(.LC10)
	addi	a1,a1,%lo(.LC9)
	addi	a0,a0,%lo(.LC10)
	call	printf
	ld	ra,8(sp)
	li	a0,0
	addi	sp,sp,16
	jr	ra
	.size	main, .-main
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"Factorial of %d = %llu\n"
.LC1:
	.string	"${U}"
	.zero	3
.LC2:
	.string	"User: %s\n"
	.zero	6
.LC3:
	.string	"${H}"
	.zero	3
.LC4:
	.string	"Host: %s\n"
	.zero	6
.LC5:
	.string	"${M}"
	.zero	3
.LC6:
	.string	"Machine ID: %s\n"
.LC7:
	.string	"${T}"
	.zero	3
.LC8:
	.string	"Timestamp: %s\n"
	.zero	1
.LC9:
	.string	"${E}"
	.zero	3
.LC10:
	.string	"Epoch Time: %s\n"
	.ident	"GCC: (SiFive GCC 8.3.0-2019.08.0) 8.3.0"

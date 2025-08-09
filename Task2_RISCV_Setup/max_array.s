	.file	"max_array.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	find_max
	.type	find_max, @function
find_max:
	li	a4,1
	mv	a5,a0
	lw	a0,0(a0)
	ble	a1,a4,.L2
	addiw	a3,a1,-2
	slli	a3,a3,32
	addi	a4,a5,8
	srli	a3,a3,30
	addi	a5,a5,4
	add	a3,a3,a4
.L4:
	lw	a4,0(a5)
	addi	a5,a5,4
	bge	a4,a0,.L3
	mv	a4,a0
.L3:
	mv	a0,a4
	bne	a5,a3,.L4
.L2:
	ret
	.size	find_max, .-find_max
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	ld	a4,0(a5)
	ld	a3,16(a5)
	ld	a1,8(a5)
	ld	a5,24(a5)
	addi	sp,sp,-48
	srli	a2,a4,32
	sd	a3,16(sp)
	sd	a5,24(sp)
	sd	ra,40(sp)
	sd	a4,0(sp)
	sd	a1,8(sp)
	sext.w	a3,a2
	li	a5,12
	bge	a3,a5,.L8
	li	a2,12
	li	a3,12
.L8:
	lw	a5,8(sp)
	sext.w	a4,a5
	bge	a4,a3,.L9
	sext.w	a4,a2
	mv	a5,a4
.L9:
	lw	a3,12(sp)
	sext.w	a2,a3
	bge	a2,a4,.L10
	sext.w	a2,a5
	mv	a3,a2
.L10:
	lw	a5,16(sp)
	sext.w	a4,a5
	bge	a4,a2,.L11
	sext.w	a4,a3
	mv	a5,a4
.L11:
	lw	a3,20(sp)
	sext.w	a2,a3
	bge	a2,a4,.L12
	sext.w	a2,a5
	mv	a3,a2
.L12:
	lw	a5,24(sp)
	sext.w	a4,a5
	bge	a4,a2,.L13
	sext.w	a4,a3
	mv	a5,a4
.L13:
	lw	a1,28(sp)
	bge	a1,a4,.L14
	sext.w	a1,a5
.L14:
	lui	a0,%hi(.LC1)
	addi	a0,a0,%lo(.LC1)
	call	printf
	lui	a1,%hi(.LC2)
	lui	a0,%hi(.LC3)
	addi	a1,a1,%lo(.LC2)
	addi	a0,a0,%lo(.LC3)
	call	printf
	lui	a1,%hi(.LC4)
	lui	a0,%hi(.LC5)
	addi	a1,a1,%lo(.LC4)
	addi	a0,a0,%lo(.LC5)
	call	printf
	lui	a1,%hi(.LC6)
	lui	a0,%hi(.LC7)
	addi	a1,a1,%lo(.LC6)
	addi	a0,a0,%lo(.LC7)
	call	printf
	lui	a1,%hi(.LC8)
	lui	a0,%hi(.LC9)
	addi	a1,a1,%lo(.LC8)
	addi	a0,a0,%lo(.LC9)
	call	printf
	lui	a1,%hi(.LC10)
	lui	a0,%hi(.LC11)
	addi	a1,a1,%lo(.LC10)
	addi	a0,a0,%lo(.LC11)
	call	printf
	ld	ra,40(sp)
	li	a0,0
	addi	sp,sp,48
	jr	ra
	.size	main, .-main
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
.LC0:
	.word	12
	.word	45
	.word	7
	.word	89
	.word	34
	.word	56
	.word	99
	.word	23
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC1:
	.string	"Maximum value in array = %d\n"
	.zero	3
.LC2:
	.string	"${U}"
	.zero	3
.LC3:
	.string	"User: %s\n"
	.zero	6
.LC4:
	.string	"${H}"
	.zero	3
.LC5:
	.string	"Host: %s\n"
	.zero	6
.LC6:
	.string	"${M}"
	.zero	3
.LC7:
	.string	"Machine ID: %s\n"
.LC8:
	.string	"${T}"
	.zero	3
.LC9:
	.string	"Timestamp: %s\n"
	.zero	1
.LC10:
	.string	"${E}"
	.zero	3
.LC11:
	.string	"Epoch Time: %s\n"
	.ident	"GCC: (SiFive GCC 8.3.0-2019.08.0) 8.3.0"

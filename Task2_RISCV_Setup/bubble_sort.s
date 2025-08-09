	.file	"bubble_sort.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	bubble_sort
	.type	bubble_sort, @function
bubble_sort:
	addiw	a1,a1,-1
	ble	a1,zero,.L1
	addi	a6,a0,4
.L3:
	addiw	a1,a1,-1
	slli	a2,a1,32
	srli	a2,a2,30
	mv	a5,a0
	add	a2,a2,a6
.L5:
	lw	a4,0(a5)
	lw	a3,4(a5)
	ble	a4,a3,.L4
	sw	a3,0(a5)
	sw	a4,4(a5)
.L4:
	addi	a5,a5,4
	bne	a5,a2,.L5
	bne	a1,zero,.L3
.L1:
	ret
	.size	bubble_sort, .-bubble_sort
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	ld	a2,0(a5)
	ld	a3,8(a5)
	ld	a4,16(a5)
	lw	a5,24(a5)
	lui	a0,%hi(.LC1)
	addi	sp,sp,-80
	addi	a0,a0,%lo(.LC1)
	sd	s0,64(sp)
	sd	s1,56(sp)
	sd	s2,48(sp)
	sd	s3,40(sp)
	sd	ra,72(sp)
	sd	a2,0(sp)
	sd	a3,8(sp)
	sd	a4,16(sp)
	sw	a5,24(sp)
	mv	s0,sp
	call	printf
	addi	s2,sp,28
	mv	s1,sp
	lui	s3,%hi(.LC2)
.L12:
	lw	a1,0(s1)
	addi	a0,s3,%lo(.LC2)
	addi	s1,s1,4
	call	printf
	bne	s1,s2,.L12
	li	a0,10
	call	putchar
	mv	a0,sp
	li	a1,7
	call	bubble_sort
	lui	a0,%hi(.LC3)
	addi	a0,a0,%lo(.LC3)
	call	printf
.L13:
	lw	a1,0(s0)
	addi	a0,s3,%lo(.LC2)
	addi	s0,s0,4
	call	printf
	bne	s0,s2,.L13
	li	a0,10
	call	putchar
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
	lui	a1,%hi(.LC12)
	lui	a0,%hi(.LC13)
	addi	a1,a1,%lo(.LC12)
	addi	a0,a0,%lo(.LC13)
	call	printf
	ld	ra,72(sp)
	ld	s0,64(sp)
	ld	s1,56(sp)
	ld	s2,48(sp)
	ld	s3,40(sp)
	li	a0,0
	addi	sp,sp,80
	jr	ra
	.size	main, .-main
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
.LC0:
	.word	64
	.word	34
	.word	25
	.word	12
	.word	22
	.word	11
	.word	90
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC1:
	.string	"Original array: "
	.zero	7
.LC2:
	.string	"%d "
	.zero	4
.LC3:
	.string	"Sorted array: "
	.zero	1
.LC4:
	.string	"${U}"
	.zero	3
.LC5:
	.string	"User: %s\n"
	.zero	6
.LC6:
	.string	"${H}"
	.zero	3
.LC7:
	.string	"Host: %s\n"
	.zero	6
.LC8:
	.string	"${M}"
	.zero	3
.LC9:
	.string	"Machine ID: %s\n"
.LC10:
	.string	"${T}"
	.zero	3
.LC11:
	.string	"Timestamp: %s\n"
	.zero	1
.LC12:
	.string	"${E}"
	.zero	3
.LC13:
	.string	"Epoch Time: %s\n"
	.ident	"GCC: (SiFive GCC 8.3.0-2019.08.0) 8.3.0"

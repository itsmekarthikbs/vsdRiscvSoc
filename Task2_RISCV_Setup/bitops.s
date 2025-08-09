	.file	"bitops.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	set_bit
	.type	set_bit, @function
set_bit:
	li	a5,1
	sllw	a1,a5,a1
	or	a0,a0,a1
	sext.w	a0,a0
	ret
	.size	set_bit, .-set_bit
	.align	1
	.globl	clear_bit
	.type	clear_bit, @function
clear_bit:
	li	a5,1
	sllw	a1,a5,a1
	not	a1,a1
	and	a0,a1,a0
	sext.w	a0,a0
	ret
	.size	clear_bit, .-clear_bit
	.align	1
	.globl	toggle_bit
	.type	toggle_bit, @function
toggle_bit:
	li	a5,1
	sllw	a1,a5,a1
	xor	a0,a0,a1
	sext.w	a0,a0
	ret
	.size	toggle_bit, .-toggle_bit
	.align	1
	.globl	check_bit
	.type	check_bit, @function
check_bit:
	srlw	a0,a0,a1
	andi	a0,a0,1
	ret
	.size	check_bit, .-check_bit
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
	lui	a0,%hi(.LC0)
	addi	sp,sp,-16
	li	a1,10
	addi	a0,a0,%lo(.LC0)
	sd	ra,8(sp)
	call	printf
	lui	a0,%hi(.LC1)
	li	a1,10
	addi	a0,a0,%lo(.LC1)
	call	printf
	lui	a0,%hi(.LC2)
	li	a1,2
	addi	a0,a0,%lo(.LC2)
	call	printf
	lui	a0,%hi(.LC3)
	li	a1,3
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
	lui	a1,%hi(.LC12)
	lui	a0,%hi(.LC13)
	addi	a1,a1,%lo(.LC12)
	addi	a0,a0,%lo(.LC13)
	call	printf
	lui	a1,%hi(.LC14)
	lui	a0,%hi(.LC15)
	addi	a1,a1,%lo(.LC14)
	addi	a0,a0,%lo(.LC15)
	call	printf
	ld	ra,8(sp)
	li	a0,0
	addi	sp,sp,16
	jr	ra
	.size	main, .-main
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"Initial: %u\n"
	.zero	3
.LC1:
	.string	"After setting bit 1: %u\n"
	.zero	7
.LC2:
	.string	"After clearing bit 3: %u\n"
	.zero	6
.LC3:
	.string	"After toggling bit 0: %u\n"
	.zero	6
.LC4:
	.string	"CLEAR"
	.zero	2
.LC5:
	.string	"Bit 2 is %s\n"
	.zero	3
.LC6:
	.string	"${U}"
	.zero	3
.LC7:
	.string	"User: %s\n"
	.zero	6
.LC8:
	.string	"${H}"
	.zero	3
.LC9:
	.string	"Host: %s\n"
	.zero	6
.LC10:
	.string	"${M}"
	.zero	3
.LC11:
	.string	"Machine ID: %s\n"
.LC12:
	.string	"${T}"
	.zero	3
.LC13:
	.string	"Timestamp: %s\n"
	.zero	1
.LC14:
	.string	"${E}"
	.zero	3
.LC15:
	.string	"Epoch Time: %s\n"
	.ident	"GCC: (SiFive GCC 8.3.0-2019.08.0) 8.3.0"

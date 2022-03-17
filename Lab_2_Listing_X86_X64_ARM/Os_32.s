	.file	"main.cpp"
	.text
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB1738:
	.cfi_startproc
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	movl	%esp, %ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	pushl	%ebx
	.cfi_escape 0x10,0x3,0x2,0x75,0x7c
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x78,0x6
	subl	$16, %esp
	movaps	.LC1@GOTOFF(%ebx), %xmm0
	fldl	.LC0@GOTOFF(%ebx)
	movaps	%xmm0, %xmm1
	movd	%xmm0, %eax
	psrlq	$32, %xmm1
	movd	%xmm1, %edx
	fld	%st(0)
.L2:
	fld	%st(1)
	movl	%eax, -16(%ebp)
	movaps	.LC2@GOTOFF(%ebx), %xmm1
	fchs
	movl	%edx, -12(%ebp)
	fmul	%st(1), %st
	paddq	%xmm1, %xmm0
	fildq	-16(%ebp)
	movaps	%xmm0, %xmm1
	movd	%xmm0, %ecx
	psrlq	$32, %xmm1
	movd	%xmm0, %eax
	xorl	$2000000000, %ecx
	movd	%xmm1, %edx
	fdivrp	%st, %st(1)
	orl	%edx, %ecx
	faddp	%st, %st(2)
	jne	.L2
	fstp	%st(0)
	subl	$12, %esp
	fstpt	(%esp)
	pushl	_ZSt4cout@GOT(%ebx)
	call	_ZNSo9_M_insertIeEERSoT_@PLT
	movl	%eax, (%esp)
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	leal	-8(%ebp), %esp
	xorl	%eax, %eax
	popl	%ecx
	.cfi_restore 1
	.cfi_def_cfa 1, 0
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	leal	-4(%ecx), %esp
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1738:
	.size	main, .-main
	.type	_GLOBAL__sub_I_main, @function
_GLOBAL__sub_I_main:
.LFB2226:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	subl	$12, %esp
	leal	_ZStL8__ioinit@GOTOFF(%ebx), %esi
	pushl	%esi
	call	_ZNSt8ios_base4InitC1Ev@PLT
	addl	$12, %esp
	leal	__dso_handle@GOTOFF(%ebx), %eax
	pushl	%eax
	pushl	%esi
	pushl	_ZNSt8ios_base4InitD1Ev@GOT(%ebx)
	call	__cxa_atexit@PLT
	addl	$16, %esp
	leal	-8(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2226:
	.size	_GLOBAL__sub_I_main, .-_GLOBAL__sub_I_main
	.section	.init_array,"aw"
	.align 4
	.long	_GLOBAL__sub_I_main
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	1202590843
	.long	1065646817
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC1:
	.long	2
	.long	0
	.long	0
	.long	0
	.align 16
.LC2:
	.long	1
	.long	0
	.long	0
	.long	0
	.section	.text.__x86.get_pc_thunk.bx,"axG",@progbits,__x86.get_pc_thunk.bx,comdat
	.globl	__x86.get_pc_thunk.bx
	.hidden	__x86.get_pc_thunk.bx
	.type	__x86.get_pc_thunk.bx, @function
__x86.get_pc_thunk.bx:
.LFB2230:
	.cfi_startproc
	movl	(%esp), %ebx
	ret
	.cfi_endproc
.LFE2230:
	.hidden	__dso_handle
	.ident	"GCC: (GNU) 11.1.0"
	.section	.note.GNU-stack,"",@progbits

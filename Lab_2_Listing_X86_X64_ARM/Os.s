	.file	"main.cpp"
	.text
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB1743:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	fldl	.LC0(%rip)
	movl	$2, %eax
	fld	%st(0)
.L2:
	fld	%st(1)
	movq	%rax, 8(%rsp)
	incq	%rax
	fchs
	fmul	%st(1), %st
	fildq	8(%rsp)
	fdivrp	%st, %st(1)
	faddp	%st, %st(2)
	cmpq	$2000000000, %rax
	jne	.L2
	fstp	%st(0)
	pushq	%rax
	.cfi_def_cfa_offset 40
	leaq	_ZSt4cout(%rip), %rdi
	pushq	%rax
	.cfi_def_cfa_offset 48
	fstpt	(%rsp)
	call	_ZNSo9_M_insertIeEERSoT_@PLT
	popq	%rdx
	.cfi_def_cfa_offset 40
	popq	%rcx
	.cfi_def_cfa_offset 32
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	xorl	%eax, %eax
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE1743:
	.size	main, .-main
	.type	_GLOBAL__sub_I_main, @function
_GLOBAL__sub_I_main:
.LFB2231:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leaq	_ZStL8__ioinit(%rip), %rbp
	movq	%rbp, %rdi
	call	_ZNSt8ios_base4InitC1Ev@PLT
	movq	_ZNSt8ios_base4InitD1Ev@GOTPCREL(%rip), %rdi
	movq	%rbp, %rsi
	popq	%rbp
	.cfi_def_cfa_offset 8
	leaq	__dso_handle(%rip), %rdx
	jmp	__cxa_atexit@PLT
	.cfi_endproc
.LFE2231:
	.size	_GLOBAL__sub_I_main, .-_GLOBAL__sub_I_main
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I_main
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	1202590843
	.long	1065646817
	.hidden	__dso_handle
	.ident	"GCC: (GNU) 11.1.0"
	.section	.note.GNU-stack,"",@progbits

	.file	"main.cpp"
	.text
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB1764:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	$2, %eax@присваиваем двойку счетчику
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	fldl	.LC0(%rip)@два раза пушим вещественное число
	fld	%st(0)
	.p2align 4,,10
	.p2align 3
.L2:
	fld	%st(0)@пушим значение элемента начала стека
	movq	%rax, 8(%rsp)@копируем значение счетчика
	addq	$1, %rax@добавляем единицу счетчику
	fchs@ меняем знак
	fmul	%st(2), %st@перемножаем
	fildq	8(%rsp)@переводим из целого в вещественное
	fdivrp	%st, %st(1)@делим
	faddp	%st, %st(1)@складываем
	cmpq	$2000000000, %rax@сравниваем
	jne	.L2
	fstp	%st(1)@копируем
	subq	$16, %rsp@вычитаем
	.cfi_def_cfa_offset 64
	leaq	_ZSt4cout(%rip), %rdi
	fstpt	(%rsp)@копируем
	call	_ZNSo9_M_insertIeEERSoT_@PLT
	movq	%rax, %rbp
	movq	(%rax), %rax
	movq	-24(%rax), %rax
	movq	240(%rbp,%rax), %r12
	popq	%rax
	.cfi_def_cfa_offset 56
	popq	%rdx
	.cfi_def_cfa_offset 48
	testq	%r12, %r12
	je	.L9
	cmpb	$0, 56(%r12)
	je	.L4
	movzbl	67(%r12), %eax
.L5:
	movq	%rbp, %rdi
	movsbl	%al, %esi
	call	_ZNSo3putEc@PLT
	movq	%rax, %rdi
	call	_ZNSo5flushEv@PLT
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L4:
	.cfi_restore_state
	movq	%r12, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%r12), %rax
	movl	$10, %esi
	movq	%r12, %rdi
	call	*48(%rax)
	jmp	.L5
.L9:
	call	_ZSt16__throw_bad_castv@PLT
	.cfi_endproc
.LFE1764:
	.size	main, .-main
	.p2align 4
	.type	_GLOBAL__sub_I_main, @function
_GLOBAL__sub_I_main:
.LFB2252:
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
.LFE2252:
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

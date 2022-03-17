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
	movl	$2, %eax@присваиваем регистру хранения промежуточных данных
	pushq	%rbp@пушим адрес начала локальных переменных текущей программы
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	subq	$24, %rsp@отнимаем из указателя вершины стека
	.cfi_def_cfa_offset 48
	fldl	.LC0(%rip)@пушим на стек сопроцессора два вещественных числа
	fldl	.LC1(%rip)
	.p2align 4,,10
	.p2align 3
.L2:
	fld	%st(1)@пушим второй элемент стека
	movq	%rax, 8(%rsp)
	addq	$1, %rax
	fmul	%st(1), %st
	fildq	8(%rsp)
	fdivrp	%st, %st(1)
	faddp	%st, %st(2)
	cmpq	$2000000000, %rax
	jne	.L2
	fstp	%st(0)@копирует
	subq	$16, %rsp@вычитаем
	.cfi_def_cfa_offset 64
	leaq	_ZSt4cout(%rip), %rdi@присваиваем адрес в строке приемнике
	fstpt	(%rsp)@копируем в указатель начала стека
	call	_ZNSo9_M_insertIeEERSoT_@PLT производим переход к подпрограмме ввода-вывода
	movq	%rax, %rbp@присваиваем
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
	.align 8
.LC1:
	.long	1202590843
	.long	-1081836831
	.hidden	__dso_handle
	.ident	"GCC: (GNU) 11.1.0"
	.section	.note.GNU-stack,"",@progbits

	.file	"main.cpp"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1764:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movl	$2, %eax @присваиваем счетчику начальное значение
	fldl	.LC0(%rip)
	fldl	.LC0(%rip) @два раза кладем на стек начальное значение answer
.L2:
	fld	%st(1) @кладем на стек значение из конца стека
	fchs @меняем его знак
	fmul	%st(1), %st @перемножаем два первых элемента стека
	movq	%rax, 8(%rsp) @присваиваем регистру значение счетчика
	fildq	8(%rsp) @кладем его на стек
	fdivrp	%st, %st(1) @делим
	faddp	%st, %st(2) @складываем
	addq	$1, %rax @добавляем счетчику единицу
	cmpq	$2000000000, %rax @и сравниваем
	jne	.L2
	fstp	%st(0)
	leaq	-16(%rsp), %rsp
	.cfi_def_cfa_offset 48
	fstpt	(%rsp)
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIeEERSoT_@PLT
	movq	%rax, %rdi
	addq	$16, %rsp
	.cfi_def_cfa_offset 32
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
	movl	$0, %eax
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE1764:
	.size	main, .-main
	.type	_GLOBAL__sub_I_main, @function
_GLOBAL__sub_I_main:
.LFB2252:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leaq	_ZStL8__ioinit(%rip), %rbx
	movq	%rbx, %rdi
	call	_ZNSt8ios_base4InitC1Ev@PLT
	leaq	__dso_handle(%rip), %rdx
	movq	%rbx, %rsi
	movq	_ZNSt8ios_base4InitD1Ev@GOTPCREL(%rip), %rdi
	call	__cxa_atexit@PLT
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
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

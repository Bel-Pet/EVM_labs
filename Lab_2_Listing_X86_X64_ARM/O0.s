	.file	"main.cpp"
	.text
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.globl	main
	.type	main, @function
main:
.LFB1729:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	$2000000000, -32(%rbp)
	movsd	.LC0(%rip), %xmm0 @присваиваем векторнуму регистру вещественное число
	movsd	%xmm0, -24(%rbp) @копируем в регистр значение
	fldl	-24(%rbp) @кладем значение в стек сопроцессора
	fstpt	-16(%rbp) @записываем элемент со стека и удаляем его из стека
	movq	$2, -40(%rbp) @присваимаем регистру константу
	jmp	.L2
.L3:
	fldt	-16(%rbp) @кладем на стек сопроцессора
	fchs @меняем знак
	fldl	-24(%rbp) @кладем на стек следующий элемент
	fmulp	%st, %st(1) @перемножаем два элемента на стеке
	fildq	-40(%rbp) @преобразуем операнд из целого в вещественное
	fdivrp	%st, %st(1) @делим
	fldt	-16(%rbp) @кладем следующий элемент на стек
	faddp	%st, %st(1) @складываем элементы на стеке
	fstpt	-16(%rbp) @записываем вершину стека по вычисляемуму адресу
	addq	$1, -40(%rbp) @прибавляем к счетчику единицу
.L2:
	movq	-40(%rbp), %rax @присваем значение из одного регистра в другой
	cmpq	-32(%rbp), %rax @сравниваем значение двух регистров
	jl	.L3
	pushq	-8(%rbp)
	pushq	-16(%rbp)@пушим вычисляемое программой число
	leaq	_ZSt4cout(%rip), %rax
	movq	%rax, %rdi
	call	_ZNSolsEe@PLT
	addq	$16, %rsp
	movq	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSolsEPFRSoS_E@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1729:
	.size	main, .-main
	.type	_Z41__static_initialization_and_destruction_0ii, @function
_Z41__static_initialization_and_destruction_0ii:
.LFB2230:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	cmpl	$1, -4(%rbp)
	jne	.L7
	cmpl	$65535, -8(%rbp)
	jne	.L7
	leaq	_ZStL8__ioinit(%rip), %rax
	movq	%rax, %rdi
	call	_ZNSt8ios_base4InitC1Ev@PLT
	leaq	__dso_handle(%rip), %rax
	movq	%rax, %rdx
	leaq	_ZStL8__ioinit(%rip), %rax
	movq	%rax, %rsi
	movq	_ZNSt8ios_base4InitD1Ev@GOTPCREL(%rip), %rax
	movq	%rax, %rdi
	call	__cxa_atexit@PLT
.L7:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2230:
	.size	_Z41__static_initialization_and_destruction_0ii, .-_Z41__static_initialization_and_destruction_0ii
	.type	_GLOBAL__sub_I_main, @function
_GLOBAL__sub_I_main:
.LFB2231:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$65535, %esi
	movl	$1, %edi
	call	_Z41__static_initialization_and_destruction_0ii
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2231:
	.size	_GLOBAL__sub_I_main, .-_GLOBAL__sub_I_main
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I_main
	.section	.rodata
	.align 8
.LC0:
	.long	1202590843
	.long	1065646817
	.hidden	__dso_handle
	.ident	"GCC: (GNU) 11.1.0"
	.section	.note.GNU-stack,"",@progbits

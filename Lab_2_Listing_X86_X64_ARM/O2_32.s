	.file	"main.cpp"
	.text
	.section	.text._ZNKSt5ctypeIcE8do_widenEc,"axG",@progbits,_ZNKSt5ctypeIcE8do_widenEc,comdat
	.align 2
	.p2align 4
	.weak	_ZNKSt5ctypeIcE8do_widenEc
	.type	_ZNKSt5ctypeIcE8do_widenEc, @function
_ZNKSt5ctypeIcE8do_widenEc:
.LFB1512:
	.cfi_startproc
	movzbl	8(%esp), %eax
	ret
	.cfi_endproc
.LFE1512:
	.size	_ZNKSt5ctypeIcE8do_widenEc, .-_ZNKSt5ctypeIcE8do_widenEc
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB1759:
	.cfi_startproc
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	movl	$2, %eax@счетчик
	xorl	%edx, %edx
	pushl	-4(%ecx)
	pushl	%ebp
	movl	%esp, %ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	.cfi_escape 0x10,0x7,0x2,0x75,0x7c
	.cfi_escape 0x10,0x6,0x2,0x75,0x78
	.cfi_escape 0x10,0x3,0x2,0x75,0x74
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x70,0x6
	subl	$24, %esp
	fldl	.LC0@GOTOFF(%ebx) два раза кладем начальное значение answer на стек
	fld	%st(0)
	.p2align 4,,10
	.p2align 3
.L4:
	fld	%st(0)
	movd	%eax, %xmm0@записывем в векторный регистр значение счетчика
	movd	%edx, %xmm1
	addl	$1, %eax@добавляем 1
	fchs@изменяем знак
	punpckldq	%xmm1, %xmm0@распаковываем и чередуем элементы для побитовой операции с числом
	adcl	$0, %edx
	movl	%eax, %esi@копируем
	fmul	%st(2), %st@перемножаем
	movq	%xmm0, -32(%ebp)@копируем
	xorl	$2000000000, %esi@сравниваем
	movl	%edx, %ecx@копируем
	fildq	-32(%ebp)@преобразовываем из целого в вещественный
	orl	%esi, %ecx@производим сравнение следующей части
	fdivrp	%st, %st(1)@делим
	faddp	%st, %st(1)@складываем
	jne	.L4
	fstp	%st(1)
	subl	$12, %esp
	fstpt	(%esp)
	pushl	_ZSt4cout@GOT(%ebx)
	call	_ZNSo9_M_insertIeEERSoT_@PLT
	addl	$16, %esp
	movl	%eax, %esi
	movl	(%eax), %eax
	movl	-12(%eax), %eax
	movl	124(%esi,%eax), %edi
	testl	%edi, %edi
	je	.L11
	cmpb	$0, 28(%edi)
	je	.L6
	movzbl	39(%edi), %eax
.L7:
	subl	$8, %esp
	movsbl	%al, %eax
	pushl	%eax
	pushl	%esi
	call	_ZNSo3putEc@PLT
	movl	%eax, (%esp)
	call	_ZNSo5flushEv@PLT
	addl	$16, %esp
	leal	-16(%ebp), %esp
	xorl	%eax, %eax
	popl	%ecx
	.cfi_remember_state
	.cfi_restore 1
	.cfi_def_cfa 1, 0
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	leal	-4(%ecx), %esp
	.cfi_def_cfa 4, 4
	ret
.L6:
	.cfi_restore_state
	subl	$12, %esp
	pushl	%edi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movl	(%edi), %eax
	leal	_ZNKSt5ctypeIcE8do_widenEc@GOTOFF(%ebx), %ecx
	addl	$16, %esp
	movl	24(%eax), %edx
	movl	$10, %eax
	cmpl	%ecx, %edx
	je	.L7
	pushl	%eax
	pushl	%eax
	pushl	$10
	pushl	%edi
	call	*%edx
	addl	$16, %esp
	jmp	.L7
.L11:
	call	_ZSt16__throw_bad_castv@PLT
	.cfi_endproc
.LFE1759:
	.size	main, .-main
	.p2align 4
	.type	_GLOBAL__sub_I_main, @function
_GLOBAL__sub_I_main:
.LFB2247:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	subl	$16, %esp
	.cfi_def_cfa_offset 28
	leal	_ZStL8__ioinit@GOTOFF(%ebx), %esi
	pushl	%esi
	.cfi_def_cfa_offset 32
	call	_ZNSt8ios_base4InitC1Ev@PLT
	addl	$12, %esp
	.cfi_def_cfa_offset 20
	leal	__dso_handle@GOTOFF(%ebx), %eax
	pushl	%eax
	.cfi_def_cfa_offset 24
	pushl	%esi
	.cfi_def_cfa_offset 28
	pushl	_ZNSt8ios_base4InitD1Ev@GOT(%ebx)
	.cfi_def_cfa_offset 32
	call	__cxa_atexit@PLT
	addl	$20, %esp
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE2247:
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
	.section	.text.__x86.get_pc_thunk.bx,"axG",@progbits,__x86.get_pc_thunk.bx,comdat
	.globl	__x86.get_pc_thunk.bx
	.hidden	__x86.get_pc_thunk.bx
	.type	__x86.get_pc_thunk.bx, @function
__x86.get_pc_thunk.bx:
.LFB2253:
	.cfi_startproc
	movl	(%esp), %ebx
	ret
	.cfi_endproc
.LFE2253:
	.hidden	__dso_handle
	.ident	"GCC: (GNU) 11.1.0"
	.section	.note.GNU-stack,"",@progbits

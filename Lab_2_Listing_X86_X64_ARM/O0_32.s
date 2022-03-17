	.file	"main.cpp"
	.text
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.globl	main
	.type	main, @function
main:
.LFB1721:
	.cfi_startproc
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	movl	%esp, %ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	pushl	%ebx@адрес указалетя на объект в памяти
	pushl	%ecx@счетчик
	.cfi_escape 0xf,0x3,0x75,0x78,0x6
	.cfi_escape 0x10,0x3,0x2,0x75,0x7c
	subl	$48, %esp
	call	__x86.get_pc_thunk.bx@вызов для получения доступа к глобальным объектам
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx@добавляем таблицу с информацией о смещениях переразмещяемых объектов
	movl	$2000000000, -40(%ebp) @присваимаем константное значение
	movl	$0, -36(%ebp)
	fldl	.LC0@GOTOFF(%ebx) ложим на стек сопроцессора  вещественное число
	fstpl	-32(%ebp) @ и забираем это число из стека
	fldl	-32(%ebp) @записываем в стек число
	fstpt	-20(%ebp) @и забираем его из стека
	movl	$2, -48(%ebp) @присваиваем двойку
	movl	$0, -44(%ebp) @и в оставшуюсю часть записываем ноль
	jmp	.L2
.L3:
	fldt	-20(%ebp) @кладем на стек answer
	fchs @меняем знак элемента в вершине стека
	fldl	-32(%ebp) @кладем на стек x
	fmulp	%st, %st(1)@перемножаем элементы на стеке
	fildq	-48(%ebp) @превращаем целое в вещественное и кладем в стек
	fdivrp	%st, %st(1) @делим на стеке
	fldt	-20(%ebp) @кладем answer на стек
	faddp	%st, %st(1) @перемножаем на стеке
	fstpt	-20(%ebp) @записываем из вершины стека
	addl	$1, -48(%ebp) @добавляем единицу к счетчику
	adcl	$0, -44(%ebp)
.L2:
	movl	-48(%ebp), %eax
	movl	-44(%ebp), %edx
	cmpl	-40(%ebp), %eax
	movl	%edx, %eax
	sbbl	-36(%ebp), %eax
	jl	.L3
	pushl	-12(%ebp)
	pushl	-16(%ebp)
	pushl	-20(%ebp)
	movl	_ZSt4cout@GOT(%ebx), %eax
	pushl	%eax
	call	_ZNSolsEe@PLT
	addl	$16, %esp
	subl	$8, %esp
	movl	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOT(%ebx), %edx
	pushl	%edx
	pushl	%eax
	call	_ZNSolsEPFRSoS_E@PLT
	addl	$16, %esp
	movl	$0, %eax
	leal	-8(%ebp), %esp
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
.LFE1721:
	.size	main, .-main
	.type	_Z41__static_initialization_and_destruction_0ii, @function
_Z41__static_initialization_and_destruction_0ii:
.LFB2225:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$4, %esp
	.cfi_offset 3, -12
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	cmpl	$1, 8(%ebp)
	jne	.L7
	cmpl	$65535, 12(%ebp)
	jne	.L7
	subl	$12, %esp
	leal	_ZStL8__ioinit@GOTOFF(%ebx), %eax
	pushl	%eax
	call	_ZNSt8ios_base4InitC1Ev@PLT
	addl	$16, %esp
	subl	$4, %esp
	leal	__dso_handle@GOTOFF(%ebx), %eax
	pushl	%eax
	leal	_ZStL8__ioinit@GOTOFF(%ebx), %eax
	pushl	%eax
	movl	_ZNSt8ios_base4InitD1Ev@GOT(%ebx), %eax
	pushl	%eax
	call	__cxa_atexit@PLT
	addl	$16, %esp
.L7:
	nop
	movl	-4(%ebp), %ebx
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2225:
	.size	_Z41__static_initialization_and_destruction_0ii, .-_Z41__static_initialization_and_destruction_0ii
	.type	_GLOBAL__sub_I_main, @function
_GLOBAL__sub_I_main:
.LFB2226:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$8, %esp
	call	__x86.get_pc_thunk.ax
	addl	$_GLOBAL_OFFSET_TABLE_, %eax
	subl	$8, %esp
	pushl	$65535
	pushl	$1
	call	_Z41__static_initialization_and_destruction_0ii
	addl	$16, %esp
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2226:
	.size	_GLOBAL__sub_I_main, .-_GLOBAL__sub_I_main
	.section	.init_array,"aw"
	.align 4
	.long	_GLOBAL__sub_I_main
	.section	.rodata
	.align 8
.LC0:
	.long	1202590843
	.long	1065646817
	.section	.text.__x86.get_pc_thunk.ax,"axG",@progbits,__x86.get_pc_thunk.ax,comdat
	.globl	__x86.get_pc_thunk.ax
	.hidden	__x86.get_pc_thunk.ax
	.type	__x86.get_pc_thunk.ax, @function
__x86.get_pc_thunk.ax:
.LFB2227:
	.cfi_startproc
	movl	(%esp), %eax
	ret
	.cfi_endproc
.LFE2227:
	.section	.text.__x86.get_pc_thunk.bx,"axG",@progbits,__x86.get_pc_thunk.bx,comdat
	.globl	__x86.get_pc_thunk.bx
	.hidden	__x86.get_pc_thunk.bx
	.type	__x86.get_pc_thunk.bx, @function
__x86.get_pc_thunk.bx:
.LFB2228:
	.cfi_startproc
	movl	(%esp), %ebx
	ret
	.cfi_endproc
.LFE2228:
	.hidden	__dso_handle
	.ident	"GCC: (GNU) 11.1.0"
	.section	.note.GNU-stack,"",@progbits

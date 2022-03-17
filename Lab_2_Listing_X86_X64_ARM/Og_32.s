	.file	"main.cpp"
	.text
	.type	_Z41__static_initialization_and_destruction_0ii, @function
_Z41__static_initialization_and_destruction_0ii:
.LFB2246:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$4, %esp
	.cfi_def_cfa_offset 16
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	cmpl	$1, %eax
	je	.L4
.L1:
	addl	$4, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
.L4:
	.cfi_restore_state
	cmpl	$65535, %edx
	jne	.L1
	subl	$12, %esp
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
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	jmp	.L1
	.cfi_endproc
.LFE2246:
	.size	_Z41__static_initialization_and_destruction_0ii, .-_Z41__static_initialization_and_destruction_0ii
	.globl	main
	.type	main, @function
main:
.LFB1759:
	.cfi_startproc
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	movl	%esp, %ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	pushl	%ebx
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x78,0x6
	.cfi_escape 0x10,0x3,0x2,0x75,0x7c
	subl	$16, %esp
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	movl	$2, %eax
	movl	$0, %edx
	fldl	.LC0@GOTOFF(%ebx)
	jmp	.L6
.L7:
	fld	%st(0)
	fchs
	fmull	.LC0@GOTOFF(%ebx)
	movd	%eax, %xmm0
	movd	%edx, %xmm1
	punpckldq	%xmm1, %xmm0
	movq	%xmm0, -16(%ebp)
	fildq	-16(%ebp)
	fdivrp	%st, %st(1)
	faddp	%st, %st(1)
	addl	$1, %eax
	adcl	$0, %edx
.L6:
	movl	$1999999999, %ecx
	cmpl	%eax, %ecx
	movl	$0, %ecx
	sbbl	%edx, %ecx
	jge	.L7
	leal	-12(%esp), %esp
	fstpt	(%esp)
	pushl	_ZSt4cout@GOT(%ebx)
	call	_ZNSo9_M_insertIeEERSoT_@PLT
	movl	%eax, (%esp)
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
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
.LFE1759:
	.size	main, .-main
	.type	_GLOBAL__sub_I_main, @function
_GLOBAL__sub_I_main:
.LFB2247:
	.cfi_startproc
	subl	$12, %esp
	.cfi_def_cfa_offset 16
	movl	$65535, %edx
	movl	$1, %eax
	call	_Z41__static_initialization_and_destruction_0ii
	addl	$12, %esp
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
.LFB2248:
	.cfi_startproc
	movl	(%esp), %ebx
	ret
	.cfi_endproc
.LFE2248:
	.hidden	__dso_handle
	.ident	"GCC: (GNU) 11.1.0"
	.section	.note.GNU-stack,"",@progbits

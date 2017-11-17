	.file	"a.c"
	.text
	.globl	fibonacci
	.type	fibonacci, @function
fibonacci:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movl	%edi, -36(%rbp)
	cmpl	$0, -36(%rbp)
	jne	.L2
	movl	$0, -20(%rbp)
	jmp	.L3
.L2:
	cmpl	$1, -36(%rbp)
	jne	.L4
	movl	$1, -20(%rbp)
	jmp	.L3
.L4:
	movl	-36(%rbp), %eax
	subl	$2, %eax
	movl	%eax, %edi
	call	fibonacci
	movl	%eax, %ebx
	movl	-36(%rbp), %eax
	subl	$1, %eax
	movl	%eax, %edi
	call	fibonacci
	addl	%ebx, %eax
	movl	%eax, -20(%rbp)
.L3:
	movl	-20(%rbp), %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	fibonacci, .-fibonacci
	.section	.rodata
.LC0:
	.string	"%d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$6, %edi
	call	fibonacci
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-11)"
	.section	.note.GNU-stack,"",@progbits

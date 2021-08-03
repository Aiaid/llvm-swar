	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 12, 0
	.globl	_main                           ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	subq	$56, %rsp
	.cfi_def_cfa_offset 64
	movl	%edi, 52(%rsp)
	movq	%rsi, 40(%rsp)
	movq	8(%rsi), %rdi
	callq	_atoi
	movl	%eax, 36(%rsp)
	movq	40(%rsp), %rax
	movq	16(%rax), %rdi
	callq	_atoi
	movl	%eax, 48(%rsp)
	movl	36(%rsp), %ecx
	movl	%ecx, %edx
	shrl	$28, %edx
	movd	%edx, %xmm0
	movl	%ecx, %edx
	shrl	$24, %edx
	andl	$15, %edx
	movd	%edx, %xmm1
	punpcklwd	%xmm0, %xmm1            ## xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1],xmm1[2],xmm0[2],xmm1[3],xmm0[3]
	movl	%ecx, %edx
	shrl	$20, %edx
	andl	$15, %edx
	movd	%edx, %xmm0
	movl	%ecx, %edx
	shrl	$16, %edx
	andl	$15, %edx
	movd	%edx, %xmm2
	punpcklwd	%xmm0, %xmm2            ## xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1],xmm2[2],xmm0[2],xmm2[3],xmm0[3]
	punpckldq	%xmm1, %xmm2            ## xmm2 = xmm2[0],xmm1[0],xmm2[1],xmm1[1]
	movl	%ecx, %edx
	shrl	$12, %edx
	andl	$15, %edx
	movd	%edx, %xmm0
	movl	%ecx, %edx
	shrl	$8, %edx
	andl	$15, %edx
	movd	%edx, %xmm1
	punpcklwd	%xmm0, %xmm1            ## xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1],xmm1[2],xmm0[2],xmm1[3],xmm0[3]
	movl	%ecx, %edx
	andl	$15, %edx
	movd	%edx, %xmm0
	shrl	$4, %ecx
	andl	$15, %ecx
	movd	%ecx, %xmm3
	punpcklwd	%xmm3, %xmm0            ## xmm0 = xmm0[0],xmm3[0],xmm0[1],xmm3[1],xmm0[2],xmm3[2],xmm0[3],xmm3[3]
	punpckldq	%xmm1, %xmm0            ## xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
	punpcklqdq	%xmm2, %xmm0            ## xmm0 = xmm0[0],xmm2[0]
	movl	%eax, %ecx
	shrl	$28, %ecx
	movd	%ecx, %xmm1
	movl	%eax, %ecx
	shrl	$24, %ecx
	andl	$15, %ecx
	movd	%ecx, %xmm2
	punpcklwd	%xmm1, %xmm2            ## xmm2 = xmm2[0],xmm1[0],xmm2[1],xmm1[1],xmm2[2],xmm1[2],xmm2[3],xmm1[3]
	movl	%eax, %ecx
	shrl	$20, %ecx
	andl	$15, %ecx
	movd	%ecx, %xmm1
	movl	%eax, %ecx
	shrl	$16, %ecx
	andl	$15, %ecx
	movd	%ecx, %xmm3
	punpcklwd	%xmm1, %xmm3            ## xmm3 = xmm3[0],xmm1[0],xmm3[1],xmm1[1],xmm3[2],xmm1[2],xmm3[3],xmm1[3]
	punpckldq	%xmm2, %xmm3            ## xmm3 = xmm3[0],xmm2[0],xmm3[1],xmm2[1]
	movl	%eax, %ecx
	shrl	$12, %ecx
	andl	$15, %ecx
	movd	%ecx, %xmm1
	movl	%eax, %ecx
	shrl	$8, %ecx
	andl	$15, %ecx
	movd	%ecx, %xmm2
	punpcklwd	%xmm1, %xmm2            ## xmm2 = xmm2[0],xmm1[0],xmm2[1],xmm1[1],xmm2[2],xmm1[2],xmm2[3],xmm1[3]
	movl	%eax, %ecx
	andl	$15, %ecx
	movd	%ecx, %xmm1
	shrl	$4, %eax
	andl	$15, %eax
	movd	%eax, %xmm4
	punpcklwd	%xmm4, %xmm1            ## xmm1 = xmm1[0],xmm4[0],xmm1[1],xmm4[1],xmm1[2],xmm4[2],xmm1[3],xmm4[3]
	punpckldq	%xmm2, %xmm1            ## xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
	punpcklqdq	%xmm3, %xmm1            ## xmm1 = xmm1[0],xmm3[0]
	paddw	%xmm0, %xmm1
	movd	%xmm1, %esi
	pextrw	$1, %xmm1, %edx
	pextrw	$2, %xmm1, %ecx
	pextrw	$3, %xmm1, %r8d
	pextrw	$4, %xmm1, %r9d
	pextrw	$5, %xmm1, %r10d
	pextrw	$6, %xmm1, %edi
	pextrw	$7, %xmm1, %eax
	movl	%eax, 16(%rsp)
	movl	%edi, 8(%rsp)
	movl	%r10d, (%rsp)
	leaq	l_.str(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	xorl	%eax, %eax
	addq	$56, %rsp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__const
l_.str:                                 ## @.str
	.asciz	"<4 x i4><%i, %i, %i, %i, %i, %i, %i, %i>\n"

	.section	__TEXT,__cstring,cstring_literals
L___unnamed_1:                          ## @0
	.asciz	"%d\n"

.subsections_via_symbols

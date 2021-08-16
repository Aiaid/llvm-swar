	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 12, 0
	.globl	_main                           ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$112, %rsp
	movl	%edi, -36(%rbp)
	movq	%rsi, -8(%rbp)
	movq	8(%rsi), %rdi
	callq	_atoll
	movq	%rax, -32(%rbp)
	movq	-8(%rbp), %rax
	movq	16(%rax), %rdi
	callq	_atoll
	movq	%rax, -24(%rbp)
	movq	-8(%rbp), %rax
	movq	24(%rax), %rdi
	callq	_atoll
	movq	%rax, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	32(%rax), %rdi
	callq	_atoll
	movq	%rax, -88(%rbp)
	movq	-32(%rbp), %rcx
	movq	-24(%rbp), %rdx
	movq	%rdx, -80(%rbp)
	movq	%rcx, -72(%rbp)
	movq	-16(%rbp), %rcx
	movq	%rax, -64(%rbp)
	pmovzxbw	-80(%rbp), %xmm3                ## xmm3 = mem[0],zero,mem[1],zero,mem[2],zero,mem[3],zero,mem[4],zero,mem[5],zero,mem[6],zero,mem[7],zero
	pmovzxbw	-64(%rbp), %xmm0                ## xmm0 = mem[0],zero,mem[1],zero,mem[2],zero,mem[3],zero,mem[4],zero,mem[5],zero,mem[6],zero,mem[7],zero
	movq	%rcx, -56(%rbp)
	movdqa	%xmm0, %xmm1
	psllw	$7, %xmm1
	movdqa	%xmm3, %xmm4
	psubw	%xmm1, %xmm4
	movdqa	%xmm4, %xmm2
	psrlw	$15, %xmm2
	packuswb	%xmm2, %xmm2
	pcmpeqd	%xmm1, %xmm1
	pxor	%xmm1, %xmm2
	pmovzxbw	%xmm2, %xmm2                    ## xmm2 = xmm2[0],zero,xmm2[1],zero,xmm2[2],zero,xmm2[3],zero,xmm2[4],zero,xmm2[5],zero,xmm2[6],zero,xmm2[7],zero
	psllw	$15, %xmm2
	psraw	$15, %xmm2
	pand	%xmm4, %xmm2
	psraw	$15, %xmm4
	pand	%xmm3, %xmm4
	por	%xmm4, %xmm2
	movdqa	%xmm0, %xmm3
	psllw	$6, %xmm3
	movdqa	%xmm2, %xmm4
	psubw	%xmm3, %xmm4
	movdqa	%xmm4, %xmm3
	psrlw	$14, %xmm3
	packuswb	%xmm3, %xmm3
	pxor	%xmm1, %xmm3
	pmovzxbw	%xmm3, %xmm3                    ## xmm3 = xmm3[0],zero,xmm3[1],zero,xmm3[2],zero,xmm3[3],zero,xmm3[4],zero,xmm3[5],zero,xmm3[6],zero,xmm3[7],zero
	psllw	$15, %xmm3
	psraw	$15, %xmm3
	pand	%xmm4, %xmm3
	psllw	$1, %xmm4
	psraw	$15, %xmm4
	pand	%xmm2, %xmm4
	por	%xmm4, %xmm3
	movdqa	%xmm0, %xmm2
	psllw	$5, %xmm2
	movdqa	%xmm3, %xmm4
	psubw	%xmm2, %xmm4
	movdqa	%xmm4, %xmm2
	psrlw	$13, %xmm2
	packuswb	%xmm2, %xmm2
	pxor	%xmm1, %xmm2
	pmovzxbw	%xmm2, %xmm2                    ## xmm2 = xmm2[0],zero,xmm2[1],zero,xmm2[2],zero,xmm2[3],zero,xmm2[4],zero,xmm2[5],zero,xmm2[6],zero,xmm2[7],zero
	psllw	$15, %xmm2
	psraw	$15, %xmm2
	pand	%xmm4, %xmm2
	psllw	$2, %xmm4
	psraw	$15, %xmm4
	pand	%xmm3, %xmm4
	por	%xmm4, %xmm2
	movdqa	%xmm0, %xmm3
	psllw	$4, %xmm3
	movdqa	%xmm2, %xmm4
	psubw	%xmm3, %xmm4
	movdqa	%xmm4, %xmm3
	psrlw	$12, %xmm3
	packuswb	%xmm3, %xmm3
	pxor	%xmm1, %xmm3
	pmovzxbw	%xmm3, %xmm3                    ## xmm3 = xmm3[0],zero,xmm3[1],zero,xmm3[2],zero,xmm3[3],zero,xmm3[4],zero,xmm3[5],zero,xmm3[6],zero,xmm3[7],zero
	psllw	$15, %xmm3
	psraw	$15, %xmm3
	pand	%xmm4, %xmm3
	psllw	$3, %xmm4
	psraw	$15, %xmm4
	pand	%xmm2, %xmm4
	por	%xmm4, %xmm3
	movdqa	%xmm0, %xmm2
	psllw	$3, %xmm2
	movdqa	%xmm3, %xmm4
	psubw	%xmm2, %xmm4
	movdqa	%xmm4, %xmm2
	psrlw	$11, %xmm2
	packuswb	%xmm2, %xmm2
	pxor	%xmm1, %xmm2
	pmovzxbw	%xmm2, %xmm2                    ## xmm2 = xmm2[0],zero,xmm2[1],zero,xmm2[2],zero,xmm2[3],zero,xmm2[4],zero,xmm2[5],zero,xmm2[6],zero,xmm2[7],zero
	psllw	$15, %xmm2
	psraw	$15, %xmm2
	pand	%xmm4, %xmm2
	psllw	$4, %xmm4
	psraw	$15, %xmm4
	pand	%xmm3, %xmm4
	por	%xmm4, %xmm2
	movdqa	%xmm0, %xmm3
	psllw	$2, %xmm3
	movdqa	%xmm2, %xmm4
	psubw	%xmm3, %xmm4
	movdqa	%xmm4, %xmm3
	psrlw	$10, %xmm3
	packuswb	%xmm3, %xmm3
	pxor	%xmm1, %xmm3
	pmovzxbw	%xmm3, %xmm3                    ## xmm3 = xmm3[0],zero,xmm3[1],zero,xmm3[2],zero,xmm3[3],zero,xmm3[4],zero,xmm3[5],zero,xmm3[6],zero,xmm3[7],zero
	psllw	$15, %xmm3
	psraw	$15, %xmm3
	pand	%xmm4, %xmm3
	psllw	$5, %xmm4
	psraw	$15, %xmm4
	pand	%xmm2, %xmm4
	por	%xmm4, %xmm3
	movdqa	%xmm0, %xmm2
	paddw	%xmm0, %xmm2
	movdqa	%xmm3, %xmm4
	psubw	%xmm2, %xmm4
	movdqa	%xmm4, %xmm2
	psrlw	$9, %xmm2
	packuswb	%xmm2, %xmm2
	pxor	%xmm1, %xmm2
	pmovzxbw	%xmm2, %xmm2                    ## xmm2 = xmm2[0],zero,xmm2[1],zero,xmm2[2],zero,xmm2[3],zero,xmm2[4],zero,xmm2[5],zero,xmm2[6],zero,xmm2[7],zero
	psllw	$15, %xmm2
	psraw	$15, %xmm2
	pand	%xmm4, %xmm2
	psllw	$6, %xmm4
	psraw	$15, %xmm4
	pand	%xmm3, %xmm4
	por	%xmm4, %xmm2
	movdqa	%xmm2, %xmm3
	psubw	%xmm0, %xmm3
	movdqa	%xmm3, %xmm0
	psrlw	$8, %xmm0
	packuswb	%xmm0, %xmm0
	pxor	%xmm1, %xmm0
	pmovzxbw	%xmm0, %xmm0                    ## xmm0 = xmm0[0],zero,xmm0[1],zero,xmm0[2],zero,xmm0[3],zero,xmm0[4],zero,xmm0[5],zero,xmm0[6],zero,xmm0[7],zero
	psllw	$15, %xmm0
	psraw	$15, %xmm0
	pand	%xmm3, %xmm0
	psllw	$7, %xmm3
	psraw	$15, %xmm3
	pand	%xmm2, %xmm3
	por	%xmm3, %xmm0
	pextrb	$2, %xmm0, %esi
	pextrb	$4, %xmm0, %edx
	pextrb	$6, %xmm0, %ecx
	pextrb	$8, %xmm0, %r8d
	leaq	l_.str(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	xorl	%eax, %eax
	addq	$112, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__const
l_.str:                                 ## @.str
	.asciz	"<16 x i8><%i, %i, %i, %i>\n"

	.section	__TEXT,__cstring,cstring_literals
L___unnamed_1:                          ## @0
	.asciz	"%d\n"

.subsections_via_symbols

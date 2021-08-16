	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 12, 0
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4                               ## -- Begin function main
LCPI0_0:
	.space	16,1
LCPI0_1:
	.space	16,128
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
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
	movl	%edi, -76(%rbp)
	movq	%rsi, -8(%rbp)
	movq	8(%rsi), %rdi
	callq	_atoll
	movq	%rax, -72(%rbp)
	movq	-8(%rbp), %rax
	movq	16(%rax), %rdi
	callq	_atoll
	movq	%rax, -64(%rbp)
	movq	-8(%rbp), %rax
	movq	24(%rax), %rdi
	callq	_atoll
	movq	%rax, -56(%rbp)
	movq	-8(%rbp), %rax
	movq	32(%rax), %rdi
	callq	_atoll
	movq	%rax, -88(%rbp)
	movq	-72(%rbp), %rcx
	movq	-64(%rbp), %rdx
	movq	%rdx, -48(%rbp)
	movq	%rcx, -40(%rbp)
	movq	-56(%rbp), %rcx
	movq	%rcx, -24(%rbp)
	pmovzxbw	-48(%rbp), %xmm3                ## xmm3 = mem[0],zero,mem[1],zero,mem[2],zero,mem[3],zero,mem[4],zero,mem[5],zero,mem[6],zero,mem[7],zero
	pmovzxbw	-40(%rbp), %xmm5                ## xmm5 = mem[0],zero,mem[1],zero,mem[2],zero,mem[3],zero,mem[4],zero,mem[5],zero,mem[6],zero,mem[7],zero
	pmovzxbw	-24(%rbp), %xmm10               ## xmm10 = mem[0],zero,mem[1],zero,mem[2],zero,mem[3],zero,mem[4],zero,mem[5],zero,mem[6],zero,mem[7],zero
	movq	%rax, -32(%rbp)
	pmovzxbw	-32(%rbp), %xmm9                ## xmm9 = mem[0],zero,mem[1],zero,mem[2],zero,mem[3],zero,mem[4],zero,mem[5],zero,mem[6],zero,mem[7],zero
	movdqa	%xmm9, %xmm4
	psllw	$7, %xmm4
	movdqa	%xmm10, %xmm0
	psllw	$7, %xmm0
	movdqa	%xmm5, %xmm1
	psubw	%xmm0, %xmm1
	movdqa	%xmm3, %xmm0
	psubw	%xmm4, %xmm0
	movdqa	%xmm0, %xmm4
	psrlw	$15, %xmm4
	movdqa	%xmm1, %xmm6
	psrlw	$15, %xmm6
	packuswb	%xmm6, %xmm4
	movdqa	LCPI0_0(%rip), %xmm8            ## xmm8 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
	pxor	%xmm8, %xmm4
	movdqa	%xmm4, %xmm6
	punpckhbw	%xmm6, %xmm6            ## xmm6 = xmm6[8,8,9,9,10,10,11,11,12,12,13,13,14,14,15,15]
	psllw	$15, %xmm6
	psraw	$15, %xmm6
	pand	%xmm1, %xmm6
	movdqa	%xmm1, %xmm7
	psraw	$15, %xmm7
	pmovzxbw	%xmm4, %xmm1                    ## xmm1 = xmm4[0],zero,xmm4[1],zero,xmm4[2],zero,xmm4[3],zero,xmm4[4],zero,xmm4[5],zero,xmm4[6],zero,xmm4[7],zero
	psllw	$15, %xmm1
	psraw	$15, %xmm1
	pand	%xmm0, %xmm1
	psraw	$15, %xmm0
	pand	%xmm3, %xmm0
	pand	%xmm5, %xmm7
	por	%xmm0, %xmm1
	psllw	$7, %xmm4
	pand	LCPI0_1(%rip), %xmm4
	por	%xmm7, %xmm6
	movdqa	%xmm10, %xmm3
	psllw	$6, %xmm3
	movdqa	%xmm9, %xmm5
	psllw	$6, %xmm5
	movdqa	%xmm1, %xmm2
	psubw	%xmm5, %xmm2
	movdqa	%xmm6, %xmm7
	psubw	%xmm3, %xmm7
	movdqa	%xmm7, %xmm5
	psrlw	$14, %xmm5
	movdqa	%xmm2, %xmm3
	psrlw	$14, %xmm3
	packuswb	%xmm5, %xmm3
	pxor	%xmm8, %xmm3
	movdqa	%xmm3, %xmm5
	punpckhbw	%xmm5, %xmm5            ## xmm5 = xmm5[8,8,9,9,10,10,11,11,12,12,13,13,14,14,15,15]
	psllw	$15, %xmm5
	psraw	$15, %xmm5
	pand	%xmm7, %xmm5
	psllw	$1, %xmm7
	psraw	$15, %xmm7
	pmovzxbw	%xmm3, %xmm0                    ## xmm0 = xmm3[0],zero,xmm3[1],zero,xmm3[2],zero,xmm3[3],zero,xmm3[4],zero,xmm3[5],zero,xmm3[6],zero,xmm3[7],zero
	psllw	$15, %xmm0
	psraw	$15, %xmm0
	pand	%xmm2, %xmm0
	psllw	$1, %xmm2
	psraw	$15, %xmm2
	pand	%xmm1, %xmm2
	pand	%xmm6, %xmm7
	por	%xmm2, %xmm0
	por	%xmm7, %xmm5
	pand	%xmm8, %xmm3
	psllw	$6, %xmm3
	por	%xmm4, %xmm3
	movdqa	%xmm10, %xmm2
	psllw	$5, %xmm2
	movdqa	%xmm9, %xmm1
	psllw	$5, %xmm1
	movdqa	%xmm0, %xmm7
	psubw	%xmm1, %xmm7
	movdqa	%xmm5, %xmm1
	psubw	%xmm2, %xmm1
	movdqa	%xmm1, %xmm2
	psrlw	$13, %xmm2
	movdqa	%xmm7, %xmm4
	psrlw	$13, %xmm4
	packuswb	%xmm2, %xmm4
	pxor	%xmm8, %xmm4
	movdqa	%xmm4, %xmm6
	punpckhbw	%xmm6, %xmm6            ## xmm6 = xmm6[8,8,9,9,10,10,11,11,12,12,13,13,14,14,15,15]
	psllw	$15, %xmm6
	psraw	$15, %xmm6
	pand	%xmm1, %xmm6
	movdqa	%xmm1, %xmm2
	psllw	$2, %xmm2
	psraw	$15, %xmm2
	pmovzxbw	%xmm4, %xmm1                    ## xmm1 = xmm4[0],zero,xmm4[1],zero,xmm4[2],zero,xmm4[3],zero,xmm4[4],zero,xmm4[5],zero,xmm4[6],zero,xmm4[7],zero
	psllw	$15, %xmm1
	psraw	$15, %xmm1
	pand	%xmm7, %xmm1
	psllw	$2, %xmm7
	psraw	$15, %xmm7
	pand	%xmm0, %xmm7
	pand	%xmm5, %xmm2
	por	%xmm7, %xmm1
	por	%xmm2, %xmm6
	pand	%xmm8, %xmm4
	psllw	$5, %xmm4
	por	%xmm3, %xmm4
	movdqa	%xmm10, %xmm2
	psllw	$4, %xmm2
	movdqa	%xmm9, %xmm3
	psllw	$4, %xmm3
	movdqa	%xmm1, %xmm0
	psubw	%xmm3, %xmm0
	movdqa	%xmm6, %xmm7
	psubw	%xmm2, %xmm7
	movdqa	%xmm7, %xmm2
	psrlw	$12, %xmm2
	movdqa	%xmm0, %xmm3
	psrlw	$12, %xmm3
	packuswb	%xmm2, %xmm3
	pxor	%xmm8, %xmm3
	movdqa	%xmm3, %xmm5
	punpckhbw	%xmm5, %xmm5            ## xmm5 = xmm5[8,8,9,9,10,10,11,11,12,12,13,13,14,14,15,15]
	psllw	$15, %xmm5
	psraw	$15, %xmm5
	pand	%xmm7, %xmm5
	movdqa	%xmm7, %xmm2
	psllw	$3, %xmm2
	psraw	$15, %xmm2
	pmovzxbw	%xmm3, %xmm7                    ## xmm7 = xmm3[0],zero,xmm3[1],zero,xmm3[2],zero,xmm3[3],zero,xmm3[4],zero,xmm3[5],zero,xmm3[6],zero,xmm3[7],zero
	psllw	$15, %xmm7
	psraw	$15, %xmm7
	pand	%xmm0, %xmm7
	psllw	$3, %xmm0
	psraw	$15, %xmm0
	pand	%xmm1, %xmm0
	pand	%xmm6, %xmm2
	por	%xmm0, %xmm7
	por	%xmm2, %xmm5
	pand	%xmm8, %xmm3
	psllw	$4, %xmm3
	por	%xmm4, %xmm3
	movdqa	%xmm10, %xmm2
	psllw	$3, %xmm2
	movdqa	%xmm9, %xmm1
	psllw	$3, %xmm1
	movdqa	%xmm7, %xmm0
	psubw	%xmm1, %xmm0
	movdqa	%xmm5, %xmm1
	psubw	%xmm2, %xmm1
	movdqa	%xmm1, %xmm2
	psrlw	$11, %xmm2
	movdqa	%xmm0, %xmm4
	psrlw	$11, %xmm4
	packuswb	%xmm2, %xmm4
	pxor	%xmm8, %xmm4
	movdqa	%xmm4, %xmm6
	punpckhbw	%xmm6, %xmm6            ## xmm6 = xmm6[8,8,9,9,10,10,11,11,12,12,13,13,14,14,15,15]
	psllw	$15, %xmm6
	psraw	$15, %xmm6
	pand	%xmm1, %xmm6
	movdqa	%xmm1, %xmm2
	psllw	$4, %xmm2
	psraw	$15, %xmm2
	pmovzxbw	%xmm4, %xmm1                    ## xmm1 = xmm4[0],zero,xmm4[1],zero,xmm4[2],zero,xmm4[3],zero,xmm4[4],zero,xmm4[5],zero,xmm4[6],zero,xmm4[7],zero
	psllw	$15, %xmm1
	psraw	$15, %xmm1
	pand	%xmm0, %xmm1
	psllw	$4, %xmm0
	psraw	$15, %xmm0
	pand	%xmm7, %xmm0
	pand	%xmm5, %xmm2
	por	%xmm0, %xmm1
	por	%xmm2, %xmm6
	pand	%xmm8, %xmm4
	psllw	$3, %xmm4
	por	%xmm3, %xmm4
	movdqa	%xmm10, %xmm2
	psllw	$2, %xmm2
	movdqa	%xmm9, %xmm3
	psllw	$2, %xmm3
	movdqa	%xmm1, %xmm0
	psubw	%xmm3, %xmm0
	movdqa	%xmm6, %xmm7
	psubw	%xmm2, %xmm7
	movdqa	%xmm7, %xmm2
	psrlw	$10, %xmm2
	movdqa	%xmm0, %xmm3
	psrlw	$10, %xmm3
	packuswb	%xmm2, %xmm3
	pxor	%xmm8, %xmm3
	movdqa	%xmm3, %xmm5
	punpckhbw	%xmm5, %xmm5            ## xmm5 = xmm5[8,8,9,9,10,10,11,11,12,12,13,13,14,14,15,15]
	psllw	$15, %xmm5
	psraw	$15, %xmm5
	pand	%xmm7, %xmm5
	movdqa	%xmm7, %xmm2
	psllw	$5, %xmm2
	psraw	$15, %xmm2
	pmovzxbw	%xmm3, %xmm7                    ## xmm7 = xmm3[0],zero,xmm3[1],zero,xmm3[2],zero,xmm3[3],zero,xmm3[4],zero,xmm3[5],zero,xmm3[6],zero,xmm3[7],zero
	psllw	$15, %xmm7
	psraw	$15, %xmm7
	pand	%xmm0, %xmm7
	psllw	$5, %xmm0
	psraw	$15, %xmm0
	pand	%xmm1, %xmm0
	pand	%xmm6, %xmm2
	por	%xmm0, %xmm7
	por	%xmm2, %xmm5
	pand	%xmm8, %xmm3
	psllw	$2, %xmm3
	por	%xmm4, %xmm3
	paddw	%xmm10, %xmm10
	psubw	%xmm10, %xmm5
	movdqa	%xmm9, %xmm0
	paddw	%xmm9, %xmm0
	movdqa	%xmm7, %xmm1
	psubw	%xmm0, %xmm1
	psrlw	$9, %xmm5
	movdqa	%xmm1, %xmm0
	psrlw	$9, %xmm0
	packuswb	%xmm5, %xmm0
	pxor	%xmm8, %xmm0
	pmovzxbw	%xmm0, %xmm2                    ## xmm2 = xmm0[0],zero,xmm0[1],zero,xmm0[2],zero,xmm0[3],zero,xmm0[4],zero,xmm0[5],zero,xmm0[6],zero,xmm0[7],zero
	psllw	$15, %xmm2
	psraw	$15, %xmm2
	pand	%xmm1, %xmm2
	psllw	$6, %xmm1
	psraw	$15, %xmm1
	pand	%xmm7, %xmm1
	por	%xmm1, %xmm2
	pand	%xmm8, %xmm0
	paddb	%xmm0, %xmm0
	por	%xmm3, %xmm0
	psubw	%xmm9, %xmm2
	psrlw	$8, %xmm2
	packuswb	%xmm2, %xmm2
	pandn	%xmm8, %xmm2
	por	%xmm0, %xmm2
	pextrb	$1, %xmm2, %esi
	pextrb	$2, %xmm2, %edx
	pextrb	$3, %xmm2, %ecx
	pextrb	$4, %xmm2, %r8d
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

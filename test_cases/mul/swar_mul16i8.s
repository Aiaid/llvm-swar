	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 12, 0
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4                               ## -- Begin function main
LCPI0_0:
	.space	16,128
LCPI0_1:
	.space	16,252
LCPI0_2:
	.space	16,248
LCPI0_3:
	.space	16,240
LCPI0_4:
	.space	16,224
LCPI0_5:
	.space	16,192
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
	movq	%rcx, -72(%rbp)
	movq	%rdx, -80(%rbp)
	movq	-16(%rbp), %rcx
	movq	%rax, -64(%rbp)
	movq	%rcx, -56(%rbp)
	movdqa	-80(%rbp), %xmm0
	movdqa	-64(%rbp), %xmm1
	movdqa	%xmm0, %xmm3
	psllw	$7, %xmm3
	movdqa	LCPI0_0(%rip), %xmm2            ## xmm2 = [128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128]
	pand	%xmm2, %xmm3
	pxor	%xmm5, %xmm5
	pcmpgtb	%xmm3, %xmm5
	pand	%xmm1, %xmm5
	movdqa	%xmm0, %xmm3
	psllw	$6, %xmm3
	pand	%xmm2, %xmm3
	pxor	%xmm6, %xmm6
	pcmpgtb	%xmm3, %xmm6
	movdqa	%xmm1, %xmm4
	paddb	%xmm1, %xmm4
	pand	%xmm6, %xmm4
	paddb	%xmm5, %xmm4
	movdqa	%xmm0, %xmm3
	psllw	$5, %xmm3
	pand	%xmm2, %xmm3
	pxor	%xmm6, %xmm6
	pcmpgtb	%xmm3, %xmm6
	movdqa	%xmm1, %xmm5
	psllw	$2, %xmm5
	pand	%xmm6, %xmm5
	movdqa	%xmm0, %xmm3
	psllw	$4, %xmm3
	pand	%xmm2, %xmm3
	pxor	%xmm6, %xmm6
	pcmpgtb	%xmm3, %xmm6
	movdqa	%xmm1, %xmm7
	psllw	$3, %xmm7
	pand	%xmm6, %xmm7
	movdqa	%xmm0, %xmm3
	psllw	$3, %xmm3
	pand	%xmm2, %xmm3
	pxor	%xmm6, %xmm6
	pcmpgtb	%xmm3, %xmm6
	movdqa	%xmm1, %xmm3
	psllw	$4, %xmm3
	pand	%xmm6, %xmm3
	pxor	%xmm6, %xmm6
	pand	LCPI0_1(%rip), %xmm5
	pand	LCPI0_2(%rip), %xmm7
	pand	LCPI0_3(%rip), %xmm3
	paddb	%xmm4, %xmm5
	paddb	%xmm7, %xmm3
	paddb	%xmm5, %xmm3
	movdqa	%xmm0, %xmm4
	psllw	$2, %xmm4
	pand	%xmm2, %xmm4
	pxor	%xmm5, %xmm5
	pcmpgtb	%xmm4, %xmm5
	movdqa	%xmm1, %xmm4
	psllw	$5, %xmm4
	pand	%xmm5, %xmm4
	pand	LCPI0_4(%rip), %xmm4
	movdqa	%xmm0, %xmm5
	psllw	$1, %xmm5
	pand	%xmm2, %xmm5
	pcmpgtb	%xmm5, %xmm6
	movdqa	%xmm1, %xmm5
	psllw	$6, %xmm5
	pand	%xmm6, %xmm5
	pand	LCPI0_5(%rip), %xmm5
	paddb	%xmm4, %xmm5
	psllw	$7, %xmm1
	pand	%xmm2, %xmm0
	pand	%xmm1, %xmm0
	paddb	%xmm5, %xmm0
	paddb	%xmm3, %xmm0
	pextrb	$1, %xmm0, %esi
	pextrb	$2, %xmm0, %edx
	pextrb	$3, %xmm0, %ecx
	pextrb	$4, %xmm0, %r8d
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

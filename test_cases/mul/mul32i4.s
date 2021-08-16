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
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rcx
	movq	%rdx, -72(%rbp)
	movq	%rcx, -80(%rbp)
	movq	-16(%rbp), %rdx
	movq	%rax, -64(%rbp)
	movq	%rdx, -56(%rbp)
	movl	%ecx, %r8d
	shrl	$16, %r8d
	movl	%ecx, %r9d
	shrl	$12, %r9d
	andl	$15, %r9d
	movl	%ecx, %r10d
	shrl	$8, %r10d
	andl	$15, %r10d
	shrl	$4, %ecx
	andl	$15, %ecx
	movl	%eax, %edx
	shrl	$16, %edx
	andl	$15, %edx
	movl	%eax, %esi
	shrl	$12, %esi
	andl	$15, %esi
	movl	%eax, %edi
	shrl	$8, %edi
	andl	$15, %edi
	shrl	$4, %eax
	andl	$15, %eax
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	pinsrb	$2, %eax, %xmm1
	pinsrb	$4, %edi, %xmm1
	pinsrb	$6, %esi, %xmm1
	pinsrb	$8, %edx, %xmm1
	pinsrb	$2, %ecx, %xmm0
	pinsrb	$4, %r10d, %xmm0
	pinsrb	$6, %r9d, %xmm0
	andl	$15, %r8d
	pinsrb	$8, %r8d, %xmm0
	pmullw	%xmm1, %xmm0
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
	.asciz	"<32 x i4><%i, %i, %i, %i>\n"

	.section	__TEXT,__cstring,cstring_literals
L___unnamed_1:                          ## @0
	.asciz	"%d\n"

.subsections_via_symbols

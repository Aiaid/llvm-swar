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
	shrl	$8, %r8d
	movl	%ecx, %r9d
	shrl	$6, %r9d
	andl	$3, %r9d
	movl	%ecx, %r10d
	shrl	$4, %r10d
	andl	$3, %r10d
	shrl	$2, %ecx
	andl	$3, %ecx
	movl	%eax, %edx
	shrl	$8, %edx
	andl	$3, %edx
	movl	%eax, %esi
	shrl	$6, %esi
	andl	$3, %esi
	movl	%eax, %edi
	shrl	$4, %edi
	andl	$3, %edi
	shrl	$2, %eax
	andl	$3, %eax
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	pinsrb	$2, %eax, %xmm1
	pinsrb	$4, %edi, %xmm1
	pinsrb	$6, %esi, %xmm1
	pinsrb	$8, %edx, %xmm1
	pinsrb	$2, %ecx, %xmm0
	pinsrb	$4, %r10d, %xmm0
	pinsrb	$6, %r9d, %xmm0
	andl	$3, %r8d
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
	.asciz	"<64 x i2><%i, %i, %i, %i>\n"

	.section	__TEXT,__cstring,cstring_literals
L___unnamed_1:                          ## @0
	.asciz	"%d\n"

.subsections_via_symbols

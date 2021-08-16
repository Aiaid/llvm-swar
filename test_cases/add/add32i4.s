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
	movq	%rcx, -72(%rbp)
	movq	%rdx, -80(%rbp)
	movq	-16(%rbp), %rcx
	movq	%rax, -64(%rbp)
	movq	%rcx, -56(%rbp)
	movl	%edx, %ecx
	shrl	$4, %ecx
	andl	$15, %ecx
	movl	%edx, %esi
	andl	$15, %esi
	movd	%esi, %xmm0
	pinsrb	$1, %ecx, %xmm0
	movl	%edx, %ecx
	shrl	$8, %ecx
	andl	$15, %ecx
	pinsrb	$2, %ecx, %xmm0
	shrl	$12, %edx
	andl	$15, %edx
	pinsrb	$3, %edx, %xmm0
	movl	%eax, %ecx
	shrl	$4, %ecx
	andl	$15, %ecx
	movl	%eax, %edx
	andl	$15, %edx
	movd	%edx, %xmm1
	pinsrb	$1, %ecx, %xmm1
	movl	%eax, %ecx
	shrl	$8, %ecx
	andl	$15, %ecx
	pinsrb	$2, %ecx, %xmm1
	shrl	$12, %eax
	andl	$15, %eax
	pinsrb	$3, %eax, %xmm1
	paddb	%xmm0, %xmm1
	movd	%xmm1, %esi
	pextrb	$1, %xmm1, %edx
	pextrb	$2, %xmm1, %ecx
	pextrb	$3, %xmm1, %r8d
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

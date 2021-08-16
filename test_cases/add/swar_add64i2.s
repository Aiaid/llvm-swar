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
	subq	$160, %rsp
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
	movq	-24(%rbp), %r8
	movq	%rcx, -72(%rbp)
	movq	%r8, -80(%rbp)
	movq	-16(%rbp), %rcx
	movq	%rax, -64(%rbp)
	movq	%rcx, -56(%rbp)
	movl	%r8d, %ecx
	andl	$85, %ecx
	xorl	%eax, %r8d
	andl	$85, %eax
	addl	%ecx, %eax
	andl	$170, %r8d
	xorl	%eax, %r8d
	movl	%r8d, %edx
	shrl	$2, %edx
	andl	$3, %edx
	movl	%r8d, %eax
	andl	$3, %eax
	movd	%eax, %xmm0
	pinsrb	$1, %edx, %xmm0
	movl	%r8d, %ecx
	shrl	$4, %ecx
	andl	$3, %ecx
	pinsrb	$2, %ecx, %xmm0
	shrl	$6, %r8d
	pinsrb	$3, %r8d, %xmm0
	movd	%xmm0, %esi
	leaq	l_.str(%rip), %rdi
                                        ## kill: def $r8d killed $r8d killed $r8
	xorl	%eax, %eax
	callq	_printf
	xorl	%eax, %eax
	addq	$160, %rsp
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

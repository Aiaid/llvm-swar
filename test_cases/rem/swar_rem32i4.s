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
	movq	%rax, %rcx
	movq	%rax, -88(%rbp)
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, -72(%rbp)
	movq	%rax, -80(%rbp)
	movq	-16(%rbp), %rdx
	movq	%rcx, -64(%rbp)
	movq	%rdx, -56(%rbp)
	movl	%eax, %r8d
	shrl	$16, %r8d
	andl	$15, %r8d
	movl	%eax, %r9d
	shrl	$12, %r9d
	andl	$15, %r9d
	movl	%eax, %r11d
	shrl	$8, %r11d
	andl	$15, %r11d
	shrl	$4, %eax
	andl	$15, %eax
	movl	%ecx, %r10d
	shrl	$16, %r10d
	andl	$15, %r10d
	movl	%ecx, %edi
	shrl	$12, %edi
	andl	$15, %edi
	movl	%ecx, %edx
	shrl	$8, %edx
	andl	$15, %edx
	shrl	$4, %ecx
	andl	$15, %ecx
	movzbl	%al, %eax
	divb	%cl
	movzbl	%ah, %esi
	movzbl	%r11b, %eax
	divb	%dl
	movzbl	%ah, %edx
	movzbl	%r9b, %eax
	divb	%dil
	movzbl	%ah, %ecx
	movzbl	%r8b, %eax
	divb	%r10b
	movzbl	%ah, %eax
	leaq	l_.str(%rip), %rdi
	movl	%eax, %r8d
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

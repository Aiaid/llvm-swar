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
	andl	$341, %ecx                      ## imm = 0x155
	xorl	%eax, %r8d
	andl	$341, %eax                      ## imm = 0x155
	subl	%eax, %ecx
	andl	$680, %r8d                      ## imm = 0x2A8
	xorl	%ecx, %r8d
	movl	%r8d, %esi
	shrl	$2, %esi
	andl	$3, %esi
	movl	%r8d, %edx
	shrl	$4, %edx
	andl	$3, %edx
	movl	%r8d, %ecx
	shrl	$6, %ecx
	andl	$3, %ecx
	shrl	$8, %r8d
	andl	$3, %r8d
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

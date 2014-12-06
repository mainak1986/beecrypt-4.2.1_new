 














	.section	.note.GNU-stack,"",@progbits















































	.text
	.align 4
	.globl mpzero
	
	.type mpzero,@function

mpzero:

	pushl %edi

	movl 8(%esp),%ecx
	movl 12(%esp),%edi

	xorl %eax,%eax
	rep; stosl

	popl %edi
	ret

.Lmpzero_size:
	.size mpzero, .Lmpzero_size  - mpzero




	.text
	.align 4
	.globl mpfill
	
	.type mpfill,@function

mpfill:

	pushl %edi

	movl 8(%esp),%ecx
	movl 12(%esp),%edi
	movl 16(%esp),%eax

	rep; stosl

	popl %edi
	ret

.Lmpfill_size:
	.size mpfill, .Lmpfill_size  - mpfill




	.text
	.align 4
	.globl mpeven
	
	.type mpeven,@function

mpeven:

	movl 4(%esp),%ecx
	movl 8(%esp),%eax
	movl -4(%eax,%ecx,4),%eax
	notl %eax
	andl $1,%eax
	ret

.Lmpeven_size:
	.size mpeven, .Lmpeven_size  - mpeven




	.text
	.align 4
	.globl mpodd
	
	.type mpodd,@function

mpodd:

	movl 4(%esp),%ecx
	movl 8(%esp),%eax
	movl -4(%eax,%ecx,4),%eax
	andl $1,%eax
	ret

.Lmpodd_size:
	.size mpodd, .Lmpodd_size  - mpodd




	.text
	.align 4
	.globl mpaddw
	
	.type mpaddw,@function

mpaddw:

	pushl %edi

	movl 8(%esp),%ecx
	movl 12(%esp),%edi
	movl 16(%esp),%eax

	xorl %edx,%edx
	leal -4(%edi,%ecx,4),%edi
	addl %eax,(%edi)
	decl %ecx
	jz .Lmpaddw_skip
	leal -4(%edi),%edi

	.align 4
.Lmpaddw_loop:
	adcl %edx,(%edi)
	leal -4(%edi),%edi
	decl %ecx
	jnz .Lmpaddw_loop
.Lmpaddw_skip:
	sbbl %eax,%eax
	negl %eax

	popl %edi
	ret

.Lmpaddw_size:
	.size mpaddw, .Lmpaddw_size  - mpaddw




	.text
	.align 4
	.globl mpsubw
	
	.type mpsubw,@function

mpsubw:

	pushl %edi

	movl 8(%esp),%ecx
	movl 12(%esp),%edi
	movl 16(%esp),%eax

	xorl %edx,%edx
	leal -4(%edi,%ecx,4),%edi
	subl %eax,(%edi)
	decl %ecx
	jz .Lmpsubw_skip
	leal -4(%edi),%edi

	.align 4
.Lmpsubw_loop:
	sbbl %edx,(%edi)
	leal -4(%edi),%edi
	decl %ecx
	jnz .Lmpsubw_loop
.Lmpsubw_skip:
	sbbl %eax,%eax
	negl %eax

	popl %edi
	ret

.Lmpsubw_size:
	.size mpsubw, .Lmpsubw_size  - mpsubw




	.text
	.align 4
	.globl mpadd
	
	.type mpadd,@function

mpadd:

	pushl %edi
	pushl %esi

	movl 12(%esp),%ecx
	movl 16(%esp),%edi
	movl 20(%esp),%esi

	xorl %edx,%edx
	decl %ecx

	.align 4
.Lmpadd_loop:
	movl (%esi,%ecx,4),%eax
	movl (%edi,%ecx,4),%edx
	adcl %eax,%edx
	movl %edx,(%edi,%ecx,4)
	decl %ecx
	jns .Lmpadd_loop

	sbbl %eax,%eax
	negl %eax

	popl %esi
	popl %edi
	ret

.Lmpadd_size:
	.size mpadd, .Lmpadd_size  - mpadd




	.text
	.align 4
	.globl mpsub
	
	.type mpsub,@function

mpsub:

	pushl %edi
	pushl %esi

	movl 12(%esp),%ecx
	movl 16(%esp),%edi
	movl 20(%esp),%esi

	xorl %edx,%edx
	decl %ecx

	.align 4
.Lmpsub_loop:
	movl (%esi,%ecx,4),%eax
	movl (%edi,%ecx,4),%edx
	sbbl %eax,%edx
	movl %edx,(%edi,%ecx,4)
	decl %ecx
	jns .Lmpsub_loop

	sbbl %eax,%eax
	negl %eax
	popl %esi
	popl %edi
	ret

.Lmpsub_size:
	.size mpsub, .Lmpsub_size  - mpsub




	.text
	.align 4
	.globl mpdivtwo
	
	.type mpdivtwo,@function

mpdivtwo:

	pushl %edi

	movl 8(%esp),%ecx
	movl 12(%esp),%edi

	leal (%edi,%ecx,4),%edi
	negl %ecx
	xorl %eax,%eax

	.align 4
.Lmpdivtwo_loop:
	rcrl $1,(%edi,%ecx,4)
	inc %ecx
	jnz .Lmpdivtwo_loop

	popl %edi
	ret

.Lmpdivtwo_size:
	.size mpdivtwo, .Lmpdivtwo_size  - mpdivtwo




	.text
	.align 4
	.globl mpmultwo
	
	.type mpmultwo,@function

mpmultwo:

	pushl %edi

	movl 8(%esp),%ecx
	movl 12(%esp),%edi

	xorl %edx,%edx
	decl %ecx

	.align 4
.Lmpmultwo_loop:
	movl (%edi,%ecx,4),%eax
	adcl %eax,%eax
	movl %eax,(%edi,%ecx,4)
	decl %ecx 
	jns .Lmpmultwo_loop

	sbbl %eax,%eax
	negl %eax

	popl %edi
	ret

.Lmpmultwo_size:
	.size mpmultwo, .Lmpmultwo_size  - mpmultwo




	.text
	.align 4
	.globl mpsetmul
	
	.type mpsetmul,@function

mpsetmul:

	pushl %edi
	pushl %esi

	pushl %ebx
	pushl %ebp

	movl 20(%esp),%ecx
	movl 24(%esp),%edi
	movl 28(%esp),%esi
	movl 32(%esp),%ebp

	xorl %edx,%edx
	decl %ecx

	.align 4
.Lmpsetmul_loop:
	movl %edx,%ebx
	movl (%esi,%ecx,4),%eax
	mull %ebp
	addl %ebx,%eax
	adcl $0,%edx
	movl %eax,(%edi,%ecx,4)
	decl %ecx
	jns .Lmpsetmul_loop

	movl %edx,%eax

	popl %ebp
	popl %ebx

	popl %esi
	popl %edi
	ret

.Lmpsetmul_size:
	.size mpsetmul, .Lmpsetmul_size  - mpsetmul




	.text
	.align 4
	.globl mpaddmul
	
	.type mpaddmul,@function

mpaddmul:

	pushl %edi
	pushl %esi

	pushl %ebx
	pushl %ebp

	movl 20(%esp),%ecx
	movl 24(%esp),%edi
	movl 28(%esp),%esi
	movl 32(%esp),%ebp

	xorl %edx,%edx
	decl %ecx

	.align 4
.Lmpaddmul_loop:
	movl %edx,%ebx
	movl (%esi,%ecx,4),%eax
	mull %ebp
	addl %ebx,%eax
	adcl $0,%edx
	addl (%edi,%ecx,4),%eax
	adcl $0,%edx
	movl %eax,(%edi,%ecx,4)
	decl %ecx
	jns .Lmpaddmul_loop

	movl %edx,%eax

	popl %ebp
	popl %ebx

	popl %esi
	popl %edi
	ret

.Lmpaddmul_size:
	.size mpaddmul, .Lmpaddmul_size  - mpaddmul




	.text
	.align 4
	.globl mpaddsqrtrc
	
	.type mpaddsqrtrc,@function

mpaddsqrtrc:

	pushl %edi
	pushl %esi

	pushl %ebx

	movl 16(%esp),%ecx
	movl 20(%esp),%edi
	movl 24(%esp),%esi

	xorl %ebx,%ebx
	decl %ecx

	.align 4
.Lmpaddsqrtrc_loop:
	movl (%esi,%ecx,4),%eax
	mull %eax
	addl %ebx,%eax
	adcl $0,%edx
	addl %eax,4(%edi,%ecx,8)
	adcl %edx,(%edi,%ecx,8)
	sbbl %ebx,%ebx
	negl %ebx
	decl %ecx
	jns .Lmpaddsqrtrc_loop

	movl %ebx,%eax

	popl %ebx

	popl %esi
	popl %edi
	ret

.Lmpaddsqrtrc_size:
	.size mpaddsqrtrc, .Lmpaddsqrtrc_size  - mpaddsqrtrc




	.text
	.align 4
	.globl mppndiv
	
	.type mppndiv,@function

mppndiv:

	movl 4(%esp),%edx
	movl 8(%esp),%eax
	divl 12(%esp)
	ret

.Lmppndiv_size:
	.size mppndiv, .Lmppndiv_size  - mppndiv


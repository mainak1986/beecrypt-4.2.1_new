














	.section	.note.GNU-stack,"",@progbits













































	.set	K00,	0x5a827999
	.set	K20,	0x6ed9eba1
	.set	K40,	0x8f1bbcdc
	.set	K60,	0xca62c1d6

	.set	PARAM_H,		0
	.set	PARAM_DATA,		20










	.text
	.align 4
	.globl sha1Process
	
	.type sha1Process,@function

sha1Process:

	pushl %edi
	pushl %esi
	pushl %ebx
	pushl %ebp

	movl 20(%esp),%esi
	subl $20,%esp
	leal PARAM_DATA(%esi),%edi
	movl %esp,%ebp

	movl $4,%ecx
.L0:
	movl (%esi,%ecx,4),%edx
	movl %edx,(%ebp,%ecx,4)
	decl %ecx
	jns .L0

	movl $15,%ecx

	.align 4
.L1:
	movl (%edi,%ecx,4),%edx

	movl %edx,%eax
	andl $0xff00ff,%edx
	rol $8,%eax
	andl $0xff00ff,%eax
	ror $8,%edx
	or %eax,%edx

	mov %edx,(%edi,%ecx,4)
	decl %ecx
	jns .L1

	leal PARAM_DATA(%esi),%edi
	movl $16,%ecx
	xorl %eax,%eax

	.align 4
.L2:
	movl 52(%edi),%eax
	movl 56(%edi),%ebx
	xorl 32(%edi),%eax
	xorl 36(%edi),%ebx
	xorl 8(%edi),%eax
	xorl 12(%edi),%ebx
	xorl (%edi),%eax
	xorl 4(%edi),%ebx
	roll $1,%eax
	roll $1,%ebx
	movl %eax,64(%edi)
	movl %ebx,68(%edi)
	movl 60(%edi),%eax
	movl 64(%edi),%ebx
	xorl 40(%edi),%eax
	xorl 44(%edi),%ebx
	xorl 16(%edi),%eax
	xorl 20(%edi),%ebx
	xorl 8(%edi),%eax
	xorl 12(%edi),%ebx
	roll $1,%eax
	roll $1,%ebx
	movl %eax,72(%edi)
	movl %ebx,76(%edi)
	addl $16,%edi
	decl %ecx
	jnz .L2

	movl $PARAM_DATA,%edi

	movl (%ebp),%eax
.L01_20:
	
	movl 8(%ebp),%ecx
	movl 4(%ebp),%ebx
	movl 12(%ebp),%edx
	roll $5,%eax
	xorl %edx,%ecx
	addl 16(%ebp),%eax
	andl %ebx,%ecx
	addl $K00,%eax
	rorl $2,%ebx
	addl 0(%esi,%edi),%eax
	xorl %edx,%ecx
	movl %ebx,4(%ebp)
	addl %ecx,%eax
	movl %eax,16(%ebp)

	
	movl %ebx ,%ecx
	movl (%ebp),%ebx
	movl 8(%ebp),%edx
	roll $5,%eax
	xorl %edx,%ecx
	addl 12(%ebp),%eax
	andl %ebx,%ecx
	addl $K00,%eax
	rorl $2,%ebx
	addl 4(%esi,%edi),%eax
	xorl %edx,%ecx
	movl %ebx,(%ebp)
	addl %ecx,%eax
	movl %eax,12(%ebp)

	
	movl %ebx ,%ecx
	movl 16(%ebp),%ebx
	movl 4(%ebp),%edx
	roll $5,%eax
	xorl %edx,%ecx
	addl 8(%ebp),%eax
	andl %ebx,%ecx
	addl $K00,%eax
	rorl $2,%ebx
	addl 8(%esi,%edi),%eax
	xorl %edx,%ecx
	movl %ebx,16(%ebp)
	addl %ecx,%eax
	movl %eax,8(%ebp)

	
	movl %ebx ,%ecx
	movl 12(%ebp),%ebx
	movl (%ebp),%edx
	roll $5,%eax
	xorl %edx,%ecx
	addl 4(%ebp),%eax
	andl %ebx,%ecx
	addl $K00,%eax
	rorl $2,%ebx
	addl 12(%esi,%edi),%eax
	xorl %edx,%ecx
	movl %ebx,12(%ebp)
	addl %ecx,%eax
	movl %eax,4(%ebp)

	
	movl %ebx ,%ecx
	movl 8(%ebp),%ebx
	movl 16(%ebp),%edx
	roll $5,%eax
	xorl %edx,%ecx
	addl (%ebp),%eax
	andl %ebx,%ecx
	addl $K00,%eax
	rorl $2,%ebx
	addl 16(%esi,%edi),%eax
	xorl %edx,%ecx
	movl %ebx,8(%ebp)
	addl %ecx,%eax
	movl %eax,(%ebp)

	addl $20,%edi
	
	movl %ebx ,%ecx
	movl 4(%ebp),%ebx
	movl 12(%ebp),%edx
	roll $5,%eax
	xorl %edx,%ecx
	addl 16(%ebp),%eax
	andl %ebx,%ecx
	addl $K00,%eax
	rorl $2,%ebx
	addl 0(%esi,%edi),%eax
	xorl %edx,%ecx
	movl %ebx,4(%ebp)
	addl %ecx,%eax
	movl %eax,16(%ebp)

	
	movl %ebx ,%ecx
	movl (%ebp),%ebx
	movl 8(%ebp),%edx
	roll $5,%eax
	xorl %edx,%ecx
	addl 12(%ebp),%eax
	andl %ebx,%ecx
	addl $K00,%eax
	rorl $2,%ebx
	addl 4(%esi,%edi),%eax
	xorl %edx,%ecx
	movl %ebx,(%ebp)
	addl %ecx,%eax
	movl %eax,12(%ebp)

	
	movl %ebx ,%ecx
	movl 16(%ebp),%ebx
	movl 4(%ebp),%edx
	roll $5,%eax
	xorl %edx,%ecx
	addl 8(%ebp),%eax
	andl %ebx,%ecx
	addl $K00,%eax
	rorl $2,%ebx
	addl 8(%esi,%edi),%eax
	xorl %edx,%ecx
	movl %ebx,16(%ebp)
	addl %ecx,%eax
	movl %eax,8(%ebp)

	
	movl %ebx ,%ecx
	movl 12(%ebp),%ebx
	movl (%ebp),%edx
	roll $5,%eax
	xorl %edx,%ecx
	addl 4(%ebp),%eax
	andl %ebx,%ecx
	addl $K00,%eax
	rorl $2,%ebx
	addl 12(%esi,%edi),%eax
	xorl %edx,%ecx
	movl %ebx,12(%ebp)
	addl %ecx,%eax
	movl %eax,4(%ebp)

	
	movl %ebx ,%ecx
	movl 8(%ebp),%ebx
	movl 16(%ebp),%edx
	roll $5,%eax
	xorl %edx,%ecx
	addl (%ebp),%eax
	andl %ebx,%ecx
	addl $K00,%eax
	rorl $2,%ebx
	addl 16(%esi,%edi),%eax
	xorl %edx,%ecx
	movl %ebx,8(%ebp)
	addl %ecx,%eax
	movl %eax,(%ebp)

	addl $20,%edi
	
	movl %ebx ,%ecx
	movl 4(%ebp),%ebx
	movl 12(%ebp),%edx
	roll $5,%eax
	xorl %edx,%ecx
	addl 16(%ebp),%eax
	andl %ebx,%ecx
	addl $K00,%eax
	rorl $2,%ebx
	addl 0(%esi,%edi),%eax
	xorl %edx,%ecx
	movl %ebx,4(%ebp)
	addl %ecx,%eax
	movl %eax,16(%ebp)

	
	movl %ebx ,%ecx
	movl (%ebp),%ebx
	movl 8(%ebp),%edx
	roll $5,%eax
	xorl %edx,%ecx
	addl 12(%ebp),%eax
	andl %ebx,%ecx
	addl $K00,%eax
	rorl $2,%ebx
	addl 4(%esi,%edi),%eax
	xorl %edx,%ecx
	movl %ebx,(%ebp)
	addl %ecx,%eax
	movl %eax,12(%ebp)

	
	movl %ebx ,%ecx
	movl 16(%ebp),%ebx
	movl 4(%ebp),%edx
	roll $5,%eax
	xorl %edx,%ecx
	addl 8(%ebp),%eax
	andl %ebx,%ecx
	addl $K00,%eax
	rorl $2,%ebx
	addl 8(%esi,%edi),%eax
	xorl %edx,%ecx
	movl %ebx,16(%ebp)
	addl %ecx,%eax
	movl %eax,8(%ebp)

	
	movl %ebx ,%ecx
	movl 12(%ebp),%ebx
	movl (%ebp),%edx
	roll $5,%eax
	xorl %edx,%ecx
	addl 4(%ebp),%eax
	andl %ebx,%ecx
	addl $K00,%eax
	rorl $2,%ebx
	addl 12(%esi,%edi),%eax
	xorl %edx,%ecx
	movl %ebx,12(%ebp)
	addl %ecx,%eax
	movl %eax,4(%ebp)

	
	movl %ebx ,%ecx
	movl 8(%ebp),%ebx
	movl 16(%ebp),%edx
	roll $5,%eax
	xorl %edx,%ecx
	addl (%ebp),%eax
	andl %ebx,%ecx
	addl $K00,%eax
	rorl $2,%ebx
	addl 16(%esi,%edi),%eax
	xorl %edx,%ecx
	movl %ebx,8(%ebp)
	addl %ecx,%eax
	movl %eax,(%ebp)

	addl $20,%edi
	
	movl %ebx ,%ecx
	movl 4(%ebp),%ebx
	movl 12(%ebp),%edx
	roll $5,%eax
	xorl %edx,%ecx
	addl 16(%ebp),%eax
	andl %ebx,%ecx
	addl $K00,%eax
	rorl $2,%ebx
	addl 0(%esi,%edi),%eax
	xorl %edx,%ecx
	movl %ebx,4(%ebp)
	addl %ecx,%eax
	movl %eax,16(%ebp)

	
	movl %ebx ,%ecx
	movl (%ebp),%ebx
	movl 8(%ebp),%edx
	roll $5,%eax
	xorl %edx,%ecx
	addl 12(%ebp),%eax
	andl %ebx,%ecx
	addl $K00,%eax
	rorl $2,%ebx
	addl 4(%esi,%edi),%eax
	xorl %edx,%ecx
	movl %ebx,(%ebp)
	addl %ecx,%eax
	movl %eax,12(%ebp)

	
	movl %ebx ,%ecx
	movl 16(%ebp),%ebx
	movl 4(%ebp),%edx
	roll $5,%eax
	xorl %edx,%ecx
	addl 8(%ebp),%eax
	andl %ebx,%ecx
	addl $K00,%eax
	rorl $2,%ebx
	addl 8(%esi,%edi),%eax
	xorl %edx,%ecx
	movl %ebx,16(%ebp)
	addl %ecx,%eax
	movl %eax,8(%ebp)

	
	movl %ebx ,%ecx
	movl 12(%ebp),%ebx
	movl (%ebp),%edx
	roll $5,%eax
	xorl %edx,%ecx
	addl 4(%ebp),%eax
	andl %ebx,%ecx
	addl $K00,%eax
	rorl $2,%ebx
	addl 12(%esi,%edi),%eax
	xorl %edx,%ecx
	movl %ebx,12(%ebp)
	addl %ecx,%eax
	movl %eax,4(%ebp)

	
	movl %ebx ,%ecx
	movl 8(%ebp),%ebx
	movl 16(%ebp),%edx
	roll $5,%eax
	xorl %edx,%ecx
	addl (%ebp),%eax
	andl %ebx,%ecx
	addl $K00,%eax
	rorl $2,%ebx
	addl 16(%esi,%edi),%eax
	xorl %edx,%ecx
	movl %ebx,8(%ebp)
	addl %ecx,%eax
	movl %eax,(%ebp)

	addl $20,%edi

.L21_40:
	
	movl %ebx ,%ecx
	movl 4(%ebp),%ebx
	roll $5,%eax
	xorl %ebx,%ecx
	addl 16(%ebp),%eax
	xorl 12(%ebp),%ecx
	addl $K20,%eax
	rorl $2,%ebx
	addl 0(%esi,%edi),%eax
	movl %ebx,4(%ebp)
	addl %ecx,%eax
	movl %eax,16(%ebp)

	
	movl %ebx ,%ecx
	movl (%ebp),%ebx
	roll $5,%eax
	xorl %ebx,%ecx
	addl 12(%ebp),%eax
	xorl 8(%ebp),%ecx
	addl $K20,%eax
	rorl $2,%ebx
	addl 4(%esi,%edi),%eax
	movl %ebx,(%ebp)
	addl %ecx,%eax
	movl %eax,12(%ebp)

	
	movl %ebx ,%ecx
	movl 16(%ebp),%ebx
	roll $5,%eax
	xorl %ebx,%ecx
	addl 8(%ebp),%eax
	xorl 4(%ebp),%ecx
	addl $K20,%eax
	rorl $2,%ebx
	addl 8(%esi,%edi),%eax
	movl %ebx,16(%ebp)
	addl %ecx,%eax
	movl %eax,8(%ebp)

	
	movl %ebx ,%ecx
	movl 12(%ebp),%ebx
	roll $5,%eax
	xorl %ebx,%ecx
	addl 4(%ebp),%eax
	xorl (%ebp),%ecx
	addl $K20,%eax
	rorl $2,%ebx
	addl 12(%esi,%edi),%eax
	movl %ebx,12(%ebp)
	addl %ecx,%eax
	movl %eax,4(%ebp)

	
	movl %ebx ,%ecx
	movl 8(%ebp),%ebx
	roll $5,%eax
	xorl %ebx,%ecx
	addl (%ebp),%eax
	xorl 16(%ebp),%ecx
	addl $K20,%eax
	rorl $2,%ebx
	addl 16(%esi,%edi),%eax
	movl %ebx,8(%ebp)
	addl %ecx,%eax
	movl %eax,(%ebp)

	addl $20,%edi
	
	movl %ebx ,%ecx
	movl 4(%ebp),%ebx
	roll $5,%eax
	xorl %ebx,%ecx
	addl 16(%ebp),%eax
	xorl 12(%ebp),%ecx
	addl $K20,%eax
	rorl $2,%ebx
	addl 0(%esi,%edi),%eax
	movl %ebx,4(%ebp)
	addl %ecx,%eax
	movl %eax,16(%ebp)

	
	movl %ebx ,%ecx
	movl (%ebp),%ebx
	roll $5,%eax
	xorl %ebx,%ecx
	addl 12(%ebp),%eax
	xorl 8(%ebp),%ecx
	addl $K20,%eax
	rorl $2,%ebx
	addl 4(%esi,%edi),%eax
	movl %ebx,(%ebp)
	addl %ecx,%eax
	movl %eax,12(%ebp)

	
	movl %ebx ,%ecx
	movl 16(%ebp),%ebx
	roll $5,%eax
	xorl %ebx,%ecx
	addl 8(%ebp),%eax
	xorl 4(%ebp),%ecx
	addl $K20,%eax
	rorl $2,%ebx
	addl 8(%esi,%edi),%eax
	movl %ebx,16(%ebp)
	addl %ecx,%eax
	movl %eax,8(%ebp)

	
	movl %ebx ,%ecx
	movl 12(%ebp),%ebx
	roll $5,%eax
	xorl %ebx,%ecx
	addl 4(%ebp),%eax
	xorl (%ebp),%ecx
	addl $K20,%eax
	rorl $2,%ebx
	addl 12(%esi,%edi),%eax
	movl %ebx,12(%ebp)
	addl %ecx,%eax
	movl %eax,4(%ebp)

	
	movl %ebx ,%ecx
	movl 8(%ebp),%ebx
	roll $5,%eax
	xorl %ebx,%ecx
	addl (%ebp),%eax
	xorl 16(%ebp),%ecx
	addl $K20,%eax
	rorl $2,%ebx
	addl 16(%esi,%edi),%eax
	movl %ebx,8(%ebp)
	addl %ecx,%eax
	movl %eax,(%ebp)

	addl $20,%edi
	
	movl %ebx ,%ecx
	movl 4(%ebp),%ebx
	roll $5,%eax
	xorl %ebx,%ecx
	addl 16(%ebp),%eax
	xorl 12(%ebp),%ecx
	addl $K20,%eax
	rorl $2,%ebx
	addl 0(%esi,%edi),%eax
	movl %ebx,4(%ebp)
	addl %ecx,%eax
	movl %eax,16(%ebp)

	
	movl %ebx ,%ecx
	movl (%ebp),%ebx
	roll $5,%eax
	xorl %ebx,%ecx
	addl 12(%ebp),%eax
	xorl 8(%ebp),%ecx
	addl $K20,%eax
	rorl $2,%ebx
	addl 4(%esi,%edi),%eax
	movl %ebx,(%ebp)
	addl %ecx,%eax
	movl %eax,12(%ebp)

	
	movl %ebx ,%ecx
	movl 16(%ebp),%ebx
	roll $5,%eax
	xorl %ebx,%ecx
	addl 8(%ebp),%eax
	xorl 4(%ebp),%ecx
	addl $K20,%eax
	rorl $2,%ebx
	addl 8(%esi,%edi),%eax
	movl %ebx,16(%ebp)
	addl %ecx,%eax
	movl %eax,8(%ebp)

	
	movl %ebx ,%ecx
	movl 12(%ebp),%ebx
	roll $5,%eax
	xorl %ebx,%ecx
	addl 4(%ebp),%eax
	xorl (%ebp),%ecx
	addl $K20,%eax
	rorl $2,%ebx
	addl 12(%esi,%edi),%eax
	movl %ebx,12(%ebp)
	addl %ecx,%eax
	movl %eax,4(%ebp)

	
	movl %ebx ,%ecx
	movl 8(%ebp),%ebx
	roll $5,%eax
	xorl %ebx,%ecx
	addl (%ebp),%eax
	xorl 16(%ebp),%ecx
	addl $K20,%eax
	rorl $2,%ebx
	addl 16(%esi,%edi),%eax
	movl %ebx,8(%ebp)
	addl %ecx,%eax
	movl %eax,(%ebp)

	addl $20,%edi
	
	movl %ebx ,%ecx
	movl 4(%ebp),%ebx
	roll $5,%eax
	xorl %ebx,%ecx
	addl 16(%ebp),%eax
	xorl 12(%ebp),%ecx
	addl $K20,%eax
	rorl $2,%ebx
	addl 0(%esi,%edi),%eax
	movl %ebx,4(%ebp)
	addl %ecx,%eax
	movl %eax,16(%ebp)

	
	movl %ebx ,%ecx
	movl (%ebp),%ebx
	roll $5,%eax
	xorl %ebx,%ecx
	addl 12(%ebp),%eax
	xorl 8(%ebp),%ecx
	addl $K20,%eax
	rorl $2,%ebx
	addl 4(%esi,%edi),%eax
	movl %ebx,(%ebp)
	addl %ecx,%eax
	movl %eax,12(%ebp)

	
	movl %ebx ,%ecx
	movl 16(%ebp),%ebx
	roll $5,%eax
	xorl %ebx,%ecx
	addl 8(%ebp),%eax
	xorl 4(%ebp),%ecx
	addl $K20,%eax
	rorl $2,%ebx
	addl 8(%esi,%edi),%eax
	movl %ebx,16(%ebp)
	addl %ecx,%eax
	movl %eax,8(%ebp)

	
	movl %ebx ,%ecx
	movl 12(%ebp),%ebx
	roll $5,%eax
	xorl %ebx,%ecx
	addl 4(%ebp),%eax
	xorl (%ebp),%ecx
	addl $K20,%eax
	rorl $2,%ebx
	addl 12(%esi,%edi),%eax
	movl %ebx,12(%ebp)
	addl %ecx,%eax
	movl %eax,4(%ebp)

	
	movl %ebx ,%ecx
	movl 8(%ebp),%ebx
	roll $5,%eax
	xorl %ebx,%ecx
	addl (%ebp),%eax
	xorl 16(%ebp),%ecx
	addl $K20,%eax
	rorl $2,%ebx
	addl 16(%esi,%edi),%eax
	movl %ebx,8(%ebp)
	addl %ecx,%eax
	movl %eax,(%ebp)

	addl $20,%edi

.L41_60:
	
	movl %ebx ,%ecx
	roll $5,%eax
	movl 4(%ebp),%ebx
	movl %ecx,%edx
	addl 16(%ebp),%eax
	orl %ebx,%ecx
	andl %ebx,%edx
	andl 12(%ebp),%ecx
	addl $K40,%eax
	orl %edx,%ecx
	addl 0(%esi,%edi),%eax
	rorl $2,%ebx
	addl %ecx,%eax
	movl %ebx,4(%ebp)
	movl %eax,16(%ebp)

	
	movl %ebx ,%ecx
	roll $5,%eax
	movl (%ebp),%ebx
	movl %ecx,%edx
	addl 12(%ebp),%eax
	orl %ebx,%ecx
	andl %ebx,%edx
	andl 8(%ebp),%ecx
	addl $K40,%eax
	orl %edx,%ecx
	addl 4(%esi,%edi),%eax
	rorl $2,%ebx
	addl %ecx,%eax
	movl %ebx,(%ebp)
	movl %eax,12(%ebp)

	
	movl %ebx ,%ecx
	roll $5,%eax
	movl 16(%ebp),%ebx
	movl %ecx,%edx
	addl 8(%ebp),%eax
	orl %ebx,%ecx
	andl %ebx,%edx
	andl 4(%ebp),%ecx
	addl $K40,%eax
	orl %edx,%ecx
	addl 8(%esi,%edi),%eax
	rorl $2,%ebx
	addl %ecx,%eax
	movl %ebx,16(%ebp)
	movl %eax,8(%ebp)

	
	movl %ebx ,%ecx
	roll $5,%eax
	movl 12(%ebp),%ebx
	movl %ecx,%edx
	addl 4(%ebp),%eax
	orl %ebx,%ecx
	andl %ebx,%edx
	andl (%ebp),%ecx
	addl $K40,%eax
	orl %edx,%ecx
	addl 12(%esi,%edi),%eax
	rorl $2,%ebx
	addl %ecx,%eax
	movl %ebx,12(%ebp)
	movl %eax,4(%ebp)

	
	movl %ebx ,%ecx
	roll $5,%eax
	movl 8(%ebp),%ebx
	movl %ecx,%edx
	addl (%ebp),%eax
	orl %ebx,%ecx
	andl %ebx,%edx
	andl 16(%ebp),%ecx
	addl $K40,%eax
	orl %edx,%ecx
	addl 16(%esi,%edi),%eax
	rorl $2,%ebx
	addl %ecx,%eax
	movl %ebx,8(%ebp)
	movl %eax,(%ebp)

	addl $20,%edi
	
	movl %ebx ,%ecx
	roll $5,%eax
	movl 4(%ebp),%ebx
	movl %ecx,%edx
	addl 16(%ebp),%eax
	orl %ebx,%ecx
	andl %ebx,%edx
	andl 12(%ebp),%ecx
	addl $K40,%eax
	orl %edx,%ecx
	addl 0(%esi,%edi),%eax
	rorl $2,%ebx
	addl %ecx,%eax
	movl %ebx,4(%ebp)
	movl %eax,16(%ebp)

	
	movl %ebx ,%ecx
	roll $5,%eax
	movl (%ebp),%ebx
	movl %ecx,%edx
	addl 12(%ebp),%eax
	orl %ebx,%ecx
	andl %ebx,%edx
	andl 8(%ebp),%ecx
	addl $K40,%eax
	orl %edx,%ecx
	addl 4(%esi,%edi),%eax
	rorl $2,%ebx
	addl %ecx,%eax
	movl %ebx,(%ebp)
	movl %eax,12(%ebp)

	
	movl %ebx ,%ecx
	roll $5,%eax
	movl 16(%ebp),%ebx
	movl %ecx,%edx
	addl 8(%ebp),%eax
	orl %ebx,%ecx
	andl %ebx,%edx
	andl 4(%ebp),%ecx
	addl $K40,%eax
	orl %edx,%ecx
	addl 8(%esi,%edi),%eax
	rorl $2,%ebx
	addl %ecx,%eax
	movl %ebx,16(%ebp)
	movl %eax,8(%ebp)

	
	movl %ebx ,%ecx
	roll $5,%eax
	movl 12(%ebp),%ebx
	movl %ecx,%edx
	addl 4(%ebp),%eax
	orl %ebx,%ecx
	andl %ebx,%edx
	andl (%ebp),%ecx
	addl $K40,%eax
	orl %edx,%ecx
	addl 12(%esi,%edi),%eax
	rorl $2,%ebx
	addl %ecx,%eax
	movl %ebx,12(%ebp)
	movl %eax,4(%ebp)

	
	movl %ebx ,%ecx
	roll $5,%eax
	movl 8(%ebp),%ebx
	movl %ecx,%edx
	addl (%ebp),%eax
	orl %ebx,%ecx
	andl %ebx,%edx
	andl 16(%ebp),%ecx
	addl $K40,%eax
	orl %edx,%ecx
	addl 16(%esi,%edi),%eax
	rorl $2,%ebx
	addl %ecx,%eax
	movl %ebx,8(%ebp)
	movl %eax,(%ebp)

	addl $20,%edi
	
	movl %ebx ,%ecx
	roll $5,%eax
	movl 4(%ebp),%ebx
	movl %ecx,%edx
	addl 16(%ebp),%eax
	orl %ebx,%ecx
	andl %ebx,%edx
	andl 12(%ebp),%ecx
	addl $K40,%eax
	orl %edx,%ecx
	addl 0(%esi,%edi),%eax
	rorl $2,%ebx
	addl %ecx,%eax
	movl %ebx,4(%ebp)
	movl %eax,16(%ebp)

	
	movl %ebx ,%ecx
	roll $5,%eax
	movl (%ebp),%ebx
	movl %ecx,%edx
	addl 12(%ebp),%eax
	orl %ebx,%ecx
	andl %ebx,%edx
	andl 8(%ebp),%ecx
	addl $K40,%eax
	orl %edx,%ecx
	addl 4(%esi,%edi),%eax
	rorl $2,%ebx
	addl %ecx,%eax
	movl %ebx,(%ebp)
	movl %eax,12(%ebp)

	
	movl %ebx ,%ecx
	roll $5,%eax
	movl 16(%ebp),%ebx
	movl %ecx,%edx
	addl 8(%ebp),%eax
	orl %ebx,%ecx
	andl %ebx,%edx
	andl 4(%ebp),%ecx
	addl $K40,%eax
	orl %edx,%ecx
	addl 8(%esi,%edi),%eax
	rorl $2,%ebx
	addl %ecx,%eax
	movl %ebx,16(%ebp)
	movl %eax,8(%ebp)

	
	movl %ebx ,%ecx
	roll $5,%eax
	movl 12(%ebp),%ebx
	movl %ecx,%edx
	addl 4(%ebp),%eax
	orl %ebx,%ecx
	andl %ebx,%edx
	andl (%ebp),%ecx
	addl $K40,%eax
	orl %edx,%ecx
	addl 12(%esi,%edi),%eax
	rorl $2,%ebx
	addl %ecx,%eax
	movl %ebx,12(%ebp)
	movl %eax,4(%ebp)

	
	movl %ebx ,%ecx
	roll $5,%eax
	movl 8(%ebp),%ebx
	movl %ecx,%edx
	addl (%ebp),%eax
	orl %ebx,%ecx
	andl %ebx,%edx
	andl 16(%ebp),%ecx
	addl $K40,%eax
	orl %edx,%ecx
	addl 16(%esi,%edi),%eax
	rorl $2,%ebx
	addl %ecx,%eax
	movl %ebx,8(%ebp)
	movl %eax,(%ebp)

	addl $20,%edi
	
	movl %ebx ,%ecx
	roll $5,%eax
	movl 4(%ebp),%ebx
	movl %ecx,%edx
	addl 16(%ebp),%eax
	orl %ebx,%ecx
	andl %ebx,%edx
	andl 12(%ebp),%ecx
	addl $K40,%eax
	orl %edx,%ecx
	addl 0(%esi,%edi),%eax
	rorl $2,%ebx
	addl %ecx,%eax
	movl %ebx,4(%ebp)
	movl %eax,16(%ebp)

	
	movl %ebx ,%ecx
	roll $5,%eax
	movl (%ebp),%ebx
	movl %ecx,%edx
	addl 12(%ebp),%eax
	orl %ebx,%ecx
	andl %ebx,%edx
	andl 8(%ebp),%ecx
	addl $K40,%eax
	orl %edx,%ecx
	addl 4(%esi,%edi),%eax
	rorl $2,%ebx
	addl %ecx,%eax
	movl %ebx,(%ebp)
	movl %eax,12(%ebp)

	
	movl %ebx ,%ecx
	roll $5,%eax
	movl 16(%ebp),%ebx
	movl %ecx,%edx
	addl 8(%ebp),%eax
	orl %ebx,%ecx
	andl %ebx,%edx
	andl 4(%ebp),%ecx
	addl $K40,%eax
	orl %edx,%ecx
	addl 8(%esi,%edi),%eax
	rorl $2,%ebx
	addl %ecx,%eax
	movl %ebx,16(%ebp)
	movl %eax,8(%ebp)

	
	movl %ebx ,%ecx
	roll $5,%eax
	movl 12(%ebp),%ebx
	movl %ecx,%edx
	addl 4(%ebp),%eax
	orl %ebx,%ecx
	andl %ebx,%edx
	andl (%ebp),%ecx
	addl $K40,%eax
	orl %edx,%ecx
	addl 12(%esi,%edi),%eax
	rorl $2,%ebx
	addl %ecx,%eax
	movl %ebx,12(%ebp)
	movl %eax,4(%ebp)

	
	movl %ebx ,%ecx
	roll $5,%eax
	movl 8(%ebp),%ebx
	movl %ecx,%edx
	addl (%ebp),%eax
	orl %ebx,%ecx
	andl %ebx,%edx
	andl 16(%ebp),%ecx
	addl $K40,%eax
	orl %edx,%ecx
	addl 16(%esi,%edi),%eax
	rorl $2,%ebx
	addl %ecx,%eax
	movl %ebx,8(%ebp)
	movl %eax,(%ebp)

	addl $20,%edi

.L61_80:
	
	movl %ebx ,%ecx
	movl 4(%ebp),%ebx
	roll $5,%eax
	xorl %ebx,%ecx
	addl 16(%ebp),%eax
	xorl 12(%ebp),%ecx
	addl $K60,%eax
	rorl $2,%ebx
	addl 0(%esi,%edi),%eax
	movl %ebx,4(%ebp)
	addl %ecx,%eax
	movl %eax,16(%ebp)

	
	movl %ebx ,%ecx
	movl (%ebp),%ebx
	roll $5,%eax
	xorl %ebx,%ecx
	addl 12(%ebp),%eax
	xorl 8(%ebp),%ecx
	addl $K60,%eax
	rorl $2,%ebx
	addl 4(%esi,%edi),%eax
	movl %ebx,(%ebp)
	addl %ecx,%eax
	movl %eax,12(%ebp)

	
	movl %ebx ,%ecx
	movl 16(%ebp),%ebx
	roll $5,%eax
	xorl %ebx,%ecx
	addl 8(%ebp),%eax
	xorl 4(%ebp),%ecx
	addl $K60,%eax
	rorl $2,%ebx
	addl 8(%esi,%edi),%eax
	movl %ebx,16(%ebp)
	addl %ecx,%eax
	movl %eax,8(%ebp)

	
	movl %ebx ,%ecx
	movl 12(%ebp),%ebx
	roll $5,%eax
	xorl %ebx,%ecx
	addl 4(%ebp),%eax
	xorl (%ebp),%ecx
	addl $K60,%eax
	rorl $2,%ebx
	addl 12(%esi,%edi),%eax
	movl %ebx,12(%ebp)
	addl %ecx,%eax
	movl %eax,4(%ebp)

	
	movl %ebx ,%ecx
	movl 8(%ebp),%ebx
	roll $5,%eax
	xorl %ebx,%ecx
	addl (%ebp),%eax
	xorl 16(%ebp),%ecx
	addl $K60,%eax
	rorl $2,%ebx
	addl 16(%esi,%edi),%eax
	movl %ebx,8(%ebp)
	addl %ecx,%eax
	movl %eax,(%ebp)

	addl $20,%edi
	
	movl %ebx ,%ecx
	movl 4(%ebp),%ebx
	roll $5,%eax
	xorl %ebx,%ecx
	addl 16(%ebp),%eax
	xorl 12(%ebp),%ecx
	addl $K60,%eax
	rorl $2,%ebx
	addl 0(%esi,%edi),%eax
	movl %ebx,4(%ebp)
	addl %ecx,%eax
	movl %eax,16(%ebp)

	
	movl %ebx ,%ecx
	movl (%ebp),%ebx
	roll $5,%eax
	xorl %ebx,%ecx
	addl 12(%ebp),%eax
	xorl 8(%ebp),%ecx
	addl $K60,%eax
	rorl $2,%ebx
	addl 4(%esi,%edi),%eax
	movl %ebx,(%ebp)
	addl %ecx,%eax
	movl %eax,12(%ebp)

	
	movl %ebx ,%ecx
	movl 16(%ebp),%ebx
	roll $5,%eax
	xorl %ebx,%ecx
	addl 8(%ebp),%eax
	xorl 4(%ebp),%ecx
	addl $K60,%eax
	rorl $2,%ebx
	addl 8(%esi,%edi),%eax
	movl %ebx,16(%ebp)
	addl %ecx,%eax
	movl %eax,8(%ebp)

	
	movl %ebx ,%ecx
	movl 12(%ebp),%ebx
	roll $5,%eax
	xorl %ebx,%ecx
	addl 4(%ebp),%eax
	xorl (%ebp),%ecx
	addl $K60,%eax
	rorl $2,%ebx
	addl 12(%esi,%edi),%eax
	movl %ebx,12(%ebp)
	addl %ecx,%eax
	movl %eax,4(%ebp)

	
	movl %ebx ,%ecx
	movl 8(%ebp),%ebx
	roll $5,%eax
	xorl %ebx,%ecx
	addl (%ebp),%eax
	xorl 16(%ebp),%ecx
	addl $K60,%eax
	rorl $2,%ebx
	addl 16(%esi,%edi),%eax
	movl %ebx,8(%ebp)
	addl %ecx,%eax
	movl %eax,(%ebp)

	addl $20,%edi
	
	movl %ebx ,%ecx
	movl 4(%ebp),%ebx
	roll $5,%eax
	xorl %ebx,%ecx
	addl 16(%ebp),%eax
	xorl 12(%ebp),%ecx
	addl $K60,%eax
	rorl $2,%ebx
	addl 0(%esi,%edi),%eax
	movl %ebx,4(%ebp)
	addl %ecx,%eax
	movl %eax,16(%ebp)

	
	movl %ebx ,%ecx
	movl (%ebp),%ebx
	roll $5,%eax
	xorl %ebx,%ecx
	addl 12(%ebp),%eax
	xorl 8(%ebp),%ecx
	addl $K60,%eax
	rorl $2,%ebx
	addl 4(%esi,%edi),%eax
	movl %ebx,(%ebp)
	addl %ecx,%eax
	movl %eax,12(%ebp)

	
	movl %ebx ,%ecx
	movl 16(%ebp),%ebx
	roll $5,%eax
	xorl %ebx,%ecx
	addl 8(%ebp),%eax
	xorl 4(%ebp),%ecx
	addl $K60,%eax
	rorl $2,%ebx
	addl 8(%esi,%edi),%eax
	movl %ebx,16(%ebp)
	addl %ecx,%eax
	movl %eax,8(%ebp)

	
	movl %ebx ,%ecx
	movl 12(%ebp),%ebx
	roll $5,%eax
	xorl %ebx,%ecx
	addl 4(%ebp),%eax
	xorl (%ebp),%ecx
	addl $K60,%eax
	rorl $2,%ebx
	addl 12(%esi,%edi),%eax
	movl %ebx,12(%ebp)
	addl %ecx,%eax
	movl %eax,4(%ebp)

	
	movl %ebx ,%ecx
	movl 8(%ebp),%ebx
	roll $5,%eax
	xorl %ebx,%ecx
	addl (%ebp),%eax
	xorl 16(%ebp),%ecx
	addl $K60,%eax
	rorl $2,%ebx
	addl 16(%esi,%edi),%eax
	movl %ebx,8(%ebp)
	addl %ecx,%eax
	movl %eax,(%ebp)

	addl $20,%edi
	
	movl %ebx ,%ecx
	movl 4(%ebp),%ebx
	roll $5,%eax
	xorl %ebx,%ecx
	addl 16(%ebp),%eax
	xorl 12(%ebp),%ecx
	addl $K60,%eax
	rorl $2,%ebx
	addl 0(%esi,%edi),%eax
	movl %ebx,4(%ebp)
	addl %ecx,%eax
	movl %eax,16(%ebp)

	
	movl %ebx ,%ecx
	movl (%ebp),%ebx
	roll $5,%eax
	xorl %ebx,%ecx
	addl 12(%ebp),%eax
	xorl 8(%ebp),%ecx
	addl $K60,%eax
	rorl $2,%ebx
	addl 4(%esi,%edi),%eax
	movl %ebx,(%ebp)
	addl %ecx,%eax
	movl %eax,12(%ebp)

	
	movl %ebx ,%ecx
	movl 16(%ebp),%ebx
	roll $5,%eax
	xorl %ebx,%ecx
	addl 8(%ebp),%eax
	xorl 4(%ebp),%ecx
	addl $K60,%eax
	rorl $2,%ebx
	addl 8(%esi,%edi),%eax
	movl %ebx,16(%ebp)
	addl %ecx,%eax
	movl %eax,8(%ebp)

	
	movl %ebx ,%ecx
	movl 12(%ebp),%ebx
	roll $5,%eax
	xorl %ebx,%ecx
	addl 4(%ebp),%eax
	xorl (%ebp),%ecx
	addl $K60,%eax
	rorl $2,%ebx
	addl 12(%esi,%edi),%eax
	movl %ebx,12(%ebp)
	addl %ecx,%eax
	movl %eax,4(%ebp)

	
	movl %ebx ,%ecx
	movl 8(%ebp),%ebx
	roll $5,%eax
	xorl %ebx,%ecx
	addl (%ebp),%eax
	xorl 16(%ebp),%ecx
	addl $K60,%eax
	rorl $2,%ebx
	addl 16(%esi,%edi),%eax
	movl %ebx,8(%ebp)
	addl %ecx,%eax
	movl %eax,(%ebp)


	movl $4,%ecx

	.align 4
.L3:
	movl (%ebp,%ecx,4),%eax
	addl %eax,(%esi,%ecx,4)
	decl %ecx
	jns .L3

	addl $20,%esp
	popl %ebp
	popl %ebx
	popl %esi
	popl %edi
	ret

.Lsha1Process_size:
	.size sha1Process, .Lsha1Process_size  - sha1Process


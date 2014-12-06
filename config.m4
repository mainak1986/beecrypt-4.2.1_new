dnl config.m4
ifdef(`__CONFIG_M4_INCLUDED__',,`
define(`CONFIG_TOP_SRCDIR',`.')
define(`ASM_OS',`linux-gnu')
define(`ASM_CPU',`i686')
define(`ASM_ARCH',`i386')
define(`ASM_BIGENDIAN',`no')
define(`ASM_SRCDIR',`./gas')
define(`TEXTSEG',`.text')
define(`GLOBL',`.globl')
define(`GSYM_PREFIX',`')
define(`LSYM_PREFIX',`.L')
define(`ALIGN',`.align 4')
define(`__CONFIG_M4_INCLUDED__')
')
	.section	.note.GNU-stack,"",@progbits

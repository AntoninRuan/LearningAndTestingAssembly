section	.text
   global _start     ;must be declared for linker (ld)
_start:             ;tell linker entry point

   mov	eax,4       ;system call number (sys_write)
   mov	ebx,1       ;file descriptor (stdout)
   mov	ecx, name   ;message to write
   mov	edx, 12      ;message length
   int	0x80        ;call kernel

   mov	[name],  dword 'salu'  
   mov   [name + 4], byte 't' 

   ;writing the name 'Nuha Ali'
   mov	edx,11       ;message length
   mov	ecx,name    ;message to write
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel

   mov eax, 4
   mov ebx, 1
   mov ecx, 0xa
   int 0x80

   mov	eax,1       ;system call number (sys_exit)
   mov  ebx, 0
   int	0x80        ;call kernel

section	.data
name dW 'Hello World '
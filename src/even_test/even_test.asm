SYS_EXIT equ 1
SYS_WRITE equ 4
SYS_READ equ 3

STDIN equ 2
STDOUT equ 1

section .data
	askMsg db 'Entrez un nombre: '
	lenAskMsg equ $-askMsg
	evenMsg db 'Nombre pair!', 0xa
	lenEvenMsg equ $-evenMsg
	oddMsg db 'Nombre impair!', 0xa
	lenOddMsg equ $-oddMsg

section .bss
	num resb 1

section .text
	global _start

_start:
	
	mov eax, SYS_WRITE 
	mov ebx, STDOUT
	mov ecx, askMsg
	mov edx, lenAskMsg
	int 0x80

	mov eax, SYS_READ
	mov ebx, STDIN
	mov ecx, num
	mov edx, 1
	int 0x80

	;test de la parité
	mov ax, [num]
	and ax, 1
	jnz odd
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, evenMsg
	mov edx, lenEvenMsg
	int 0x80
	jmp end_prog

odd:
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, oddMsg
	mov edx, lenOddMsg
	int 0x80

end_prog:

	mov eax, SYS_EXIT
	mov ebx, 0
	int 0x80
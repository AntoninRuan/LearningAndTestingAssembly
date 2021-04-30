SYS_EXIT equ 1
SYS_WRITE equ 4
STDOUT equ 1

section .text
	global _start

_start:
	
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, msg
	mov edx, lenMsg
	int 0x80


	mov eax, SYS_EXIT
	mov ebx, 0
	int 0x80

section .data
	msg db 'Hello Word!', 0xa, 0xd
	lenMsg equ $-msg 
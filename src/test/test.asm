section .text

	global _start

_start:
	
	mov eax, 4
	mov ebx, 1
	mov ecx, s + 3
	mov edx, lenS
	int 0x80

	mov eax, 1
	mov ebx ,0
	int 0x80

section .data
	s db 'Hello World'
	lenS equ $-s

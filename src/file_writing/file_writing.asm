SYS_EXIT equ 1
SYS_READ equ 3
SYS_WRITE equ 4
SYS_OPEN equ 5
SYS_CLOSE equ 6
SYS_CREATE equ 8

STDIN equ 2
STDOUT equ 1

section .text
   global _start

_start:

   mov eax, SYS_CREATE ; création du fichier
   mov ebx, fileName
   mov ecx, 0777
   int 0x80

   mov [fd], eax ; récupération du file descriptor

   mov eax, SYS_WRITE
   mov ebx, [fd]
   mov ecx, msg
   mov edx, lenMsg
   int 0x80

   mov eax, SYS_CLOSE
   mov ebx, [fd]
   int 0x80

end_prog:
   mov eax, SYS_EXIT
   mov ebx, 0
   int 0x80


section .bss
   fd resb 1

section .data
   fileName db 'hello.txt', 0x0
   msg db 'Hello Word!', 0xa
   lenMsg equ $-msg

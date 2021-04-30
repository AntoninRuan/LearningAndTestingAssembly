section .data
    userMsg db 'Entrez un message: '
    lenUserMsg equ $-userMsg
    dispMsg db 'Vous avez saisi: '
    lenDispMsg equ $-dispMsg

section .bss
    num resb 5

section .text
    global _start

_start:
    mov eax, 4 ; Passage en mode print
    mov ebx, 1 ; file descriptor (ici standard_out)
    mov ecx, userMsg ; message à print
    mov edx, lenUserMsg ; longueur du message
    int 0x80 ; envoie au système

    mov eax, 3 ; passage en mode lecture
    mov ebx, 2 ; file descriptor (ici standard_in)
    mov ecx, num ; déplacement de la valeur lue dans la variable num
    mov edx, 5 ; longueur dans la lecture
    int 0x80

    mov eax, 4
    mov ebx, 1;
    mov ecx, dispMsg
    mov edx, lenDispMsg
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, num
    mov edx, 5
    int 0x80

    mov eax, 1
    mov ebx, 0
    int 0x80



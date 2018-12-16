section .data
	i db 0
	msg1 db 'Tallet '
	n1 equ $ - msg1
	msg2 db ' er delelig med 3'
	n2 equ $ - msg2

section .bss
	svar resb 1
section .text
global _start
_start:
	mov ecx, 10
for:
	mov eax, ecx
	push ecx
	mov ebx, 3
	div ebx
	cmp edx, 0
	jne for

	mov [svar], eax 

	mov eax, 4
	mov ebx, 1
	mov ecx, msg1
	mov edx, n1
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, svar
	mov edx, 1
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, msg2
	mov edx, n2
	int 80h

	pop ecx
	loop for

ferdig:
	mov eax, 1
	int 80h

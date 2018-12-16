
section .data
	sum db 0
	n db 5
	i db 1

section .text
global _start
_start:
	mov ecx, [n]
l:
	push ecx
	mov eax, [i]
	mov ebx, [sum]
	add ebx, eax
	mov [sum], ebx
	inc eax
	mov [i], eax
	pop ecx
	loop l

ferdig:
	mov eax, [sum]
	sub eax, '0'
	mov [sum], eax
	mov eax, 4
	mov ebx, 1
	mov ecx, sum
	mov edx, 1
	int 80h

	mov eax, 1
	int 80h

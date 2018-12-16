section .data

section .bss
	a resb 1
	n resb 1
section .text
	global _start
_start:
	mov [n], 4 	;Gir n verdien 4
	mov eax, 1	;Første fibonacci tall(a)
	mov ebx, 2	;Andre fibonacci-tall(a)
lokke:
	push ecx	;Pusher i stacken
	push eax	
	push ebx

	add eax, '0'	;Legger til asciitegnet 0(48)
	mov [a], eax
;skriver ut a
	mov eax, 4 	;kaller på systemfunk(writer)
	mov ebx, 1	;stdout
	mov ecx, n	;ecx addresserer til n 
	mov edx, 1	;Lengde 1
	int 0x80	;interrupt (setter i gang)
	
	pop ebx		;får tilbake fra stacken
	pop eax
	pop ecx
	
	mov edx, eax	;Velger en midlertidig for a
	mov eax, ebx	; a blir til b
	add ebx, edx	; b blir b + midlertidig a

	mov eax, 1	;Systemfunksjon (exit)
	mov ebx, 0
	int 0x80

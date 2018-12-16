section .data
	a db 1 
	b db 2
 
section .bss
	n resb 1
	ascii resb 1
	
section .text
global _start
_start:
	mov eax, 3	;Sys_read
	mov ebx, 0	;stdin
	mov ecx, n	;n inn i ecx
	mov edx, 1	; lengde 1
	int 80h
	
	mov ecx, [n]	;verdien i n til ecx
	sub ecx, '0'	; trekker fra 48 i ascii tabellen
	mov [n], ecx	; verdien til n blir til ascii tegnet oppdatert

l:
	mov eax, [a]	; addresserer til a
	add eax, '0'	; legger til ascii verdi
	mov [ascii], eax	; 49 ascii tabell i ascii verdi
	push ecx	;pusher ecx  som har verdien n
	mov eax, 4	;syswrite
	mov ebx, 1	;stdout
	mov ecx, ascii	;addresserer til a
	mov edx, 1	;lengde 1
	int 80h

	mov eax, [a]	; a verdi inn i eax
	mov ecx, [b]	; b verdi inn i ebx
	mov [a], ecx	; a blir til ecx
	add ecx, eax	; a + b blir nye ecx
	mov [b], ecx	; setter b til å være ecx ver
	pop ecx		; får tilbake n i loopen
	loop l		; til n blir 0
ferdig:
	mov eax, 1	; ferdig programmet
	int 80h

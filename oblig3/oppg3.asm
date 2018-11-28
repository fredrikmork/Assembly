;Programmet skal øke a med 1 så lenge a er mindre enn 10, og minke a 
;med 1 når den er over 10. Vi forventer 0 som svar
	cr	equ 13 ; Vognretur
	lf	equ 10 ; Linjeskift
	SYS_EXIT	equ 1
	SYS_READ	equ 3
	SYS_WRITE	equ 4
	STDIN	equ 0
	STDOUT	equ 1
	STDERR	equ 2

;Lager variabelen a og gir 1 byte
section .bss
	a resb 1
	i resb 1

;Lager variablene for linjeskift
section .data
	crlf db cr,lf
	crlflen equ $ - crlf

section .text
	global _start ;må bli deklarert for å bruke gcc

_start:
	mov 	[a], byte 0
	mov	[i], byte 0
	mov 	ebx, [i]
	mov 	eax, [a] ; addresserer eax verdien til a
	jmp 	.L2	;går til L2
.L1:
	add 	eax, 1
	add 	ebx, 1
.L2:
	cmp 	ebx, 9
	jbe 	.L1
	sub 	eax, 1
	add	ebx, 1
	cmp 	ebx, 19
	jbe 	.L2
	add 	eax, '0'
	mov 	[a], eax
	mov 	ecx, a
	mov 	edx, 1
	mov 	ebx, STDOUT
	mov 	eax, SYS_WRITE
	int 	80h
;Lager et linjeskift
	mov 	edx,crlflen
	mov 	ecx,crlf
	mov 	ebx,STDOUT
	mov 	eax,SYS_WRITE
	int 	80h
	mov 	eax,SYS_EXIT
	mov 	ebx,0
	int 	80h


		

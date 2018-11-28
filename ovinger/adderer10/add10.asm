;Definerer seksjonen
;allocates 1 byte to n
section .bss	
	n resb 1

;Global start must be declared for using gcc (debug)
section .text	 	;definerer kodeseksjon
	global _start 	;setter en start på programmet og definerer den global
_start:
	mov ecx, 10 	;ECX gets the value 10. Becomes the countervariable in the loop.
	mov eax, '1'	;EAX gets the value '1' (tegnet 1, tallverdi 49)

a:			;makes a loop 'a'
	mov [n], eax	;legger innholdet av eax i variablen n
	mov eax, 4	;(12-18)kaller opp systemfunksjon 4(write) og skriver verdien i n(1 byte) til 1(stdout)
	mov ebx, 1	; ebx 1 er int 
	push ecx    	; push ECX on the stack

	mov ecx, n	;legger addressen til n inn i ECX
	mov edx, 1	;setter lengde 1 i edx
	int 0x80 	;interrupt (Programmed exception for system calls)

	mov eax, [n]	; legger verdien i n inn i EAX
	sub eax, '0' 	; --EAX <--EAX - ascii-tegnet '0' (48 desimalt) trekker fra EAX
	inc eax		; øker verdien i EAX med 1
	add eax, '0' 	; --EAX <--EAX + '0' legger til ascii-tegnet til EAX
	pop ecx	     	; --pop the top element  of the stack into ECX
	loop a		; starter a på nytt bare at ecx er dekrementert med 1. når ecx er 0 avsluttes løkken.

	mov eax, 1	;avslutter systemet
	int 0x80 	;interrupt

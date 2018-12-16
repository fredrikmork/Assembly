	cr equ 13		;vognretur
	lf equ 10		;linjeskift
		
section .data			;Datasegment
	msg1 db 'Inndata: '	;variabel med 'Inndata: ' streng
	n1 equ $ - msg1		;setter n1 til å være msg1 length
	msg2 db cr,lf,'ja'
	n2 equ $ - msg2
	msg3 db cr,lf,'nei'
	n3 equ $ - msg3

section .bss			;Datasegment
	a resb 1		;reserverer 1 byte i a
section .text			;Kodesegment
global _start			;Must be declared for using gcc
_start:				;tell linker entry point
	mov eax, 4		;system call number (sys_write)
	mov ebx, 1		;file descriptor (stdout)
	mov ecx, msg1		;msg to write
	mov edx, n1		;msg to length
	int 80h			;kaller kernel

	mov eax, 3		;(sys_read)
	mov ebx, 0		;(std_in)
	mov ecx, a		;ecx fører til a
	mov edx, 1		;lengden på input a
	int 80h			;kaller på kernel

	mov eax, [a]		;addresserer eax til averdi. gets the value to accumulator
	and eax, 1		;get eax's first bit 
	cmp eax, 0		;sammenligner eax med 0
	je _nei			; hvis eax er 0
_ja:
	mov eax, 4		;stdwrite
	mov ebx, 1		;stdout
	mov ecx, msg2		;message to write
	mov edx, n2		;message to data
	int 80h			;call kernel
	jmp _ferdig		;jump to -ferdig;
_nei:
	mov eax, 4		;stdwrite
	mov ebx, 1		;stdout
	mov ecx, msg3		;message to write
	mov edx, n3		;message to data
	int 80h			;call kernel
_ferdig:
	mov eax, 1		;sys_exit
	mov ebx, 0		;stdin
	int 80h			;call kernell



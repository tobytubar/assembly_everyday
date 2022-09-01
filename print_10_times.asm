; repeat input 10 times 

section .bss
	BufLen: equ 16
	Buff: resb BufLen

section .data
section .text

global _start
_start:
	nop

; get input	
	mov eax,3	; sys_read
	mov ebx,0	; stdin
	mov ecx,Buff	; read to buffer
	mov edx,BufLen	; read BufLen of bits
	int 80h

; output
	mov esi,9
write:
	mov eax,4
	mov ebx,1
	mov ecx,Buff
	mov edx,BufLen
	int 80h

	dec esi
	jnz write

; exit
	mov eax,1
	mov ebx,0
	int 80h

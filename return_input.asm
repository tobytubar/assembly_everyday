; simple program that returns you yours input
; 
SECTION .bss
	
	BUFFLEN equ 1024
	Buff: resb BUFFLEN

SECTION .data
SECTION .text
global _start

_start:
	nop	; keeps gdb happy
	
; read 1024 bits from input
Read:
	mov eax,3	; sys_read
	mov ebx,0 	; stdin	
	mov ecx,Buff	; read to Buff
	mov edx,BUFFLEN ; read BUFFLEN of bites
	int 80h
	cmp eax,0	; if 0 then EOF
	je Done		; terminate if EOF
	
; write Buffer to stdout
	mov eax,4	; sys_write
	mov ebx,1	; stdout
	mov ecx,Buff	; write Buff
	mov edx,BUFFLEN ; write BUFFLEN of bites
	int 80h	
	jmp Read

; terminate program
Done:
	mov eax,1	; sys_exit
	mov ebx,0	; return 0
	int 80h


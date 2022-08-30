; program asks user to enter name and then greets him 
;
section .bss

	BUFFLEN equ 16
	Buff: resb BUFFLEN
	
section .data
	
	Prompt: db "Enter your name: "
	PromptLen equ $-Prompt

	GreetMessage: db "Greetings, "
	GMLen equ $-GreetMessage

section .text
global _start

_start:
	nop
; prompt for user's name
	mov eax,4	; system write
	mov ebx,1	; stdout
	mov ecx,Prompt	; write prompt message
	mov edx,PromptLen ; message length
	int 80h

; get user's name
	mov eax,3	; system read
	mov ebx,0	; stdin
	mov ecx,Buff	; read in buffer
	mov edx,BUFFLEN ; read BUFFLEN of bites
	int 80h

; greet user
	mov eax,4	; system write
	mov ebx,1	; stdout
	mov ecx,GreetMessage ; greet message
	mov edx,GMLen	; size of bits
	int 80h

	mov eax,4
	mov ebx,1
	mov ecx,Buff
	mov edx,BUFFLEN
	int 80h

; terminate program
	mov eax,1	; sys_exit
	mov ebx,0	; return 0
	int 80h	


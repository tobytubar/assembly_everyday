; keep asking user if he wants to terminate program
; if first char in input is 'y' terminates, otherwise no

SECTION .bss
	
	; buffer used for user input
	BLen equ 4
	Buff: resb BLen

SECTION .data
	
	Prompt: db "Do you want to exit? (y/n): "
	PLen equ $-Prompt

SECTION .text
global _start
_start:
	nop

PromptUser:	
; prompt user for input (y/n)
	mov eax,4	; system write
	mov ebx,1	; stdout
	mov ecx,Prompt
	mov edx,PLen
 	int 80h

; get user's input	
	mov eax,3	; system read
	mov ebx,0	; stdin
	mov ecx,Buff
	mov edx,BLen
	int 80h

; act based on user's input
	cmp byte [Buff],079h	; compare to hex of 'y'
	je Done
	jmp PromptUser

; terminating program
Done:
	mov eax,1	; sys exit
	mov ebx,0	; return 0
	int 80h	


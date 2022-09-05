; defining data inside of procedure

section .bss
section .data
section .text

Greet_user:
	mov eax,4
	mov ebx,1
	mov ecx,Message
	mov edx,30
	int 80h
	ret
	Message: db "Hello, this is a message",10

global _start
_start:
	call Greet_user
	
	; exit
	mov eax,1
	mov ebx,0
	int 80h


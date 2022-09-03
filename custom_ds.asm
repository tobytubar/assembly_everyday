; custom data structure

SECTION .bss
	
	BuffLen: equ 10
	Buff: resb BuffLen

SECTION .data

	Prompt: db "Enter your name: "
	PLen: equ $-Prompt
	
	HelloPart: db "Hello, "
	HelloLen: equ $-HelloPart
	UserName: db "          ",10
	UNameLen: equ $-UserName
	FullLen: equ $-HelloPart

SECTION .text

AskForInput:
	mov eax,4
	mov ebx,1
	mov ecx,Prompt
	mov edx,PLen
	int 80h
	ret

ReadInput:
	call AskForInput

	mov eax,3
	mov ebx,0
	mov ecx,Buff
	mov edx,BuffLen
	int 80h	
	ret


GetUserName:
	call ReadInput
	
	mov eax,Buff	
	mov ecx,10
.ChangeChar:	mov bl, byte [eax+ecx-1]
		mov byte [UserName+ecx],bl
		dec ecx
		cmp ecx,0
		ja .ChangeChar
	ret		


GreetUser:
	call GetUserName
	
	mov eax,4
	mov ebx,1
	mov ecx,HelloPart
	mov edx,FullLen
	int 80h
	ret


Exit:	mov eax,1
	mov ebx,0
	int 80h


global _start
_start:
	call GreetUser
	call Exit
	
	

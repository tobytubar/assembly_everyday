; print hello using procedures

section .bss
	
	BuffLen: equ 16
	Buff: resb BuffLen
	
section .data
	
	Message: db "Enter your name: "
	MLen: equ $-Message
	
	Greeting: db "Hello "
	GLen: equ $-Greeting

	MesEnd: db "Thanks for launching this awesome program!",10
	MEndLen: equ $-MesEnd

section .text
	nop

; ask user to enter name	
EnterNamePrompt:
	mov eax,4	
	mov ebx,1
	mov ecx,Message
	mov edx,MLen
	int 80h
	ret

; read user's input	
ReadInput:
	mov eax,3
	mov ebx,0
	mov ecx,Buff
	mov edx,BuffLen
	int 80h
	ret

; greet user
GreetUser:
	call EnterNamePrompt	; ask user to enter name
	call ReadInput		; print 'Hello ' + user's name

	mov eax,4
	mov ebx,1
	mov ecx,Greeting
	mov edx,GLen
	int 80h

; print user's name
	mov eax,4
	mov ebx,1
	mov ecx,Buff
	mov edx,BuffLen
	int 80h

	mov eax,4
	mov ebx,1
	mov ecx,MesEnd
	mov edx,MEndLen
	int 80h

	ret

global _start
_start:
	call GreetUser
	
; terminate program
	mov eax,1
	mov ebx,0
	int 80h


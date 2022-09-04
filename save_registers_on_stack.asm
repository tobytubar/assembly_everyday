; instructions that save registers by pushing 
; them onto the stack, and retrieving
section .bss
section .data
	
	Message: db "some rand message",10
	MLen: equ $-Message
	
	SMessage: db "second message",10
	SMLen: equ $-SMessage

section .text

; push some GP registers onto the stack
SaveRegisters:
	pop rsi	; get instruction pointer
	push rax
	push rbx
	push rcx
	push rdx
	push rsi ; push instruction pointer back
	ret	

; restore registers
GetRegisters:
	pop rsi ; get instruction pointer
	pop rdx
	pop rcx
	pop rbx
	pop rax
	push rsi ; push instruction pointer back
	ret

; testing instructions
PrintSomething:
	mov eax,4
	mov ebx,1
	mov ecx,Message
	mov edx,MLen

	call SaveRegisters

	mov eax,4
	mov ebx,1
	mov ecx,SMessage
	mov edx,SMLen
	int 80h

	call GetRegisters
	
	int 80h
	ret

global _start
_start:
	call PrintSomething

; exit
	mov eax,1
	mov ebx,0
	int 80h
		
	
	
	
	
	

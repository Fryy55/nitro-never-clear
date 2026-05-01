%include "string.mac"
%include "ansi.mac"


section .rodata
	string critErrorMsg, ansi("1;31"), "A critical error has occurred!", ansi("0"), 0xa


section .text
	global critError

critError: ; JMP
	mov edi, 1
	mov rsi, critErrorMsg
	mov edx, critErrorMsgLen
	mov eax, 1 ; write
	syscall

	mov edi, 1
	mov eax, 60 ; exit
	syscall
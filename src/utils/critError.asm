%include "string.mac"


section .rodata
	string critErrorMsg, "A critical error has occurred!", 0xa


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
%include "globals.inc"
%include "critError.inc"


section .text
	global readKey

readKey: ; ()
	xor edi, edi
	mov rsi, key
	mov edx, 5
	xor eax, eax ; read
	syscall

	test rax, rax
	js exit
	jz critError

	ret
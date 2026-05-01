%include "critError.inc"
%include "globals.inc"
%include "flushFD0.inc"

%include "string.mac"
%include "ansi-colors.mac"


section .rodata
	string prompt, CYN_B"Enter a key ", GRN"(4 bytes, e.g. ", WHT_B"`1f b0 0b 69`", GRN")", CYN_B": ", WHT_B""

section .text
	global readKey

readKey: ; ()
	push rbp
	mov rbp, rsp

	bufSize equ 12
	sub rsp, 16

	read:
	mov edi, 1
	mov rsi, prompt
	mov edx, promptLen
	mov eax, 1 ; write
	syscall

	xor edi, edi
	mov rsi, rsp
	mov edx, bufSize
	xor eax, eax ; read
	syscall

	test rax, rax
	js critError
	jz exit

	cmp rax, bufSize
	jne read
	cmp byte [rsp + rax - 1], 0xa
	jne reread

	

	mov rsp, rbp
	pop rbp
	ret
reread:
	call flushFD0
	jmp read
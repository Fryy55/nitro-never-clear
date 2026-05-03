%include "globals.inc"
%include "readKey.inc"

%include "string.mac"
%include "ansi-colors.mac"


section .rodata
	string greeting, BLU_B"Haii and welcome to a xor guessing ", BLK_L"(more like brute forcing) ", BLU_B"thingy !", 0xa
	string result, PUR_LB"XOR-ed string: ", WHT_B ansi('40')
	string closure, RST, 0xa, BLU_B"Did u get it? idk :gladstare:", RST, 0xa

section .data
	data db 37, 11, 127, 128, 56, 15, 127, 214, 114, 56, 112, 158, 119, 19, 108, 215, 28, 18, 105, 146, 28, 81, 41, 209, 116, 81, 41, 154
	dataSize equ $ - data

section .text
	global _start

_start: ; ()
	mov edi, 1
	mov rsi, greeting
	mov edx, greetingLen
	mov eax, 1 ; write
	syscall

	call readKey

	xor ecx, ecx
	mov edx, [key]
	apply_xor:
	xor [data + ecx], dl

	ror edx, 8
	inc ecx
	cmp ecx, dataSize
	jne apply_xor

	mov edi, 1
	mov rsi, result
	mov edx, resultLen
	mov eax, 1 ; write
	syscall
	mov rsi, data
	mov edx, dataSize
	mov eax, 1 ; write
	syscall
	mov rsi, closure
	mov edx, closureLen
	mov eax, 1 ; write
	syscall

	exit: global exit
	xor rdi, rdi
	mov eax, 60 ; exit
	syscall
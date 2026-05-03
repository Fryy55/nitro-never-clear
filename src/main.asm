%include "globals.inc"
%include "readKey.inc"

%include "string.mac"
%include "ansi-colors.mac"


section .rodata
	string greeting, BLU_B"Haii and welcome to a xor guessing ", BLK_L"(more like brute forcing) ", BLU_B"thingy !", 0xa
	string result, PUR_LB"XOR-ed string: ", WHT_B ansi('40')
	string closure, RST, 0xa, BLU_B"Did u get it? idk :gladstare:", RST, 0xa

section .data
	data db 80, 99, 4, 18, 121, 86, 52, 8, 76, 69, 39, 31, 118, 89, 37, 12, 97, 68, 29, 8, 96, 68, 39, 4, 113, 91, 39, 20
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
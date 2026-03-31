%include "globals.inc"
%include "readKey.inc"

%include "string.mac"


section .rodata
	string greeting, "Haii and welcome to a xor guessing (more like brute forcing) thingy !", 0xa
	data db 80, 99, 4, 18, 121, 86, 52, 8, 76, 69, 39, 31, 118, 89, 37, 12, 97, 68, 29, 8, 96, 68, 39, 4, 113, 91, 39, 20

section .text
	global _start

_start: ; ()
	mov edi, 1
	mov rsi, greeting
	mov edx, greetingLen
	mov eax, 1 ; write
	syscall

	mov rsi, prompt
	mov edx, promptLen
	mov eax, 1 ; write
	syscall

	call readKey

	exit: global exit
	xor rdi, rdi
	mov eax, 60 ; exit
	syscall
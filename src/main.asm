%include "globals.inc"

%include "string.mac"


section .rodata
	string greeting, "Haii and welcome to a xor guessing (more like brute forcing) thingy !", 0xa
	data db 80, 99, 4, 18, 121, 86, 52, 8, 76, 69, 39, 31, 118, 89, 37, 12, 97, 68, 29, 8, 96, 68, 39, 4, 113, 91, 39, 20

section .text
	global _start

_start: ; ()
	mov rdi, 1
	mov rsi, greeting
	mov rdx, greetingLen
	mov rax, 1 ; write
	syscall

	mov rsi, prompt
	mov rdx, promptLen
	mov rax, 1 ; write
	syscall

	;! TODO: read key

	xor rdi, rdi
	mov rax, 60 ; exit
	syscall
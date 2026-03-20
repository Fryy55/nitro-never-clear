%include "globals.inc"

%include "string.mac"


section .rodata
	global _start
	string greeting, "Haii and welcome to a xor guessing (more like brute forcing) thingy !"

section .text

_start:
	mov rdi, 1
	mov rsi, greeting
	mov rdx, greetingLen
	mov rax, 1 ; write
	syscall

	xor rdi, rdi
	mov rax, 60 ; exit
	syscall
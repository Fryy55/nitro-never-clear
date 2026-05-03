section .text
	global hexCheck

hexCheck: ; (rdi nonStrippedByteToCheck) LEAF -> A: LSB bool; DI: decoded byte if true
	xor eax, eax
	movzx edi, dil

	cmp edi, 57
	jle le_57

	cmp edi, 102
	jle le_102
	ret
le_57:
	cmp edi, 48
	setge al
	sub dil, 48
	ret
le_102:
	cmp edi, 97
	setge al
	sub dil, 97
	ret
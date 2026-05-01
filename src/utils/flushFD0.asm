section .text
	global flushFD0

flushFD0: ; () LEAF
	read_loop:
	xor edi, edi
	lea rsi, [rsp - 1]
	mov edx, 1
	xor eax, eax ; read
	syscall

	cmp byte [rsp - 1], 0xa
	jne read_loop

	ret
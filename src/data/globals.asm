%include "string.mac"
%include "ansi-colors.mac"


section .rodata
	string prompt, CYN_B"Enter a key ", GRN"(4 bytes, e.g. ", WHT_B"`1f b0 0b 69`", GRN"): ", WHT_B""
	global prompt
	global promptLen


section .bss
	key resb 5
	global key
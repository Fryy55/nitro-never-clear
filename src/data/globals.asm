%include "string.mac"


section .rodata
	string prompt, "Enter a key (4 bytes, e.g. `1f b0 0b 69`): "
	global prompt
	global promptLen


section .bss
	key resb 5
	global key
	global _start                ; entry point. global = visible to linker
	
	section .text                ; code section.
	
_start:
	; display '.' on the screen
	mov eax, 4                   ; system call number (sys_write)
	mov ebx, 1                   ; file descriptor (stdout)
	mov ecx, msg                 ; message to write
	mov edx, 2                   ; message length
	int 0x80                     ; call kernel
	
	; exit(0)
	mov eax, 1                   ; system call number (sys_exit)
	xor ebx, ebx                 ; exit code 0
	int 0x80                     ; call kernel
	
	section .data                ; data section
	msg db '.', 0xA              ; msg is a byte array. db = define byte. with a new line

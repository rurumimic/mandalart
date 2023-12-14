	global _start                ; _start: entry point for linker
	
	section .text
	
_start:
	; write message to stdout
	mov edx, len                 ; message length
	mov ecx, msg                 ; message address
	mov ebx, 1                   ; fd (1 = stdout)
	mov eax, 4                   ; syscall number (4 = sys_write)
	int 0x80                     ; call kernel
	
	; exit
	mov eax, 1                   ; syscall number (1 = sys_exit)
	xor ebx, ebx                 ; exit code 0
	int 0x80                     ; call kernel
	
	section .data
	msg db 'Hello, World!', 0xA  ; message with LF
	len equ $ - msg              ; count message length

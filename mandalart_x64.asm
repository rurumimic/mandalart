	global _start                ; entry point. global = visible to linker
	
	section .text                ; code section.
	
_start:
	; display '.' on the screen
	mov rax, 1                   ; system call number (sys_write)
	mov rdi, 1                   ; file descriptor (stdout)
	lea rsi, [msg]               ; message to write
	mov rdx, 2                   ; message length
	syscall                      ; call kernel
	
	; exit(0)
	mov rax, 60                  ; system call number (sys_exit)
	xor rdi, rdi                 ; exit code 0
	syscall                      ; call kernel
	
	section .data                ; data section
	msg db '.', 0xA              ; msg is a byte array. db = define byte. with a new line

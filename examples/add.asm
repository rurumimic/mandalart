	global _start                ; entry point. global = visible to linker
	
	section .text                ; code section.
	
_start:
	mov rdi, 1                   ; a
	mov rsi, 2                   ; b
	call add                     ; call add function
	
	; print result
	add rax, '0'                 ; convert to ascii
	push rax                     ; save result on the stack
	mov rax, 1                   ; system call number (sys_write)
	mov rdi, 1                   ; file descriptor (stdout)
	mov rsi, rsp                 ; message to write
	mov rdx, 1                   ; message length
	syscall                      ; call kernel
	pop rax                      ; restore result
	
	; exit(0)
	mov rax, 60                  ; system call number (sys_exit)
	xor rdi, rdi                 ; exit code 0
	syscall                      ; call kernel
	
	; int add(int a, int b)
add:                          
	mov rax, rdi                 ; a
	add rax, rsi                 ; b
	ret                          ; return

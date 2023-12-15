	global _start                ; entry point. global = visible to linker
	
	section .text                ; code section.
	
	extern print                 ; print is defined in another file
	
_start:
	; print(msg)
	mov rdi, msg                 ; first argument
	call print                   ; call print
	
	; exit(0)
	mov rax, 60                  ; system call number (sys_exit)
	xor rdi, rdi                 ; exit code 0
	syscall                      ; call kernel
	
add:
	; int add(int a, int b)
	mov rax, rdi                 ; a
	add rax, rsi                 ; b
	ret                          ; return
	
	section .data                ; data section
	msg db '.'                   ; msg is a byte array. db = define byte.

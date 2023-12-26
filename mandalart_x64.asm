	global _start                ; entry point. global = visible to linker
	
	section .text                ; code section.
	
	extern print, strcpy
	
_start:
	; check_args
	pop rdi                      ; argc
	mov rsi, rsp                 ; argv
	cmp rdi, 2                   ; check if argc >= 2
	jl goodbye                   ; if not, jump to goodbye
	
	call load_args               ; load second argument into buffer
	
	; print(buffer)
	mov rdi, buffer
	call print
	
	jmp goodbye
	
load_args:
	mov rsi, [rsi + 8]           ; argv[1]. load second argument's address
	mov rdi, buffer              ; load buffer's address
	call strcpy
	ret
	
goodbye:
	; print(bye)
	mov rdi, bye                 ; load bye's address
	call print                   ; call print
	jmp exit
	
exit:
	; exit(0)
	mov rax, 60                  ; system call number (sys_exit)
	xor rdi, rdi                 ; exit code 0
	syscall                      ; call kernel
	
	section .data                ; data section
	bye db 'Bye.'                ; bye is a byte array. db = define byte.
	
	section .bss
	buffer resb 255              ; reserve 255 bytes for buffer

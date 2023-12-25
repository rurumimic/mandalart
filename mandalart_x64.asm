	global _start                ; entry point. global = visible to linker
	
	section .text                ; code section.
	
	extern print                 ; print is defined in another file
	
_start:
	cmp rdi, 2 ; check if argc >= 2
	jl no_args

	mov rdi, [rsi + 8]           ; first argument address
	mov rsi, buffer
	call strcpy

	; print(msg)
	mov rdi, msg ; first argument
	call print ; call print

	jmp exit

exit:
	; exit(0)
	mov rax, 60                  ; system call number (sys_exit)
	xor rdi, rdi                 ; exit code 0
	syscall                      ; call kernel
	
no_args:
	; print(msg)
	mov rdi, msg ; first argument
	call print ; call print

	jmp exit

strcpy:
.loop:
	mov al, [rsi]                ; load byte from source
	test al, al                  ; check if byte is zero
	jz .done                     ; if zero, jump to done
	mov [rdi], al                ; store byte to destination
	inc rsi                      ; increment source pointer
	inc rdi                      ; increment destination pointer
	jmp .loop                    ; repeat until zero byte found
.done:
	ret                          ; return from function
	
	section .data                ; data section
	msg db '.'                   ; msg is a byte array. db = define byte.

	section .bss
	buffer resb 256

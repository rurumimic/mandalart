	global open, read, read_loop, close
	
	section .text
	
	extern print, newline
	extern clean
	
open:
	mov rax, 2                   ; sys_open
	mov rdi, rdi                 ; filename
	mov rsi, rsi                 ; flags (O_RDONLY)
	syscall
	ret
	
read:
	mov rax, 0                   ; sys_read
	mov rdi, rdi                 ; file descriptor
	mov rsi, rsi                 ; buffer
	mov rdx, rdx                 ; buffer size
	syscall
	ret
	
close:
	mov rax, 3                   ; sys_close
	mov rdi, rdi                 ; file descriptor
	syscall
	ret
	
read_loop:
	push rdi                     ; save file descriptor
	push rsi                     ; save buffer
.loop:
	; clean(buffer)
	mov rdi, rsi                 ; buffer
	call clean
	
	; read(fd, buffer, 255)
	mov rdi, [rsp + 8]           ; file descriptor
	mov rsi, [rsp]               ; buffer
	mov rdx, 255                 ; buffer size
	call read
	
	; check EOF
	test rax, rax                ; rax == 0
	jz .done
	
	; print(buffer)
	mov rdi, [rsp]               ; buffer
	call print
	
	jmp .loop                    ; repeat until EOF
.done:
	add rsp, 16
	ret

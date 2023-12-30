	global print, newline, length ; make functions visible to the linker
	section .text                ; code section.
	
	; void print(char * str)
print:
	push rdi                     ; save rdi on the stack
	
	call length                  ; length(msg)
	push rax                     ; save length on the stack
	
	; display msg on the screen
	mov rax, 1                   ; system call number (sys_write)
	mov rdi, 1                   ; file descriptor (stdout)
	mov rsi, [rsp + 8]           ; message to write
	mov rdx, [rsp]               ; message length
	syscall                      ; call kernel
	add rsp, 16                  ; remove length and msg from the stack
	
	ret                          ; return
	
	; display newline on the screen
newline:
	mov rax, 1                   ; system call number (sys_write)
	mov rdi, 1                   ; file descriptor (stdout)
	mov rsi, lf                  ; message to write
	mov rdx, 1                   ; message length
	syscall                      ; call kernel
	ret                          ; return
	
length:                       ; int length(char * str)
	mov rax, 0                   ; length = 0
.loop:
	cmp byte [rdi], 0            ; check if end of string
	je .end                      ; if so, jump to end
	inc rax                      ; length + 1
	inc rdi                      ; str + 1
	jmp .loop                    ; loop
.end:
	ret                          ; return
	
	section .data                ; data section.
	lf db 0x0A                   ; newline character

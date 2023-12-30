	global _start                ; entry point. global = visible to linker
	
	section .text                ; code section.
	
	extern print, newline
	extern strcpy, clean
	extern open, read, read_loop, close
	
_start:
	; check_args
	pop rdi                      ; argc
	mov rsi, rsp                 ; argv
	cmp rdi, 2                   ; check if argc >= 2
	jl goodbye                   ; if not, jump to goodbye
	
	call load_args               ; load second argument into buffer
	
	mov rdi, title
	call print
	call newline
	
	call read_file               ; read file
	
	jmp goodbye
	
read_file:
	; open(buffer, O_RDONLY)
	mov rdi, buffer              ; load buffer's address
	mov rsi, 0                   ; O_RDONLY
	call open                    ; call open
	push rax                     ; save file descriptor
	
	; read loop
	mov rdi, [rsp]               ; load file descriptor
	mov rsi, buffer              ; load buffer's address
	call read_loop               ; call read_loop
	
	; close(fd)
	mov rdi, [rsp]               ; load file descriptor
	call close                   ; call close
	
	pop rax                      ; restore file descriptor
	ret
	
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
	title db 0x0A, 'Mandalart', 0x0A, 0
	bye db 0x0A, 'Good Luck.', 0x0A, 0
	
	section .bss
	buffer resb 255              ; reserve 255 bytes for buffer

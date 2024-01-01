	global _start                ; entry point. global = visible to linker
	
	section .text                ; code section.
	
	extern print, newline
	extern strcpy, clean
	extern open, read, read_loop, close
	
_start:
	pop edi                      ; argc
	mov esi, esp                 ; argv
	cmp edi, 2                   ; check if argc >= 2
	jl goodbye                   ; if not, jump to goodbye
	
	call load_args               ; load second argument to buffer
	
	mov edi, title
	call print
	call newline
	
	call read_file
	
	jmp goodbye
	
read_file:
	; open(buffer, O_RDONLY)
	mov ebx, buffer              ; buffer address
	mov ecx, 0                   ; O_RDONLY
	call open                    ; open file
	push eax                     ; save file descriptor
	
	; read loop
	mov ebx, [esp]               ; load file descriptor
	mov ecx, buffer              ; buffer address
	call read_loop
	
	; close(fd)
	mov ebx, [esp]               ; load file descriptor
	call close
	
	pop eax
	ret
	
load_args:
	mov esi, [esi + 4]           ; argv[1]. load second argument's address
	mov edi, buffer              ; buffer address
	call strcpy
	ret
	
goodbye:
	mov edi, bye
	call print
	jmp exit
	
exit:
	mov eax, 1                   ; system call number (sys_exit)
	xor ebx, ebx                 ; exit code 0
	int 0x80                     ; syscall
	
	section .data                ; data section
	title db 0x0A, 'Mandalart', 0x0A, 0
	bye db 0x0A, 'Good Luck', 0x0A, 0
	
	section .bss
	buffer resb 255              ; reserve 255 bytes for buffer

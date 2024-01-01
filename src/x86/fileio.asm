	global open, read, read_loop, close
	
	section .text
	
	extern print, newline
	extern clean
	
open:
	mov eax, 5                   ; sys_open
	mov ebx, ebx                 ; filename
	mov ecx, ecx                 ; flags (O_RDONLY)
	int 0x80
	ret
	
read:
	mov eax, 3                   ; sys_read
	mov ebx, ebx                 ; file descriptor
	mov ecx, ecx                 ; buffer
	mov edx, edx                 ; buffer size
	int 0x80
	ret
	
close:
	mov eax, 6                   ; sys_close
	mov ebx, ebx                 ; file descriptor
	int 0x80
	ret
	
read_loop:
	push ebx                     ; save file descriptor
	push ecx                     ; save buffer
.loop:
	; clean(buffer)
	mov edi, ecx                 ; buffer
	call clean
	
	; read(fd, buffer, 255)
	mov ebx, [esp + 4]           ; file descriptor
	mov ecx, [esp]               ; buffer
	mov edx, 255                 ; buffer size
	call read
	
	; check EOF
	cmp eax, 0
	je .done
	
	; print(buffer)
	mov edi, [esp]               ; buffer
	call print
	
	jmp .loop
	
.done:
	add esp, 8
	ret

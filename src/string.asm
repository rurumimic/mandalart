	global strcpy
	
	section .text
	
strcpy:
	movzx rcx, byte [bufferSize] ; max number of bytes to copy
.loop:
	xor rax, rax                 ; clear rax
	mov al, [rsi]                ; load byte from source
	mov [rdi], al                ; store byte to destination
	test al, al                  ; check if zero byte
	jz .done                     ; if zero byte, we're done
	inc rsi                      ; increment source pointer
	inc rdi                      ; increment destination pointer
	dec rcx                      ; decrement counter
	jz .done                     ; if counter is zero, we're done
	jmp .loop                    ; repeat until zero byte found
.done:
	ret                          ; return from function
	
	section .data                ; data section
	bufferSize db 255            ; bufferSize is a byte. db = define byte.

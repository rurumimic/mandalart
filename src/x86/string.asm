	global strcpy, clean
	section .text
	
strcpy:
	movzx ecx, byte [bufferSize]
.loop:
	xor eax, eax                 ; clear eax
	mov al, [esi]                ; load byte from source
	mov [edi], al                ; store byte to destination
	test al, al                  ; check if byte is zero
	jz .done                     ; if zero, we're done
	inc esi                      ; increment source pointer
	inc edi                      ; increment destination pointer
	dec ecx                      ; decrement counter
	jz .done                     ; if counter is zero, we're done
	jmp .loop                    ; repeat until zero byte is found
.done:
	ret
	
clean:
	mov edi, edi                 ; buffer address
	movzx ecx, byte [bufferSize] ; max number of bytes to clear
	mov al, 0                    ; clear value
	rep stosb                    ; clear buffer
	ret
	
	section .data
	bufferSize db 255

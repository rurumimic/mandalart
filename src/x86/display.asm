	global print, newline, length
	
	section .text
	
	; void print(char * str)
print:
	push edi                     ; save edi on the stack
	
	call length                  ; length(msg)
	push eax                     ; save length on the stack
	
	mov eax, 4                   ; syscall write
	mov ebx, 1                   ; file descriptor (stdout)
	mov ecx, [esp + 4]           ; message to write
	mov edx, [esp]               ; message length
	int 0x80                     ; syscall
	; pop eax ; clean up the stack
	; pop edi ; restore edi
	add esp, 8                   ; clean up the stack
	
	ret
	
newline:
	mov eax, 4                   ; syscall write
	mov ebx, 1                   ; file descriptor (stdout)
	mov ecx, lf                  ; message to write
	mov edx, 1                   ; message length
	int 0x80                     ; syscall
	ret
	
	; int length(char * str)
length:
	mov eax, 0                   ; length = 0
.loop:
	cmp byte [edi], 0            ; check if end of string
	je .end                      ; if so, jump to end
	inc eax                      ; length + 1
	inc edi                      ; str + 1
	jmp .loop                    ; goto loop
.end:
	ret
	
	section .data
	lf db 0x0A                   ; line feed

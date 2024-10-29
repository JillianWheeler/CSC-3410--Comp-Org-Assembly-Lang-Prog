BITS 32

section .data
	titleMsg DB 'The Dividing Program', 0xa
	lenTitleMsg EQU $-titleMsg
	userMsg DB 'Please enter a single digit number: '
	lenUserMsg EQU $-userMsg
	quotMsg DB 'The quotient is: '
	lenQuotMsg EQU $-quotMsg
	remMsg DB 0xa, 'The remainder is: '
	lenRemMsg EQU $-remMsg
	newLineMsg DB 0xa
	lenNewLineMsg EQU $-newLineMsg

SECTION .bss
	n1 RESB 5
	n2 RESB 5
	quotient RESB 5
	remainder RESB 5

SECTION .text
	GLOBAL _start

_start:
	;message
	mov eax, 4	;write
	mov ebx, 1	;out
	mov ecx, titleMsg
	mov edx, lenTitleMsg
	int 80h

	;ask for first number	
	mov eax, 4	;write
	mov ebx, 1	;out
	mov ecx, userMsg
	mov edx, lenUserMsg
	int 80h

	;read n1
	mov eax, 3	;read
	mov ebx, 0	;in
	mov ecx, n1
	mov edx, 2
	int 80h

	;ask for n2
	mov eax, 4	;write
	mov ebx, 1	;out
	mov ecx, userMsg
	mov edx, lenUserMsg
	int 80h

	;read n2
	mov eax, 3	;read
	mov ebx, 0	;in
	mov ecx, n2
	mov edx, 2
	int 80h

	;n1 to num
	mov al, [n1]
	sub al, '0'
	mov ah, 0

	;n2 to num
	mov bl, [n2]
	sub bl, '0'
	
	;divide
	xor dx, dx
	idiv bl

	;quotient and remainder to string
	add al, '0'
	add ah, '0'

	;store them
	mov [quotient], al
	mov [remainder], ah

	;message
	mov eax, 4	;write
	mov ebx, 1	;out
	mov ecx, quotMsg
	mov edx, lenQuotMsg
	int 80h

	;now the quotient
	mov eax, 4	;write
	mov ebx, 1	;out
	mov ecx, quotient
	mov edx, 1
	int 80h

	;message
	mov eax, 4	;write
	mov ebx, 1	;out
	mov ecx, remMsg
	mov edx, lenRemMsg
	int 80h
	
	;remainder
	mov eax, 4	;write
	mov ebx, 1	;out
	mov ecx, remainder
	mov edx, 1
	int 80h

	;new lines
	mov eax, 4	;write
	mov ebx, 1	;out
	mov ecx, newLineMsg
	mov edx, lenNewLineMsg
	int 80h

	;exit
	mov eax, 1	;exit
	mov ebx, 0
	int 80h

	

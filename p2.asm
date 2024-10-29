BITS 32

SECTION .data
	titleMsg DB 'The Multiplying Program', 0xa ;Its the title
	lenTitleMsg EQU $-titleMsg
	userMsg DB 'Please enter a single digit number: ', 0xa
	lenUserMsg EQU $-userMsg
	answerMsg DB 'The answer is: ', 0xa
	lenAnswerMsg EQU $-answerMsg
	newLineMsg DB 0ax

SECTION .bss	;data
	n1 RESB 2
	n2 RESB 2
	answer RESB 2 ;saving space for the answer

SECTION .text
	GLOBAL _start

_start:
	;Show the title
	mov eax, 4	;write
	mov ebx, 1	;out
	mov ecx, titleMsg
	mov edx, lenTitleMsg
	int 80h

	;Ask for n1
	mov eax, 4	;write
	mov ebx, 1	;out
	mov ecx, userMsg
	mov edx, lenUserMsg
	int 80h

	;Read n1
	mov eax, 3 	;read
	mov ebx, 0	;in
	mov ecx, n1
	mov edx, 2
	int 80h

	;Ask for n2
	mov eax, 4
	mov ebx, 1
	mov ecx, userMsg
	mov edx, lenUserMsg
	int 80h

	;Read n2
	mov eax, 3	;read
	mov ebx, 0
	mov ecx, n2
	mov edx, 2
	int 80h

	;String to number
	mov al, [n1]
	sub al, '0'

	;String to number
	mov ah, [n2]
	sub ah, '0'

	;Multiply
	imul ah		;AX = AL * AH, result is AX!

	;answer to string
	add al, '0'
	mov [answer], al ;buffer
	mov byte [answer+1], 0 ;null

	;Show user answer message
	mov eax, 4	;write
	mov ebx, 1	;out
	mov ecx, answerMsg
	mov edx, lenAnswerMsg
	int 80h

	;Show answer
	mov eax, 4	;write
	mov ebx, 1	;out
	mov ecx, answer
	mov edx, 1
	int 80h

	;New line
	mov eax, 4
	mov ebx, 1
	mov ecx, newLineMsg
	mov edx, 1
	int 80h

	;Exit
	mov eax, 1	;exit
	mov ebx, 0
	int 80h



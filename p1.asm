BITS 32

SECTION .data
	titleMsg DB 'The Adding Program', 0xa 	;title
	lenTitleMsg EQU $ - titleMsg		;Length of the above message
	userMsg DB 'Please enter a single digit number: ' 
	lenUserMsg EQU $ - userMsg
	answerMsg DB 'The answer is: ' 
	lenAnswerMsg EQU $ - answerMsg
	newLineMsg DB 0ax
	lenNewLineMsg EQU $ - newLineMsg

SECTION .bss ;data
	n1 RESB 1
	n2 RESB 1
	answer RESB 1
	space RESB 1

SECTION .text
	GLOBAL _start

_start:	
	;Program inputs

	;Tell user the program
	mov eax, 4 ;write
	mov ebx, 1 ;out
	mov ecx, titleMsg
	mov edx, lenTitleMsg
	int 80h

	;Start asking for inputs
	;num 1
	mov eax, 4 ;write
	mov ebx, 1 ;out
	mov ecx, userMsg
	mov edx, lenUserMsg
	int 80h

	;Read it 
	mov eax, 3 ;read
	mov ebx, 0 ;in
	mov ecx, n1
	mov edx, 1 
	;read 2 bytes 
	int 80h

	;Get rid of newline
	mov eax, 3
	mov ebx, 0
	mov ecx, space
	mov edx, 1
	int 80h

	;num 2
	mov eax, 4 ;write
	mov ebx, 1 ;out
	mov ecx, userMsg
	mov edx, lenUserMsg
	int 80h

	;Read it
	mov eax, 3 ;read
	mov ebx, 0 ;in
	mov ecx, n2
	mov edx, 1
	int 80h

	;get rid of  space
	mov eax, 3
	mov ebx, 0
	mov ecx, space
	mov edx, 1
	int 80h

	;string to int
	;n1
	mov al, [n1]
	sub al, '0' ;ASCII to int
	
	;n2
	mov ah, [n2]
	sub ah, '0'

	;preform additon
	add al, ah	;n1 plus n2

	;now convert back to string
	add al, '0'
	mov [answer], al

	;Show the user the output message
	mov eax, 4 ;write
	mov ebx, 1 ;out
	mov ecx, answerMsg
	mov edx, lenAnswerMsg
	int 80h

	;output the number
	mov eax, 4 ;write
	mov ebx, 1 ;out
	mov ecx, answer
	mov edx, 1
	int 80h

	;output message
	mov eax, 4 ;write
	mov ebx, 1 ;out
	mov ecx, newLineMsg
	mov edx, lenNewLineMsg
	int 80h

	;Exit the program
	mov eax, 1 ;exit
	mov ebx, 0
	int 80h

	

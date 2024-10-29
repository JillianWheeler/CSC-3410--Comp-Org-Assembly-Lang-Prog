BITS 32

SYS_EXIT equ 1
SYS_READ equ 3
SYS_WRITE equ 4
STDIN equ 0
STDOUT equ 1

;data section
SECTION .data
	titleMsg DB 'The Swapping Program', 0xa
	lenTitleMsg EQU $-titleMsg
	userMsg DB 'Please enter a two character string: ', 0xa
	lenUserMsg EQU $-userMsg
	answerMsg DB 'The answer is: ', 0xa
	lenAnswerMsg EQU $-answerMsg

SECTION .bss
	;3 bytes for 2 char and a /n
	two_char_string RESB 3 
	
SECTION .text
	GLOBAL _start

_start:

	;program title
	mov eax, SYS_WRITE
        mov ebx, STDOUT
	mov ecx, titleMsg
	mov edx, lenTitleMsg
	int 80h

	;ask user
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, userMsg
	mov edx, lenUserMsg
	int 80h

	;get user info
	mov eax, SYS_READ
	mov ebx, STDIN
	mov ecx, two_char_string
	mov edx, 3
	int 80h
	
		
	;move the charachters around
	;load them
	mov al, [two_char_string]
	mov bl, [two_char_string + 1]
	
	;store them in opposite positions
	mov [two_char_string + 1], al
	mov [two_char_string], bl

	;Show the user
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, answerMsg
	mov edx, lenAnswerMsg
	int 80h

	;show the results and a /n
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, two_char_string
	mov edx, 2
	int 80h

	;add another newline because it wont line up correctly
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, titleMsg + lenTitleMsg -1
	mov edx, 1
	int 80h

	;exit
	mov eax, SYS_EXIT
	mov ebx, 0
	int 80h

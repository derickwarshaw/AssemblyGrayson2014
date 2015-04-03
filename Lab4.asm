TITLE Lab 4

 ;Description: GCD Program
 ;Derick Warshaw // COSC 2425 // LAB4

INCLUDE Irvine32.inc

.data
firstNumber dword ?
secondNumber dword ?


messageFirstNum   byte "Enter first integer: ",0
messageSecondNum  byte "Enter second integer: ",0
messageAnswer     byte "Greatest common divisor is: ",0


.code
main PROC

call Clrscr								;clear screen
call getIntegers							;procedure to get the integers
exit										;exit process

main ENDP

getIntegers PROC


	mov  edx,OFFSET messageFirstNum			;move message into edx reg
	call WriteString						;message to get number
	call ReadInt							;read an integer into the eax
	mov  firstNumber,eax					;move number in the eax to firstNumber
	mov  edx,OFFSET messageSecondNum			;move message into edx reg
	call WriteString						;message to get number
	call ReadInt							;read an integer into the eax
	mov  secondNumber,eax					;move number in eax to secondNumber
	mov eax,firstNumber						;move firstNumber to eax
	mov ebx,secondNumber					;move secondNumber to ebx
	call calcGCD							;find the GCD
	mov  edx,OFFSET messageAnswer				;move answer message into edx
	call WriteString						;write the message to the console
	call WriteDec							;write the number that is stored in eax to the console
	call Crlf								;new line

	getIntegers ENDP						;end process


calcGCD PROC

	push ebx				;push to stack
	push edx				;push to stack

	STAGE1:				;stage 1 label
	mov  edx,0			;throw a zero in edx
	div ebx		          ;division of first and second numbers
	cmp  edx,0		     ;compare what is in the edx to zero
	je   STAGE2		     ;if the edx result is equal to 0 - no further action is necessary and proceed to STAGE 2
	mov  eax,ebx			;move remainder in register to do the math again
	mov  ebx,edx			;move remainder in register to do the math again
	jmp  STAGE1			;jump back to STAGE 1 to further work the math down

	STAGE2:				;stage 2 label
	mov eax,ebx			;the greatest common divisor is stored in the eax now
	pop edx				;pop edx back to stack
	pop ebx				;pop ebx back to stack
	ret					;return the place in the program where calcGCD was called from to continue

calcGCD ENDP
END main
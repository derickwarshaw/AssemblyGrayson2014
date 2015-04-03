TITLE Lab1 

 ; Description: This program performs simple addition by clearing the screen,  locating the cursor in the middle
 ;			 of the screen, prompting the user for two integers, adding the integers, and displaying their sum.

 ;Derick Warshaw // COSC 2425 // LAB1

INCLUDE Irvine32.inc										;include all the files in the Irvine Library

.data 
	firstIntegerPrompt BYTE "Please enter the first integer: ",0	;prompt to tell the user to enter the first int
	secondIntegerPrompt BYTE "Please enter the secod integer: ",0	;prompt to tell the user to enter the second int
	displayResult BYTE "The sum of the two integers you entered: ",0 ;prompt to tell the user what the result is

	firstNumber DWORD ?										;define the first number user enters
	secondNumber DWORD ?									;define the second number user enters
	theSum  DWORD ?										;define sum of the first and second number entered

.code												;code segment defined here
	main PROC											;main procedure starts here
	call Clrscr										;clear the screen 

	;SETTING THE CURSOR TO THE MIDDLE OF SCREEN HERE
	mov dl, 20										;set the column coordinatE DEAD CENTER						
	mov dh, 11										;set the row coordinate DEAD CENTER
	call Gotoxy										;move the cursor to near the center of the screen

	mov edx,OFFSET firstIntegerPrompt						;move prompt for first integer into edx
	call WriteString									;display the message to the user

	call ReadInt										;read in the first integer 
	mov firstNumber, eax								;store the  first value in firstNumber - will sum later

	;SETTING THE CURSOR TO THE MIDDLE OF SCREEN HERE
	mov dl, 20										;set the column coordinate
	mov dh, 12										;set the row coordinate BELOW THE LAST ONE
	call Gotoxy										;move the cursor to near the center of the screen

	mov edx,OFFSET secondIntegerPrompt						;move prompt for second integer into edx
	call WriteString									;display the message to the user

	call ReadInt										;read the second integer 
	mov secondNumber, eax								;store the second value in secondNumber-will sum later

	mov eax, secondNumber								;move secondNumber into eax
	add eax, firstNumber								;calculate the sum by adding firstNumber to eax value
	mov theSum, eax									;move what is in the eax to theSum

	;SETTING THE CURSOR TO THE MIDDLE OF SCREEN HERE
	mov dl, 20										;set the column coordinate 
	mov dh, 13										;set the row coordinate BELOW THE LAST ONE
	call Gotoxy										;move the cursor to near the center of the screen

	mov edx, OFFSET displayResult							;move the text of displayResult into edx
	call WriteString									;display the text to the screen	

	mov eax, theSum									;move theSum into the eax
	call WriteInt										;print to the screen what is in theSum

	exit												;exit
main ENDP												;end process
	END main											;end source code
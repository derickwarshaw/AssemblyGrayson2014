TITLE Lab 3

 ; Description: This program presents the user with a menu of options to choose from. When they make a selection
 ;              a text message will display the selection they picked from the menu. If a number outsid of 1-5 is entered - an error is printed
 ;Derick Warshaw // COSC 2425 // LAB3

INCLUDE Irvine32.inc

.data
prompt BYTE "USE THE BOOLEAN CALCULATOR: Choose from option 1-5", 0			;message of instructions on how to select
userSelection WORD ?												;holds user input
firstLine BYTE "1. x AND y", 0										;text for the line one of the menu choice
secondLine BYTE "2. x OR y", 0                                                  ;text for the line two of the menu choice
thirdLine BYTE "3. NOT x", 0											;text for the line three of the menu choice
fourthLine BYTE "4. x XOR y",0										;text for the line four of the menu choice
fifthLine BYTE "5. Exit program", 0									;text for the line five of the menu choice
firstLineMessage BYTE "You chose the AND operation. ", 0					;display when a 1 is entered
secondLineMessage BYTE "You chose the OR operation. ", 0					;display when a 2 is entered
thirdLineMessage BYTE "You chose the NOT operation. ", 0					;display when a 3 is entered
fourthLineMessage BYTE "You chose the exclusive OR operation. ", 0			;display when a 4 is entered
fifthLineMessage BYTE "You chose to exit the program", 0                        ;display whena 5 is entered
errorMessage BYTE "Please make a selection from the menu. ", 0				;display when something other than 1-5 entered


.code
main PROC
    call Clrscr												;call this to clear out the screen  
    mov edx, offset prompt                                                 ;move prompt to edx reg
    call WriteString											;display the message
    call Crlf													;place a new line
    mov edx, offset firstLine										;move firstLine to edx reg
    call WriteString											;display line1
    call Crlf													;place a new line
    mov edx, offset secondLine									;move secondLine to edx reg
    call WriteString											;display secondLine
    call Crlf													;place a new line
    mov edx, offset thirdLine										;move thirdLine to edx reg
    call WriteString											;display thirdLine
    call Crlf													;place a new line
    mov edx, offset fourthLine									;move fourthLine to edx reg
    call WriteString											;display fourthLine
    call Crlf													;place a new line
    mov edx, offset fifthLine										;movefifthLine to edx reg
    call WriteString											;displayfifthLine
    call Crlf													;place a new line
    mov ax, userSelection                                                  ;move user input to ax reg
	   
    MENU:														;MENU LABEL - beginning of loop
	   call Crlf												;new line
	   call Crlf												;new line
	   call ReadInt											;read user input
	   cmp ax, 1												;compare input to 1
	   je select1												;if 1, jump to select1 label
	   cmp ax, 2												;compare input to 2
	   je select2												;if 2, jump to select2 label
	   cmp ax, 3												;compare input to 3 
	   je select3												;if 3, jump to select3 label
	   cmp ax, 4												;compare input to 4
	   je select4												;if 4, jump to select4 label
	   cmp ax, 5												;compare input to 5
	   je select5												;if 5, jump to select5 label
	   ja error												;if more than 5 -- jump to error label

	   loop MENU												;end the loop

    EXIT														;exit the main proc

    select1:													;when user enters a 1
    mov edx, offset firstLineMessage								;move firstLineMessage to edx reg
    call WriteString											;display the message
    call Crlf                                                              ;new line
    call Crlf                                                              ;new line
    exit														;exit select1

    select2:													;when user enters a 2
    mov edx, offset secondLineMessage								;move secondLineeMessage to edx reg
    call WriteString											;display the message
    call Crlf                                                              ;new line
    call Crlf                                                              ;new line
    exit														;exit select2

    select3:													;when user enters a 3
    mov edx, offset thirdLineMessage								;move thirdLineMessage to edx reg
    call WriteString											;display the message
    call Crlf                                                              ;new line
    call Crlf                                                              ;new line
    exit														;exit select3
    
    select4:													;when user enters a 4
    mov edx, offset fourthLineMessage								;move fourthLineMessage to edx reg
    call WriteString											;display the message
    call Crlf                                                              ;new line
    call Crlf                                                              ;new line
    exit														;exit select4

    select5:													;when user enters a 5
    mov edx, offset fifthLineMessage								;move fifthLineMessage to edx reg
    call WriteString											;display the message
    call Crlf                                                              ;new line
    call Crlf                                                              ;new line
    exit														;exit select5

    error:													;when user enter a number other than 1-5
    mov edx, offset errorMessage                                           ;move errorMessage to edx reg
    call WriteString											;display error message
    call Crlf                                                              ;new line
    call Crlf                                                              ;new line
    jmp MENU													;jump to top of loop
    

main ENDP
END main         
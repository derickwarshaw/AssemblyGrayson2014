TITLE Lab2

 ; Description: This program allows the user to enter multiple scores between 0 and 100. Then, a letter grade is
 ;              displayed. There is also an accumulator for the number of test scores.

 ;Derick Warshaw // COSC 2425 // LAB2

INCLUDE Irvine32.inc





.data
instructionPrompt BYTE "Please enter your test scores and when finished type 9999. ", 0  ;The message for ending the score entries
scoreAMessage BYTE "You Scored an A. ", 0                                            ;Score an an A determined
scoreBMessage BYTE "You Scored an B. ", 0                                            ;Score an an B determined
scoreCMessage BYTE "You Scored an C. ", 0                                            ;Score an an C determined
scoreDMessage BYTE "You Scored an D. ", 0                                            ;Score an an D determined
scoreFMessage BYTE "You Scored an F. ", 0                                            ;Score an an F determined
testScore WORD ?                                                              ;A score that is entered by the user
count WORD 0                                                                  ;This is an accumulator
exitMessage BYTE "Goodbye. ",0                                                ;Message indicating program is exiting
errorMessage BYTE "Enter a score between 0 and 100. ", 0				   ;This is a message to indicate invalid data entered

.code
main PROC
    call Clrscr                                                                ;to clear screen
    mov edx,offset instructionPrompt                                           ;send prompt message to edx register
    call WriteString                                                           ;display the instruction text
    mov ax, testScore                                                          ;the score the user enters is placed in the ax register
    
THEBEGINNING:
    
    call ReadInt                                                               ;read the score the user put in the ax
    call Crlf                                                                  ;create a new line
    cmp eax, 9999                                                              ;compare what the user entered for a score to the sentinal value that will exit program
    je HALT                                                                    ;if number is 9999 the program will jump to halt label
    cmp eax, 0                                                                 ;compare 0 to what the user entered                                                                        
    jl NEGATIVENUMBER                                                          ;if number is less than zero, jump to NEGATIVENUMBER
    cmp eax, 100                                                               ;compare 100 to what the user entered
    ja TOOBIG                                                                  ;if number is greater than 100, jump to TOOBIG
    cmp eax, 90                                                                ;compare 90 to what the user entered
    jge AnA                                                                    ;if the number is greater than or equal to 90 jump to AnA
    cmp eax, 80                                                                ;compare 80 to what the user entered
    jge Ab                                                                     ;if the number is greater than or equal to 80 jump to AnB
    cmp eax, 70                                                                ;compare 70 to what the user entered
    jge Ac                                                                     ;if the number is greater than or equal to 70 jump to AnC
    cmp eax, 60                                                                ;compare 60 to what the user entered
    jge Ad                                                                     ;if the number is greater than or equal to 60 jump to AnD
    cmp eax, 59                                                                ;compare 69 to what the user entered
    jle af                                                                     ;if the number is less than or equal to 59 jump to AnF
    
AnA:                                                                           ;AnA: Label for when the user got an A on a test score
    mov edx, offset scoreAMessage                                              ;put string for score in edx
    call WriteString                                                           ;display the letter grade for the score
    call Crlf                                                                  ;new line
    call Crlf                                                                  ;new line
    jmp THEBEGINNING                                                           ;jump to the beginning of the loop    
    exit   

Ab:                                                                           ;Ab: Label for when the user got an B on a test score
    mov edx, offset scoreBMessage                                              ;put string for score in edx
    call WriteString                                                           ;display the letter grade for the score
    call Crlf                                                                  ;new line
    call Crlf                                                                  ;new line
    jmp THEBEGINNING                                                           ;jump to the beginning of the loop    
    exit

MIDDLE:                                                                       ;A label for a jump back to the middle. I used this as a work around for having a jump that was too far.
	jmp THEBEGINNING                                                          ;jump to the beginning of the loop
	  
Ac:                                                                           ;Ac: Label for when the user got an C on a test score
    mov edx, offset scoreCMessage                                              ;put string for score in edx
    call WriteString                                                           ;display the letter grade for the score
    call Crlf                                                                  ;new line
    call Crlf                                                                  ;new line   
    jmp THEBEGINNING                                                           ;jump to the beginning of the loop    
    exit       
    
  
Ad:                                                                           ;Ad: Label for when the user got an D on a test score
    mov edx, offset scoreDMessage                                              ;put string for score in edx
    call WriteString                                                           ;display the letter grade for the score
    call Crlf                                                                  ;new line
    call Crlf                                                                  ;new line
    jmp THEBEGINNING                                                           ;jump to the beginning of the loop    
    exit       
    
    
    
Af:                                                                           ;Af: Label for when the user got an F on a test score
    mov edx, offset scoreFMessage                                              ;put string for score in edx
    call WriteString                                                           ;display the letter grade for the score
    call Crlf                                                                  ;new line
    call Crlf                                                                  ;new line
    jmp THEBEGINNING                                                           ;jump to the beginning of the loop    
    exit              

    

    jmp MIDDLE                                                                 ;jump to MIDDLE which then jumps back to THEBEGINNING
	   
    exit                                                                       ;exit main
    
    HALT:                                                                     ;stopit label: user entered 999
    mov edx, offset exitMessage                                                ;send exitMessage to edx register
    call WriteString                                                           ;display exitMessage
    exit                                                                       ;exit stopit

    NEGATIVENUMBER:                                                            ;NEGATIVENUMBER: user entered a negative number
    mov edx, offset errorMessage                                               ;send errorMessage to edx register
    call WriteString                                                           ;display errorMessage
    jmp THEBEGINNING                                                           ;jump to the top of the loop    
    exit                                                                       ;exit NEGATIVENUMBER

    TOOBIG:                                                                    ;TOOBIG label: user entered a number greater than 100
    mov edx, offset errorMessage                                               ;send errorMessage to edx register
    call WriteString                                                           ;display errorMessage
    jmp THEBEGINNING                                                                    ;jump to the top of the loop
    exit                                                                       ;exit TOOBIG
main ENDP                                        

END main                               
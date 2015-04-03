TITLE Lab 3

 ; Description: This program presents the user with a menu of options to choose from. When they make a selection
 ;              a text message will display the selection they picked from the menu. If a number outsid of 1-5 is entered - an error is printed
 ;Derick Warshaw // COSC 2425 // LAB3

INCLUDE Irvine32.inc

.data
int1 sdword ?
int2 sdword ?
caseTable byte '1'  
		    ;lookup value
		dword enterInt          ;address of lookup value
entrySize = ($ - caseTable )
		byte '2'
		dword endTest
		numberOfEntries = 2
msgIntro  byte "This is Your Name's fifth assembly program. A test program that",0dh,0ah
		byte "will call the PROC findGCD, passing in the integer values input by",0dh,0ah
		byte "the user and then it will display the results to the screen.",0dh,0ah,0
msgSelMn  byte "---------------------------------",0dh,0ah
		byte "Select 1 to Run Prog or 2 to Quit ",0dh,0ah
		byte "---------------------------------",0dh,0ah
		byte "Enter Selection: ",0
msgInt1   byte "Enter first integer: ",0
msgInt2   byte "Enter second integer: ",0
msgAns    byte "Greatest common divisor is: ",0
msgEnd    byte "GoodBye",0dh,0ah,0

.code
main PROC
;///////Intro Message/////////////////////////////////
	mov edx,OFFSET msgIntro  ;intro message into edx
	   call WriteString         ;display msgIntro
	   call Crlf                ;endl
	   call WaitMsg             ;pause message
	   call Clrscr              ;clear screen
	   call Menu                ;menu procedure

ExitProg::exit                   ;global label to exit
main ENDP

;------------------------------------------------
Menu PROC
;
; Receives: Nothing
; Returns: Nothing
;------------------------------------------------
	mov  edx,OFFSET msgSelMn ;ask user for input
	call WriteString         ;display msgSelMn
	call ReadChar		 ;read one character
	call Clrscr
	   mov  ebx,OFFSET caseTable;point EBX to the table
	mov  ecx,numberOfEntries ;loop counter

	   L1:
	cmp  al,[ebx]		 ;match found?
	jne  L2		         ;no: continue
	call NEAR PTR [ebx + 1]	 ;yes: call the procedure
	call WriteString	 ;display message
	call Crlf                ;endl
	call Clrscr              ;clear screen
	jmp  L3		         ;exit the search

	   L2:
	add  ebx,5		 ;point to the next entry
	loop L1		         ;repeat until ECX = 0

	   L3:
	jmp Menu	         ;run Menu again

Menu ENDP

;------------------------------------------------
enterInt PROC
;
; Finds the GCD
; Receives: EAX = 1, EBX = 1
; Returns: EAX = GCD
;------------------------------------------------
	   push edx

	   mov  edx,OFFSET msgInt1  ;ask user for input
	call WriteString         ;display msgInt1
	call ReadInt		 ;read integer
	   mov  int1,eax
	mov  edx,OFFSET msgInt2  ;ask user for input
	   call WriteString         ;display msgInt2
	call ReadInt		 ;read integer
	   mov  int2,eax

	   mov eax,int1
	   mov ebx,int2
	   call findGCD
	mov  edx,OFFSET msgAns
	call WriteString
	call WriteDec
	call Crlf

	   call WaitMsg
	   pop edx

enterInt ENDP

;------------------------------------------------
findGCD PROC
;
; Finds the GCD
; Receives: EAX = 1, EBX = 1
; Returns: EAX = GCD
;------------------------------------------------
	push ebx
	push edx

	or eax,eax                ;explicitly set sign flag
	.IF SIGN?                 ;in the event of a neg int
	  neg eax
	.ENDIF
	or ebx,ebx
	.IF SIGN?
	  neg ebx
	.ENDIF

	   L1:
	   mov  edx,0
	div ebx		          ;divide int1 by int2
	cmp  edx,0		  ;does remainder = 0 ?
	je   L2		          ;yes: quit
	mov  eax,ebx		  ;no: prepare for
	mov  ebx,edx		  ;next iteration
	jmp  L1

	   L2:
	   mov eax,ebx		  ;EAX = GCD

	pop edx
	pop ebx
	ret

findGCD ENDP

;------------------------------------------------
endTest PROC
;
; Receives: Nothing
; Returns: EDX = offset of message
;          Sets CF = 1 to signal end of program
;------------------------------------------------
	   mov  edx,OFFSET msgEnd   ;msgEnd into edx
	call WriteString	 ;display message
	call Crlf                ;endl
	stc	                 ;CF = 1
	jc ExitProg    	         ;if CF=1 then jump to Global ExitProg

endTest ENDP

END main
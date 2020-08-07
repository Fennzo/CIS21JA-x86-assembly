	INCLUDE Irvine32.inc

	COMMENT !
Alex Jin
05/24/2020
1.     Clears the screen, locates the cursor near the middle of the screen.

2.      Prompts the user for two signed integers.

3.      Displays their sum and difference.

4.      Repeats the same steps three times. Clears the screen after each loop iteration
			!



		.data
		row byte ?
		msg1 byte "Input signed integer1: ", 0
		msg2 byte "Input signed integer2: ", 0
		msgSum byte "Sum: ", 0
		msgDiff byte "Difference: ", 0
		msgWait byte "Press any key...", 0
		var1 SDWORD ?
		var2 SDWORD ?



		.code
		main proc

		mov ecx, 3
		mov row, 10
		l1:
		call ClrScr
		call locate
		call input
		call displaySum
		call displayDiff
		call waitForKey
		mov row, 10
		loop l1;

		exit
		main endp

;Does not take in any value or return any value
;Clear screen and sets cursor position

	locate proc
			mov   dh, row ; row 10
			mov   dl, 20 ; column 20
			call  Gotoxy; locate cursor
			inc row
			ret
		locate endp

;Does not take in any value or return any value
;Calculate the sum of var1 and var2, print the result accompanied by a string

	displaySum proc
		call locate
		mov eax, var1
		add eax, var2
		mov edx, OFFSET msgSum
		call writeString
		call writeInt
		call crlf

			ret
			displaySum endp

;Does not take in any value or return any value
;Take the difference of var1 and var2, print the result accompanied by a string

	displayDiff proc
		call locate
		mov eax, var1
		sub eax, var2
		mov edx, OFFSET msgDiff
		call writeString
		call writeInt

			ret
			displayDiff endp
;Does not take in any value or return any value
;Read 2 signed user input and save it to var1/var2

	input proc
	
		mov edx, OFFSET msg1
		call writeString
		call readInt
		mov var1, eax
		call crlf

		call locate
		mov edx, OFFSET msg2
		call writeString
		call readInt
		mov var2, eax

		ret
		input endp
;Does not take in any value or return any value
;Print a string and allows user to enter any key to continue the loop

	waitForKey proc
		call locate
		mov	 edx, OFFSET msgWait
		call WriteString
		call readChar

		ret
		waitForKey endp

		end main

COMMENT !
  Input signed interger1: 10
  Input signed integer2: 5
                   Sum: +15
                   Difference: +5                                                                                                     
				   Press any key...
				   !
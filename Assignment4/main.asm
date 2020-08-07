INCLUDE Irvine32.inc
	;05/08/2020
	;Alex Jin
	;Use userinput to do mathematic calculuations, input input to array and reverse the array
	;

	.data
	msg byte "Please enter a number: ", 0
	msgSum byte "The sum is: ", 0
	msgMean byte "The mean is: ", 0
	msgOriginal byte "The original array: ", 0
	msgRotation byte "After a rotation: ", 0
	msgSpace byte " ",0
	msgRemainder byte "/",0
	var1 DWORD ?
	var2 DWORD ?
	array DD 10 DUP (?)

	.code
	main proc

		mov ecx, 10
		mov ebx, OFFSET array
	
	top:
		mov edx, OFFSET msg
		call writeString
		call readDec
		mov [ebx], eax
		add ebx, 4
			LOOP top

		mov ecx, 10
		mov ebx, OFFSET array
		mov eax, 0

	sumLoop:								; sum the array

		add eax, [ebx]
		add ebx, 4

			LOOP sumLoop
	
		mov edx, OFFSET msgSum
		call writeString
		call writeDec
	
		call crlf
		mov edx, OFFSET msgMean
		call writeString
		mov edx,0
		mov ebx,10
		div ebx								; divide array
		mov ebx, edx
		call writeDec
		mov edx, OFFSET msgRemainder
		call writeString
		mov eax, ebx
		call writeDec

		mov ecx, 10
		mov ebx, OFFSET array

		call crlf
		mov edx, OFFSET msgOriginal
		call writeString

	print:
		mov eax, [ebx]
		call writeDec
		add ebx, 4
		mov edx, OFFSET msgSpace
		call writeString
		LOOP print


		mov ESI, OFFSET array  
        mov EDI, SIZEOF array
        add EDI, OFFSET array
        sub EDI, TYPE array  

        mov ECX, LENGTHOF array
        shr ECX, 1         

L1:     mov EAX, [ESI]         ;reverse array and a much faster reversal
        mov EBX, [EDI]
        mov [EDI],EAX
        mov [ESI],EBX
		call Crlf
		mov edx, OFFSET msgRotation
		call writeString
		mov var2, ECX
		mov var1, ESI
		mov ECX, LENGTHOF array
		mov ESI, OFFSET array
		
			L2:     
			mov EDX, OFFSET msgSpace
			call writeString
			MOV EAX, [ESI]			;print reversed array
			call WriteDec

			add ESI, TYPE array
			LOOP L2
		mov ESI, var1
		mov ECX, var2
        add ESI, TYPE array
        sub EDI, TYPE array
        LOOP L1

     
        

		

	



	invoke ExitProcess,0
	main endp
	end main

	COMMENT !

Please enter a number: 1
Please enter a number: 2
Please enter a number: 3
Please enter a number: 4
Please enter a number: 5
Please enter a number: 6
Please enter a number: 7
Please enter a number: 8
Please enter a number: 9
Please enter a number: 10
The sum is: 55
The mean is: 5/5
The original array: 1 2 3 4 5 6 7 8 9 10
After a rotation:  10 2 3 4 5 6 7 8 9 1
After a rotation:  10 9 3 4 5 6 7 8 2 1
After a rotation:  10 9 8 4 5 6 7 3 2 1
After a rotation:  10 9 8 7 5 6 4 3 2 1
After a rotation:  10 9 8 7 6 5 4 3 2 1

!	
include Irvine32.inc
COMMENT !
Alex Jin
05/06/2020
A prime number is an integer that is divisible only by 1 and by itself. Write a program that:

1.      Takes a number as an input.

2.      Prints back to the console all the primes that are larger than 1 but not larger than the number that has been entered.

You need to have a procedure called isPrime. You may have more procedures if you like.

1.      This procedure receives a number through one of the registers.

2.      Checks if this number is prime.

3.      Returns back through one of the registers to the main program 1, if the number is prime, 0 otherwise.

sample run:

Please enter a number: 44

Primes found until the given number:

2 3 5 7 11 13 17 19 23 29 31 37 41 43 Press any key to continue . . .

!
.data


inputString BYTE "Please enter a number: ", 0	
displayString BYTE "Primes found until the given number: ", 0
space BYTE " ", 0


input DWORD			?			
count DWORD			2			

.code
main proc
	mov edx, offset inputString	
	call writeString				
	call readDec					
	

	mov edx, offset displayString		
	call writeString				

	call Crlf 
	mov esi, eax					 
	mov edx, offset space			
	mov ecx, count
	
	;Check if count variable is smaller than input, if so, count is prime and print it
	;If not, increate count and continue loop
	while02:
		cmp ecx, esi				
		jae outwhile02				
		mov eax, ecx				
		call isPrime				
		cmp ebx, 1
		jne out03
		mov eax, ecx
		call writeDec
		call writeString
		out03:
		inc ecx

		jmp while02

		outwhile02:
 
	exit
main endp

;Take in input and check if it is prime or not. Return 1 or 0 depending on the result
isPrime PROC
push ecx					
push edx					

	mov ebx, eax			
	mov ecx, 2				

	;while1 loop to check the input and perform division to check remainder
	while01:
		cmp ecx, ebx		
		jae outwhile01		
	
		mov eax, ebx		
		xor edx, edx		
		div	ecx				
		cmp edx, 0
		jz notPrime			
		inc ecx				
		jmp while01		
	outwhile01:
		mov ebx, 1		
		jmp out01
	notPrime:
		mov ebx, 0			
	out01:

pop edx
pop ecx

	ret 
isPrime ENDP

end main

COMMENT !

sample run:

Please enter a number: 35
Primes found until the given number:
2 3 5 7 11 13 17 19 23 29 31 Press any key to continue . . .

!

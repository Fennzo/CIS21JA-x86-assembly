COMMENT !

Write a complete program that sorts dword unsigned integer array in descending order. Assume that the user doesn’t enter more than 40 integers. 


!

include irvine32.inc
; ===============================================
.data
array  WORD 8,8,8,8,8,0,8,4
.code
main proc
 
          ; mov EAX,1Bh

   ;  mov EBX,5h

    ; mov ESP,63FB60h
    ; mov EDX,4294967281
   ;sub al, cl
  ; mov eax, dword ptr myWords
mov eax,0FFFF8EBAh

test ah, 0F0h     
mov EAX,3
exit
main endp
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

Enter up to 40 unsigned dword integers. To end the array, enter 0.
After each element press enter.
1
4
3
899
74
34
5
2
17
0


Your initial array:
1 4 3 899 74 34 5 2 17
Your array sorted in descending order:
899 74 34 17 5 4 3 2 1
Press any key to continue...




!
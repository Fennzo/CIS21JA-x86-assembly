INCLUDE Irvine32.inc
;Alex Jin
;05/07/2020
;((num1 ^ 3) * num2 + 5 * ( num2 ^ 2)) / num3

.data
num1 byte "Input data for num1: ", 0 ; for String must be byte
num2 byte "Input data for num2: ", 0 ; print value
num3 byte "Input data for num3: ", 0
msg byte "R",0
var1 dword ? ; variableName sizeOfVariable ? ( no value yet)
var2 dword ?
var3 dword ?
result1 dword ?
result2 dword ?

.code
main proc
mov edx, OFFSET num1 ; always use edx to display String
call writestring ; To display the string above
call readdec ; Read 32-bit unsigned integer and return value to eax
mov var1, eax

mov edx, OFFSET num2
call writestring
call readdec
mov var2, eax

mov edx, OFFSET num3
call writestring
call readdec
mov var3, eax

mov ebx, var1
mov eax, var1
mul ebx
mul ebx ; num1 ^ 3
mov var1, eax


call crlf ; make space
mov eax, var2
mul var1 ; (num1 ^ 3) * num2
mov result1, eax


mov eax, var2
mul var2 ; num2^2
mov ebx, 5
mul ebx ; 5+ num2 ^ 2

add result1, eax ; ((num1 ^ 3) * num2 + 5 * ( num2 ^ 2))
mov eax, result1
mov edx, 0

div var3 ; ((num1 ^ 3) * num2 + 5 * ( num2 ^ 2)) / num3
mov ecx, edx
call writedec
mov edx, OFFSET msg
call writestring
mov eax, ecx
call writedec





exit
main endp
end main
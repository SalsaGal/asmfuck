section .text
global _start
_start:
    mov eax, 1
    mov ebx, 0
    int 0x80

print:
    mov eax, 4
    mov ebx, 1
    mov ecx, data
    add ecx, dword [data_pointer]
    mov edx, 1
    int 0x80
    ret

section .data
    data_pointer: dd 0

section .bss
    data: resb 30000

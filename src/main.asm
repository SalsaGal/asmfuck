section .text
global _start
_start:

interpret:
    mov eax, [instruction_pointer]      ; Get instruction address
    mov bl, [eax]                       ; Get instruction

    cmp bl, 0
    jz .end
    inc dword [instruction_pointer]
    jmp interpret

.end:
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
    instructions: db "++++++++++++++++++++++++++++++++++++.", 0
    instruction_pointer: dd instructions
    data_pointer: dd 0

section .bss
    data: resb 30000

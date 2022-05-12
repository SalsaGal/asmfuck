section .text
global _start
_start:
    mov byte [data], '%'

interpret:
    inc dword [instruction_pointer]

    mov eax, [instruction_pointer]      ; Get instruction address
    mov ebx, [data_pointer]             ; Get data address
    mov ch, [eax]                       ; Get instruction

    cmp ch, '.'
    jne .not_print

.not_print:
    mov eax, 4
    mov ecx, [data_pointer]
    mov ebx, 1
    mov edx, 1
    int 0x80
    jnz interpret

.end:
    mov eax, 1
    mov ebx, 0
    int 0x80

section .data
    data_pointer: dd data
    instruction_pointer: dd instructions - 1
    instructions: db "." 0

section .bss
    data: resb 30000

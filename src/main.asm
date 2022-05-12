section .text
global _start
_start:

interpret:
    inc dword [instruction_pointer]

    mov eax, [instruction_pointer]      ; Get instruction address
    mov ebx, [data_pointer]             ; Get data address
    mov ch, [eax]                       ; Get instruction

    cmp ch, '.'
    je print
    cmp ch, ','
    je input
    cmp ch, '+'
    je increment
    cmp ch, '-'
    je decrement
    cmp ch, '>'
    je right
    cmp ch, '<'
    je left
    cmp ch, 0
    jnz interpret

.end:
    mov eax, 1
    mov ebx, 0
    int 0x80

input:
    mov eax, 3
    mov ebx, 2
    mov ecx, [data_pointer]
    mov edx, 1
    int 0x80
    jmp interpret

right:
    inc byte [data_pointer]
    jmp interpret

left:
    dec byte [data_pointer]
    jmp interpret

decrement:
    dec byte [ebx]
    jmp interpret

increment:
    inc byte [ebx]
    jmp interpret

print:
    mov eax, 4
    mov ecx, ebx
    mov ebx, 1
    mov edx, 1
    int 0x80
    jmp interpret

section .data
    data_pointer: dd data
    instruction_pointer: dd instructions - 1
    instructions: db ",+.", 0

section .bss
    data: resb 30000
    input_buf: resb 1

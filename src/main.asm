section .text
global _start
_start:

interpret:
    inc dword [instruction_pointer]

    mov rax, [instruction_pointer]      ; Get instruction address
    mov rbx, [data_pointer]             ; Get data address
    mov ch, [rax]                       ; Get instruction

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
    mov rax, 60
    mov rdi, 0
    syscall

input:
    mov rax, 0
    mov rdi, 0
    mov rsi, [data_pointer]
    mov rdx, 1
    syscall
    jmp interpret

right:
    inc byte [data_pointer]
    jmp interpret

left:
    dec byte [data_pointer]
    jmp interpret

decrement:
    dec byte [rbx]
    jmp interpret

increment:
    inc byte [rbx]
    jmp interpret

print:
    mov rax, 1
    mov rdi, 1
    mov rsi, [data_pointer]
    mov rdx, 1
    syscall
    jmp interpret

section .data
    data_pointer: dq data
    instruction_pointer: dq instructions - 1
    instructions: db "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.,+.,++.", 0

section .bss
    data: resb 30000
    input_buf: resb 1

section .text
global _start
_start:

interpret:
    mov eax, [instruction_pointer]      ; Get instruction address
    mov ebx, [data_pointer]             ; Get data address
    mov ch, [eax]                       ; Get instruction

.end:
    mov eax, 1
    mov ebx, 0
    int 0x80

section .data
    data_pointer: dd data
    instruction_pointer: dd instructions
    instructions: db "++++++++++++++++++++++++++++++++++++.", 0

section .bss
    data: resb 30000

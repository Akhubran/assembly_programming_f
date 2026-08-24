section .data
    msg db "Hello, WSL Assembly!", 0xA
    len equ $ - msg

section .text
    global _start

_start:
    ; sys_write
    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, len
    syscall

    ; sys_exit
    mov rax, 60
    xor rdi, rdi
    syscall
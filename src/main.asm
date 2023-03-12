section .data
    hello       db "Hello, World", 10
    hello_len   equ $-hello

section .bss

section .text
    global _start

_start:
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, hello
    mov     rdx, hello_len
    syscall

    mov     rax, 60
    mov     rdi, 0
    syscall
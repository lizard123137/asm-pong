global get_time

section .data

section .bss

section .text


; gets time since epoch in milliseconds
get_time:
    push        rbp
    mov         rbp, rsp

    ; push empty values to be used as return for the time of day
    push        0x0
    push        0x0

    ; get time of day syscall
    mov         rax, 0x60
    mov         rdi, rsp
    mov         rsi, 0x0
    syscall

    pop         rax ; gets seconds
    pop         rbx ; gets microseconds

    imul        rax, rax, 1000000 ; converts seconds to microseconds
    add         rax, rbx          ; add microseconds
    xor         rdx, rdx
    mov         rbx, 1000
    div         rbx               ; converts to millis

    pop         rbp
    ret
section .data
    prompt db "Enter string: ", 0
    prompt_len equ $ - prompt
    key db 0x5A              ; XOR key

section .bss
    buffer resb 128
    length resb 1

section .text
    global _start

_start:
    ; write(1, prompt, prompt_len)
    mov rax, 1          ; syscall: write
    mov rdi, 1          ; fd: stdout
    mov rsi, prompt
    mov rdx, prompt_len
    syscall

    ; read(0, buffer, 128)
    mov rax, 0          ; syscall: read
    mov rdi, 0          ; fd: stdin
    mov rsi, buffer
    mov rdx, 128
    syscall
    mov [length], al    ; store number of bytes read

    ; XOR loop
    xor rcx, rcx        ; index = 0
.encrypt_loop:
    cmp rcx, [length]
    jge .done_encrypt
    mov al, [buffer + rcx]
    xor al, [key]
    mov [buffer + rcx], al
    inc rcx
    jmp .encrypt_loop

.done_encrypt:
    ; write(1, buffer, length)
    mov rax, 1
    mov rdi, 1
    mov rsi, buffer
    movzx rdx, byte [length]
    syscall

    ; exit(0)
    mov rax, 60
    xor rdi, rdi
    syscall

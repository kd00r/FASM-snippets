;file: double-hardware-gen-check.asm
;double intel hardware random number generator gates grants permission to leave.
;typical execution time: 0.085 s

format ELF64

section '.text' executable
public main
main:
    mov rbp, rsp; for correct debugging
    rdrand eax
    cmp eax, 0xDEADBEEF
    jg perm
    jmp main
    
perm:
    rdrand eax
    cmp eax, 0xD15EA5E
    jl exit
    jmp main

exit:
    xor rax, rax
    ret

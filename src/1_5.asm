    option casemap:none

    .data

fmt_str byte 'Hello World!', 10, 0 ; here 10 is the newline feed

    .code

    externdef printf:proc

    public asm_func

asm_func proc
    sub rsp, 56
    lea rcx, fmt_str ; load the format string into the RCX register to be used by the printf
    call printf
    add rsp, 56
    ret
asm_func endp
    
    end
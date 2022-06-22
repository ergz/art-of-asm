; a hello world program using printf from C

    option casemap:none

    .data 

format_string byte "Hello from asm world!", 10, 0 

    .code

    externdef printf:proc

    public asm_func

asm_func proc
    
    sub     rsp, 56
    lea     rcx, format_string
    call    printf
    add     rsp, 56

    ret

asm_func endp

    end


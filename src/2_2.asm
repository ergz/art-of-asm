
    option casemap:none

nl      =       10


    .data

left_op     dword       0f0f0f0fh
right_op1   dword       0f0f0f0f0h
right_op2   dword       12345678h


title_str   byte        "Listing 2-2", 0

fmt_str1    byte        "%lx AND %lx = %lx", nl, 0
fmt_str2    byte        "%lx OR %lx = %lx", nl, 0
fmt_str3    byte        "%lx XOR %lx = %lx", nl, 0
fmt_str4    byte        "%NOT lx = %lx", nl, 0

    .code
    externdef printf:proc

    public get_title
get_title PROC
    lea     rax, title_str      ; load title string address into rax register
    ret
get_title ENDP

    public asm_main
asm_main PROC
    sub     rsp, 56

; AND operator
    lea     rcx, fmt_str1       ; load fmt str address 
    mov     edx, left_op
    mov     r8d, right_op1
    mov     r9d, edx
    and     r9d, r8d
    call    printf

    lea     rcx, fmt_str1
    mov     edx, left_op
    mov     r8d, right_op2
    mov     r9d, r8d
    and     r9d, edx
    call    printf

asm_main ENDP

    END
    
; Notes ---
; RCX, RDX, R8, R9 are the registers specified in Windows ABI
; for use as the first, second, third and fourth argument respectively
; all of these are volatile

    option casemap:none

nl      =       10


    .data

left_op     dword       0f0f0f0fh
right_op1   dword       0f0f0f0f0h
right_op2   dword       12345678h


title_str   byte        "Listing 2-2", 0
sep_str     byte        "--------------", nl, 0

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
    lea     rcx, fmt_str1       ; load address for fmt_str1 into the rcx register
    mov     edx, left_op        ; move the left_op value into the edx register
    mov     r8d, right_op1      ; move the right_op value into the r8d register
    mov     r9d, edx            ; move the edx value into the r9d register, this one is a little confusing to me
    and     r9d, r8d            ; r9d AND r8d, we also have all of our values into the correct register based on the ABI to call printf
    call    printf

    lea     rcx, fmt_str1
    mov     edx, left_op
    mov     r8d, right_op2
    mov     r9d, r8d
    and     r9d, edx
    call    printf

    lea     rcx, sep_str
    call    printf

; OR operator
    lea     rcx, fmt_str2       ; load address of fmt_str2 in rcx for use in the printf call
    mov     edx, left_op
    mov     r8d, right_op1
    mov     r9d, edx 
    or      r8d, r9d 
    call    printf

    add     rsp, 56
    ret 
asm_main ENDP

    END

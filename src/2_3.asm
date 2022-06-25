; 2-3

    option casemap:none

nl      =   10
maxlen  =   256

    .data

title_str       byte    "listing 2-3", 0

init_prompt     byte    "enter an integer between 0-127: ", 0
fmt_str1        byte    "the value in hexadecimal: %x", nl, 0
fmt_str2        byte    "invert all the bits: %x", nl, 0
fmt_str3        byte    "add 1 (hexadecimal): %x", nl, 0
fmt_str4        byte    "output as signed int: %d", nl, 0
fmt_str5        byte    "using the 'neg' instruction: %d", nl, 0

int_value       sqword  ?
input           byte    maxlen dup (?)

    .code

    externdef   printf:proc
    externdef   atoi:proc
    externdef   readline:proc

    public get_title
get_title PROC
    lea     rcx, title_str
    ret
get_title ENDP


    public asm_main
asm_main PROC

    sub     rsp, 56

    lea     rcx, init_prompt
    call    printf

    lea     rcx, input      ; pass arguments into the realine function
    mov     rdx, maxlen
    call    readline

    ; call atoi(i)

    lea     rcx, input
    call    atoi
    and     rax, 0ffh       ; we use only LO 8 bits
    mov     int_value, rax  ; move result into the int_value

    lea     rcx, fmt_str1
    mov     rdx, rax
    call    printf

    mov     rdx, int_value
    not     dl              ; we are only interested in the lower byte
    lea     rcx, fmt_str2
    call    printf

    mov     rdx, int_value
    not     rdx
    add     rdx, 1
    and     rdx, 0ffh
    lea     rcx, fmt_str3
    call    printf

    mov     rdx, int_value
    not     rdx
    add     rdx, 1
    lea     rcx, fmt_str4
    call    printf

    mov     rdx, int_value
    neg     rdx
    lea     rcx, fmt_str5
    call    printf

    

    add     rsp, 56
    ret

asm_main ENDP

    end


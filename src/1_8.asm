; assembly that shows how to return values to a
; a C function

    option casemap:none

; constants
nl      =       10
maxlen  =       256

    .data

title_str   byte        "Listing 1-8", 0
prompt      byte        "Enter a string: ", 0
fmt_string  byte        "User entered: '%s'", nl, 0

; make `maxlen` copies/duplicates of size byte, each uinitialized
input       byte maxlen dup (?)


    .code

    externdef printf:proc
    externdef readline:proc

    public get_title

; procedure loads the address of the title_str into the RAX
; register, this is the register where C expects to find 
; the return of this proc. (WINDOWS ABI)
get_title proc
    
    lea rax, title_str  ; load address of title string in RAX register
    ret

get_title endp

; ASM Main function
    public asm_main
asm_main proc 

    sub     rsp, 56
    
    lea     rcx, prompt     ; load prompt string address into RCX register
    call    printf          ; this is the reigster where ABI tells us to place arguments

    mov     input, 0        ; ensure the input string is terminated with 0

    lea     rcx, input      ; load input address to rcx register
    mov     rdx, maxlen     ; move maxlen into rdx register
    call    readline        ; use rcx and rdx as arguments to call readline

    lea     rcx, fmt_string
    lea     rdx, input
    call    printf

    add     rsp, 56
    ret

asm_main endp

    end

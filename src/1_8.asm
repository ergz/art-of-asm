    option casemap:none

; constants
nl      =   10  ; newline
maxlen  =   256 ; max len of the string

    .data

title_string    byte    'Listing 1_8', 0
prompt_string   byte    'Enter a string: ', 0
format_string   byte    'User entered: "%s" ', nl, 0

input   byte    maxlen dup (?) ; make maxlen copies of byte, each uninitialized

    .code

    externdef printf:proc
    externdef readline:proc


;; get_title procedure -------------------------
;; get_title moves the address of the byte containing the string "Listing 1_8", 0
;; into the RAX register, it does this usig the LEA instruction
    public get_title
get_title proc
    
    lea rax, title_string   ; load address of title_string into rax
    ret 

get_title endp

    public asm_main
asm_main proc

    sub rsp, 56

    ;; first we want to print a prompt, to do this we use the stdio function printf, 
    ;; we need to make the arguments for printf avaialble by loading the address of the
    ;; byte prompt_string into RCX
    lea rcx, prompt_string
    call printf

    mov input, 0 ;; clear the input

    ; read user input by calling readline from out cpp program. We load the required 
    ; arguments into the registers RCX, and RDX and then call readline
    lea rcx, input
    mov rdx, maxlen
    call readline

    ; load RCX and RDX with arugments to printf, to print back to the user
    lea rcx, format_string
    lea rdx, input
    call printf

    add rsp, 56
    ret

asm_main endp

    end
    option casemap:none

; constants
nl      =   10   ; newline
maxlen  =   256 ; max len of the string

    .data

title_string    byte    'Listing 1_8', 0
prompt_string   byte    'Enter a string: ', 0
format_string   byte    'User entered: "%s" ', nl, 0

input   byte    maxlen dup (?) ; make maxlen copies of byte, each uninitialized

    .code

    externdef printf:proc
    externdef readline:proc

    public get_title
get_title proc
    
    lea rax, title_string
    ret 

get_title endp

    public asm_main
asm_main proc

    sub rsp, 56

    ; first we want to print a prompt, to do this we use the C++ function printf
    ; we load this prompt in RCX and then call
    lea rcx, prompt_string
    call printf

    mov input, 0

    ; read user input
    lea rcx, input
    mov rdx, maxlen
    call readline

    lea rcx, format_string
    lea rdx, input
    call printf

    add rsp, 56
    ret

asm_main endp

    end
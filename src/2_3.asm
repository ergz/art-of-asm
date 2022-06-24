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





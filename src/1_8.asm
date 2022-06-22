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



; a user defined proc

    .code 

asm_proc proc
    ret             ; return from the procedure
asm_proc endp

main proc           ; the main procedure
    call asm_proc   ; call our proc
    ret
main endp
    end
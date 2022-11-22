    .CODE

    option casemap:none     ; make all symbols case sensitive (like C)

    public asm_func         ; make this visible outside of this source

asm_func PROC ; start procedure
    
    ret

asm_func ENDP ; end procedure
        
    END
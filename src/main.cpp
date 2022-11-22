#include <stdio.h>

extern "C" 
{
    // Function written in ASM
    void asm_func(void);    
}

int main() 
{
    printf("calling asm function\n");
    asm_func();
    printf("returned from asm function\n");

    return(0);
}
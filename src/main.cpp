#include <stdio.h>

extern "C" 
{
    void asm_func(void);
};

int main(void) 
{
    printf("calling asm main\n");
    asm_func();
    printf("return from asm main\n");
}
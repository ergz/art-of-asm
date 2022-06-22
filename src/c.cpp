#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>


extern "C" 
{
    void asm_main(void);


    char *get_title(void);

    int readline(char* dest, int maxlen);
}

int readline(char *dest, int maxlen) 
{
    char *result = fgets(dest, maxlen, stdin);
    if (results != NULL) {
        int len = strlen(result);
        if (len > 0) {
            dest[len - 1] = 0;
        }
        return(len);
    }

    return(-1) // an error occured
}

int main(void)
{

    try {
        char *title = get_title();
        printf("calling %s\n", title);
        asm_func();
        printf("%s terminated\n", title);

    } catch(...) {
        printf("an error occured!")
    }
}
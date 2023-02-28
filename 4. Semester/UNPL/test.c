#include <stdio.h>

void foo(void);

int global = 16;

int main()
{
    foo();
    printf("Value of global (2): %d \n", global);
    return 0;
}

void foo(void)
{
    printf("Value of global (1): %d \n", global);
    global = 17;
}
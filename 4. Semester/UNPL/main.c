#include <stdio.h>
#include <stdlib.h>
#include "MyMath.h"

int main(int argc, char const *argv[])
{
    if (argc == 3)
    {
        int sum = add(atoi(argv[1]), atoi(argv[2]));
        printf("Sum: %d", sum);
    }
    else
    {
        int prod = mult(atoi(argv[1]), atoi(argv[2]));
        printf("Product: %d", prod);
    }

    return 0;
}

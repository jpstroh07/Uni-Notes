/*test program LLTest.c, console application*/
#include "LL.h"
#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    LL list1, list2;
    
    printf("== Construction of lists ==\n");
    constructLL(&list1);
    constructLL(&list2);

    printLL(&list1);

    printf("\n== Adding values to front of list 1==\n");
    addFrontLL(&list1, 3);
    addFrontLL(&list1, 5);
    addFrontLL(&list1, 2);
    addFrontLL(&list1, 18);
    addFrontLL(&list1, 12);

    printLL(&list1);

    printf("number of elements: %d\n", numbInLL(&list1));

    printf("\n== Adding values to rear of list 1 ==\n");
    addRearLL(&list1, 4);
    addRearLL(&list1, 10);

    printLL(&list1);

    printf("\n== Copying lists ==\n");
    copyLL(&list2, &list1);

    printLL(&list2);

    printf("\n== Destruction of lists ==\n");
    destructLL(&list1);
    destructLL(&list2);

    system("pause");
    return 0;
}

/*eof LLTest.c*/
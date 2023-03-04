/*test program LLTest.c, console application*/
#include "LL.h"

int main(void)
{
    LL list1, list2;
    constructLL(&list1);
    constructLL(&list2);
    printLL(&list1);
    addFrontLL(&list1, 3);
    addFrontLL(&list1, 5);
    addFrontLL(&list1, 2);
    addFrontLL(&list1, 18);
    addFrontLL(&list1, 12);

    printLL(&list1);
    printf("number of elements: %d\n", numbInLL(&list1));
    addRearLL(&list1, 4);
    addRearLL(&list1, 10);

    printLL(&list1);
    copyLL(&list2, &list1);

    printLL(&list2);
    destructLL(&list1);
    destructLL(&list2);

    system("pause");
    return 0;
}

/*eof LLTest.c*/
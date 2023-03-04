/*part of source file LL.c*/
#include "LL.h"

void addFrontLL(LL *list, int number)
{
    node *newNode;
    newNode = malloc(sizeof(node));

    newNode->value = number;
    newNode->next = list->head;
    list->head = newNode;
}
/*eof LL.c*/
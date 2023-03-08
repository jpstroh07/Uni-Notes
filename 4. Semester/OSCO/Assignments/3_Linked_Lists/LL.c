/*part of source file LL.c*/
#include "LL.h"
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

void addFrontLL(LL *list, int number)
{
    node *newNode;
    newNode = (node *)malloc(sizeof(node));

    newNode->value = number;
    newNode->next = list->head;
    list->head = newNode;

    if (list->tail == NULL)
    {
        list->tail = newNode;
    }
}

void constructLL(LL *list)
{
    list->head = NULL;
    list->tail = NULL;
}

void destructLL(LL *list)
{
    node *current = list->head;

    while (current != NULL)
    {
        node *temp = current;
        current = current->next;
        free(temp);
    }

    list->head = NULL;
    list->tail = NULL;
}

void printLL(LL *list)
{
    node *current = list->head;
    char c[50] = "";
    int l = 0;

    while (current != NULL)
    {
        int result = sprintf(c + l, "%d ", current->value);

        if (result < 0)
        {
            return;
        }

        l += result;
        current = current->next;
    }

    printf("Values of list: %s\n", c);
}

int numbInLL(LL *list)
{
    node *current = list->head;
    int i = 0;

    while (current != NULL)
    {
        current = current->next;
        i++;
    }

    return i;
}

void addRearLL(LL *list, int n)
{
    node *newNode = (node *)malloc(sizeof(node));
    newNode->value = n;
    newNode->next = NULL;

    if (list->head == NULL)
    {
        list->head = newNode;
    }
    else
    {
        list->tail->next = newNode;
    }
    
    list->tail = newNode;
}

void deleteLL(LL *list, int n)
{
    node *current = list->head;
    node *previous = NULL;

    while (current != NULL && current->value != n)
    {
        previous = current;
        current = current->next;
    }

    if (current == NULL)
    {
        return;
    }

    if (previous == NULL)
    {
        list->head = current->next;
    }
    else
    {
        previous->next = current->next;
    }

    if (current == list->tail)
    {
        list->tail = previous;
    }

    free(current);
}

void copyLL(LL *list1, LL *list2)
{
    destructLL(list2);
    node *current = list1->head;

    while (current != NULL)
    {
        addRearLL(list2, current->value);
        current = current->next;
    }
}
/*eof LL.c*/
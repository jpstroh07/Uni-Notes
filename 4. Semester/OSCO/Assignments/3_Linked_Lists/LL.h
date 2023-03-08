/*part of header file LL.h*/
#ifndef LL_H
#define LL_H

struct Snode
{
    int value;
    struct Snode *next;
};
typedef struct Snode node;

struct list
{
    node *head;
    node *tail;
};

typedef struct list LL;

void addFrontLL(LL *list, int number);
void constructLL(LL *list);
void destructLL(LL *list);
void printLL(LL *list);
int numbInLL(LL *list);
void addRearLL(LL *list, int n);
void deleteLL(LL *list, int n);
void copyLL(LL *list1, LL *list2);

#endif
/*eof LL.h*/
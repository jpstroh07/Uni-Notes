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
    /*???*/;
};

typedef struct list LL;

void addFrontLL(LL *list, int number);

#endif
/*eof LL.h*/
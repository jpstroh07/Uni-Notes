#include "LRU.h"
#include <stdio.h>

#define F 3
#define P 3

int lframes[F] = {0};
int ages[P] = {0}; // keep track of age per frame
int oldestIndex;
int lfaults = 0;

int LgetAddr(int page_in)
{
    oldestIndex = 0;
    
    LupdateAges(page_in);
    int isInMem = LchkPmem(page_in);

    if (isInMem == 1)
    {
        printf("|P: %d  | %d | %d | %d |\n", page_in, lframes[0], lframes[1], lframes[2]);
        return 0;
    }
    else
    {
        lru(page_in);
        LhandlePfault(page_in);
    }

    printf("|P: %d  | %d | %d | %d | F\n", page_in, lframes[0], lframes[1], lframes[2]);
    lfaults++;
}

int LchkPmem(int page_in)
{
    for (int i = 0; i < F; i++)
    {
        if (lframes[i] == page_in && ages[i] != 0)
        {
            ages[i] = 0;
            return 1;
        }
    }
    return 0;
}

void LhandlePfault(int page_in)
{
    lframes[oldestIndex] = page_in;
    ages[oldestIndex] = 0;
}

void LupdateAges(int page_in) // update the ages array, add into getAddr()
{
    for (int i = 0; i < P; i++)
    {
        ages[i]++;
    }
}

int lru(int page_in) // result is frame index
{
    int max_val = ages[0];

    for (int i = 0; i < P; i++)
    {
        if (ages[i] > max_val)
        {
            max_val = ages[i];
            oldestIndex = i;
        }
    }
}

int lGetFaults()
{
    return lfaults;
}

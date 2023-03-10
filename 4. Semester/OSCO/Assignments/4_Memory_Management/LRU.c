#include "LRU.h"

#define F 3
#define P 3

int frames[F];
int lastFIFOindex = 0;
int ages[P]; // keep track of age per frame

int LgetAddr(int page_in)
{
    return 0;
}

int LchkPmem(int page_in)
{
    return 0;
}

void LhandlePfault(int page_in)
{
}

void LupdateAges(int page_in) // update the ages array, add into getAddr()
{
}

int lru(int page_in) // result is frame index
{
    return 0;
}
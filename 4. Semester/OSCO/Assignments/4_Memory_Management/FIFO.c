#include "FIFO.h"
#include <stdio.h>

#define F 3

int fframes[F] = {0};
int lastFIFOindex = 0; // keep track of last select
int ffaults = 0;

int FgetAddr(int page_in) // result is fault: 0 or 1
{
    int isInMem = FchkPmem(page_in);

    if (isInMem == 1)
    {   
        printf("|P: %d  | %d | %d | %d |\n", page_in, fframes[0], fframes[1], fframes[2]);
        return 0;
    }
    else
    {
        FhandlePfault(page_in);
        fifo(page_in);
    }

    printf("|P: %d  | %d | %d | %d | F\n", page_in, fframes[0], fframes[1], fframes[2]);
    ffaults++;
}

int FchkPmem(int page_in) // result is yes: 1 no: 0
{
    for (int i = 0; i < F; i++)
    {
        if (fframes[i] == page_in)
        {
            return 1;
        }
    }
    return 0;
}

void FhandlePfault(int page_int) // update frames
{
    fframes[lastFIFOindex] = page_int;
}

int fifo(int page_in) // result is frame index
{
    lastFIFOindex++;

    if(lastFIFOindex > 2) {
        lastFIFOindex = 0;
    }
}

int fGetFaults()
{
    return ffaults;
}
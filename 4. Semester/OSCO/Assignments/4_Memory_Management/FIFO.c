#include "FIFO.h"

#define F 3

int frames[F];
int lastFIFOindex = 0; // keep track of last select

int FgetAddr(int page_in) // result is fault: 0 or 1
{
    for(int i = 0; i < F; i++) {
        if(frames[i] == page_in) {
            return 1;
        }
    }
    return 0;
}

int FchkPmem(int page_in) // result is yes: 1 no: 0
{
    return 0;
}

void FhandlePfault(int page_int) // update frames
{
}

int fifo(int page_int) // result is frame index
{
    return 0;
}

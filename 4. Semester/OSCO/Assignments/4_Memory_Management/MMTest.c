#include <stdlib.h>
#include <stdio.h>
#include "FIFO.h"
#include "LRU.h"

int main()
{
    int input[] = {2, 3, 2, 1, 5, 2, 4, 5, 3, 2, 5, 2, 1, 5, 6, 5, 3, 1, 4, 5, 5, 3}; // 2, 3, 2, 1, 5, 2, 4, 5, 3, 2, 5, 2

    printf("- FIFO memory management -\n");
    printf("Frame: | 0 | 1 | 2 | PF?\n");

    for (int i = 0; i < sizeof(input) / sizeof(int); i++)
    {
        FgetAddr(input[i]);
    }

    printf("\nFIFO total faults: %d\n", fGetFaults());

    printf("\n========================\n\n");

    printf("- LRU memory management -\n");
    printf("Frame: | 0 | 1 | 2 | PF?\n");

    for (int i = 0; i < sizeof(input) / sizeof(int); i++)
    {
        LgetAddr(input[i]);
    }

    printf("\nLRU total faults: %d", lGetFaults());

    return 0;
}
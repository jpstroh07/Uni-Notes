#ifndef FIFO_h
#define FIFO_h

int FgetAddr(int page_in);
int FchkPmem(int page_in);
void FhandlePfault(int page_int);
int fifo(int page_in);

int fGetFaults();

#endif
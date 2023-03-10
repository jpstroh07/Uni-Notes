#ifndef FIFO.h
#define FIFO.h

int FgetAddr(int page_in);
int FchkPmem(int page_in);
void FhandlePfault(int page_int);
int Ffifo(int page_int);

#endif
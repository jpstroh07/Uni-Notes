#ifndef LRU_h
#define LRU_h

int LgetAddr(int page_in);
int LchkPmem(int page_in);
void LhandlePfault(int page_in);

void LupdateAges(int page_in);
int lru(int page_in);

int lGetFaults();

#endif
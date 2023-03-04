#include<stdio.h>
#include<stdlib.h>

int numCatcher() {
    int num;

    printf("Give number to multiply: \n");
    scanf("%d", &num);

    return num;
}

int multiply(int i1, int i2) {
    printf("Called multiplier method in header file \n");

    int res = i1 * i2;

    return res;
}
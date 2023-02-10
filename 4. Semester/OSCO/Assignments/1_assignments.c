#include<stdio.h>
#include<stdlib.h>

void main(int argc, char **argv) {
    printf("Program started \n");

    int first = atoi(argv[0]);
    int second = atoi(argv[1]);
    int result = first * second;

    printf("Result is: %d", result);
}
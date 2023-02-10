#include<stdio.h>

void multiply() {
    int firstM, secondM;
    
    printf("Give first number to multiply: \n");
    scanf("%d", &firstM);

    printf("Give second number to multiply: \n");
    scanf("%d", &secondM);

    int res = firstM * secondM;
    printf("Result: %d", res);
}

void main() {
    printf("Program started \n");

    multiply();
}
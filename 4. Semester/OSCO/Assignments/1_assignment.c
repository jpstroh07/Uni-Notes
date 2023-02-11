#include <stdio.h>
#include <stdlib.h>
#include "1_multiplier.h"

// 6.
void main() {
    printf("Program started \n");

    int firstM, secondM;

    firstM = numCatcher();
    secondM = numCatcher();

    int res = multiply(firstM, secondM);
    printf("Result: %d", res);
}

// 1.
/*
void main() {
    printf("Program started \n");
}
*/

// 2.
/*
void main() {
    printf("Program started \n");
    int i1, i2, res;

    i1 = 3;
    i2 = 5;

    res = i1 * i2;

    printf("Result: %d", res);
}
*/

// 3.
/*
void main(int argc, char *argv[]) {
    printf("Program started \n");

    int first = atoi(argv[1]);
    int second = atoi(argv[2]);

    int result = first * second;

    printf("Result is: %d", result);
}
*/

// 4.
/*
void main() {
    printf("Program started \n");

    int firstM, secondM;

    printf("Give first number to multiply: \n");
    scanf("%d", &firstM);

    printf("Give second number to multiply: \n");
    scanf("%d", &secondM);

    int res = firstM * secondM;
    printf("Result: %d", res);
}
*/

// 5.
/*
int multiply() {
    int firstM, secondM;

    printf("Give first number to multiply: \n");
    scanf("%d", &firstM);

    printf("Give second number to multiply: \n");
    scanf("%d", &secondM);

    int res = firstM * secondM;
    return res;
}

void main() {
    printf("Program started \n");

    int res = multiply();
    printf("Result: %d", res);
}
*/
#include <stdio.h>
#include <string.h>
#include "2_struct.h"

void reader(student s);

void printer(student s);

int main() {
    student s1;

    reader(s1);
    printer(s1);

    return 0;
}

void reader(student s) {
    printf("Input student first name: ");
    //scanf("%s", &s.firstName);
    strcpy_s(s.firstName, sizeof(s.firstName), "sauidh");
    printf("Input student last name: ");
    //scanf("%s", &s.lastName);

    printf("Input student number: ");
    //scanf("%d", &s.studentNumber);
}

void printer(student s) {
    printf("\nStudent:\n- First name: %s\n- Last name: %s\n- Student number: %d\n", s.firstName, s.lastName, s.studentNumber);
}
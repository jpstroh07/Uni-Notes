#include <stdio.h>
#include <string.h>

// 1
typedef enum {FIRST_YEAR, SECOND_YEAR, THIRD_YEAR, FORTH_YEAR} YEAR;
struct std {
    char firstName[20];
    char lastName[20];
    long studentNumber;
    YEAR year;
};
typedef struct std student;

void reader(student *s); // 2

void printer(student *s); // 3

void copy(student *s1, student *s2); // 4

void writeTxt(student s); // 5

void writeBin(student s); // 6

void exchange(student *s1, student *s2); // 7

int sum(int arr[], int size); // 8

int main() {
    student s1, s2;

    reader(&s1);
    reader(&s2);

    printer(&s1);
    printer(&s2);

    exchange(&s1, &s2);

    printf("\n-----------------------\n");

    printer(&s1);
    printer(&s2);

    writeTxt(s1);
    writeBin(s2);

    int test[5] = {1, 2, 3, 4, 5};

    int res = sum(test, 5);

    printf("\nResult of sum of array is: %d", res);

    return 0;
}

void reader(student *s) {
    printf("Input student first name: ");
    scanf("%s", s->firstName);

    printf("Input student last name: ");
    scanf("%s", s->lastName);

    printf("Input student number: ");
    scanf("%ld", &s->studentNumber);
}

void printer(student *s) {
    printf("\nStudent:\n- First name: %s\n- Last name: %s\n- Student number: %ld\n", s->firstName, s->lastName, s->studentNumber);
}

void copy(student *s1, student *s2) {
    strcpy(s1->firstName, s2->firstName);
}

void writeTxt(student s) {
    char* filename = "2_tfile.txt";
    FILE *fp = fopen(filename, "w");

    fprintf(fp, "Student: First name: %s; Last name: %s; Student number: %ld", s.firstName, s.lastName, s.studentNumber);

    fclose(fp);
}

void writeBin(student s) {
    char* filename = "2_bfile.bin";
    FILE *fp = fopen(filename, "wb");

    fwrite(&s.studentNumber, sizeof(long), 1, fp);

    fclose(fp);
}

void exchange(student *s1, student *s2) {
    char temp[20];
    
    strcpy(temp, s1->firstName);
    strcpy(s1->firstName, s2->firstName);
    strcpy(s2->firstName, temp);
}

int sum(int arr[], int size) {
    int sum = 0;

    for (int i = 0; i < size; i++) {
        sum += arr[i];
    }

    return sum;
}
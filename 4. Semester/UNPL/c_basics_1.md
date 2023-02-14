# C Basics 1

- [C Basics 1](#c-basics-1)
  - [Data types](#data-types)
  - [Modifier](#modifier)
  - [Ternary operator '?'](#ternary-operator-)
  - [Pointer and address operator](#pointer-and-address-operator)
  - [Arrays](#arrays)
    - [Array Identifier](#array-identifier)
  - [Example File](#example-file)

## Data types

| Type   | Explanation                                                                                | Example                               | Value Range                    | Format Specifier | Storage Size (bits) |
|--------|--------------------------------------------------------------------------------------------|---------------------------------------|--------------------------------|------------------|---------------------|
| char   | Character variable. Declaration can also use ASCII value of character                      | `char c = 'a'; / char c = '66'; (B)`  | -128 - 127                     | %c               | 8                   |
| int    | Whole number with negative, zero or positive value                                         | `int i = 10;`                         | -2.147.483.648 - 2.147.483.647 | %d               | 16 or 32            |
| short  | Used to store small numbers                                                                | `short s = 10;`                       | -32.768 - 32.767               | %d               | 16                  |
| long   | Used to store large numbers. Can also be used as a modifier to increase storage range      | `long l = 10; / long double = 10e32;` | -9.2e18 - 9.2e18               | %d               | 64                  |
| double | Double precision float data type. Are used to hold real numbers (More capacity than float) | `double d = 1.5;`                     | -1,7e308 - 1,7e308             | %lf              | 64                  |
| float  | Single precision float data type. Are used to hold real numbers                            | `float f = 1.5;`                      | -3.4e38 - 3.4e38               | %f               | 32                  |

## Modifier

| Type     | Explanation                                                                                                                                             | Example                 |
|----------|---------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------|
| signed   | Tells compiler that the data type can have minus values. Is default setting of every declared type                                                      | `signed int si = 10;`   |
| unsigned | Tells compiler that data type cannot have minus values. "Shifts" range to plus side for higher range in plus region (e.g.: char: -128 - 127 -> 0 - 255) | `unsigned int ui = 10;` |
| long     | Increases storage range of data type                                                                                                                    | `long int li = 10;`     |

## Ternary operator '?'

General: 
- `name = (expr1) ? (expr2) : (expr3);` equivalent
- `name = if (expr1) expr2; else (expr3);` equivalent
- `if (expr1) name=expr2; else name=expr3;` equivalent

## Pointer and address operator

- Pointer operator: *
- Address operator: &

Example 1:
```c
int i, j, k, *p, l;

i = 16;
j = 17;
k = 18;
l = 19;
p = &k;
```

|     |     | Address | Content |
|-----|-----|---------|---------|
| i   | int | 0xF010  | 16      |
| j   | int | 0xF00C  | 17      |
| k   | int | 0xF008  | 18      |
| p   | ptr | 0xF004  | 0xF008  |
| l   | int | 0xF000  | 19      |

```c
int v1, v2, *p1, *p2, *p3;

v1 = 17;
v2 = 18;
p1 = &v1;
p2 = p1;
*p2 = 19;     // v1 becomes 19
p3 = &(*p1);  // long-winded way of writing p3 = p1
v2 += *(&v1); // long winded way of writing v2 = v2 + v1;
```

## Arrays

An array is a series of indexed variables which is declared in C as: 

```
data-type name[Dimension];
```

- First in the series is denoted as: `name[0];`
- Last in the series is denoted as: `name[Dimension - 1];`

### Array Identifier

An array identifier (read: array name) is a constant pointer (i.e.: a pointer with a fixed value)

```c
char c, s[20], *p;

p = s;      // same as p = &s[0];
            // the address of the first element

p = &s[4];  // let p point to the 5th element
            // of array s

c = *s;     // same as c = s[0];

s = p;      // false. this is not allowed, because s is a
            // pointer value and its not possible to
            // change a value
```

## Example File

```c
#include <stdio.h>              // importing functionality or files

int main() {                    // declaration of main function
    printf("Hello World! \n");  // function call in stdio.h file
    return 0;                   // return value of main function
}
```
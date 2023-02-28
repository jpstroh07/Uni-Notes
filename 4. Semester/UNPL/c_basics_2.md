# C Basics 2

- [C Basics 2](#c-basics-2)
  - [One-Liner](#one-liner)
  - [Primitive Types](#primitive-types)
  - [Type Conversion](#type-conversion)
  - [The Cast Operator](#the-cast-operator)
  - [Global Variables](#global-variables)
  - [Local Variables](#local-variables)
  - [Local Static Variables](#local-static-variables)
  - [Program Arguments](#program-arguments)
  - [Typedefs](#typedefs)
  - [Bit Operation](#bit-operation)

## One-Liner

It is possible in C, to write the entire file into one single line. This can make sense for small programs, but it does reduce the readability of the program:

```C
// This program displays the time of compilation in the console in the HH:MM:SS format

main(_){_^448&&main(-~_);putchar(--_%64?32|-~7[__TIME__-_/8%8][">'txiZ^(~z?"-48]>>";;;====~$::199"[_*2&8|_/64]/(_&2?1:8)%8&1:10);}
```

## Primitive Types

| Data Type          | Memory (Bytes) | Range                           | Format Specifier |
|--------------------|----------------|---------------------------------|------------------|
| short int          | 2              | -32.768 to 32.767               | %hd              |
| unsigned short int | 2              | 0 to 65.535                     | %hu              |
| unsigned int       | 4              | 0 to 4.294.967.295              | %u               |
| int                | 4              | -2.147.483.648 to 2.147.483.647 | %d               |
| long int           | 4              | -2.147.483.648 to 2.147.483.647 | %ld              |
| unsigned long int  | 4              | 0 to 4.294.967.295              | %lu              |
| long long int      | 8              | -(2^63) to (2^63)-1             | %lld             |
| unsigned long      | 8              | 0 to 18.446.744.073.709.551.615 | %llu             |
| signed char        | 1              | -128 to 127                     | %c               |
| unsigned char      | 1              | 0 to 255                        | %c               |
| float              | 4              |                                 | %f               |
| double             | 8              |                                 | %lf              |
| long double        | 12             |                                 | %Lf              |

## Type Conversion

It is also possible to convert data types into other data types:

```C
short int i;
float f;
double d;

f = 1.4; // truncation from 'const double' to 'float'
d = f + 2;

// first f converts to double, 2 is an int which converts to double
// because d is a double, no additional conversion takes place
d = 3.4;

d += 69997.1; // d equals 70000.5
i = f + d;

// first f converts to double, the result 70001.5 is converted to
// an int 70001 (0x11171) and then to a short
// which means some of the bytes get lost, result i = 4465 (0x1171) 
```

## The Cast Operator

By means of "type casting" one can force a type cast. Use it to make casts compliant, and to prevent compiler warnings:

```C
f = (float) 1.4;              // C-style cast (might give runtime errors)
f = float (1.4);              // functional style cast
f = static_cast<float> (1.4); // static cast (might give compile time errors)
```

## Global Variables

Global variables are declared outside any block. These variables are accessible for all functions in the .c file. However, global variables can also cause serious errors:

```C
#include <stdio.h>

void foo(void);

int global = 16;

int main()
{
    foo();
    printf("Value of global (2): %d \n", global);
    return 0;
}

void foo(void)
{
    printf("Value of global (1): %d \n", global);
    global = 17;
}

```

## Local Variables

As a contrast, local variables are declared within a {...} block. Compared to the global variables, local variables have a limited lifetime and visibility, only exist in the block where they are declared and are also only in this block visible. Non-Static local variables are also called automatic variables:

```C
#include <stdio.h>

void foo(void)
{
    int local = 18;
    printf("Value of local (1): %d \n", local);
}

int main()
{
    int local = 19;
    foo();
    printf("Value of local (2): %d \n", local);
    return 0;
}
```

## Local Static Variables

An automatic variable exists at the beginning of the function and ceases to exist at the end. Their life span is equal to the function's lifetime. If the key word `static` is added, the variable continues to exist and keeps its value as well, even after leaving the function. The lifetime is now extended to that of the program, the visibility (scope) remains the same. The initialization of a static variable takes place when the function is called the first time:

```C
#include <stdio.h>

void foo(void)
{
    static int i = 1;
    printf("Value of i: %d \n", i);
    i++;
}

int main()
{
    foo(); foo(); foo();
    return 0;
}
```

## Program Arguments

Arguments can be passed in the command line, when a compiled .c file is called:

```C
#include <stdio.h>
int main(int argc, char* argv[])
{
    printf("Hello world! \n");
    int i = 0;

    while (i < argc)
    {
        printf("argument %d = %s \n", i, argv[i]),
        i++;
    }

    return 0;
}
```

## Typedefs

Typedefs are used to give a different name to a declaration, for example:

```C
typedef unsigned int UINT;
```

Then, in this case, an `unsigned int` can be declared like:

```C
UINT p;
```

This is used for easier refactoring. When a type needs to be changed, it can be easily changed at the beginning of the file, rather than going through the entire file and changing every single type.

## Bit Operation

C can also be used to perform bit operation:

```C
#include <stdio.h>
#include <stdlib.h>

typedef unsigned char uchar;

int main(int argc, char* argv[])
{
    uchar x = 55;  // 55 (dec) = 0x37 (hex) = 0011 0111 (bin)
    uchar y = 25;  // 25 (dec) = 0x19 (hex) = 0001 1001 (bin)
    uchar z;

    // bitwise operations and, or, xor, not
    z = x & y;  // result: 17  = 0x11 = 0001 0001 -> and
    z = x | y;  // result: 63  = 0x3f = 0011 1111 -> or
    z = x ^ y;  // result: 46  = 0x2e = 0010 1110 -> xor
    z = ~x;     // result: 200 = 0xc8 = 1100 1000 -> not

    uchar a = 0x19;    // equals 0001 1001 binary (25 decimal)
    uchar b = a << 2;  // equals 0110 0100 binary (100 decimal) -> left shift
    uchar c = b >> 1;  // equals 0011 0010 binary (50 decimal)  -> right shift

    return 0;
}
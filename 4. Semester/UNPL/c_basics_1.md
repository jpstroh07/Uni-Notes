# C Basics 1

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
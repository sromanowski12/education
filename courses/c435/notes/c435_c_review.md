## CSCI-C435 - OPERATING SYSTEMS
### C Programming Language - Topic Review

### Data Types

int: integer, a whole number.
float: floating point, a number with a fractional part.
double: double-precision floating point value.
char: single character.

The amount of storage required for each of these types varies by platform.
C has a built-in `sizeof` operator that gives the memory requirements for a particular data type.

```c
    printf("int: %ld \n", sizeof(int));
    printf("float: %ld \n", sizeof(float));
    printf("double: %ld \n", sizeof(double));
    printf("char: %ld \n", sizeof(char));
```
`printf` has two arguments:
The first is the output string with a format specifier (%ld), while the next argument returns the sizeof value. 
In the final output, the %ld (for long decimal) is replaced by the value in the second argument.


Also, notice the use of format specifiers for float (%f) and char (%c) output.

```c
int a, b;
    float salary = 56.23;
    char letter = 'Z';
    a = 8;
    b = 34;
    int c = a+b;

    printf("%d \n", c);
    printf("%f \n", salary);
    printf("%c \n", letter);
```

### Constants

#### Arrays
An array can be declared by specifying the type of elements it will contain, followed by the name of the array, and the size of the array in square brackets. For example, to declare an array of integers with a size of 5, you would write:
```c
int myArray[5];

/* You can also initialize the array with values at the time of declaration: */

int myArray[] = {1, 2, 3, 4, 5};
```
You can access and assign values to specific elements in the array using the array name and the index of the element in square brackets. For example, to assign the value 10 to the first element of the array:

```c
myArray[0] = 10;

/* You can also use a for loop to iterate through all the elements of an array. For example, to print all the elements of the array: */

for (int i = 0; i < 5; i++) {
    printf("%d ", myArray[i]);
}
```

#### For Loops

```c
#include <stdio.h>

int main() {
  printf("Hello World!");
  return 0;
}
```

#### While Loops

```c
while (condition) {
   // code to be executed
}
```

The condition is a boolean expression that is evaluated before each iteration of the loop. As long as the condition evaluates to true, the code inside the loop will be executed. Once the condition evaluates to false, the loop will exit and the program will continue with the next instruction after the loop.

Example:

```c
int i = 0;
while (i < 5) {
   printf("%d\n", i);
   i++;
}
```

```c
0
1
2
3
4
```
This is a basic example of how a while loop work in C.
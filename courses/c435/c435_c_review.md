## CSCI-C435 - OPERATING SYSTEMS
### C Programming Language - Topic Review

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
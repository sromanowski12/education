#include <stdio.h>
#define ARRAY_SIZE 10
int main ()
{
    int index, my_array[ARRAY_SIZE];
    for (index = 0; index < ARRAY_SIZE; index++)
    {
        my_array[index] = 0;
        printf ("my_array[%d] = %d\n", index, my_array[index]);
    }
    printf("\n");
    return 0;
}
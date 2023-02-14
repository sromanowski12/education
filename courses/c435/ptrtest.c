#include <stdio.h>

int main(){
    struct myints {
        int int1;
        int int2;
        int int3;
    } mystruct;

    struct myints *mysptr = &mystruct;

    int myvar = 12345;

    int *ptrToMyvar = &myvar;

    int **ptrToPtrToMyvar = &ptrToMyvar;
    
    int ***ptrToPtrToPtrToMyvar = &ptrToPtrToMyvar;

    /* Pointers to pointers to variable */
    printf("Myvar: %d\n",myvar);
    printf("&Myvar: %ld\n",&myvar);
    printf("MyPtr1: %d\n",*ptrToMyvar);
    printf("MyPtr1p: %ld\n",ptrToMyvar);
    printf("&MyPtr1p: %ld\n",&ptrToMyvar);
    printf("MyPtr2: %d\n",**ptrToPtrToMyvar);
    printf("MyPtr2p: %ld\n",ptrToPtrToMyvar);
    printf("&MyPtr2p: %ld\n",&ptrToPtrToMyvar);
    printf("MyPtr3: %d\n",***ptrToPtrToPtrToMyvar);
    printf("MyPtr3p: %ld\n",ptrToPtrToPtrToMyvar);
    printf("&MyPtr3p: %ld\n",&ptrToPtrToPtrToMyvar);
    printf("\n\n");

    /* Now structures and pointers */
    /* Initialize Structure Variables */
    mystruct.int1 = 101;
    mystruct.int2 = 102;
    mystruct.int3 = 103;

    printf("StructVars: %d,%d,%d\n\n",
    mystruct.int1,mystruct.int2,mystruct.int3);

    printf("Struct Element int2: %d\n",(*mysptr).int2);
    printf("Struct Element int2: %d\n",mysptr->int2);

    return 0;
}
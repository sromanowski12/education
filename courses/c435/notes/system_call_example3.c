// C++ Code to demonstrate getpid()
#include <stdio.h>
#include <unistd.h>


// Driver Code
int main()
{
	int pid = fork();
	if (pid == 0)
    {
        printf("\nCurrent process id of Process : \n");
		printf("%d",getpid());
        printf("\n");
        printf("\nCurrent process id of Child Process : \n");
        printf("%d",getppid());
        printf("\n");
    }
    return(0);
}

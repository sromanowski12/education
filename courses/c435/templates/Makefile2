# This Makefile contains three targets: "main", "clean", and the default target. The "main" target is the main executable that you want to build. The "main.
# c" file is specified as a dependency for this target, so it will be compiled whenever the "main" target is built.

# The "CC" variable defines the compiler to use (gcc in this case). The "CFLAGS" variable defines the flags to pass to the compiler, such as "-Wall" to  
# enable all warnings, "-Wextra" for extra warnings, and "-Werror" to treat warnings as errors.

# The "clean" target is used to clean up the generated files and is executed by running "make clean". This target removes the "main" executable file.

# By default, running "make" without any arguments will build the "main" target, since it is the first target in the Makefile. 

CC = cc
CFLAGS = -Wall -Wextra -Werror

main: main.c
	$(CC) $(CFLAGS) -o main main.c

clean:
	rm -f main

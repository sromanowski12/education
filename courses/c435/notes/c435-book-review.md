Figure 1-1
...


Figure 2-1. (a) Multiprogramming of four programs. (b) Conceptual model of
four independent, sequential processes. (c) Only one program is active at any
instant.
Figure 2-2. A process can be in running, blocked, or ready state. Transitions
between these states are as shown.

Figure 2-3. The lowest layer of a process-structured operating system handles
interrupts and scheduling. Above that layer are sequential processes.
Figure 2-4. Some of the fields of the MINIX 3 process table. The fields are distributed
over the kernel, the process manager, and the file system.
Figure 2-5. Skeleton of what the lowest level of the operating system does
when an interrupt occurs.




Figure 2-21 : A solution to the readers and writers problem
Figure 2-22 : Bursts of CPU usage alternate with periods of waiting for I/O. (a) A CPU-bound process. (b) An I/O-bound process.

Figure 2-24 : An example of shortest job first scheduling. (a) Running four jobs
in the original order. (b) Running them in shortest job first order.
Figure 2-29 : MINIX 3 is structured in four layers. Only processes in the bottom
layer may use privileged (kernel mode) instructions.



Figure 2-39. Interrupt processing hardware on a 32-bit Intel PC.
Figure 2-40. (a) How a hardware interrupt is processed. (b) How a system call
is made.

Figure 2-41. Restart is the common point reached after system startup, interrupts,
or system calls. The most deserving process (which may be and often is a
different process from the last one interrupted) runs next. Not shown in this diagram
are interrupts that occur while the kernel itself is running
Figure 2-42. Queueing of processes trying to send to process 0.
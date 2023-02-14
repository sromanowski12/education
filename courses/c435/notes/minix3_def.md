## usr/src/boot

## usr/include/
## usr/include/minix


## usr/src/kernel
### **debug.c**
### **debug.h**  
### **ipc.h**
### **interrupt.c**  
### **kernel.h**
### **main.c** 
#### Functions
- main()

```c
announce();				/* print MINIX startup banner */
/* Warnings for sanity checks that take time. These warnings are printed
 * so it's a clear warning no full release should be done with them
 * enabled.
 */
#if DEBUG_SCHED_CHECK
  FIXME("DEBUG_SCHED_CHECK enabled");
#endif
#if DEBUG_VMASSERT
  FIXME("DEBUG_VMASSERT enabled");
#endif
#if DEBUG_PROC_CHECK
  FIXME("PROC check enabled");
#endif
  restart();
```

- announce(): Display the MINIX startup banner.
- prepare_shutdown(): This function prepares to shutdown MINIX.
- shutdown(): This function is called from prepare_shutdown or stop_sequence to bring down MINIX. How to shutdown is in the argument: RBT_HALT (return to the monitor), RBT_MONITOR (execute given code), RBT_RESET (hard reset). 

### **proc.c** 
contains essentially all of the process and message handling. Together with "mpx.s" it forms the lowest layer of the MINIX kernel.
- There is one entry point from the outside:
**sys_call**: a system call, i.e., the kernel is trapped with an INT
- As well as several entry points used from the interrupt and task level: **lock_send**: send a message to a process

#### **Functions**
- mini_send(): Send a message from 'caller_ptr' to 'dst'. 
  - If 'dst' is blocked waiting for this message, copy the message to it and unblock 'dst'.
  - If 'dst' is not waiting at all, or is waiting for another source, queue 'caller_ptr'.

### **proc.h**
declaration of the process table
- contains all process data, including registers, flags, scheduling priority, memory map, accounting, message passing (IPC) information, and so on.
- Many assembly code routines reference fields in it. 
  - The offsets to these fields are defined in the assembler include file **sconst.h**. 
  - When changing struct proc, be sure to change **sconst.h** to match.

## **start.c**
First C file used by the kernel. 
## **table.c**

## usr/src/include
## usr/src/include/minix
## usr/src/servers
## usr/src/tools

## kernel
Kernel is central component of an operating system that manages operations of computer and hardware. It basically manages operations of memory and CPU time. It is core component of an operating system. Kernel acts as a bridge between applications and data processing performed at hardware level using inter-process communication and system calls. 

Kernel loads first into memory when an operating system is loaded and remains into memory until operating system is shut down again. It is responsible for various tasks such as disk management, task management, and memory management. 

 Kernel has a process table that keeps track of all active processes
• Process table contains a per process region table whose entry points to entries in region table.

 Kernel loads an executable file into memory during ‘exec’ system call’.

It decides which process should be allocated to processor to execute and which process should be kept in main memory to execute. It basically acts as an interface between user applications and hardware. The major aim of kernel is to manage communication between software i.e. user-level applications and hardware i.e., CPU and disk memory. 

**Objectives of Kernel**: 
To establish communication between user level application and hardware. 
To decide state of incoming processes.  
To control disk management.  
To control memory management. 
To control task management. 

**Types of Kernel:**
1. Monolithic Kernel
It is one of types of kernel where all operating system services operate in kernel space. It has dependencies between systems components. It has huge lines of code which is complex. 

Example: 
Unix, Linux, Open VMS, XTS-400 etc. 
Advantage:
It has good performance.  

Disadvantage: 
It has dependencies between system component and lines of code in millions. 

2. Micro Kernel
It is kernel types which has minimalist approach. It has virtual memory and thread scheduling. It is more stable with less services in kernel space. It puts rest in user space. 

Example : 
Mach, L4, AmigaOS, Minix, K42 etc.
 
Advantage : 
It is more stable. 
 
Disadvantage : 
There are lots of system calls and context switches. 

3. Hybrid Kernel
It is the combination of both monolithic kernel and microkernel. It has speed and design of monolithic kernel and modularity and stability of microkernel. 

Example : 
Windows NT, Netware, BeOS etc.
 
Advantage : 
It combines both monolithic kernel and microkernel. 
 
Disadvantage : 
It is still similar to monolithic kernel. 

4. Exo Kernel
It is the type of kernel which follows end-to-end principle. It has fewest hardware abstractions as possible. It allocates physical resources to applications. 

Example : 

Nemesis, ExOS etc.
 
Advantage : 
It has fewest hardware abstractions. 
 
Disadvantage : 
There is more work for application developers. 

5. Nano Kernel
It is the type of kernel that offers hardware abstraction but without system services. Micro Kernel also does not have system services therefore the Micro Kernel and Nano Kernel have become analogous. 

Example : 
EROS etc.

Advantage : 
It offers hardware abstractions without system services. 

Disadvantage : 
It is quite same as Micro kernel hence it is less used. 


## Process Management
## Memory Management




## Adding a floppy image file to VirualBox
Here are the steps to add a floppy image file to VirtualBox:

Start VirtualBox and select the virtual machine to which you want to add the floppy image.
Click on the "Storage" section in the virtual machine's settings.
Click on the floppy controller in the Storage Tree to add a new floppy device.
Click the Add Floppy icon to add a new floppy device.
Select "Add Floppy Image" from the menu and browse to the location of the floppy image file.
Select the floppy image file and click the "Open" button.
Click "OK" to save the changes and close the virtual machine's settings.
After following these steps, the floppy image file will be available to the virtual machine as a floppy disk. You can access it from within the virtual machine just as you would access a physical floppy disk.

Note that VirtualBox supports a variety of floppy image formats, including .img, .vfd, and .iso. You may need to convert your floppy image file to one of these formats in order to use it in VirtualBox.


## "proc pointer"
In MINIX, the "proc pointer" is a pointer to a structure that represents a process. The process structure, "struct proc", is defined in the file "proc.h" and contains information such as the process ID, state, priority, and memory maps. The proc pointer is used to access information about the currently running process and to update its state.

In the MINIX kernel, **the proc pointer is used to access the process structure of the currently running process**. The proc pointer is updated by the scheduler whenever a new process is selected to run. The process structure is used to store information about the process, such as its state, priority, and memory maps.

The proc pointer is used in various parts of the MINIX kernel to access information about the currently running process and to update its state. For example, the scheduler uses the proc pointer to update the state of the process to "running" when it is selected to run, and to "ready" when it is ready to run again. The proc pointer is also used by the memory management subsystem to access the memory maps of the process, and by the system call interface to access information about the process making the system call.

## kernel - get process

In MINIX, the kernel gets a process by selecting the next process to run from the process queue using the scheduling algorithm. The scheduling algorithm determines which process should be assigned to the CPU next based on factors such as priority, time slice, and process state.

The process selection is done by the scheduler in the MINIX kernel, which is implemented in the file "proc.c" in the kernel source code. The main function that implements the scheduling is the "schedule()" function, which is called whenever the scheduler needs to select a new process to run.

In C, the scheduler uses functions such as "next_proc()" to select the next process to run from the process queue. This function examines the state of each process in the queue and selects the one with the highest priority or the next process in the round-robin scheduling algorithm. The selected process is then returned to the calling function for execution.

Once a process has been selected, the kernel sets its state to "running" and allocates the CPU to it. The process is then executed until it terminates, blocks on I/O, or yields the CPU voluntarily. At that point, the scheduler is called again to select the next process to run.

## call processes for kernel in c

In MINIX, the kernel schedules processes using a round-robin scheduling algorithm. When a process is scheduled, it is assigned to the CPU and executed. The scheduling decision is made by the kernel's scheduler, which is responsible for selecting the next process to run and allocating CPU time to it. The scheduler uses a data structure, usually a queue, to keep track of all the processes in the system and their states (e.g. running, ready, blocked, etc.). When a process terminates or blocks on I/O, the scheduler selects the next process in the queue to run.

The scheduling algorithm in MINIX is implemented in the file "proc.c" in the kernel source code. The main function that implements the scheduling is the "schedule()" function, which is called whenever the scheduler needs to select a new process to run. The function updates the process state and queue and selects the next process to run based on the priority and other scheduling parameters.

In C, the scheduling is done using function calls, conditional statements, and data structures such as queues and linked lists. The scheduler uses functions such as "enqueue()" to add processes to the queue, "dequeue()" to remove processes from the queue, and "next_proc()" to select the next process to run based on the scheduling algorithm. The scheduling decision is also influenced by the current state of the processes, which can be updated using functions such as "set_timer()" and "unset_timer()".

## function keys in minix source code
To locate the function keys in MINIX source code, you can use the search functionality of your text editor or a code search tool. The function keys in MINIX are typically implemented as macros or functions in the source code.

You can search for the function keys by searching for the key names or the corresponding function calls in the source code. For example, you can search for the function that implements the "F1" key by searching for "f1_func()" or "handle_f1()". Similarly, you can search for the function that implements the "F2" key by searching for "f2_func()" or "handle_f2()".

It's worth noting that the specific names and implementations of the function keys may vary depending on the version of MINIX you're using. In some cases, the function keys may be implemented in the system's console driver, while in others they may be implemented in the system's terminal emulator. To find the specific implementation, you may need to search through the source code of the relevant components, such as the "console.c" or "term.c" files.

In summary, to locate the function keys in MINIX source code, you can use a text editor or code search tool to search for the key names or corresponding function calls in the source code. The specific names and implementations may vary, so you may need to search through multiple files to find the relevant code.


## kernel - debug, function

Minix, as an operating system, implements a text-based user interface that relies on text mode display to provide feedback and receive inputs from users. When a function key is pressed, Minix can respond by updating the screen with information that corresponds to the function of the key.

For example, when the user presses the F1 key, Minix might display a help screen that provides information on the available commands and their usage. When the F2 key is pressed, Minix might display information about the system status, such as the memory usage or CPU utilization.

The way Minix updates the screen and displays information when a function key is pressed depends on the implementation of the operating system. Minix uses system calls to access the video display hardware and update the screen with new information. The specific system calls used, and the way they are used, will vary depending on the architecture and implementation of Minix.

In general, Minix displays information in the kernel when a function key is pressed by writing to the text-mode video buffer and updating the screen with the new information. The exact details of how this is done will depend on the specific implementation of Minix and the architecture it is running on.****
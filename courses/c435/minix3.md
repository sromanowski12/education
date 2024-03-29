## Include directory 
03400 include/minix/sysutil.h
00000 include/ansi.h
The <ansi.h> header attempts to decide whether the compiler has enough
conformance to Standard C for Minix to take advantage of. If so, the
symbol _ANSI is defined (as 31459). Otherwise _ANSI is not defined
here, but it may be defined by applications that want to bend the rules.
The magic number in the definition is to inhibit unnecessary bending
of the rules. (For consistency with the new ’#ifdef _ANSI" tests in
the headers, _ANSI should really be defined as nothing, but that would
break many library routines that use "#if _ANSI".)

If _ANSI ends up being defined, a macro

PROTOTYPE(function, params)

is defined. This macro expands in different ways, generating either
ANSI Standard C prototypes or old-style K&R (Kernighan & Ritchie)
prototypes, as needed. Finally, some programs use _CONST, _VOIDSTAR etc
in such a way that they are portable over both ANSI and K&R compilers.
The appropriate macros are defined here.

02800 include/minix/type.h
00200 include/errno.h 
The <errno.h> header defines the numbers of the various errors that can
00201 * occur during program execution. They are visible to user programs and
00202 * should be small positive integers. However, they are also used within
00203 * MINIX, where they must be negative. For example, the READ system call is
00204 * executed internally by calling do_read(). This function returns either a
00205 * (negative) error number or a (positive) number of bytes actually read.
00206 *
00207 * To solve the problem of having the error numbers be negative inside the
00208 * the system and positive outside, the following mechanism is used. All the
00209 * definitions are are the form:
00210 *
00211 * #define EPERM (_SIGN 1)
00212 *
00213 * If the macro _SYSTEM is defined, then _SIGN is set to "-", otherwise it is
00214 * set to "". Thus when compiling the operating system, the macro _SYSTEM
00215 * will be defined, setting EPERM to (- 1), whereas when when this
00216 * file is included in an ordinary user program, EPERM has the value ( 1)

01800 include/sys/dir.h
00900 include/fcntl.h 
02100 include/sys/iocdisk.h
00100 include/limits.h 
The <limits.h> header defines some basic sizes, both of the language types
(e.g., the number of bits in an integer), and of the operating system (eg.
the number of characters in a file name.

02000 include/sys/ioctl.h
00700 include/signal.h 
01600 include/sys/sigcontext.h
00600 include/string.h 
01700 include/sys/stat.h
01000 include/termios.h 
01400 include/sys/types.h
01300 include/timers.h 
01900 include/sys/wait.h
00400 include/unistd.h
04400 include/ibm/interrupt.h 
04300 include/ibm/portio.h 
04500 include/ibm/ports.h 
03500 include/minix/callnr.h 
03600 include/minix/com.h 
02300 include/minix/config.h 
02600 include/minix/const.h 
04100 include/minix/devio.h 
04200 include/minix/dmap.h 
02200 include/minix/ioctl.h 
03000 include/minix/ipc.h 
02500 include/minix/sysconfig.h 
03200 include/minix/syslib.h 

## Drivers
10800 drivers/drivers.h
12100 drivers/atwini/atwini.c
12000 drivers/atwini/atwini.h
11000 drivers/libdriver/driver.c
10800 drivers/libdriver/driver.h
11400 drivers/libdriver/drvlib.c
10900 drivers/libdriver/drvlib.h
11600 drivers/memory/memory.c
15900 drivers/tty/console.c
15200 drivers/tty/keyboard.c
13600 drivers/tty/tty.c
13400 drivers/tty/tty.h

## Kernel
10400 kernel/clock.c  
04700 kernel/config.h 
04800 kernel/const.h 
08000 kernel/exception.c 
05300 kernel/glo.h 
08100 kernel/i8259.c 
05400 kernel/ipc.h 
04600 kernel/kernel.h 
08700 kernel/klib.s 
08800 kernel/klib386.s 
07100 kernel/main.c 
06200 kernel/mpx.s 
06300 kernel/mpx386.s 
05700 kernel/priv.h 
07400 kernel/proc.c 
05500 kernel/proc.h 
08300 kernel/protect.c 
05800 kernel/protect.h 
05100 kernel/proto.h 
05600 kernel/sconst.h 
06900 kernel/start.c
09700 kernel/system.c 
09600 kernel/system.h 
10300 kernel/system/doexec.c
10200 kernel/system/dosetalarm.c 
06000 kernel/table.c 
04900 kernel/type.h 
09400 kernel/utility.c 

## File System 
22900 servers/fs/inode.c
21900 servers/fs/inode.h
27000 servers/fs/link.c
23800 servers/fs/lock.c
21800 servers/fs/lock.h
24000 servers/fs/main.c
26700 servers/fs/mount.c
24500 servers/fs/open.c
22000 servers/fs/param.h
26300 servers/fs/path.c
25900 servers/fs/pipe.c
27800 servers/fs/protect.c
21200 servers/fs/proto.h
25000 servers/fs/read.c
27500 servers/fs/stadir.c
23300 servers/fs/super.c
22100 servers/fs/super.h
22200 servers/fs/table.c
28800 servers/fs/time.c
21100 servers/fs/type.h
25600 servers/fs/write.c
21600 servers/fs/buf.h 
22400 servers/fs/cache.c 
21000 servers/fs/const.h 
28300 servers/fs/device.c 
28100 servers/fs/dmap.c
21700 servers/fs/file.h 
23700 servers/fs/filedes.c 
21500 servers/fs/fproc.h 
20900 servers/fs/fs.h 
21400 servers/fs/glo.h

## Process manager
19300 servers/pm/break.c
17100 servers/pm/const.h
18700 servers/pm/exec.c
18400 servers/pm/forkexit.c
20400 servers/pm/getset.c
17500 servers/pm/glo.h
18000 servers/pm/main.c
20500 servers/pm/misc.c
17600 servers/pm/mproc.h
17700 servers/pm/param.h
17000 servers/pm/pm.h
17300 servers/pm/proto.h
19500 servers/pm/signal.c
17800 servers/pm/table.c
20300 servers/pm/time.c
20200 servers/pm/timers.c
17200 servers/pm/type.h

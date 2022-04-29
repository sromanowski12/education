Ch. 3 - Names, Scopes, & Bindings

Name: a character string used to represent something else
- To refer to data using symbolic identifiers rather than addresses
- Most name are identifiers
- Symbols like '+' can also be names (i.e. Racket)

Binding: an association between two things such as a name, & the entity (function, variable, etc.) it names

Scope: (of a binding) is the part of the program (textually) in which the binding is active

Binding Time: 
- The time at which a binding is created
- Or more generally, the time at which any implementation decision is made

Time at which implementation decisions may be made:
- Language design time
- Language implementation time
- Program writing time
- Compile time
- Link time
- Load time
- Runtime

Binding Time
- Static (Lexical) Binding: things bound before runtime (typically at compile time)
- Dynamic Binding: things bound at runtime
- Early vs. Late Binding
  - In general, early binding times are associated with greater efficiency
  - Later binding times are associated with greater flexibility
  - Compiled languages tend to have early binding times
  - Interpreted languages tend to have later binding times

Lifetime of Binding & Objects
- Binding Lifetime: time period from creation to destruction of binding
- Object Lifetime: time period from creation to destruction of an object
- If object outlives binding it's garbage
- If binding outlives object it's a dangling reference

Storage Allocation of Objects
- Static Objects:
  - Have absolute address that is retained throughout the program's execution
  - Ex. Global or static local variables, numeric and string literals, code
- Stack Objects:
  - Allocated and deallocated in last-in, first-out order
  - Usually in conjunction with subroutine calls and returns
- Heap Objects:
  - May be allocated and deallocated at arbitrary times
  - Require a more general and expensive storage management

Stack-Based Allocation
- Why a stack?
  - Allocate space for recursive routines
  - Reuse space
- Contents of a stack frame (or activation record)
  - Arguments and local variables
  - Return address
  - Temporaries
  - Bookkeeping (saved registers, line number static link, etc.)
- Each stack frame is allocated for each subroutine
Heap Management Algorithms

Scope Rules
- Scope of a Binding:
- Scope:

On subroutine entry:
On subroutine exit:

Static (Lexical) Scope Rules
Static Scope Rules: Example

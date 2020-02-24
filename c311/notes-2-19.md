## **Notes 2/19/2020**

**Symbols**
- has 4 attributes (cells):
  - print name - to e called by *symbol-name*, its name for printing
  - value cell - called by _symbol-value_, contains it's value as a variable
  - function cell - called by _symbol-function_
  - property list cell - called by _symbol-plist_

```lisp
; Symbols
(defun January ()
  (princ "its a new year"))

(defvar January 31 "it's a month")
January
31
(symbol-plist 'January)
(variable-documentation "it's a month")

(variable-documentation "it's a month")
```

**Interned Symbols**
- list (vector) of symbols called *obarray*
- *make-symbol* creates a new *uninterned* symbol
  - symbols created this way are not stored in the table


Examples of Symbols
- dog
  - Symbol Name
  - Symbol Value
- goat
- 4

```lisp
(setq a 'a) ; a
(setq b (make-symbol "a")) ; a
; "a" is a reference to a new uninterned symbol & not stored in obarray
; - symbol-value = "a"

(eq a b) ; nil
(eq b 'a) ; nil
(eq a 'a) ; t
(symbol-name b) ; "a"
(eq a (intern "a")) ; t
```

```lisp
; HW6 Review
(setq week '(monday tuesday))
(monday tuesday)

(random 7)
1

(elt week 1)
tuesday

(symbol-name 'tuesday)
"tuesday"

(capitalize (symbol-name 'tuesday))
"Tuesday"
```

**Ex. 2 First-fit, best-fit**
- Write two Lisp unctions inspired from memory allocation methods.
- Both function take two parameters

```lisp
; L = (10 19 7 12 18 25)
; best-fit 5 L --> 7
; best-fit 13 L --> 18
; - best-fit - returns the smallest of the potential options
; first-fit 5 L --> 10
; first-fit 13 L --> 19

; if a number is larger than what is available then return nil
```

**Ex. 3 (Optional, 3 extra credit points)**
- function called *calendar*
  - takes two parameters: the day of the week and the number of days in the month

**Linux - use cal**

**Example**
(calendar 2 30)
the result should be
S  M  T  W  T  F  S
      1  2  3  4  5
6  7  8  9  10 11 12
13 14 15 16 17 18 19
20 21 22 23 24 25 26
27 28 29 30

### **Dynamic Binding**

- the meaning of the identifier is determined at runtime based on the context of the instruction executed
- Example in Lisp: function A makes reference to a "global" variable x
- Function B declares a local variable x and then calls function A
- Within that function call, x is the local variable from B

### **Binding Time**

- **Language Design**: fundamental aspects of the language, built-in functions, keywords
- **Language Implementation**: details such as the size of each type, file representation, runtime exceptions
- **Programming**: algorithms, design of data structures
- **Compilation**: mapping between higher-level constructs and machine code, static data
- **Linking**: between function calls and external entities and their actual code
- **Load**: virtual addresses, dynamic libraries
- **Runtime**: virtual functions, values to variables...

### **Object Lifetime**

- **Object**: any entity in the program. Variables, functions.
- **Object Lifetime**: the time span between the object creation and destruction
- **Binding Lifetime**: the time span between the creation and destruction of the binding
- **Dangling Reference**: when the binding exists after the destruction of the object.
  - Ex. deleting a pointer but not making it NULL
- **Leak Memory**: when an object still exists but there is no binding to it.
  - Ex. making a pointer NULL without deleting it first
    - *Solved by garbage collection*

### **Object Allocation**

- **Static Objects** - they have an absolute address that exists for the duration of the program
  - Global variables, static local variables, runtime tables, function space for languages that don't support recursion, constants
- **Stack Objects** - Last In, First Out (LIFO). Function space for languages that support recursion
- **Heap Objects** - can be allocated an de-allocated at arbitrary times. Dynamically allocated parts of linked data structures, dynamically resized objects
  - **Heap**: linked lists where the nodes can be of different sizes (of memory)


### **Function Space**

- The stack of function calls contains a *frame* for each function
- One frame contains:
  - arguments, return values
  - local variables, elaboration-time constants
    - ex. x = 2*y
      - 2 is a constants
  - temporaries: intermediate values produced in complex computations
  - bookeeping information: return address, reference to the calling frame, debugging information

```lisp
(defun A (x) (* x x))
(defun B (x y) (setq y (A x)))
(defun C (n)
  (if (= n 1) (B n 3)
    (C (- n 1))))
```

### **Heap Management**

- There is usually a linked list - *free list* of all the meory blocks not in use
- When an allocation demand is made, the program searches the heap for a free block of at least the requested size
- **First Fit** - returning the first block that fits the requested size
- **Best Fit** - returning the smallest block that fits the request
- **Worst Fit** - the largest block, to avoid fragmenting the memory
- **Pool** - dividing the list into sublists by size
- **Compact** - moving te allocating heaps closer together to create larger free blocks. When moving an object one needs to update all the references to it.

### **Scope & Rules**

- **Scope of binding**: the textual region of the program in which a binding is active
- **Scope**: sometimes a region of a program of maximal size in which no binding changes scope
- **Referencing Environment**the set of active bindings at any given point in the program execution
- The scope of bindings is determined by *binding rules*, included in the description of the language

### **Scope of a Binding**

- Usually the scope of a binding is determined statically, meaning at compilation time
- When a function is called that has a local variable, the binding between the variable name and the instance of the variable local to the call is created
- Any previous bindings for that same variable name are deactivated in the process (or hidden)
- When the function call ends, the previous binding for the name is restored

### **Static Scope**

- **Static Scope**
  - Sometimes called *lexical scope*
- **Current Binding**
- **Global Scope**
- **Local Static Scope**: for languages that do not support recursion and for static variables in other

### **Nested Declarations**

```lisp
(let ((A 1))
  (let ((A 2) (B A)) B)
```

- In Lisp the variables in a let are declared in parallel. In the above expression B is equal to 1


Ex. **Dynamic Scope**
```lisp
(defvar y 3)     ; y is a global

(defun f (x)
  (+ x y))   ; we think f uses the global y
(f 10) ; => 13

(defun g ()
  (let ((y 4) (a 1))
    (f a)))
(g) ; => 5   ; think again
```

### **Scope Implementation**

- Static scope relies on a symbol table which is amap or dictionary.
- Dynamic scope uses an association list or a cental reference table.
- For dynamic scoping, it is a list of symbols (name) associated with the scope (value)


### **Associative Lists**

```lisp
(setq flowers '((rose . red) (lily . white) (iris . purple)))

(assoc 'lily flowers) ; (lily . white)
(rassoc 'purple flowers) ; (iris . purple)

```

- *assq*, *rassq*  - same as *assoc* and *rassoc* but use *eq* instead of *equal*
- **copy-alist** - a 2-level deep copy of the list
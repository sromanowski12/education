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

- **Static Objects**
- **Stack Objects**
- **Heap Objects**
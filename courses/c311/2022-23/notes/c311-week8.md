# C311 Overview

---
## Week 1 - Introduction to Racket
### Reading:
### Notes:

---

## Week 2 - Racket: Basics
### Reading:
**Racket Guide:**
- 2.1
- 2.2.1 - 2.2.3
- 2.2.5
  
### Notes:
Simple Values, Strings
- Byte?
- Bytes-ref
- Make-bytes
Identifiers in Racket
Conditionals: if, and, or, cond, & Nested Lists

Conditional: if
Conditional: Nested if

And
- Syntax
- `( and ‹expr›* )`
  
Or
- Syntax
`( or ‹expr›* )`

Cond
- Syntax
`( cond {[ ‹expr› ‹expr›* ]}* )`


---
## Week 3 - Racket: Functions
### Reading:
Tutorial (Quick):
- Part 6
  
Racket Guide:
- 2.2.4
- 2.2.6
- 2.2.7
- 4.4
- 4.4.2

### Notes:  
#### General Function Calls
The 1st expression in a function call doesn’t need to be an identifier for function name, but any expression that evaluates to a function value

Syntactically, the 1st expression in a function call could be a number

But that leads to an error, since a number is not a function.

```scheme
(define (double v)
    ((if (string? v) string-append +) v v))

> (double "mnah")
"mnahmnah"
> (double 5)
10
```
#### Anonymous `lambda` Function
It would be tedious if you had to name all of your functions.

When calling a function that accepts a function argument, the argument function often isn’t needed anywhere else.

Having to write down the function via define would be a hassle, because you have to make up a name and find a place to put the function definition

Instead, can use `lambda`, which creates an anonymous function

Evaluating a `lambda` form by itself produces a function:



Use of `lambda` as a result for a function that generates functions:

A lambda form can also accept zero or more than one arguments

Optional Arguments in `lambda` Form
[arg-id default-expr] 

---
## Week 4 - Racket: Scope & Binding
### Reading:
Racket Guide w/ pics:
- Part 5
- Part 7
Racket Guide:
- 2.2.8
- 4.6.3
- 4.9

### Notes:
Local Binding w/ define
Local Binding w/ let
Local Binding w/ let*
Local Binding w/ letrec
Lexical Scope (Static Scope)
Lexical Scope: Global Definitions
Assignment: set!

---
## Week 5 - Racket: Lists, Iteration, Recursion
### Reading:
Racket Guide w/ pics:
- Part 8
Racket Guide:
- 2.3

### Notes:
#### Functions
**The `list` Function**
**The `map` Function**
```rkt
(define (rainbow p)
    (map (lambda (color)
        (colorize p color))
        (list "red" "orange")))

> (rainbow (square 5))
```
**The `apply` Function**

Predefined Functions - Operating on Lists
* `length`
* `list-ref`
* `append`
* `reverse`
* `member`

Predefined List Loops
`andmap`, `ormap`

Iterative Functions:
`filter`, `foldl`

List Primitives: 
`first`, `rest`

List Primitives: 
`cons`, `empty`, `cons?`, `empty?`


The list Function
The map Function
The apply Function
Predefined Functions Operating on Lists
- Length
- List-ref
- Append
- Reverse
- Member
Redefined List Loops
- Map, Andmap, ormap
Iterative Functions: foldl, filter
List Primitives: first, rest
List Primitives: cons, and empty
List Primitives: cons?, empty?
List Iteration from Scratch: Recursion
- My-length recursive function
- My-map recursive function
Tail-Recursion Evaluation
 Tail-Call Optimization

---
## Week 6 - Exam Week

---
## Week 7 - Racket: Pairs, Nested Lists, Vectors
### Reading:
Racket Guide:
- 2.4
- 3.9
Racket Ref.
- 4.12
### Notes:
Creating Pairs Using the cons Function
Functions pair?, car, cdr
The Use of Non-List Pairs
Nested Lists and the quote Form
The quote Form vs. list
Symbols vs. Strings
Quoting Pairs and Symbols w/ quote
Vectors
Vectors as Expressions
The Vector Form vs. #
Using Vector Functions

---
## Week 8 - Racket: struct
### Reading:
Racket Guide:
Part 5

### Notes:
Simple Structure Type: `struct`
`(struct struct‐id (field‐id ...))`

Reflective Operations and Accessors of Structure Types
•Given a definition of `struct`
`(struct struct‐id (field‐id ...))`

struct‐id? is a predicate function that takes a single argument and 
returns #t if it is an instance of the structure type, #f otherwise.
struct‐id‐field‐id, for each field‐id, is an accessor that extracts the 
value of the corresponding field from an instance of the structure typ

Copy and Update Structure Instances
•The struct‐copy form clones a structure and optionally updates 
specified fields in the clone.

`(struct‐copy struct‐id struct‐expr [field‐id expr] ...)`

struct‐id must be a structure type name bound by struct
struct‐expr must produce an instance of the structure type.
The result is a new instance of the structure type that is like the old one, 
except that each field‐id gets the value of the corresponding expr.


**Structure Subtypes (kind of inheritance)**
•Structure subtype is a structure type that extends an existing one
A structure subtype inherits the fields of its supertype
•Use an extended form of struct to define a structure subtype
`(struct struct‐id super‐id (field‐id ...))`
super‐id must be a structure type name bound by struct


**Opaque vs. Transparent Structure Types**
•Structure types by default are opaque (i.e., private)
Their instances prints won’t show any information about the fields’ values
Their accessors and mutators of a structure type are kept private to a module 
•To make a structure type transparent, add the #:transparent
keyword after the field‐name sequence

**Transparent Structure Instances Comparisons**
•For a transparent structure type, the equal? function returns true iff
both instances have the same field values.

**Opaque Structure Instances Comparisons**
•For opaque structure type, the equal? function returns true iff both 
instances have the same identify.

**Mutable Fields**
•By default, all fields in a structure type are immutable
•To make a field mutable, add keyword #:mutable to that field in the 
structure type definition
`(struct date ([month #:mutable] [day #:mutable] year))`
•To make all fields of the structure to be mutable, add #:mutable 
after the field‐name sequence
`(struct date (month day year) #:mutable)`
`(struct point (x y) #:mutable #transparent)`

**Mutators**
•For each mutable field, Racket automatically generates a mutator:
Whose name is of the form set‐struct‐id‐field‐id!
It sets the value of field‐id in an instance of the struct‐id structure.
11

**Automatic Fields**
•An automatic field is indicated by the #:auto field option
Use  #:auto‐value option to specify a value to be used for ALL auto fields



**Constructor Guard**
•A constructor guard is a procedure to be called whenever an instance 
of the structure type is created.
It provides a mechanism to validate the field values
•A constructor guard is created with the keyword #:guard
The guard takes as many arguments as non‐auto fields in the structure type, 
plus one more for the name of the instantiated type.
It must return the same number of values as given, minus the name argument




**Compilation Overview**

**Phases of Compilation**

Scanning (Lexical Analysis)
Scanning (Lexical Analysis): Example - 
GCD Program in C

Scanning (Lexical Analysis): Example - 
Tokens of the GCD Program

Parsing (Syntax Analysis)
Parsing (Syntax Analysis): Example - 
A partial Context-Free Grammar Defining `while` loop in C

GCD Program Parse Tree

Semantic Analysis
Semantic Analysis Tool: Symbol Table

Static Semantic vs.
Dynamic Semantic


Semantic Analysis Output: Syntax Tree

Intermediate Form

Target Code Generation

Code Improvement (Optimization)


| Team   | # of Students | Project Assigned                    | Presentation Schedule |
|--------|---------------|-------------------------------------|-----------------------|
| Team 1 | 4             | Drawing a Zoo                       | Week 14               |
| Team 2 | 4             | Drawing a Zoo                       | Week 14               |
| Team 3 | 3             | Dynamic Programming for Rod-Cutting | Week 14               |
| Team 4 | 4             | Drawing a City                      | Week 15               |
| Team 5 | 3             | Building a Simple Blog              | Week 15               |
| Team 6 | 3             | Building a Simple Blog              | Week 15               |
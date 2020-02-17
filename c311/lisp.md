- [**_Lisp_**](#lisp)
  - [**Variables**](#variables)
  - [**Conditionals**](#conditionals)
  - [**Functions**](#functions)
  - [**Equality Predicates**](#equality-predicates)
  - [**Input**](#input)
  - [**Output**](#output)
  - [**Loops**](#loops)
- [**Lists**](#lists)
  - [**Atoms, Pairs, Lists**](#atoms-pairs-lists)
  - [**Mutator Functions**](#mutator-functions)
  - [**Associative Lists**](#associative-lists)
  - [**Symbols**](#symbols)
- [**Classes of Objects**](#classes-of-objects)
  - [**First Class Objects**](#first-class-objects)
  - [**Second Class Objects**](#second-class-objects)
  - [**Third Class Objects**](#third-class-objects)
  - [**First Class Functions**](#first-class-functions)
  - [**Higher-Order Functions**](#higher-order-functions)
  - [**Lambda Expressions**](#lambda-expressions)
  - [**Map**](#map)
  - [**Dynamic Lambda**](#dynamic-lambda)
  - [**Function Indirection**](#function-indirection)

## **_Lisp_**

### **Variables**

**Local Variables**
**let**
**defvar**

**Global Variables**
**setq**

### **Conditionals**

```lisp
(if condition
    expression-if-true
    expressions-if-false)
```

### **Functions**

**Defining Functions**

```lisp
(defun name (arg1 arg2 ...)
    "function description"
    sequence of expressions)
```

Ex.

```lisp
(defun fib (n)
  "Return the nth Fibonacci number."
  (if (< n 2)
      n
      (+ (fib (- n 1))
         (fib (- n 2)))))
```

**Anonymous Functions**

```lisp
(funcall #'fib 30)
```

### **Equality Predicates**

**=** - tests if two numbers are equal

- Returns an error if one of the arguments is not a number
  **eq** - test if the two arguments are identical objects in the memory
  **equal** - tests if the two arguments have similar content
- If the objects are containers (lists, arrays), it compares the size and the corresponding elements

**Examples**

```lisp
(setq L '(1 2 3 4))
;(1 2 3 4)
(setq M '(1 2 3 4))
;(1 2 3 4)
(eq L M) ;nil
(equal L M) ;t
(setq M L)
;(1 2 3 4)
(eq L M) ;t

(eq '(1 2 3) '(1 2 3))
;nil
(eq "hello world" "hello world")
;nil
(eq 1 1) ;t
(eq 1 1) ;t
(eq 'L 'L) ;t
(setq M 'L) ;L
(eq 'L M) ;t

```

### **Input**

**read**

### **Output**

**prin1**
**princ**
**print**

### **Loops**

**dolist**
**dotimes**

**while**
```lisp
(defun count_div (x)
  (let ((count 0) (i 1))
    (while (<= i x)
      (if (eq (% x i) 0)
          (setq count (1+ count)))
      (setq i (1+ i)))
    count))
```

## **Lists**

**car** - 'Contents of the Address part of the Register

```lisp
(car L) ;
```

**cdr** - 'Contents of the Decrement part of the Register

```lisp
(cdr L) ;
```

**cadr** - 'Contents of the Address part of the Register

**list**
**length**

```lisp
(length L) ;
```

### **Atoms, Pairs, Lists**

Ex.
```lisp
(cons 2 3)
(2 . 3)

'(a . ())
(a)

(cons 'a ())
(a)

(cons 'a (cons 'b (cons 'c ())))
(a b c)

(cons 1 (cons 2 (cons 3 ())))
(1 2 3)
```

**Create a list from several elements**

**Creating a list of copies of objects**

**Add to front/back of the list**

```lisp
(setq L (cons value L))
(setq L (append L (list value)))
```

**Function to Find Last Element**

```lisp
(defun last (L)
  "The last element in a list"
  (if (not L)
      nil
    (if (not (cdr L))
        (car L)
      (last (cdr L)))))
```

### **Mutator Functions**

```lisp
(defun set3rd (L val)
  (let ((M L))
    (setq M (cdr M))
    (setq M (cdr M))
    (setcar M val)
    L))
```

### **Associative Lists**

A list where the elements are pairs of keys associated with values.
**Ex.**

```lisp
(setq flowers '((rose . red) (lily . white) (iris . purple)))

(assoc 'lily flowers ) ; (lily . white)
(rassoc 'purple flowers ) ;  (iris . purple)
```

assq, rassq – same as assoc and rassoc but use eq instead of equal.
copy-alist – a 2-level deep copy of the list.

**rassoc** is the reverse form of assoc; it searches for a pair whose cdr satisfies the test, rather than the car.

```lisp
(rassoc 'credit '((a . checking) (b . credit) (a . savings)))
; (b . credit)
```

```lisp
(setq A '((jan . 31) (feb . 28) (mar . 31) (feb . 29) (apr . 30) (may . 31)))
;((jan . 31) (feb . 28) (mar . 31) (feb . 29) (apr . 31) (may . 30))
(assoc 'feb A) ; (feb . 28)
(rassoc 29 A) ; (feb . 29)
(rassoc 31 A) ; (jan . 31)
(assq 'mar A) ; (mar . 31)
(setq M 'mar) ; mar
(assq M A) ; (mar . 31)
```

**Function - Copy Associative List**

```lisp
(defun copyalist (L)
  "Copies an associative list."
  (let ((newlist ()))
    (dolist (e L newlist)
      (setq newlist
            (append newlist
                    (list (cons (car e)
                                (cdr e)
                          )))))))
```

**Function - Set Association in Associative List**

```lisp
(defun setassoc (sym val L)
  "Associates the value with the symbol in the list L."
  (setcdr (assoc sym L) val))
```

### **Symbols**

```lisp
(intern "wolf") ;=> wolf
(symbol-name 'wolf)  ;=>"wolf"
(setq dog (intern "dog")) ;=> dog
(symbol-name dog) ;=> "dog"
(symbol-name 'dog) ;=> "dog"
(setq goat "skippy") ;=> "skippy"
goat ;=> "skippy"
(symbol-name 'goat) ;=> "goat"
(symbol-value 'goat) ;=>"skippy"

(setq a 'a)   ; a
(setq b (make-symbol "a"))   ; a
(eq a b)   ; nil
(eq b 'a)   ; nil
(eq a 'a)   ; t
(symbol-name b)   ; "a"
(eq a (intern "a"))
```

## **Classes of Objects**

A classification of entities one can find in a program by what can be done with them.

- **[First class](#first-class-objects)**: can be used without restriction.

- **[Second class](#second-class-objects)**: can be passed as function parameters but not assigned to a variable or returned by functions.

- **[Third Class Objects](#third-class-objects)**: cannot be passed as function parameters.

### **First Class Objects**

- Storable in variables 
- Storable in data structures 
- Comparable for equality with other entities 
- Passable as a parameter to a function 
- Returnable as the result of a function call
- Having an intrinsic identity (independent of any given name) 
- Expressible as an anonymous literal value 
- Constructable at runtime 

### **Second Class Objects**

- Values / entities that don’t have a literal expression or cannot be created dynamically.
- They can be passed as function parameters, but not returned from a function, nor assigned to a variable.
- In C structs are second class because there is no literal expression for them.
- In Java the type int is second class because you can’t inherit from it. Integer is first class.

### **Third Class Objects**

- Entities that cannot be stored in variables, nor used as parameters, nor returned from functions.
- goto: labels in C because they don’t have values associated with them.
- Basic types in C++ (the type, not the values of that type).

### **First Class Functions**

- A programming language supports first class functions if it allows functions to be first class objects.
- Supported by all functional languages: Lisp, Scheme, ML, as well as many of the interpreted languages: Python, Perl, JavaScript.
- Creating a function at runtime means your program must contain a compiler.
- In C++ only function references (pointers) are first class objects.

### **Higher-Order Functions**

- A higher-order function accepts functions as arguments and is able to return a function as its result 
- A higher-order language supports higher-order functions and allows functions to be constituents of data structures.
- Functions of order 0: both the domain and the range of the function are non-function data (numbers, lists, arrays).
- Functions of order k: Both the domain and the range can be functions of order k-1.
- Higher order: where the order is at least 2.

### **Lambda Expressions**

- Also called anonymous functions or methods. 
- They describe functions by directly describing their behavior.
- Inspired from lambda calculus, a branch of mathematics that studies functions, recursion, computability. Invented by A. Church in 1930.
- Present in many languages: C#, Python, Perl.
- Usually they mean the language allows first class functions.

```lisp
(lambda (arg-variables...) 
  [documentation-string] 
  [interactive-declaration] 
  body-forms...) 
```
Ex.
```
(lambda (x y) (* x y))   
((lambda (x y) (* x y)) 2 3)           ; 6
```

**Lambda Calculus**

- A mathematical tool to study functions, applications, recursion

**Predicates in Lambda Calculus**

TRUE := $\lambda xy. x$
- T(x, y) = x

**funcall** - calls a function with parameters provided after the function name.
```lisp
(funcall '1+ 4)  ; 5
(funcall 'sqf 48 96) ; 32
```
**apply** - calls a function with parameters stored in a list.
```lisp
(apply '1+ '(4))  ; 5
(apply 'sqf (list 48 96)) ; 32
```

### **Map**
Applies a function to an entire list
`(mapc function list)` applies the function to all the elements of the list for the side effect.
`(mapcar function list)` applies the function to all the elements of the list and collects the result in a list that it returns.
```lisp
(mapcar '1+ '(2 3 1 6)) ; (3 4 2 7)

(mapcar (lambda (x) (* x x)) '(2 3 1 6)) ;(4 9 1 36)
```

### **Dynamic Lambda**
```lisp
(setq n 10)
10
; Dynamic Lambda
(setq f (append '(lambda (x))
		(list (list '+ 'x n))))
; (lambda (x) (+ x 10))
(mapcar f '(1 2 3)) ; (11 12 13)
(funcall f 2) ; 12
```
**Print several things with just one expression**

```lisp
(mapc 'princ (list "today is " (symbol-name 'October) " " 2 "\n"))
```

**Lambda Copy**
Making a one-level copy of a list
```lisp
(defun my-copy (L)
  (mapcar (lambda (x) x) L))

(setq L ‘(1 2 3 4))   ;=>   (1 2 3 4)
(setq M (my-copy L))  ;=>   (1 2 3 4)
(eq L M)     ;=>  nil
(equal L M)  ;=>  t

```

**Storing a function in a variable**

```lisp
(setq f (lambda (x) (* x x)))
; (lambda (x) (* x x))
(mapcar f '(1 2 3)) ; (1 4 9)
(fset 'g f) ; (lambda (x) (* x x))
(g 3) ; 9
```

**fset** – sets the symbol-function of a symbol & assigns it a particular value

```lisp
(fset 'first (symbol-function 'car))
; #<subr car>
(first '(1 2 3))    ; 1
(fset 'xfirst 'car) ; car
(xfirst '(1 2 3))   ; 1
(symbol-function 'xfirst) ; car
(symbol-function (symbol-function 'xfirst))
; #<subr car>
```

### **Function Indirection**
In a function call Lisp will follow a sequence of symbols until it finds a function
```lisp
(defun g (x) (* x x)) ; g
(fset 'g1 'g) ; g
(fset 'h 'g1) ; g1
(fset 'g2 (symbol-function 'g))
; (lambda (x) (* x x))
(defun g (x) (+ x 60)) ; g
(g 5)  ; 65
(g1 5) ; 65
(h 5)  ; 65
(g2 5) ; 25
```

```lisp
(with-open-file (stream (merge-pathnames #p"data.txt"
                                         (user-homedir-pathname))
                        :direction :output    ;; Write to disk
                        :if-exists :supersede ;; Overwrite the file
                        :if-does-not-exist :create)
  (dotimes (i 100)
    ;; Write random numbers to the file
    (format stream "~3,3f~%" (random 100))))
```

```lisp

```
## **Notes - 2/17/20**

**Complex Conditional**
```lisp
(cond (c1 expr1) (c2 expr2) ... )
```
- Evaluates each condition until one of them is true
- When that happens it evaluates the expressions associated with it.
- If none of them are true, it returns nil
- Each of the cases can contain a sequence of expressions
- Equivalent to a sequence of nested simple conditionals or a sequence of if - elif - else


**Atoms, Pairs & Lists**
```lisp
'(2 . 3)
(cons 2 3)
; A list w/ one element
'(a . ())

(cons 3 ())
(3)
(cons 2 '(3))
(2 3)
(cons 1 '(2 3))
(1 2 3)

(setq L '(a b c)) ; (a b c)
(cons 0 L)        ; (0 a b c)

(setq L '(a b c)) ; (a b c)
(cons 0 L)        ; (0 a b c)
(setq M '(2 3))   ; (2 3)
; Nested List
(cons M L)        ; ((2 3) a b c)

```

**Create a list from several elements**
```lisp
(append M L "hello")
(2 3 a b c . "hello")


; make-list 
(make-list 3 "a") ;=> ("a" "a" "a")

```

```lisp
cadr
cddr
(cdar '((1 2) a b c))
```

Function Parameters
- all function parameters are value parameters in Lisp


```lisp
; LL = '(1 2 3 4)
(defvar LL '(1 2 3 4))

; L contains a reference to list LL
; (1 . '(2 3 4))
(defun last (L)
  (while (and L (cdr L))
    (setq L (cdr L)))
 (car L))

(last LL)
4
LL
(1 2 3 4)

(defun plus (x)
  (setq x (+ 1 x)))

(setq n 3)
3
(plus n)
4
n
3

```

**Mutators** - functions that modify their parameters. The other are called **accessors**
- Ex. `push`, `pop`, `setq`

**List Mutators** - functions that modify the content of a list (like push and pop)
- setcar, setcdr

```lisp
(setq L '(1 2 3))
(setcar (cdr L) 4) ; 4
L ; (1 4 3)
(setcdr (cdr L) 5) ; (1 4 . 5)
```

**Mutator Function**
```lisp
(defun set3rd (L val)
    (let ((M L))
        (setq M (cdr M))
        (setq M (cdr M))
        (setcar M val)
        L))
```


## **Name, Scope, Binding**

**Name** - character string used to represent something else
- usually identifiers, but operators (+, &, *) are also names
- allow us to refer entities in a program by a symbol instead of an address
- provide a level of abstraction in a program: classes for data abstraction, functions for control abstraction
- give us a better focus on some aspects of a program

**Binding** - the operation of associating two things, like a name and the entity it represents
- **Binding time** - the mement when the binding is performed
- **Early Binding** - *late binding*, refers to the binding time, compilation or runtime
- **Static (lexical) Binding** - *dynamic binding*, whether the binding is the same through the execution of the program or if it can change
**Polymorphism** - allowing a name (function, variable) to be bound to more than one entity
**Alias** - multiple bindings for the same entity

### **Early / Late Binding**

- **Type**: early binding constrains the type of the variable. Late binding lets that be decided when a value is assigned
- **Function**: function known at compilation time, or left to be matched when the call is being executed
- **Value**: late binding waits until the value/data assigned to a variable is needed before evaluating or loading it

### **Dynamic Binding**

- the exact meaning of each identifier (variable/function) is determined when the instruction is executed based on context
  - Lisp Ex. function A makes a reference to a "global" variable x
  - Function B declares a local variable x and then calls function A
  - Within that function call, x is the local variable from B
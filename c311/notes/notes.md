```lisp
;; This buffer is for text that is not saved, and for Lisp evaluation.
;; To create a file, visit it with C-x C-f and enter text in its buffer.

; Lambda Expressions
(defun fun1 (x y) (- x y))
fun1

(funcall 'fun1 8 2)
6

(setq fun2 (lambda (x y) (+ x y)))
(lambda (x y) (+ x y))

(funcall fun2 4 9)
13

(funcall (lambda (x y z) (max x y z)) 3 6 9)
9


(apply (lambda (x y z) (max x y z)) '(3 6 9))
9
; use when you have a list

(apply  'max '(12 3 6 134 9 10)


```

**Map**
- Applies a function to an entire list
- (mapc function list)

- (mapc function list)
- applies the function to all elements of a list and then collects the results in another list

(mapcar '1+ '(2 3 1 6))

**Dynamic Lambda**


```lisp
(mapc 'princ (list "today is " (symbol-name
    'October) " " 2 "\n"))
```

**Lambda Copy**
```lisp
(defun my-copy (L)
    (mapcar (lambda (x) x) L))
```
- lambda is an identity function
- mapcar builds up a new list and then returns it


```lisp

(setq L '(1 2 3 4))
(setq M (my-copy L))
(eq L M)
; eq only works on #s
; returns true if they have  content
(equal L M)
; equal will return true if the object referenced by both variable it is the same


```

## **[HW5](https://www.cs.iusb.edu/~dvrajito/teach/c311/hw5.html)**

**Ex. 1** The while loop and the GCD
- write a function 

**Ex. 2** Lambda Expression
- Function replace
  - Goes through a list and returns one value with another
  - **Similar to the Lambda-Copy**

```lisp
(defun replace (L z y))
```
- if x = 
- not = y then return x

Ex. (replace )

**Ex. 3** List Manipulation
**make-multiple**
- takes two parameters one that is a number and the other the size of the list

- could use a while loop to inset the elements in backwards then pop 

- dotimes or while

n = 12, m = 18
- dividend, divsor, remainder
- 12, 18, 12 (*12 % 18*)
- 18, 12, 6 (*18 % 12*)
- 12, 6, 18 (*12 % 6*)

**Part a.**
**Part b.** write a function called is-multiple that takes one parameter that is a list of numbers and returns true(t)




Declare the variable true to begin with and then change to false 

**Atoms** - something you can not divide 
- empty list is both an atom and a list
*Fundamental construction*: dotted pair or **cons**
'(2 . 3) <==> (cons 2 3)

A list by definition is a dotted pair of an expression and a list (which can be empty)

A list with one element:
```lisp
'(a . ()) ; '(a) or (cons 'a ())
```

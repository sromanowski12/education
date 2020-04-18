 ## **Recursion Notes**

**Flat Recursion**

Looks at every elements of a container (sequence) data structure as atoms

**Ex.** length

'(2 3 14 7 2) and '(4 ( 12 3 4 9 18 82 1) 35 93 7) have the same length, 5
- The lists inside the second example are only considered to the one element


```lisp
(defun length (L)
  (if (not L) 0
     (+ 1 (length (cdr L)))))
```

**Deep Recursion**

- Looks into the entire structure of the container considering that each element can be in turn a container
- If the container is a list, the characteristics of deep recursion are:
1. Testing if the car of the list is also a list
2. Calling itself recursively both on the car and the cdr of the list

For a list, examine the car of the list & check if it's a nested list or some other type of value
- Requires type-checking predicate

For a nested list, we would perform a recursive call on the list. 

Otherwise, we perform whatever operation the function is doing on the car of the list

In both cases, we also make a recursive call on the cdr of the list
Thus, in these functions, two recursive calls may happen in some cases

**Example Functions**

**Ex.** count-top-level-symbols

Counts all of the symbols in the list using the type-checking predicate symbolp. However it does not consider nested lists, so it only counts the top-level symbols.
- Starts by checking if the car of the list is a list,
  - If yes, then make a recursive call on the car of the list, then add 1 to the result to count this symbol.
  - If no, then make a recursive call on the cdr of the list and simply return the result.

```lisp
(defun count-top-level-symbols (L)
  " Counts all the symbols at the top level of the list using a flat recursion."
  (cond ((null L) 0)
        ((symbolp (car L))
         (+ 1 (count-top-level-symbols 
                  (cdr L))))
        (t (count-top-level-symbols 
                  (cdr L)))))

(count-top-level-symbols '((a b (c d) e) f g (h i (j)))) ; 2
```

**Deep Recursion**

**Ex.** count-all-symbols

Deeply recursive function. The base case is when the list is empty then return 0.
- Then we start by checking if the car of the list is a list by using the type-predicate listp.
  - If yes, make a recursive call on the car & another on the cdr, then return then sum of the results.
- If no, 
  - if the car of the list is a non-list value, 
    - A single recursive call is made on the cdr of the list
  - If car of the list is a symbol, 
    - Add 1 to the result.

*This function is no only going into all nested lists present in our list, but in any other list that may be nested inside those.*

```lisp
(defun count-all-symbols (L)
  "Counts all symbols in the list L using deep recursion"
  (cond ((null L) 0)
        ((listp (car L))
         (+ (count-all-symbols (car L))
            (count-all-symbols (cdr L))))
        ((symbolp (car L))
         (+ 1 (count-all-symbols (cdr L))))
        (t (count-all-symbols (cdr L)))))
count-all-symbols

(count-all-symbols '((a b (c d) e) f g (h i (j))))
10

```

**Ex.** depth

```lisp
(defun depth (L)
  "Computes the depth of a list using deep recursion."
  (cond ((null L) 0)
        ((listp (car L))
         (max (+ 1 (depth (car L))) 
              (depth (cdr L))))
        (t (max 1 (depth (cdr L))))
   ))

(depth '((a b (c d) e) f g (h i (j)))) ; 3
```

**Recursion Tree**
A tree with a node for each recursive call and where the children of a node are the recursive calls it generates. 

**1-Level List Copy**

```lisp
(defun simplecopy (L)
  (cond
   ((not L) nil)
   (t (cons (car L) 
            (simplecopy (cdr L))))))
(simplecopy '(a (b c (d)) e (f g)) )
; (a (b c (d)) e (f g))
```

**Deep List Copy**

```lisp
(defun deepcopy (L level)
  (cond
   ((not L) nil)
   ((<= level 0) L)
   ((listp (car L))
    (cons (deepcopy (car L) (- level 1))
          (deepcopy (cdr L) level)))
   (t (cons (car L)
            (deepcopy (cdr L) level)))))

(deepcopy '(a (b c (d)) e (f g)) 3)
; (a (b c (d)) e (f g))
```
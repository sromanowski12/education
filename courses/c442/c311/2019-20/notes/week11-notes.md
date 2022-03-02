### **General Recursion Transformation**

- A method to transform any recursive function into an interactive one
- It requires a stack,
  - For each of the parameters that might changes values in a recursive all and
  - For all the local variables (unless they are declared as static)
  - For any marks used to store the place in the function where we return after a recursive call was made
- The stack is initialized to contain the values corresponding to the top level call of the function
- Introduce a while loop that goes on while the stacks are not empty
  - Every recursive call pushes things on the stack and starts a new iteration of the loop
  - The return from a recursive call pops things from the stack
- The end of a recursive call pops things from the stack

### **Tree Structure**

```lisp
(defun root (T) ; The root of the tree
  (if T (car T)))

(defun left-subtree (T)
  (if (and T (cdr T))
    (car (cdr T)))) ; (cadr T)

(defun right-subtree (T) 
  (if (cdr (cdr L))       ; length > 2
    (car (cdr (cdr T))))) ; (caddr T)
```

**print-preorder Version 1**

```lisp
(defun print-preorder (T)
  "Print the tree in preorder. Root - left - right"
  (if T
    (progn
      (my-print (root T) " ")
      (print-preorder (left-subtree T))
      (print-preorder (right-subtree T)))))

(setq S '(23 (51 (18) (33 (5))) (7 () (10))))
(print-preorder S)
; 23 51 18 33 5 7 10 nil
```

### **Iteration**

- Remove a pair (T . state) from the stack
- Based on the stored label, we perform the action associated with it
- Then we store the current T with the label following the current one back on the stack, unless the label is the last one
- If we need to do a recursive call, we store the new T with the first label ('left) in the stack

**print-preorder Version 2**

- We need to store on the stack the tree itself, and the label.
  - We will store them together as a dotted pair
- We start with a empty stack and push the original tree with the label left to it

```lisp
(defun print-preorder (T)
  "Prints the list in preorder without recursion."
  (let ((stackT nil) (frame nil) 
        (label nil))
    (push (cons T 'left) stackT)
    (while stackT
      (setq frame (pop stackT))
      (setq T (car frame) label (cdr frame))
      (if T
          (cond ((eq label 'left)
                 (my-print (root T) " ")
                 (push (cons T 'right) stackT)
                 (push (cons (left-subtree T) 
                             'left) stackT))
                ((eq label 'right)
                 (push (cons (right-subtree T) 
                             'left) stackT)))))))
```

**print-preorder Version 3**

As we can see, this function has two loops, and no labels.
- It only stores the tree itself on the stack
- The first loop goes all the wy to the left, printing the nodes as it moves along the path
- The second loop goes on while the loop is not empty
  - It pops the tree from the stack, then it moves one step to the right, then it goes all the way down to the left again.
  - **this is repeated until the stck becomes empty**

```lisp
(defun print-preord (T)
  "An optimization of the function above."
  (let ((stackT ()))
    (while T
      (my-print (root T) " ")
      (push T stackT)
      (setq T (left-subtree T)))
    (while stackT
      (setq T (pop stackT))
      (setq T (right-subtree T))
      (while T
        (my-print (root T) " ")
        (push T stackT)
        (setq T (left-subtree T))))))

```

### **Combinations**

C(n, m) = n! / (m! (n-m)!)

C(n, m) = C(n-1, m) + C(n-1, m-1)

**Combinations - Version 1**

```lisp
(defun comb (n m)
  (cond
   ((= n m) 1)
   ((= m 0) 1)
   (t (+ (comb (- n 1) m)
         (comb (- n 1) (- m 1))))))

(comb 3 2) ; 3
(comb 5 2) ; 10
```

**Combinations - Version 2**

```lisp
(defun comb2 (n m)
  (let ((st ()) (left-res 0) (result 0))
    (push (list n m 0 'L0) st)
    (while st
      (setq frame (pop st))
      (setq n (car frame) m (elt frame 1)
            left-res (elt frame 2) label (elt frame 3))
      (cond
       ((equal label 'L0)
        (cond
         ((= n m) (setq result 1))
         ((= m 0) (setq result 1))
         (t (push (list n m 0 'L1) st)
            (push (list (- n 1) m 0 'L0) st))))
       ((equal label 'L1)
        (push (list n m result 'L2) st)
        (push (list (- n 1) (- m 1) 0 'L0) st))
       ((equal label 'L2)
        (setq result (+ result left-res)))))
    result))
```

  
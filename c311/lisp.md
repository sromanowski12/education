## \*_Lisp_

### **Variables**

**Local Variables**
**let**
**defvar**

**Global Variables**
**setq**

### **Functions**

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

## **Lists**

**car**

```lisp
(car L) ;
```

**cdr**

```lisp
(cdr L) ;
```

**list**
**length**

```lisp
(length L) ;
```

### **Atoms, Pairs, Lists**

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

```lisp
(setq flowers '((rose . red) (lily . white) (iris . purple)))

(assoc 'lily flowers ) ; (lily . white)
(rassoc 'purple flowers ) ;  (iris . purple)

```

assq, rassq – same as assoc and rassoc but use eq instead of equal.
copy-alist – a 2-level deep copy of the list.

**Copy Associative List**

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

```lisp
(defun setassoc (sym val L)
  "Associates the value with the symbol in the list L."
  (setcdr (assoc sym L) val))

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

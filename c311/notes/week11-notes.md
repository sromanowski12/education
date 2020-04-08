## **One Recursive Call**
```lisp
(defun factorial (n)
  ; label0 
  (if (< n 2) 1
    (* n (factorial (- n 1)) ; label1
    )))

(factorial 5)
120
```

```lisp
(defun factorial2 (n)
  (let ((st ()) (frame ()) (result 1))
    (push (cons n 'L0) st)
    (while st
      (mapc 'princ (list st " " result "\n"))
      (setq frame (pop st))
      (setq n (car frame) label (cdr frame))
      (if (equal label 'L0)
          (if (< n 2) (setq result 1)
            (push (cons n 'L1) st) ; else
            (push (cons (- n 1) 'L0) st))
        (setq result (* result n))))
    result))
```

```lisp
(defun driver (L val)
  (if (not L) nil
    (catch 'found
      (search L val))))
driver

(defun search (L val)
  (cond ((listp (car L))
         (search (car L) val))
        ((listp (car L))
         (search (cdr L))))
  (dolist (elem L nil)
    (if (equal elem val)
        (throw 'found elem))))
```

**Compilation Steps**
1. Precompiler
2. Scanner
3. Parser
4. Semantic Analysis
5. Target Code Generation

## **Formal Grammars**
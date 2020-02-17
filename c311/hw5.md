```lisp
(mapcar '1+ '(2 4 6))
; (3 5 7)
```

```lisp
(defun copy2 (L)
  (mapcar (lambda (x) x) L))
copy2

(setq M '(1 2 3))
(1 2 3)

(copy2 M)
(1 2 3)
```

```lisp
(setq L '(3 1 5 6 3 2 3))
(3 1 5 6 3 2 3)

(setq z 3)
3

(setq y 9)
9

(defun replace (L z y)
  (setq k (lambda (x) (if (= x z) y x)))
  (mapcar k L))
replace

(replace L z y)
(9 1 5 6 9 2 9)
```

mapc is a built-in function in ‘C source code’.

(mapc FUNCTION SEQUENCE)

Apply FUNCTION to each element of SEQUENCE for side effects only.
Unlike ‘mapcar’, don’t accumulate the results.  Return SEQUENCE.
SEQUENCE may be a list, a vector, a bool-vector, or a string.





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



```lisp
(defun count-all-symbols (L)
  "Counts all symbols in the list L using deep recursion."
  (cond ((null L) 0)
        ((listp (car L))
         (+ (count-all-symbols (car L))
            (count-all-symbols (cdr L))))
        ((symbolp (car L))
         (+ 1 (count-all-symbols (cdr L))))
        (t (count-all-symbols (cdr L)))))

(count-all-symbols '((a b (c d) e) f g (h i (j)))) ;10
```
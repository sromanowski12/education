
## **Lisp**

```lisp
(defun temp (L)
  (let ((temp (car L)))
    (while (and L (cdr L) (not (= (random 2) 0)))
;      (princ (car L)) (princ "\n")
                                        ;    (setq v1 (car L))
      (setq temp (car L))
      (setq L (cdr L)))
    temp))
temp

```



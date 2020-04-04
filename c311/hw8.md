
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



```lisp
(defun count-val (L val)
  (cond ((not L) 0)
        ((equal (car L) val)
         (+ 1 (count-val (cdr L) val)))
        (t (count-val (cdr L) val))))
```


Ex. 3. Functions with Unlimited Number of Parameters 

(numberp  2) ; t
(numberp  'a) ; nil
(listp  '(1 2 3)) ; t
(functionp  '+) ; t

- atom, arrayp, char-or-string-p, consp, floatp, functionp, integerp, stringp. 


```lisp
(defun my-make-list (length &optional init &rest endlist)
  "Creates a list by making length copies of init and appending
   endlist to it afterwards. If he init is missing the list is
   filled with 0s"
  (let ((L nil))
    (setq L (if init (make-list length init)
              (make-list length 0)))
    (append L endlist)))
my-make-list

```
```lisp
(defun prinFun (test)
  (catch 'return
    (if (< test 1)
       (throw 'return "return")
      (princ test) (princ " ")
      (prinFun (- test 1))
      (princ test) (princ " "))))
prinFun

(prinFun 3)
3 2 1 1 2 3 
```

```lisp
(defun sign (n)
  (catch 'negative
    (catch 'zero
      (cond
       ((= n 0) (throw 'zero 0))
       ((< n 0) (throw 'negative -1))
       (t 1)))))

(sign 0) ; 0
(sign 3) ; 1
(sign -5); -1
```

```lisp
(defun search (L val)
  (if (not L) nil
    (catch 'found
      (dolist (elem L nil)
        (if (equal elem val)
            (throw 'found t))))))
search

(search '(1 2 3 4) 5)
nil
```


(depth '(a b (c d) e))

(depth '(b (c d) e))

(depth '((c d) e))

(depth '((c d)))

(depth '(e))

(depth '(d))

## **Combinations**

```lisp
(defun comb (n m)
  (cond
   ((= n m) 1)
   ((= m 0) 1)
   (t (+ (comb (- n 1) m)
         (comb (- n 1) (- m 1))))))
```

```lisp
(defun el10 (n m)
  (+ (* n 10) m)) ; 10*n+m

(setq C (make-vector 100 nil))

(defun comb1 (n m)
  (let ((res (elt C (el10 n m))))
    (if res res
      (setq res  ; else
            (cond
              ((= n m) 1)
              ((= m 0) 1)
              (t (+ (comb1 (- n 1) m)
                    (comb1 (- n 1)
                           (- m 1))))))
      (aset C (el10 n m) res))))

(comb1 7 3)  ; 35
(comb1 9 5)  ; 126
```

Here is another example of a function where dynamic programming can be applied. This is computing the combination of m objects taken out of a set of n, that can be computed with the formula n factorial divided by m factorial times n-m factorial. To write this function recursively, we use Pascal’s formula for computing it, that you’ve probably seen used to build Pascal’s triangle. The idea is that we can compute combinations of m out of n as the sum of combinations of m out of n-1 plus the combinations of m-1 out of n-1.

Why do we need to use this and not the straight formula? Because this avoid having to compute some large factorials that can lead to large integers and arithmetic overflow, or to using float or double, which is not as precise.

This is the simple recursive version. It has a base case for n equal to m, and for m equal to 0, both of these being 1. Otherwise it uses the formula, which results in two recursive calls. At first glance, it may not be obvious that there is repetition in this function, so let’s take a look at the recursive tree. 


```lisp
(defun square (x)
  (* x x))          ; => square
(square 5)          ; => 25
```

```lisp
(if condition
    expression-if-true
    expressions-if-false)
```

```lisp
(defun max (x y)
  (if (> x y) x y))
```

```lisp
(defun factorial (n)
  "Computes the factorial of a number"
  (if (<= n 1) 1
        (* n (factorial (- n 1)))))

(factorial 5) -> 120
```

```lisp
(setq L '(1 2))
(1 2)

(defun prod-list (L)
  "Function to return the product of the list"
  (if (not L) 0
    (+ (car L) (prod-list (cdr L)))))
prod-list

(prod-list L)
3
```

## Loops

```lisp
(defun factorial (n)
  (let ((f 1))
    (dotimes (i n f)
      (setq f (* f (+ i 1))))))
factorial

(factorial 5)
120
```

## **Control Variable**

```lisp
(dotimes (i 4 i)
  (princ i) (princ " "))
0 1 2 3 4
```

```lisp
(dolist (e '(1 2 3 4) e)
  (princ e) (princ " "))
```

```lisp
(defun maxl (L)
  "Returns the maximum element of a list."
  (let ((m nil))
    (dolist (x L m)
      (if (or (not m) (> x m))
          (setq m x)))))
```

## **HW3 Functions**

```lisp
(if (car L) "TRUE"
|    "FALSE")
|"TRUE"
```

## **HW4 Functions**

A prime number (or a prime) is a natural number greater than 1 that cannot be formed by multiplying two smaller natural numbers. A natural number greater than 1 that is not prime is called a composite number

```lisp
(setq L '(1 2 3 4))
(1 2 3 4)


(defun prev-to-last (L)
  "Function to display the second to last element in a list"
  (let ((count 0) (i 1) (val 0))
    (while (< i (length L))
      (pop L)
      (setq val (car L))
      (setq i (1+ i)))
    val))
prev-to-last

(prev-to-last L)
3 ; --> Result if L = '(1 2 3 4)
```

```lisp
(defun is-prime (val)
  "Function to determine if a number is prime"
  (let ((index 0) (limit 2) (result nil))
    (if (< val 2) nil
      (if (= val 2) t
        (dotimes (count limit result)
          (setq index (1+ count))
          (if (not (eq (% val index) 0)) (setq result t)
            (setq result nil)))))))

```





```lisp
(expr expr expr ...)

'(monday tuesday wednesday thursday friday saturday sunday)

(+ 1 2 3 4)

```

List Manipulation 
- Add something to the front of the list
```lisp
(push "w" L)

(push 2 L)
```
- Remove something from the list
```lisp
(setq n (pop L))
```


**Example**
```lisp
(defun last (L)
  "The last element in a list"
  (if (not L)
      nil
    (if (not (cdr L))
        (car L)
      (last (cdr L)))))
```

**Function Parameters**

**Associative Lists**
```lisp
(setq flowers '((rose . red) (lily . white) (iris . purple)))
```

(push "w" L)


**catch-throw**

**Example**
```lisp
`(defun search (L val)
  (if (not L) nil
    (catch 'found
      (dolist (elem L nil)
        (if (equal elem val)
            (throw 'found t))))))

(search        '(1 2 3 4 5) 3) ; t
(search        '(1 2 3 4 5) 8) ; nil`

```


**Is Sorted**
```lisp
(defun is-sorted (L)
  (if (not (cdr L)) t
    (let ((prev (car L)))
      (catch 'notsorted
        (dolist (elem (cdr L) t)
          (if (> prev elem)
              (throw 'notsorted nil)
            (setq prev elem)))))))

(is-sorted '(1 2 3 4 5 6)) ; t
(is-sorted '(2 3 4 1 2 4)) ; nil

```



```lisp
`(defun sumlist (L)
"Returns the sum of the elements in the list"
(if (not L)
0
(+ (car L)
(sumlist (cdr)))))`

; (sumlist '(8 2 5 1))      ==> 16
```



```lisp
(defun is-prime (val)
  "Function to determine if a number is prime"
  (let ((index 1) (limit (- val 2)))      ; index initialized to 2 and later used as divisor
    (if (< val 2) nil                     ; Return nil if val < 2, val is not prime
      (if (= val 2) t                     ; Return t if val = 2, val is prime
        (dotimes (count limit result)     ; Iterate through all possible divisors <= val
          (setq index (1+ count))
          (if (not (eq (% val index) 0))  ; Determines if val is even or odd
              (setq result t)             ; if val is even, return t
            (setq result nil)))))))       ; otherwise set result to nil

```




**Test Functions**

```lisp
(defun sqf (h w)
(/ ( * h w) 144))
(sqf 48 96)
```

```lisp
(defun sqf (h w)
(/ ( * h w) 144))
(sqf 48 96)
```
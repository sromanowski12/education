; Seth Romanowski
; C311
; Programming Languages

; Declare 3 variables
; - Assign numbers to each
; - One must have a description
(setq n 5)
5

n
5

(setq i 10)
10

i
10

(defvar size 100 "The size of the problem")
size

size
100

; Show an example of using the following mathematical functions
; - expt, random, abs, cos, truncate

(expt 5 2)
25

(random 100)
26

(abs -25)
25

(cos 100)
0.8623188722876839

(truncate 46.4)
46

; Invoke the help on one of the functions listed above

; truncate is a built-in function in `C source code'.

; (truncate ARG &optional DIVISOR)

; Truncate a floating point number to an int.
; Rounds ARG toward zero.
; With optional DIVISOR, truncate ARG/DIVISOR.

; Implement the following 3 functions
; prod-list
(setq L '(1 2))
(1 2)

(defun prod-list (L)
  "Function to return the product of the list"
  (if (not L) 0
    (+ (car L) (prod-list (cdr L)))))
prod-list

(prod-list L)
3

; is-in-list
; - takes two parameters, first is a list and second is a value
(setq L '(1))
(1)

; (setq val 1)
; 1

;(setq val 3)
; 3

(defun find-val (L val)
  "Function to find a value"
  (cond
   ((not L) nil)
   ((not (cdr L)) (equal (car L) val))
   (nil)))
find-val

(find-val L val)
; t

; nil

; median
(setq val1 5)
5

(setq val2 3)
3

(setq val3 7)
7

(defun median (val1 val2 val3)
  "Function to find the median of 3 values"
  (cond
   ((or (and (<= val1 val2) (<= val2 val3))           ; val1 <= val2 <= val3
        (and (>= val1 val2) (>= val2 val3))) val2)    ; val3 <= val2 <= val1
   ((or (and (<= val2 val3) (<= val3 val1))           ; val2 <= val3 <= val1
        (and (>= val2 val3) (>= val3 val1))) val3)    ; val1 <= val3 <= val2
   (val1)))
median

(median val1 val2 val3)
; 5


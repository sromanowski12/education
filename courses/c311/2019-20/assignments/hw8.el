; Seth Romanowski
; C311
; Programming Languages

; Ex. 1: Tail Recursive Transformation
(defun random-select (L)
  (let ((temp (car L)))
    (while (and L (cdr L) (not (= (random 2) 0)))
      (setq temp (car L))
      (setq L (cdr L)))
    temp))
random-select

(random-select '(1 2 3 4))
; 1 - Third Result
; 2 - Second Result
; 1 - First Result

; Ex. 2: Transformation to Tail-Recursion
(defun count-val (L val)
  (cond ((not L) 0)
        ((equal (car L) val)
         (+ 1 (count-val (cdr L) val)))
        (t (count-val (cdr L) val))))


; Ex. 2a: Convert this function to a tail recursive one
; Ex. 2b: Convert the resulting tail-recursive function into an interative one

; Ex. 3: Functions with Unlimited Parameters
(defun sum-num (a b c &optional d e &rest f)
  (let ((sum 0))
    (if (numberp a)
        (setq sum a))
    (if (numberp b)
        (setq sum (+ sum b)))
    (if (numberp c)
        (setq sum (+ sum c)))
    (if (numberp d)
        (setq sum (+ sum d)))
    (if (numberp e)
        (setq sum (+ sum e)))
    (while f
      (if (numberp (car f))
          (setq sum (+ sum (car f))))
      (pop f))
    sum))
sum-num

(sum-num 1 2 3 4 5 6 7)
; 28

(sum-num "a" 2 3 4 5 6 7)
; 27

(sum-num 1 2 3 "d" 5 6 7)
; 24



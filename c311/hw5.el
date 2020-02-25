; Seth Romanowski
; C311
; Programming Languages

; Ex. 1 - The while loop and the GCD (greatest common divisor)
; Euclids algorithm. 
(defun gcd (n m)
  "Function to determine the greatest common divisor"
  (if (> n m)
      (let ((dividend n) (divisor m) (remainder 1))
        (while (not (= remainder 0))
          (setq remainder (% dividend divisor))
          (setq dividend divisor)
          (setq divisor remainder))
        dividend)
    (gcd m n)))
gcd

; Testing function: gcd
(gcd 12 18)  ; 6
(gcd 18 12)  ; 6
(gcd 33 64)  ; 1
(gcd 64 33)  ; 1
(gcd 100 15) ; 5
(gcd 15 100) ; 5


; Ex. 2 - Lambda Expression
(defun replace (L z y)
  (setq k (lambda (x) (if (= x z) y x)))
  (mapcar k L))
replace

; Testing function: replace
(replace '(3 1 5 6 3 2 3) 3 9)
; (9 1 5 6 9 2 9)

(defun print-list (L)
  (mapc (lambda (x) (princ x) (princ " ")) L))
print-list

; Testing function: print-list
(print-list '(3 1 5 6 3 2 3)) 
; 3 1 5 6 3 2 3 (3 1 5 6 3 2 3)

; Testing function: print-list (w/ funcall)
(funcall 'print-list '(3 1 5 6 3 2 3)) 
; 3 1 5 6 3 2 3 (3 1 5 6 3 2 3)

; Testing function: replace (w/ apply)
(apply 'replace (list '(3 1 5 6 3 2 3) 3 9))
; (9 1 5 6 9 2 9)

; Ex. 3 - List Manipulation
; Ex. 3a - Function: make-multiples
(defun make-multiples (n m)
  (if (and (> n 0) (> m 0))
      (let ((L '()) (mult m) (limit m))
        (dotimes (count limit result)
          (setq result (* n mult))
          (push result L)
          (setq mult (1- mult)))
        L)
    nil))
make-multiples

; Testing function: make-multiples
(make-multiples 4 5)
; (4 8 12 16 20)

; Ex. 3b - Function: is-multiple
(defun is-multiple (L)
  (cond
   ((not L) nil)
   ((not (cdr L)) t)
   (t (let ((mult 2) (i (car L)))
        (dotimes (count (1- (length L)) result)
          (setq j (car (cdr L)))
          (if (= j (* i mult)) (setq result t)
            (setq result nil)
            (pop L)
            (setq mult (1+ mult))))
        result))))
is-multiple

; Testing function: is-multiple
(is-multiple '(4 8 12 16)) ; t
(is-multiple '(3 5 7 9))   ; nil
(is-multiple '(3 6 9 12))  ; t


  

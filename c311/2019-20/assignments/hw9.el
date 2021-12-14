; Seth Romanowski
; C311
; Programming Languages

; Ex. 1: Deep Recursion
; Driver Function
(defun driver (L val)
  (if (not L) nil
    (catch 'found
      (search L val))))
; driver

; Recursive Function
(defun search (L val)
  (cond ((listp (car L))
         (search (car L) val))
        ((listp (car L))
         (search (cdr L))))
  (dolist (elem L nil)
    (if (equal elem val)
        (throw 'found elem))))
; search

; Testing Function: driver & search
; First Attempt - Flat List
(driver '(1 2 3) 3)
; 3

; Second Attempt - Nested List
(driver '((1 2 (3 4) 5 6 (7 8 (9)))) 5)
; 5

; Third Attempt - Nested List & Value Not Found
(driver '((1 2 (3 4) 5 6 (7 8 (9)))) 23)
; nil

; Ex. 2: Dynamic Programming
; Combination Function: comb

; Global counter Variable
(setq counter 0) ; 0

(defun comb (n m)
  (setq counter (1+ counter))
  (cond
   ((= n m) 1)
   ((= m 0) 1)
   (t (+ (comb (- n 1) m)
         (comb (- n 1) (- m 1)))))
  (princ counter t))
; comb

; Testing Function: comb
; First Attempt
(comb 3 2) ; 5
; Second Attempt
(comb 5 2) ; 19
; Third Attempt
(comb 9 5) ; 251

; Combination Function: comb1
(defun el10 (n m)
  (+ (* n 10) m)) ; 10*n+m
; el10

(setq C (make-vector 100 nil))
; [nil nil nil nil nil nil nil nil nil nil nil nil ...]

(defun comb1 (n m)
  (setq counter (1+ counter))
  (let ((res (elt C (el10 n m))))
    (if res res
      (setq res  ; else
            (cond
              ((= n m) 1)
              ((= m 0) 1)
              (t (+ (comb1 (- n 1) m)
                    (comb1 (- n 1)
                           (- m 1))))))
      (aset C (el10 n m) res)))
  (princ counter t))
; comb1

; Testing Function: comb1
; First Attempt
(comb1 3 2) ; 5
; Second Attempt
(comb1 5 2) ; 9
; Third Attempt
(comb1 9 5) ; 29

; The difference between the number of function calls for comb and comb1 is shown
; in the 2nd & 3rd attempt. As the value of m and n increase, the number of function calls
; for comb is much larger than the number of function calls for comb1.
; comb
; - Second Attempt: 19
; - Third Attempt: 251
; comb1
; - Second Attempt: 9
; - Third Attempt: 29

; Ex. 3: Dynamic Programming
(defun recur (n)
  (cond
   ((or (= n 1) (= n 2)) 1)
   ((= n 0) 0)
   (t (+ (recur (- n 1))
          (recur (- n 3))))))
; recur

; Testing Function: recur

; F(17)=F(17-1)+F(17-3)
; F(17)=277

(recur 17) ; 277

; F(17-1) or F(16)
; F(16)=189

(recur 16) ; 189

; F(17-3) or F(14)
; F(14)=88

; F(17)=189+88=277

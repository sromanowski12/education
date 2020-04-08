; Seth Romanowski
; C311
; Programming Languages

; Implement the following functions
; is-prime
(defun is-prime (val)
  "Function to determine if a number is prime"
  (let ((result t) (limit val))
    (dotimes (index limit result)
      (if (< val 3)
          (setq result nil)
        (if (eq val 2)
            (setq result t)
          (setq index (1+ index))
          (if (not (eq (% val index) 0))
              (setq result nil)
            (setq result t)))))))
is-prime

; Testing function: is-prime
(is-prime 5)  ; t
(is-prime 4)  ; nil
(is-prime 17) ; t
(is-prime 24) ; nil


; prev-to-last
(setq L '())        ; nil
(setq L '(1))       ; (1)
(setq L '(1 2 3 4)) ; (1 2 3 4)

(defun prev-to-last (L)
  "Function to display the second to last element in a list"
  (let ((count 0) (i 1) (val 0))
  (if (or (not L) (not (cdr L))) nil
    (while (< i (length L))
      (pop L)
      (setq val (car L))
      (setq i (1+ i)))
    val)))
prev-to-last

; Testing function : prev-to-last
(prev-to-last L) ; nil --> Result if L = '()
(prev-to-last L) ; nil --> Result if L = '(1)
(prev-to-last L) ; 3   --> Result if L = '(1 2 3 4)

; print-list
(setq L '())        ; nil
(setq L '(1))       ; (1)
(setq L '(1 2 3 4)) ; (1 2 3 4)

(defun print-list (L)
  "Function to print each element of a list with a space seperating them"
  (if (not L) nil
    (if (not (cdr L)) (car L)
      (dolist (e L e)
        (princ e) (princ " ")))))
print-list

; Testing function : print-list
(print-list L) ; nil --> Result if L = '()
(print-list L) ; 1 --> Result if L = '(1)
(print-list L) ; 1 2 3 4 nil --> Result if L = '(1 2 3 4)

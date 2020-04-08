; Seth Romanowski
; C311
; Programming Languages

; Ex. 1 

; Ex. 2
(setq A '[10 2 6 8 4])
; [10 2 6 8 4]

(defun swap (A x1 x2)
  (setq temp (elt A x1))
  (aset A x1 (elt A x2))
  (aset A x2 temp))
swap

(defun insert-sort (A n)
  (let ((p 1))
  (while (< p n)
    (setq i (1- p))
    (while (and (>= i 0) (> (elt A i) (elt A (1+ i))))
      (swap A i (1+ i))
      (setq i (1- i)))
    (setq p (1+ p)))
  A))
insert-sort

; Testing function: insert-sort
; A Before
A
; [10 2 6 8 4]

; A After
(insert-sort A (length A))
; [2 4 6 8 10]

; Ex. 3
; Ex. 3a - select-i
; Tail recursive? Yes

; Ex. 3b - length
; Tail recursive? No, computations after the recursive function call

; Ex. 3c - merge_sort
; Tail recursive? No, the value returned by the recursive calls is not what is returned by the function

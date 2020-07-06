; Seth Romanowski
; C311
; Programming Languages

; Ex. 1  - Symbols in Lisp
; Ex. 1a - next-day

(defun next-day (x)
  (cond
   ((eq x 'monday) 'tuesday)
   ((eq x 'tuesday) 'wednesday)
   ((eq x 'wednesday) 'thursday)
   ((eq x 'thursday) 'friday)
   ((eq x 'friday) 'saturday)
   ((eq x 'saturday) 'sunday)
   ((eq x 'sunday) 'monday)))
next-day

; Testing function: next-day
(next-day 'wednesday) ; thursday
(next-day 'friday)    ; saturday


; Ex. 1b
(setq dow '(monday tuesday wednesday thursday friday saturday sunday))
;(monday tuesday wednesday thursday friday saturday sunday)

(setq i (abs (% (random) 7))) ; 3

(setq day (elt dow i)) ;thursday

(defun random-day (L)
  (setq next (next-day day))
  (princ (concat "Today is " (capitalize (symbol-name day)) ", tomorrow is " (capitalize (symbol-name next))) t))
random-day

; Testing function: random-day
(random-day dow)
; "Today is Thursday, tomorrow is Friday"

; Ex. 2 - First-fit, Best-fit
; Ex. 2a - first-fit
(defun first-fit (L x)
  (if (not L) nil
    (if (<= x (car L)) (car L)
      (first-fit (cdr L) x))))
first-fit

; Testing function: first-fit
(first-fit '(1 2 3 40) 3) ; 3


; Ex. 2b - best-fit

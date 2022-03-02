; Lisp Notes
; 2/16
(setq L '())  ; nil
L             ; nil
(eq L nil)    ; t
(setq L '(1)) ; (1)
L             ; (1)
(setq M L)    ; (1)
M             ; (1)
(equal M L)   ; t

(car L)       ; 1
(pop L)       ; 1
L             ; nil
(car L)       ; nil
(cdr L)       ; nil
(push 1 L)    ; (1)
L             ; (1)
(cdr L)       ; nil


; Atoms, Pairs, Lists
'(2 . 3)      ; (2 . 3)
(cons 2 3)    ; (2 . 3)
(setq F '(2 . 3)) ; (2 . 3)
F             ; (2 . 3)
(cons 4 F)    ; (4 2 . 3)
(pop F)       ; 2
F             ; 3
(cons 4 F)    ; (4 . 3)
F             ; 3
(setq F (cons 4 F)) ; (4 . 3)
F             ; (4 . 3)






(defun count_div (x)
  (let ((count 0) (i 1))
    (while (<= i x)
      (if (eq (% x i) 0)
	  (setq count (1+ count)))
      (setq i (1+ i)))
    count))




(setq L '( 1 2 3 4))
; (1 2 3 4)

(defun sumlist (L)
  "Returns the sum of the elements of the list"
  (if (not L)
      0
    (+ (car L)
       (sumlist (cdr L)))))
sumlist

(sumlist L) ; 10

(defun last (L)
  (cond ((not L) nil)
        ((not (cdr L)) (car L))
        (t (last (cdr L)))))
last

(last L)
4


(lambda (x y) (* x y)) ; (lambda (x y) (* x y))
((lambda (x y) (* x y)) 2 3) ; 6
(setq f ((lambda (x y) (* x y)) 2 3)) ; 6
f ; 6

(defun sqf (w h)
  (/ (* w h) 144))
sqf

(funcall 'sqf 48 96) ; 32

(apply 'sqf (list 48 96)) ; 32

(mapcar '1+ '(2 3 1 6)) ; (3 4 2 7)

(mapcar (lambda (x) (* x x)) '(2 3 1 6)) ;(4 9 1 36)

(setq n 10)
10
; Dynamic Lambda
(setq f (append '(lambda (x))
		(list (list '+ 'x n))))
; (lambda (x) (+ x 10))
(mapcar f '(1 2 3)) ; (11 12 13)
(funcall f 2) ; 12

(setq f (lambda (x) (* x x)))
; (lambda (x) (* x x))
(mapcar f '(1 2 3)) ; (1 4 9)
(fset 'g f) ; (lambda (x) (* x x))
(g 3) ; 9

(fset 'first (symbol-function 'car))
; #<subr car>
(first '(1 2 3)) ; 1
(fset 'xfirst 'car) ; car
(xfirst '(1 2 3)) ; 1
(symbol-function 'xfirst) ; car
(symbol-function (symbol-function 'xfirst))
; #<subr car>


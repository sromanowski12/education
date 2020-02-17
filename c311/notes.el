; Lisp Notes
; 2/16
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

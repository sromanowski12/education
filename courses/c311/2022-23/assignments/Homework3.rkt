; Seth Romanowski
#lang racket

; Exercise 1
(define (binary-op f)
  (lambda (x y) (f x y)))

(define (plus x y)
  ((binary-op +) x y))

(define (times x y)
  ((binary-op *) x y))

; Exercise 2
(define curried-str-append
  (lambda (a) [lambda (b) (string-append a b)]))

; Exercise 3
(define hello
  (lambda ([firstname "Seth"] [lastname "Romanowski"])
    (string-append "Hello "firstname " " lastname))) 
; Seth Romanowski
#lang slideshow

; Exercise 1 - mycar
(define (mycar s)
  (let ([top (colorize (rectangle (* 6 s) (* 3 s)) "red")]
        [base (colorize (filled-rectangle (* 8 s) (* 2 s)) "blue")]
        [wheels (hc-append (* 4 s) (circle (* 2 s)) (circle (* 2 s)))])
    (vc-append top base wheels)))

; Exercise 2 - mybettercar
(define (mybettercar s)
  (let* ([top (colorize (rectangle (* 6 s) (* 3 s)) "red")]
         [base (filled-rectangle (* 8 s) (* 2 s) #:color "blue")]
         [wheels (hc-append (* 4 s) (circle (* 2 s)) (circle (* 2 s)))])
    (vc-append top (vc-append -10 base wheels))))
;Author: Hang Dinh
#lang racket
;check if a string is an IP-address
(define (IP-address? s)
  (define IPV4pattern #rx"([0-9][0-9]?[0-9]?)\\.([0-9][0-9]?[0-9]?)\\.([0-9][0-9]?[0-9]?)\\.([0-9][0-9]?[0-9]?)")
  (define matches (regexp-match IPV4pattern s))
  (if (equal? matches #f)
      #f
     (let ([n1 (string->number (list-ref matches 1))]
        [n2 (string->number (list-ref matches 2))]
        [n3 (string->number (list-ref matches 3))]
        [n4 (string->number (list-ref matches 4))])
       (and (> 256 n1 -1) (> 256 n2 -1) (> 256 n2 -1) (> 256 n2 -1)))
  )
 )


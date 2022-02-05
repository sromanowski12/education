; Seth Romanowski
#lang racket

(define (myname? s)
  (if (string? s)
  (if (string-prefix? s "Seth")
      "Yes"
      (if (and (string string-prefix? s "Seth") (string-suffix? s "Romanowski"))
          "Yes"
          "No"))
  "My name must be a string"))

(define (bloodpressure s d)
  (cond
    [(and (< s 120) (< d 80))
     "Normal"]
    [(or (and (>= s 120) (<= s 139)) (and (>= d 80) (<= d 89)))
     "Prehypertension"]
    [(or (and (>= s 140) (<= s 159)) (and (>= d 90) (<= d 99)))
     "Stage 1 Hypertension"]
    [(or (>= s 160) (>= d 100))
     "Stage 2 Hypertension"]))
      
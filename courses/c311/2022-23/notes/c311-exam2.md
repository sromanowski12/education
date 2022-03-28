- [Exam 2 - Study Guide](#exam-2---study-guide)
  - [Racket](#racket)
    - [Reading (Racket):](#reading-racket)
  - [Week 5 - Recursion](#week-5---recursion)
    - [Reading:](#reading)
    - [Reading (Racket):](#reading-racket-1)
    - [Reading:](#reading-1)
    - [Reading (Racket):](#reading-racket-2)
  - [Week 7 - Dynamic Programming](#week-7---dynamic-programming)
    - [Reading:](#reading-2)
    - [Reading (Racket):](#reading-racket-3)
  - [Week 8 - Compilation Overview](#week-8---compilation-overview)
    - [Reading:](#reading-3)
    - [Reading (Racket):](#reading-racket-4)
  - [Week 9 - Regular Expressions & Finite Automata](#week-9---regular-expressions--finite-automata)
    - [Reading:](#reading-4)
    - [Reading (Racket):](#reading-racket-5)
  - [](#)

# Exam 2 - Study Guide

## Racket
In this exam, you are expected to understand and apply the syntax of Racket for defining (naive) recursive functions.

### Reading (Racket):

---

## Week 5 - Recursion
### Reading:
 - Scott 4e - Section 6.2.2, 6.6
 - The Racket Guide - Section 10.3



### Reading (Racket):
- (Tutorial) Quick, The Racket Guide - 2.3

```rkt
map
apply
list-ref
length
append
reversem
member

andmap
ormap
filter, foldl
first, rest
cons,empty
cons?,empty?
```

sh

```rkt
pair?, car, cdr
```

---

### Reading:

### Reading (Racket):

---

## Week 7 - Dynamic Programming
### Reading:

```
> {vector 123 "b"}
'#{vector 123 "b"}

(vector-ref 123 "b"}
list->vector
vector->list
make-vector
vector-append
```

### Reading (Racket):

---

## Week 8 - Compilation Overview
### Reading:

```rkt
(struct point (x y))
(struct point (x y)#:transparent)


(struct-copy point p1 (x 3))
/* subtype */

(struct struct‐id super‐id (field‐id ...))

(struct point (x y))
(struct 3Dpoint point (z))

(struct date ([month #:mutable] [day #:mutable] year))

(struct date (month day year) #:mutable)
(struct point (x y) #:mutable #transparent)
```

### Reading (Racket):

## Week 9 - Regular Expressions & Finite Automata
### Reading:

### Reading (Racket):

---




## 



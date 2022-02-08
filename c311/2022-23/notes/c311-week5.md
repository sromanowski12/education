## Week 5 - Recursion

### Interation & Recursion
Imperative languages: iteration is more natural

Functional languages: recursion is more natural

#### Tail Recursion

Tail-Recursion: no computation that follows the recursive call
- the return value is simply whatever the recursive call returns


Why is Tail Recursion More Efficient?
For tail-recursive functions, dynamically allocated stack unnecessary
- Compoiler can reuse the space belongikng to the current iteration when it makes the recursive call.

**Iterative Implementation of Tail Recursion**


**Transforming Naive Recursion to Tail Recursion**
General transformation is based on *continuation-passing style* (CPS)
- A recursive function can avoid doing work after returning from a recursive call by passing that work into the recursive call, in the form of a continuation

Continuations: generalizations of the notion of nonlocal **gotos**

In low-level terms: a *continuation* cosists of
- a code address,
- a referencing environment that should be established o(or restored) when jumping to that address
- a reference to another continuation that represents what to do in the event of a subsequent subroutine return.

### Continuations

In high-level, a _continuation_ is an abstraction that captures a context ikn which execution might continue.

**call-with-current-continuation** (or **call/cc**)
- The **call/cc** function
  - takes a single argument f, which is itself a function of one argument
  - calls f, a parameter as argument a continutation c that captures the current program counter, referencing environment, and stack backtrace
  - At any point in the future, f can call c, passing a value v. The call will return v into c's captured context, as if it had been returned by the original call to call/cc
  

  ### Function `call/cc` in Racket

```racket
> [call/cc (lambda (c) 0)]
0
> [call/cc (lambda (c) 4)]
4
> [call/cc (lambda (c) (c7))]
7
> (+ 1 (+ 2 [call/cc (lambda (c) (c 7))]))
10
```

```racket
> (+ 1 (+ 2 [call/cc (lambda (c) 4)]))
7
> (define saved-c #f)
> (+ 1 (+ 2 [call/cc (lambda (c))
                        (set! saved-c c)
                        4)]))
7
> (saved-c 0)
3
> (saved-c 4)
7
> (+ 3 (saved-c 4))
```

- The continuation captured by `call/cc` is determined at run time, not compile time

**Definition of factorial**
n! = 1 * 2 * 3 * ... * n
   = n * (n 1)

### Transforming to Tail Recursion using CPS

We can automatically transform any recursivr function to a tail-recursive function using continuation-passing stye (CPS). 
- By converting every function in direct style to CPS style

A function written in CPS takes an extra argument: an explicit "continuation" i.e. a function of one argument
- When the CPS function has computed its result value, it "returns" it by calling the continuation  function of primitive functions =, - , *
- CPS versions of primitive functions =, -, and *
```racket
(define (=& x y c) (c (= x y)))
(define (-& x y c) (c (- x y)))
(define (*& x y c) (c (* x y)))
```

```racket
(define (factorial n)
 (if (= n 0)
 1
 (* n (factorial (- n 1)))))
```

```racket
(define (factorial& n c)            ; c is a continuation
 (=& n 0 (lambda (b)
        (if b                       ; growing continuation
            (c 1)                   ; in the recursive call
            (-& n 1 (lambda nm1)
                (factorial& nm1 (lambda (f)
                    (*& n f c))))))))
```

- To call a procedure written in CPS, need to provide a continuation that will receive the result computed by the CPS procedure

```racket
> (factorial& 3 [lambda (x) (display x)])
6
```

### Special Transformations to Tail Recursion

- Not based on continuation passing; Use an "accumulating" parameter

```racket
(define (sum f low high)
  (if (= low high)
        (f low)                              ; then part
        (+ (f low) (sum f (+ low 1) high)))) ; else part
```

```racket
(define (sum f low high subtotal)
    (if (= low high)
        (+ subtotal (f low))
        (sum f (+ low 1) high (+ subtotal (f low)))))

> (sum (lambda (x) (* 2 x)) 1 5 0)
30
```

- Hide subtotal parameter in an auxiliary, "helper" function

```racket
(define (sum f low high)
    (letrec ([sum-helper
        (lambda (low subtotal)
            (let ([new_subtotal (+ subtotal (f low))])
                (if (= low high)
                new_subtotal
                (sum-helper (+ low 1) new_subtotal))))])
        (sum-helper low 0)))

> (sum (lambda (x) (* 2 x)) 1 5)
30
```
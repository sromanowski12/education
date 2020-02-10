## **Class Notes - 2/11/2020**

**Lambda Expressions**
- anonymous functions
- they describe functions by directly defining their behavior
- **lambda calculus**
  - too to sutdy functions, apps, recursion
  - **meta-language** -for formal definition of functions

f(x) = 2x - 1

$\lambda$

(expression) 7 means the previous function applied to the constant 7

f(x, y) = x % y
- describes a function with two variables
x = 5
f_5(y) = 5 % y
F(x)=f_x, f_x(y) = x % y
- x is a constant

F - function of first order
f_x - of order zero

**Arithmetic & Lambda Calculus**
- **Church numerals**: defines the numerals as the n-th compositoin of a function with itself
  - 0: "" Zero(f, x) = x
    - function that two parameters, one a function and one a variable
  - 1: "" One(f, x) = f(x)
    - Function One with two parameters, one a function and one a variable, returns f(x)
  - 2: "" Two(f, x) = f(f(x))
  - n+1: "" Nplus

**Identity function**
f(x) = x

order zero ?
f(x)=x^2
f(f(x)) = x^4
Three(f, x)
- f(f(f(x))) = x^8 <=> x^2*n

Each natural number is represented as a function of two paramters, function and number

**Operations**
n+m:
- NplusM(f, x) = N(f, M(f, x)) = PLUS(n, m , f, x)
Ex. 2 + 3

(2f)(3 f x)=?

f(f(f(f(f(x))))) = (5f)(x)

n*m
- NtimesM(f, x) = N(M(f), x) = MULT(n, m, f, x)

Ex. 3 * 2
- g(x) = f(f(x))
  - g(g(g(x))) = f(f(f(f(f(f(x)))))) = 6(f, x)

SUCC(N, f, x) = f(N(f, x))
PLUS
MULT

**Predicates in Lambda Calculus**
TRUE: "" T(x, y) = x
FALSE: "" F(x, y) = y
AND: "" AND(p, q) = p(q, F)
OR: "" OR(p, q) = p(T, q)
- Returns p, applied to T and q
NOT: "" NOT(p) = p(F, T)
- Returns the opposite
- Takes one parameter
IFTHENELSE: "" 
- p stands for something T or F

**AND**
Ex.
p(q, F) = 
T(T, F) = T
- Returns the first parameter

Ex.
p(q, F)
F(T, F) = F
- Returns the second parameter

**OR**
Ex.
T - p
F - q
OR(T, F) = T(T, F)
- Returns the first parameter

OR(F, T) = F(T, T) = T
- Returns the second parameter

**Computability**
- A function is called computable if there exists an algorithm to compute it
- Church-Turing thesis - states any computable function can be computed by a Turing machine with unlimited time/storage and the other way around
- A function can be defined as computable if and only if there exists a lambda expression f such that for every pair of x, y in N, F(x) = y if and only if fx == y, where x and y are the Church numerals corresponding to x and y

**Incompleteness Theorem**
Gödel used the Church numerals to prove his Incompleteness Theorem (1931).
- **first theorem states:** no natural numbers system is capable of proving all statements that are true using only the axioms of the system and logic deduction
- **second theorem states:** such a system cannot demonstrate consistency
- This theorem shows that logic alone is not enough to build a self-contained theory
- Also shows that to properly understand a system you need a frame of reference bigger than it

**Lambda Expressions in Lisp**
```lisp
(lambda (arg-variables...) 
  [documentation-string] 
  [interactive-declaration] 
  body-forms...) 
```

Ex.
```lisp
(lambda (x y) (* x y))
((lambda (x y) (* x y)) 2 3)
6
```
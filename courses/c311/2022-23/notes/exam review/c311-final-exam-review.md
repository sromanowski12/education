# Final Exam Review


## Week 5 - Racket: Lists, Iteration, Recursion
### Reading
- (Tutorial) Quick: An Introduction to Racket w/ Pictures
  - Part 8 - Lists
- The Racket Guide
  - 2.3 - Lists, Iteration, and Recursion

#### `list` Function
```racket
(list "red" "green" "blue")

```


#### `map` Function
```racket
> (map (lambda (x) (* x 2))
       (list 2 4 6 8))
'(4 8 12 16)

> (map sqrt (list 1 4 9 16))
'(1 2 3 4)

> (map (lambda (i)
         (string-append i "!"))
       (list "peanuts" "popcorn" "crackerjack"))
'("peanuts!" "popcorn!" "crackerjack!")


```

#### `apply` Function
The apply function offers a way around this restriction. It takes a function and a list argument, and it applies the function to the values in the list:
```racket
> (apply + '(1 2 3))
6

> (apply + 1 2 '(3))
6

> (apply + '())
0

> (apply sort (list (list '(2) '(1)) <) #:key car)
'((1) (2))

(define (avg lst)
  (/ (apply + lst) (length lst)))
 

> (avg '(1 2 3))
2
```


## Week 7 - Racket: Pairs, Nested Lists, and Vectors
### Reading
- The Racket Guide
  - 2.4 - Pairs, Lists, and Racket Syntax
  - 3.9 - Vectors
- The Racket Reference
  - 4.12 - Vectors

## Week 8 - Racket: struct
### Reading
- The Racket Guide
  - Part 5 - Programmer-Defined Datatypes

## Week 9 - Regular Expressions & Finite Automata
### Reading
- Scott 4e - Section 2.1.1 - Tokens & Regular Expressions
- Scott 4e - Section 2.2.1 - Generating a Finite Automata
- Scott 4e - Section 2.4.1 - Finite Automata (on the companion side)



## Week 11 - Scanning
1. List the tasks/responsibilities of a scanner
2. Describe the ad hoc approach to scanning
- What are the advantages of the ad hoc scanners?
- Which type of compilers use ad hoc scanners?
3. Describe the DFA approach to scanning
- What are the advantages of the DFA approach to scanning?
- When is the DFA approach often used?
4. How to convert a nondeterministic finite automation (NFA) to a DFA
5. Describe two approach to representing a DFA
6. Describe table-driven scanner works

### Reading
- Scott 4e - Section 2.2


## Week 11 - Racket: Regular Expressions
### Reading
- The Racket Guide
  - Part 9 - Regular Expressions
    - 9.1 - Writing Regexp patterns
    - 9.2 - Matching Regexp patterns
    - 9.3 - Basic Assertions
    - 9.4 - Characters and Character Classes
    - 9.5 - Quantifiers
    - 9.6 - Clusters
    - 9.7 - Alternation
- The Racket Reference
  - 4.8 - Regular Expressions

## Week 13 - Context-Free Grammers (CFGs) & Parsers
1. - 
2. - 
3. - 
4. - 
5. - 

### Reading
- Scott 4e - Section 2.1.2, 2.1.3
- Scott 4e - Section 2.3 (not 2.3.1 and 2.3.2)

## Week 14 - LL(1) Parsers
1. - 
2. - 
3. - 
4. - 
5. - 

### Reading
- Scott 4e - Section 2.3.1
- Scott 4e - Section 2.3.3

## Week 15 - LR(1) Parsers

### Reading
- Scott 4e - Section 2.3.4
- Scott 4e - Section 2.4.2 - Push-down Automata (on the companion side)

## Racket
1. -
2. -
3. -
4. -
5. -
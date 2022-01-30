Function Calls as Procedure Applications
- Function calls we have seen are prcedure applications
- It's syntax is 
```
(<function_name> <argument_expr>*)
```

Examples
```racket
(circle 10)
(hc-append (circle 10) (rectangle 15 25))
(string-append "rope" "twine" "yarn)
```

Functions Are Values
- Instead of calling `circle` as a function, try evaluating it as an expression

```
> circle
#<procedure:circle>
```
- The identifier `circle` is bound to a function

- Can define functions that accept other functions as arguments

General Function Calls
- The 1st expression in a function call doesn't be to be an identifier for function name, but any expression that evaluates toa function values

```
(define (double v)
    ((if (string? v) string-append +) v v))

> (double "mnah")
"mnahmnah"
> (double 5)
10
```

- Syntactically, the 1st expression in a function call could be a number
- But that leads to an error since a number is not a function

```
> (1 2 3 4)
```

Anonymous `lambda` Function
- It would be tedious if you had to name all of your functions 
  - When calling a function that accepts a function argument, the argument function often isn't needed anywhere else
  - Having to write down the function via `define` would be a hassle, because you have to make up a name and find a place to put the function definition

- Instead you can use `lambda`, which creates an anonymous function
  
- Evaluating a `lambda` form by itself produces a function:
```racket
> (lambda (n) (filled-rectangle n n))
#<procedure>
```

- A `define` form for a function is really shorthand for a simple `define` using `lambda` as the value

```racket
(define series
    (lambda (mk)
        (hc-append 4 (mk 5) (mk 10) (mk 20))))
```

- A `lambda` form can also accept zero or more than one arguments

Optional Arguments in `lambda` Form
- An argumnet of the form `[arg-id default-expr]` is optional
  - When the argument is not supplied in a call, default-expr is the default value
  - The default-expr can refer to any preceding arg-id, and every following argument-id must have a default as well. 
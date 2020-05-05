# C311 Programming Languages
**Final Spring 2020**

**Study Guide** 

## **Programming Language Intro.**

**Languages Categories**

- **Declarative vs. Imperative**
  - **Declarative Language**: describe things that exist in the program and their properties. They describe what you want accomplished.
  - **Imperative Language**: tell the computer what to do and how you want things done.
- **Declarative Languages**
  - **Functional**: computational model based on functions, highly recursive. 
    - Defining expressions that have values and side effects.
    - Inspired from lambda calculus
  - **Dataflow**: based on flow of information (tokens) between functional nodes
  - **Logic**: using predicate logic to find a value that satisfies some predicate based on declared facts
  - **Template-Based**: XML, XSLT
- **Imperative Languages**
  - **Von Neumann**: based on modification of variables
  - **Scripting**: higher level language to handle components that were designed independently.
  - **Object-Oriented**: based on the idea of classes, objects, & methods

**Compilation vs. Interpretation**

- **Compiler**: translates a program into an executable that can be run independently
- **Interpreter**: translates pieces of a program at a time, executes them, then moves to the next unit of code

The compilation results in faster programs, while the interpretation is more flexible and easier to debug

**Compilation Steps**

- **Precompiler**: in some cases (C - C++) performs user-specified code transformations
- **Scanner**: (lexical analysis) - takes in simple text, & produces language tokens
- **Parser**: (syntactical analysis) - organizes the tokens in a parse tree
- **Semantic Analysis**: generates intermediate code
- **Target Code Generation**: translates the intermediate code into machine language


## **First Class Objects**

## **Scope**

- **Scope of a Binding**
- **Scope**
- **Referencing Environment**
- **Binding Rules**
  
## **Recursion**

## **Formal Grammars**

## **Lisp**

- Conditionals (if and cond)
- Loops (while, dolist, dotimes)
- List Manipulation (car, cdr, elt, push, pop)
- Symbols, Symbol-Name, Symbol-Func
- Lambda Expressions
- Function-Calling Functions (mapc, mapcar, funcall, apply)

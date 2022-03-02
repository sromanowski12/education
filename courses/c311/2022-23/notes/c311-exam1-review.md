## Exam #1 - Review

**CSCI-C311 - Programming Languages**

---
### **Language Classification (Week 1)**
1. Distinguish between declarative and imperative languages

**Declarative Languages**
- Focus on what the computer is to do
- "high-level": more in tune with programmers' point of view, less w/ the implementor's point of view. 

Any relational or functional language - which describe relationships between variables in  terms of functions or interference rules, and the language executor (interpreter or compiler) applies some fixed algorithm to these relations to produce a result.

**Imperative Languages**
- Focus on how the computer is to do it
- Predominate mainly for performance reason

A programming language in which programs largely consist of a series of commands to assign values to objects
Specify explicit manipulation of the computer's internal state

---

2. Describe characteristics of von Neumann subfamily of imperatove languages and the relationship between imperative languages and the von Neumann computer architecture

**Von Neumann Languages** (Fortran, Ada, Pascal, Basic, C,…)
- One of the most familiar and widely used
- Include all languages in which the basic means of computation is the modification of variables
- Based on statements such as assignment that influence subsequent computation via the side effect of changing the value of memory
- Influenced by the well-known computer architecture: von Neumann
  - Developed by John von Neumann
  - Called _stored program computing_

The **von Neumann Computer Architecture**
- Data and programs stored in memory that is sperate from CPU
- Instructions and data are piped from memory to CPU
- CPU repeatedly fetches, interprets, and updates
- Basis for imperative languages
  - Variable model memory cells
  - Assignment statements model piping
  - Iteration is efficient

---
3. Describe characteristics of the scripting subfamily of imperative languages

**Scripting Language**
- Emphasis on coordinating (or "gluing together") components drawn from surround context
- Several were developed for specific purposes 
  - csh and bash are the input languages of job control (shell) programs
  - PHP and JavaScript are intended for generating dynamic web content
  - Lua is intended for extension/embedded settings (in the gaming industry)
  - Perl, Python, & Ruby are more deliberately general purpose
- Most emphasis on rapid prototyping, with a bias toward ease of expression over speed of execution
  - Good for writing programs fast, but not for writing fast programs

---

4. Describe the characteristics of functional languages and give some examples

**Function Language**:
- Employ a computational model based on the recursive definition of functions
  - Inspired by lambda calculus, developed by Alonzo Church in 1930s
- A program is considered a function from inputs to outputs, defined in terms of simpler functions through a process of refinement
- Examples:
  - Lisp: the original functional language
  - ML: functional language with "Pascal-like" syntax
  - Haskell: the leading purely functional language

---

5. Give examples of languages that can be both functional and imperative

---

### **Compilation vs. Interpretation (Week 2)**
1. Pure compilation and pure interpretation

**Pure Compilation**
Compilation and execution of a program at the highest level of abstraction
- The compiler translates the high-level source program into an equivalent target program (typically in machine language) and then goes away.
- At some arbitrary later time, the user tells the operating system to run the target program.
- The compiler is the locus of control during compilation
- The target program is the locus of control during its own execution
- The compiler itself is a machine language program
  - Presumably created by compiling some other high-level program
  - When written to a file in a format understood by the operating system, machine language is commonly known as object code

**Pure Interpretation**
**Interpretation**: alternative style of implementation for high-level language
- Interpreter stays around for the execution of the program
- Interpreter is the locus of control during execution
- Interpreter implements a virtual machine
  - Whose "machine language" is the high-level programming language
  - The interpreter reads statements in that language more or less one statement at a time, executing as it goes along.

---

2. Compare advantages/disadvantages of compilation and interpreation
   **Interpretation**:
- Greater flexibility
- Better diagnostics (error messages)

   **Compilation**:
- Better performance

---

3. What is the difference between a compiler and a preprcoessor
- **Compilers**:
  - Attempt to "understand" their source
  - Hide further steps when errors occur
- **Preprocessors**
  - Do not attempt to understand the source
Often let errors through
---

4. Describe the following implementation strategies:
   1. **Library of Routines & Linking**
   - Compiler uses a linker program to merge the appropriate library of subroutines into the final program.
   - Examples of subroutines: math functions (sin, cos, leg, etc), I/O
   2. **Post-compilation Assembly**
   - Facilitates debugging (assembly language is easier for people to read)
   - Isolates the compiler from mandated changes in the format of machine language files
     - Only assembler must be changed, and it is shared by many compilers
   3. **The C Preprocessor**
   - Preprocessor first removes comments and expands macros
   - Conditional Compilation: Preprocessor can delete portions of code,
     - Which allows several versions of a program to be built from the same source
   4. **Source-to-Source Translation (C++)**
   - C++ implementations based on the early AT&T compiler generated an intermediate program in C, instead of an assembly language. 
   - Compiler 1 is not a preprocessor
   5. **Bootstrapping**, w/ example in Pascal
   - Start w/ a simple implementation (an interpreter)
   - Use a simple implementation to build progressively more sophisticated versions

      **Bootstrapping Example** - 
   - Early Pascal compilers were built around a set of tools
     - A Pascal to P-code compiler, written in Pascal
     - Same Pascal to P-code compiler, already translated into P-code
     - A P-code interpreter, written in Pascal
   
      **Bootstrapping Example** - 
      Faster implementation of Pascal compiler

---

### **Functional Programming Features (Week 3)**

1. Describe classification of values/objects and its examples

| x                   | Can be passed as a parameter | Can be returned from a function | Can be assigned into a variable |
| ------------------- | ---------------------------- | ------------------------------- | ------------------------------- |
| First-class values  | TRUE                         | TRUE                            | TRUE                            |
| Second-class values | TRUE                         |                                 |                                 |
| Third-class values  | FALSE                        |                                 |                                 |

- A value can have different statuses in different programming languages
  - Values of simple types are first-class in most programming languages
  - Labels (in languages that have them)
     - Usually third-class values
  - Functions
     - First-class for all functional languages & most scripting languages

   First-Class Objects/Values
  - Can be used in programs without restriction (when compared to other kinds of objects in the same language)
  - Support all the operations generally available to other objects:
     - Being passed as an argument
     - Being returns from a function
     - Being assigned to (storable in) a variable (in language with side effects)
  being expressible as an anonymous literal value
     - Being constructible at runtime
     - Being storable in data structures
     - Being comparable for equality with other entities
     - Having an intrinsic identity (independent of any given name)

---

2. Describe how strings in Java satisfy criteria of first-class objects
Java strings are first-class objects. Strings as objects provide the following advantages:
- The manner in which you obtain strings and elements of strings is consistent across all strings and all systems
- Since the programming interface for the String and StringBuffer classes is well-defined, Java Strings function predictably every time
- The String and StringBuffer class does extensive runtime checking for boundary conditions and catches errors for you

   Java strings are first-class objects deriving from the String class or the StringBuffer class. This makes finding and fixing an entire class of common and frustrating errors much easier

---

3. Which criteria of first-class objects are not satisfied by arrays in C++? Explain why not
- Can't return C++ arrays from a function.

---

4. Which languages support first class functions?
	A programming language supports first class functions if it allows function to be first class objects
	- Supported by:
		- All functional languages: Lisp, Scheme, ML
		- C#
		- Many scripting languages: Python, Perl, JavaScript
	- Partially supported by other imperative languages
		- Fortran, C, C++
- Many don't support anonymous function definitions

---

5. Describe how to use lambda expression in Java (and how to use interfaces and classes in Java)

---

6. What are lambda expressions in lambda calculus? Write lambda expressions in lambda calculus that describe indentity function, constant functions, arithmetic functions, and function application.

---

7. What are necessary and sufficient conditions for a function to be called computable, bases on Church-Turing thesis?

---

8. What is a higher-order function? Describe common uses (including currying) of higher-order functions. Explain why higher order functions aren't common in imperative languages?

---
### **Scope & Binding (Week 4)**

1. What is binding time? What is static binding? What is dynamic binding?

---

2. Describe relationship between binding lifetime and object lifetime.

---

3. Describe storage allocation mechanisms for objects. Give examples of static objects, stack objects, and heap objects.

---

4. Describe statuic scope rules. Explain the effect of static scope rules in the output of a program.

---

5. Describe dynamic scope rules. How and where dynamic scope rules are used?

---

6. Describe how scoping is implemented.

---

### **Racket**

1. Simple values, numbers, strings, booleans
2. Defining functions
3. Conditionals: if, and, or, and cond
4. lambda expressions
5. local bindings using let and let* form
6. Pre-defined functions: strings?, string-prefix?, string-suffix?
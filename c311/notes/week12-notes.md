### **Compilation Steps**
- _**Precompiler**_: in some cases (C - C++) performs user-specified code transformations
- _**Scanner**_: (lexical analysis) - takes in simple text, produces language tokens
- _**Parser**_: (syntactical analysis) - organizes the tokens in a parse tree
- _**Semantic Analysis**_: generates intermediate code
- _**Target Code Generation**_: translates the intermediate code into machine language

### **Formal Grammars**
- Abstract structures that describe a language precisely
- Composed of a set of rules that can be used to identify correct / incorrect strings of tokens in a language
- Used in particular during compilation, mostly in the syntactic analysis phase (parsing) and in part during the semantic analysis phase (translation to machine language)
- Terminal Symbol
- Non-Terminal Symbol

#### **Formal Definition**
- Let **L** be a finite set (alphabet, terminal symbols)
- & **N** be a set of non-terminal symbols
- _**Goal of Grammar**_: generate all possible strings over the alphabet L that are syntactically correct in the language
- This is done by a set of **production rules**.

#### **Production Rules**
- Of the form:
  
  $s_1NTs_2=>s_3$

- where NT is any non-terminal symbol &
- s_1, s_2, s_3 are strings made up of any combination of temrinal and non-terminal symbols
  - we say that the rule _**expands**_ the symbol NT.


### **Types of Grammars**
#### **Type 0**
#### **Type 1**
#### **Type 2**
#### **Type 3**

I => letter J

J => letter J

J => digit J

J => _ J

J => - J

J => e

Condense the rules:

J => { _ | - } J

where e is the empty string.



**Table Driven Scanner**
If the grammar is equivalen to a DFA, then we can organize the rules in a table:

**HW 11**

Ex. 1: FSM to grammar
- a. Write (as a comment in the Lisp file) as a formal grammar converted from the following finite state machine:

![alt text](sicp.jpeg)

# Chapter 1

## The Elements of Programming

- [Chapter 1](#chapter-1)
  - [The Elements of Programming](#the-elements-of-programming)
      - [Forming complex ideas](#forming-complex-ideas)
      - [The Substitution Model for Procedure Application](#the-substitution-model-for-procedure-application)
      - [Declarative vs. Imperative knowledge](#declarative-vs-imperative-knowledge)

---

#### Forming complex ideas

Powerful languages provide three mechanisms to combine simple ideas to form more complex ideas :

>**primitive expressions**, which represent the simplest entities the language is concerned with,
>**means of combination**, by which compound elements are built from simpler ones, and
>**means of abstraction**, by which compound elements can be named and manipulated as units.

.

#### The Substitution Model for Procedure Application

**Applicative-order evaluation** :
Evaluate operands then substitute their values in the operator procedure body.


```scheme
;; evaluate arguments 
(sum-of-squares (+ a 1) (* a 2))

(sum-of-squares (+ 5 1) (* 5 2))

;; substitute 
(+ (* 6 6) (* 10 10))

(+ 36 100)

136
```


**Normal-order evaluation** :
Fully expand to primitive values, then reduce.


```scheme
;; expands
(sum-of-squares (+ 5 1) (* 5 2))

(+ (square (+ 5 1)) 
   (square (* 5 2)))

;; (a drawback is that here we duplicate computations)
(+ (* (+ 5 1) (+ 5 1)) 
   (* (* 5 2) (* 5 2)))

;; reduces
(+ (* 6 6) 
   (* 10 10))

(+ 36 100)

136
```

#### Declarative vs. Imperative knowledge 

The contrast between function and procedure is a reflection of the general distinction between describing properties of things and describing how to do things, or, as it is sometimes referred to, the distinction between declarative knowledge and imperative knowledge. In mathematics we are usually concerned with declarative (what is) descriptions, whereas in computer science we are usually concerned with imperative (how to) descriptions.

#### Procedures as Black-Box Abstractions

**Free vs. bound variables** 

**Lexical scoping**
Lexical scoping dictates that free variables in a procedure are taken to refer to bindings made by enclosing procedure definitions; that is, they are looked up in the environment in which the procedure was defined.

Here,lexical scoping and the block structure allows to hide away internal `sqrt` procedures, and simplify formal parameters of sub-procedures as some of them (eg. `x`) are available in the lexical closure.  


> ( ? ) But isn't this block structure an obstacle to unit test the sub-procedures?   
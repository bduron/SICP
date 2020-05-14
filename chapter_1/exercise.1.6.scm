#lang racket

(require racket/trace)
(#%require "utils.scm")

;; Exercise 1.6: 
; Alyssa P. Hacker doesn’t see why if needs to be provided as a special form. 
; “Why can’t I just define it as an ordinary procedure in terms of cond?” she asks. 
; Alyssa’s friend Eva Lu Ator claims this can indeed be done, and she defines a new version of if:

(define (new-if predicate 
                then-clause 
                else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

; What happens when Alyssa attempts to use this to compute square roots? Explain.


;; ANSWER
(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x) 
  (new-if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (sqrt x) 
  (sqrt-iter 1.0 x))

(sqrt 16)
; => Recursion call stack limit exceeded


;; Small helper to isolate the use case
(define (display-rec x)
  (if (< x 10) 
    (display-rec (+ x 1))
    (display x)))

(define (new-display-rec x)
    (cond 
      ((< x 10) (display-rec (+ x 1)))
      (else (display x))))
        
(display-rec 1)
(new-display-rec 1)

;; What happens is that 'if' is a special form, thus the interpreter doesn't evaluate
; the else clause if the predicate is truthy
; hower the `new-if` is not a special form and the applicative order of evaluation tries to 
; evaluate the else clause even if the predicate is truthy.
; See exercise 1.5 for related explanations

#lang sicp

(#%require "utils.scm")

;; Exercise 1.1: 
; Below is a sequence of expressions. 
; What is the result printed by the interpreter in response to each expression? 
; Assume that the sequence is to be evaluated in the order in which it is presented.

(define a 3) 
(define b (+ a 1))

(assert (+ 5 3 4)           12)
(assert (- 9 1)             8)
(assert (/ 6 2)             3)
(assert (+ (* 2 4) (- 4 6)) 6)
(assert (+ a b (* a b))     19)
(assert (= a b)             #f)

(assert 
    (if 
        (and (> b a) (< b (* a b)))
        b 
        a)                  
                            b)

(assert 
    (cond 
        ((= a 4) 6)
        ((= b 4) (+ 6 7 a))
        (else 25)) 
                            16)

(assert 
    (+ 2 (if (> b a) b a))
                            6)

(assert 
    (* 
        (cond 
            ((> a b) a)
            ((< a b) b)
            (else -1))
        (+ a 1))
                            16)




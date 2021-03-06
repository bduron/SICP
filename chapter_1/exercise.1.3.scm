#lang racket

(require racket/trace)
(#%require "utils.scm")

;; Exercise 1.3: 
; Define a procedure that takes three numbers as arguments and returns 
; the sum of the squares of the two larger numbers.

(define (square x) 
    (* x x))

(define (max a b) 
    (if (>= a b) a b))    

(define (sum-square x y) 
    (+ (square x) (square y)))    

(define (sum-two-largest a b c) 
    (cond 
        ((and (>= a c) (>= b c)) (sum-square a b))
        ((and (>= a b) (>= c b)) (sum-square a c))
        ((and (>= b a) (>= c a)) (sum-square b c))))

(define (sum-two-largest-alt a b c) 
    (sum-square (max a b) (max b c)))
    

(assert (square 2) 4)
(assert (sum-square 3 4) 25)
(assert (sum-two-largest-alt 1 2 3) 13)
(assert (sum-two-largest-alt 3 2 1) 13)
(assert (sum-two-largest-alt 2 2 2) 8)
(assert (sum-two-largest-alt 2 1 2) 8)
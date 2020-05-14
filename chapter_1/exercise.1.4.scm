#lang racket

(require racket/trace)
(#%require "utils.scm")

;; Exercise 1.4: 
; Observe that our model of evaluation allows for combinations whose operators are compound expressions. 
; Use this observation to describe the behavior of the following procedure:

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

;; ANSWER
; If b > 0 the operator is substituted by '+'
; Else the operator is substituted by '-' 
; This is an instance of a higher order function
; which takes can take a function as an argument 
; and return a function as a result

(assert (a-plus-abs-b 1 (- 2))  3)
(assert (a-plus-abs-b 1 2)      3)
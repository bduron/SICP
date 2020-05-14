#lang racket

(require racket/trace)
(#%require "utils.scm")

;; Exercise 1.5: 
; Ben Bitdiddle has invented a test to determine whether the interpreter he is faced 
; with is using applicative-order evaluation or normal-order evaluation. 
; He defines the following two procedures:

(define (p) (p))

(define (test x y) 
  (if (= x 0) 
      0 
      y))

; Then he evaluates the expression

(test 0 (p))

; What behavior will Ben observe with an interpreter that uses applicative-order evaluation? 
; What behavior will he observe with an interpreter that uses normal-order evaluation? 
; Explain your answer. 
; (Assume that the evaluation rule for the special form if is the same whether the interpreter 
; is using normal or applicative order: The predicate expression is evaluated first, 
; and the result determines whether to evaluate the consequent or the alternative expression.)


;; ANSWER

; Applicative-order evaluation :
; The arguments needs to be evaluated before they can be used (substitued) in the calling procedure body.
; Thus this will lead to an infinite recursion.

; Normal-order evaluation :
; The body of the calling procedure is substituted before the arguments are evaluated. 
; As the evaluation of the arguments are demand-driven (lazy evaluation) 
; and the function (p) is in an unreachable conditional branch, the function will return 0
; and won't evaluate (p)



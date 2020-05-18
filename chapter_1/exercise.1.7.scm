#lang racket

(require racket/trace)
(#%require "utils.scm")

;; Exercise 1.7: 
; An alternative strategy for implementing good-enough? is to watch how guess changes from one 
; iteration to the next and to stop when the change is a very small fraction of the guess. 
; Design a square-root procedure that uses this kind of end test. 
; Does this work better for small and large numbers?


;; ANSWER better
(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (= (improve guess x) guess))

(define (sqrt-iter guess x) 
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (sqrt x) 
  (sqrt-iter 1.0 x))


; This way we can go to the limits of the precision system

;; A risk is to overflow the number (long?) value of guess when we square it to compare it against the input.
; For instance is we ask for the sqrt of the maximum value that can fit in a number, and the square of the guess produces a value striclty superior
; to the number overflow limit.


;; ANSWER naive 
; (define (improve guess x)
;   (average guess (/ x guess)))

; (define (good-enough? guess previous-guess)
;   (< (abs (- guess previous-guess)) 0.0001))

; (define (sqrt-iter guess previous-guess x) 
;   (if (good-enough? guess previous-guess)
;       guess
;       (sqrt-iter (improve guess x) guess x)))

; (define (sqrt x) 
;   (sqrt-iter 1.0 0 x))

(sqrt 16)           ; => 16
(sqrt 15241383936)  ; => 123456
(sqrt 0.0001)       ; => 0.01
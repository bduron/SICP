#lang racket

(require racket/trace)
(#%require "utils.scm")

;; Exercise 1.8: 
; Newton’s method for cube roots is based on the fact that if y is an approximation to 
; the cube root of x, then a better approximation is given by the value : 

; `(x/y^2 + 2y) / 3.`

; Use this formula to implement a cube-root procedure analogous to the square-root procedure.


;; ANSWER
; Here we begin to abstract the improvement function and pass it as an argument to make 
; the Newton root-finding function more generic. 

(define (cube-improve guess x) 
  (/ 
    (+ (/ x (square guess)) (* 2 guess))
    3))

(define (square-improve guess x) 
  (average guess (/ x guess)))

(define (improve guess x root-func)
  (root-func guess x))

(define (good-enough? guess x root-func)
  (= (improve guess x root-func) guess))

(define (find-root-iter guess x root-func) 
  (if (good-enough? guess x root-func)
      guess
      (find-root-iter (improve guess x root-func) x root-func)))

(define (find-root x root-func) 
  (find-root-iter 1.0 x root-func))


(find-root (cube 16) cube-improve)         ; => 16
(find-root (cube 1) cube-improve)          ; => 1

(find-root (square 16) square-improve)     ; => 16
(find-root (square 1) square-improve)      ; => 1
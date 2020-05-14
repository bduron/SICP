#lang racket

;; Maths
(define (square x) (* x x))
(define (max a b) 
    (if (>= a b) a b))    
(define (average x y) 
  (/ (+ x y) 2))

;; Tests
(define (assert a b) (eq? a b))
(define true #t)
(define false #f)


(provide 
    ;; Maths
    square
    average
    max

    ;; Tests
    assert
    true
    false)
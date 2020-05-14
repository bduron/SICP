#lang racket

;; Maths
(define (square x) (* x x))
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

    ;; Tests
    assert
    true
    false)
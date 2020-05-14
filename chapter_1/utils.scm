#lang racket

(define (assert a b) (eq? a b))
(define (add a b) (+ a b))
(define true #t)
(define false #f)

(provide 
    assert
    true
    false
    add)
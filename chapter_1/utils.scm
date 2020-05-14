#lang racket

(define (assert a b) (= a b))
(define constant (+ 5 5))
(define (add a b) (+ a b))
(display 'lol)

(provide assert)
(provide constant)
(provide add)
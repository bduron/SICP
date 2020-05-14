## How to import modules

The file you want to import must be a racket file : 


```scheme
;; utils.scm
#lang racket

(define example 1)
(provide example)
```

```scheme
;; consumer.scm
#lang sicp

(#%require "utils.scm")

example
;; => 1
```

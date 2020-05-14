<img src="racket-logo.png" alt="drawing" width="200"/>


# Chapters 
[Chapter 1](chapter_1/chapter_1.md)    

---

# Project setup 
- [Chapters](#chapters)
- [Project setup](#project-setup)
  - [How to import modules](#how-to-import-modules)
  - [How to improve the MIT-Scheme interpreter](#how-to-improve-the-mit-scheme-interpreter)

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

## How to improve the MIT-Scheme interpreter

```bash
rlwrap -r -c -f "$HOME"/scheme_completion.txt scheme
```

[More on Stackoverflow answer](https://stackoverflow.com/questions/11908746/mit-scheme-repl-with-command-line-history-and-tab-completion)

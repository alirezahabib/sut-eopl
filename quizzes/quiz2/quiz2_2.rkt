#lang racket

(define (rotate l n)
  (cond
    [(or (null? l) (zero? n) (not (list? l))) l]
    [(> n 0) (rotate (cons (car (reverse l)) (reverse (cdr (reverse l)))) (- n 1))]
    [else (rotate (append (cdr l) (list (car l))) (+ n 1))]))

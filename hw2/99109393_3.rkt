#lang racket

(define (main a b l)
  (if (null? l) null
  (cons
   (cond
     [(eqv? (car l) a) b]
     [(eqv? (car l) b) a]
     [(list? (car l)) (main a b (car l))]
     [else (car l)])
   (main a b (cdr l)))))

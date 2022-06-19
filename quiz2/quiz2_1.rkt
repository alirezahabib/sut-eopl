#lang racket

(define (flatten l)
  (cond
    [(null? l) null]
    [(list? l) (append (flatten (car l)) (flatten (cdr l)))]
    [else (list l)]))

(define (flatmap l func)
  (map func (flatten l)))

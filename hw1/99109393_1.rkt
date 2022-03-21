#lang racket

(define (main l n)
    (sort (divisors l n) <))

(define (divisors l n)
  (if (null? l) null
      (append
       (cond
         [(null? (car l)) null]
         [(list? (car l)) (divisors (car l) n)]
         [else (if (zero? (remainder (car l) n)) (list (car l)) null)])
       (divisors (cdr l) n))))
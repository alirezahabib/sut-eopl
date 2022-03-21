#lang racket

(define (powerset l)
  (if (null? l) '(())
      (append (powerset (cdr l))
              (insert (car l) (powerset (cdr l))))))

(define (insert n l)
  (if (null? l) null
      (append (list (cons n (car l))) (insert n (cdr l)))))
      
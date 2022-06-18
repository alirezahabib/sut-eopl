#lang racket

(define (powerset l)
  (if (null? l) '(())
      (append (powerset (cdr l))
              (insert (car l) (powerset (cdr l))))))

(define (insert n l)
  (map (λ (x) (cons n x)) l))

(define (insert2 n l) ; not used
  (if (null? l) null
      (append (list (cons n (car l))) (insert n (cdr l)))))

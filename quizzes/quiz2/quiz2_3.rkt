#lang racket

(define (bignum-zero? X)
  (foldr (λ (p q) (and p q)) #t (map zero? X)))


(define (successor X N)
  (cond
    [(null? X) '(1)]
    [(eq? (car X) (- N 1)) (cons 0 (successor (cdr X) N))]
    [else (cons (+ (car X) 1) (cdr X))]))


(define (predecessor X N)
  (cond
    [(null? X) '(-1)]
    [(zero? (car X)) (cons (- N 1) (predecessor (cdr X) N))]
    [else (cons (- (car X) 1) (cdr X))]))

(define (display-bignum X)
  (reverse X))
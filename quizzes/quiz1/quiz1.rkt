#lang racket

(define (merge l1 l2)
  (cond
    [(null? l1) l2]
    [(null? l2) l1]
    [(< (car l1) (car l2)) ; (car l1) is the minimum
     (cons (car l1) (merge (cdr l1) l2))] ; so it is at the begining
    [else ; (car l2) is the minimum
     (cons (car l2) (merge (cdr l2) l1))])) ; 


(define (apply l n) ; f1(f2(f3(x)))
  (if (null? l) n
      ((car l) (apply (cdr l) n)))) ; = f1( f2(f3(x)) )


(define (super-function l)
  (if (null? l)
      (lambda (x) x)
      (lambda (x) ((car l) ((super-function (cdr l)) x)))))
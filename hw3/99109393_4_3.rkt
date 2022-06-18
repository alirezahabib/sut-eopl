#lang racket

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cadr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cadr branch))

(define (total-weight mobile)
  (if (number? mobile) mobile
      (+
       (total-weight (branch-structure (left-branch mobile)))
       (total-weight (branch-structure (right-branch mobile))))))

(define (is-balanced? mobile)
  (eq?
   (* (branch-length (left-branch mobile)) (total-weight (branch-structure (left-branch mobile))))
   (* (branch-length (right-branch mobile)) (total-weight (branch-structure (right-branch mobile))))))
; Our total-weight function returns the input itself if the branch structure is a number (weight)
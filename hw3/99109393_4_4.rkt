#lang racket

; We just have to change the selector functions

(define (make-mobile left right) (cons left right))

(define (make-branch length structure)
  (cons length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cdr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cdr branch))

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

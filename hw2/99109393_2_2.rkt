#lang racket

; The cross-product the problem made up
; which is not a well-defined vector:

(define (main l1 l2)
  (map (lambda (x1) (map (lambda (x2) (* x1 x2)) l2)) l1))

#lang racket

((1 3) (2 2))

B[i j] = A[k i]*A[k j]

(define (dot-prod l1 l2)
  (apply + (map * l1 l2)))
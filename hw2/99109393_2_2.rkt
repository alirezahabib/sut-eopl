#lang racket

(define (main l1 l2) ; cross-product
  (apply + (map * l1 l2)))

#lang racket

(define (main l1 l2) ; dot-product
  (apply + (map * l1 l2)))

#lang racket

(define (nth l n)
  (if (zero? n)
      (car l)
      (nth (cdr l) (- n 1))))

(define (dot l1 l2) ; dot-product
  (apply + (map * l1 l2)))

(define (trans A) ; A = (column1 column2...)
    (apply map list A)) ; A^T = ((list row1) (list row2)...)

(define (ATA A) ; (A^T * A)(i)(j) (second order function)
  (lambda (j) (lambda (i) (dot (nth (trans A) i) (nth (trans A) j)))))

(define (main M)
  (let ([scope (range (length M))])
    (map (lambda (f) (map f scope)) (map (ATA M) scope))))

; Generates a list of functions of ATA with j = 0 1 2... (first order functions)
; then map each f (function) to f applied to (0 1 2 ...)
; (creating a 2d array with is our desired matrix)
   
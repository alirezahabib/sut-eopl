#lang racket

(define (nth l n)
  (if (zero? n)
      (car l)
      (nth (cdr l) (- n 1))))

(define (dot l1 l2) ; dot-product
  (apply + (map * l1 l2)))

(define (trans A) ; A = (column1 column2...)
    (apply map list A)) ; A^T = ((list row1) (list row2)...)

(define (product-term A B) ; (A x B)(j)(i) (second order function)
  (λ (i) (λ (j) (dot (nth A i) (nth (trans B) j)))))

(define (main A B) ; A x B
  (let ([scopeA (range (length A))]
        [scopeB (range (length (trans B)))])
    (map (λ (f) (map f scopeB)) (map (product-term A B) scopeA))))

; Generates a list of functions of AxB with i = (0 1 2 ... length(A)) (first order functions)
; then map each f (function) to f applied to j = (0 1 2 ... length(B))
; (creating a 2D array with is our desired matrix)

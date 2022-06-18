#lang racket
(require (lib "eopl.ss" "eopl"))

(define-datatype Red-blue-tree Red-blue-tree?
  [red-node (lefty Red-blue-tree?) (righty Red-blue-tree?)]
  [blue-node (children (list-of Red-blue-tree?))]
  [leaf-node (num integer?)])

(define (red-counter tree count)
  (cases Red-blue-tree tree
    [red-node (lefty righty) (red-node (red-counter lefty (add1 count)) (red-counter righty (add1 count)))]
    [blue-node (children) (blue-node (map (λ (child) (red-counter child count)) children))]
    [leaf-node (num) (leaf-node count)]))

(define (main t)
    (red-counter t 0))

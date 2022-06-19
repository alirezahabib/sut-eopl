#lang racket
(require (lib "eopl.ss" "eopl"))

(define-datatype Permtree Permtree?
  [root (children (list-of Permtree?))]
  [node (num integer?) (children (list-of Permtree?))]
  [leaf (num integer?)])

(define (permtree-helper l n)
  (if (null? l)
      (leaf n)
      (node n (map (λ (x) (permtree-helper (remove x l) x)) l))))

(define (ListToPermTree L)
  (root (map (λ (x) (permtree-helper (remove x L) x)) L)))

(define (PermTreeToPerms T)
  (cases Permtree T
    [root (children) (apply append (map (λ (child) (PermTreeToPerms child)) children))]
    [node (num children) (map (λ (x) (cons num x))
                              (apply append (map (λ (child) (PermTreeToPerms child)) children)))]
    [leaf (num) (list (list num))]))

(define (getnum N)
  (cases Permtree N
    [root (children) null]
    [node (num children) num]
    [leaf (num) num]))

(define (PruneSmooth T d)
  (cases Permtree T
    [root (children) (root (map (λ (x) (PruneSmooth x d)) children))]
    [node (num children) (node (getnum T) (map (λ (x) (PruneSmooth x d))
                              (filter (λ (y)
                                        (< (abs (- (getnum y) (getnum T))) d))
                                      children)))]      
    [leaf (num) (leaf num)]))

(define (SmoothPerms L d)
  (PermTreeToPerms (PruneSmooth (ListToPermTree L) d)))

#lang racket

; A
(define (insert n tree)
  (cond
    [(null? tree) (list n null null)]
    [(> n (car tree)) (list (car tree) (cadr tree) (insert n (caddr tree)))]
    [else (list (car tree) (insert n (cadr tree)) (caddr tree))]))
  
(define (binary-tree l)
  (if (null? l) null
      (insert (car (reverse l)) (binary-tree (reverse (cdr (reverse l))))))) 


; B
(define (flatten tree)
  (if (null? tree) null
      (append (flatten (cadr tree)) (list (car tree)) (flatten (caddr tree)))))


; C
(define (cool_depth n tree)
  (cond
    [(null? tree) +inf.0]
    [(= (car tree) n) 0]
    [else (+ 1 (min (cool_depth n (cadr tree)) (cool_depth n (caddr tree))))]))

(define (found? n tree)
  (integer? (cool_depth n tree)))

(define (depth n tree)
  (if (found? n tree) (cool_depth n tree)
      'Error404))

; D
(define (minimal-tree tree l)
  (foldl (minimaller tree) null l))

(define (minimaller tree)
  (lambda (node1 node2)
    (let ([lefty (cadr tree)]
          [righty (caddr tree)]
          [root (car tree)])
      (cond
        [(null? node1) node2]
        [(null? node2) node1]
        [(and (found? node1 lefty) (found? node2 lefty)) ((minimaller lefty) node1 node2)]
        [(and (found? node1 righty) (found? node2 righty)) ((minimaller righty) node1 node2)]
        [else root]))))
      
    


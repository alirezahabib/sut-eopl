#lang racket

(require racket/random)

(define (quick-sort comp l)
  (if (null? l) null
      (let ([pivot (random-ref l)])
        (append
         (quick-sort comp (filter (λ (x) (< (comp x pivot) 0)) l))
         (filter (λ (x) (= (comp x pivot) 0)) l)
         (quick-sort comp (filter (λ (x) (> (comp x pivot) 0)) l))))))

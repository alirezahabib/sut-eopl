#lang racket

(define (main n)
  (if (= n 1) '(1)
      (let ([prev (cons 0 (main (- n 1)))]) (map + prev (reverse prev)))))

;   0 1 3 3 1
; + 1 3 3 1 0  = (reverse '(0 1 3 3 1))
; ------------
;   1 4 6 4 1

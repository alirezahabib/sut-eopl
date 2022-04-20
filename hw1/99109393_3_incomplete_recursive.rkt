#lang racket

;        |                    |
;        | a_11          u^T  |
;        |                    |
; A^T := |                    |
;        |                    |
;        | v         A^T_(n-1)|
;        |                    |

;      |                  |
;      | a_11       v^T   |
;      |                  |
; A := |                  |
;      |                  |
;      | u        A_(n-1) |
;      |                  |

;            |                                              |
;            | a_11^2 + u^T*u      a_11*v^T + u^T*A_(n-1)   |
;            |                                              |
; A^T * A := |                                              |
;            |                                              |
;            | a_11*v + a^T*u         A^T_(n-1)*A_(n-1)     |
;            |                                              |



(define (dot-prod l1 l2)
  (apply + (map * l1 l2)))

(define (cdr2d m)
  (map cdr (cdr m)))
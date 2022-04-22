#lang racket

(require math/number-theory)

(define (dec ch a-inv b)
  (remainder (+ (remainder (* (- ch b) a-inv) 26) 26) 26))

; The last calls (remainder (+ n 26) 26) are to force a positive remainder
; (The racket default remainder may return a negative number)

(define (main s a b)
  (let ([a-inv (modular-inverse a 26)])
    (list->string (map integer->char
                       (map (λ (ch)
                              (if (<= 97 ch 122)
                                  (+ (dec (- ch 97) a-inv b) 97)
                                  ch))
                            (map char->integer (string->list s)))))))

; encrypted-string -> list-of-encrypted-characters -> list-of-encrypted-integers
; -> list-of-integers -> list-of-characters -> string
#lang racket

(define (enc ch a b)
  (remainder (+ (remainder (+ (* ch a) b) 26) 26) 26))

; The last calls (remainder (+ n 26) 26) are to force a positive remainder
; (in case of a negative a or b)
; (The racket default remainder may return a negative number)

(define (main s a b)
  (list->string (map integer->char
                     (map (λ (ch) (if (<= 97 ch 122)
                                      (+ (enc (- ch 97) a b) 97)
                                      ch))
                          (map char->integer (string->list s))))))

; string -> list-of-characters -> list-of-integers -> list-of-encrypted-integers
; -> list-of-encrypted-characters -> string
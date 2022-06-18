#lang racket
(require (lib "eopl.ss" "eopl"))

(define-datatype prefix-exp prefix-exp?
  (const-exp
   (num integer?))
  (op-exp
   (operator symbol?)
   (operand1 prefix-exp?)
   (operand2 prefix-exp?)))

(define parser
  (λ (l)
    (cond
      [(symbol? (car l)) (let* ([part1 (parser (cdr l))]
                                [part2 (parser (cdr part1))])
                           (cons (op-exp (car l) (car part1) (car part2)) (cdr part2)))]
      [(number? (car l)) (cons (const-exp (car l)) (cdr l))]
      [else (eopl:error 'parse-prefix-list "~s has unknown type" (car l))])))

(define parse-prefix-list
  (λ (prefix-list)
    (let ([ans (parser prefix-list)])
      (if (null? (cdr ans)) (car ans)
          (eopl:error 'parse-prefix-list "Invalid prefix list")))))

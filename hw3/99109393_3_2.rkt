#lang racket
(require (lib "eopl.ss" "eopl"))

(define-datatype prefix-exp prefix-exp?
  (const-exp
   (num integer?))
  (op-exp
   (operator symbol?)
   (operand1 prefix-exp?)
   (operand2 prefix-exp?)))

; A
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

; B
(define evaluator
  (λ (exp)
    (cases prefix-exp exp
      (const-exp (num) num)
      (op-exp (operator op1 op2)
              (cond
                [(eqv? operator '*) (* (evaluator op1) (evaluator op2))]
                [(eqv? operator '+) (+ (evaluator op1) (evaluator op2))]
                [(eqv? operator '-) (- (evaluator op1) (evaluator op2))]
                [else (eopl:error 'evaluator "Invalid operator ~s" operator)])))))

(define main (λ (l) (evaluator (parse-prefix-list l))))
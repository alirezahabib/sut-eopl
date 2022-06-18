#lang racket
(require (lib "eopl.ss" "eopl"))

(define report-no-binding-found
  (λ (search-var)
    (eopl:error 'apply-env "No binding for ~s" search-var)))

(define empty-env
  (λ () (list
         (λ (search-var) (report-no-binding-found search-var))
         (λ () #t)))) ; env is empty

(define extend-env
  (λ (var val env)
    (list (λ (search-var)
            (if (eqv? search-var var) val
                (apply-env env search-var)))
          (λ () #f)))) ; env is not empty

(define apply-env
  (λ (env search-var)
    ((car env) search-var)))

(define empty-env?
  (λ (env) ((cadr env))))
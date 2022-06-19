## EOPL Midterm 
> Alireza Habibzadeh `99109393`

### ‍4
#### i

```scheme
#lang racket

(define (empty-env)
  (λ (var)
    (eopl:error 'empty-env "No binding for ~s" var)))

(define (extend-env var val env)
  (λ (search-var)
    (if (eqv? var search-var) val
        (apply-env env search-var))))

(define (apply-env env var) (env var))

(define (extend-env-rec proc-name arg body)
  (λ (search-var)
    (if (eqv? search-var proc-name)
      (proc-val (procedure arg body (extend-env-rec proc-name arg body)))
      (apply-env env search-var))))
```

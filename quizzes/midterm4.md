## EOPL Midterm 
> Alireza Habibzadeh `99109393`

### ‍4
#### i

```scheme
(define (empty-env)
  (lambda (var)
    (eopl:error 'empty-env "Variable ~s not found" var)))

(define (extend-env var val env)
  (lambda (search-var)
    (if (eqv? search-var var)
      val
      (apply-env env search-var))))

(define (apply-env env var)
  (env var))

(define (extend-env-rec proc-name arg body)
  (lambda (search-var)
    (if (eqv? search-var proc-name)
      (proc-val (procedure arg body (extend-env-rec proc-name arg body)))
      (apply-env env search-var))))
```

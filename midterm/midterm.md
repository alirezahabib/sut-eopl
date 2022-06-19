## EOPL Midterm 
> Alireza Habibzadeh `99109393`

### ‍1

#### i

```scheme
#lang racket

(define (insert-at new k lst)
  (cond [(null? lst) (list new)]
        [(zero? k) (cons new lst)]
        [else (cons (car lst)
                    (insert-at new (sub1 k) (cdr lst)))]))
; ^ https://stackoverflow.com/a/29125472/5769780

(define (putter n l)
  (map (λ (k) (insert-at n k l)) (range (add1 (length l)))))

(define (Perms L)
  (if (null? L) (list null)
      (apply append (map (λ (perm) (putter (car L) perm)) (Perms (cdr L))))))
```

#### ii

```scheme
#lang racket

(define (IsSmoothPerm? L d)
  (if (or (null? L) (null? (cdr L))) #t
      (if (> (abs (- (car L) (cadr L))) d) #f
          (IsSmoothPerm? (cdr L) d))))
```

#### iii
```scheme
#lang racket

(define (SmoothPerms L d)
  (filter (λ (x) (IsSmoothPerm? x d)) (Perms L)))
```

#### q.1

```scheme
#lang racket

(define (insert-at new k lst)
  (cond [(null? lst) (list new)]
        [(zero? k) (cons new lst)]
        [else (cons (car lst)
                    (insert-at new (sub1 k) (cdr lst)))]))
; ^ https://stackoverflow.com/a/29125472/5769780

(define (putter n l)
  (map (λ (k) (insert-at n k l)) (range (add1 (length l)))))

(define (Perms L)
  (if (null? L) (list null)
      (apply append (map (λ (perm) (putter (car L) perm)) (Perms (cdr L))))))

(define (IsSmoothPerm? L d)
  (if (or (null? L) (null? (cdr L))) #t
      (if (> (abs (- (car L) (cadr L))) d) #f
          (IsSmoothPerm? (cdr L) d))))

(define (SmoothPerms L d)
  (filter (λ (x) (IsSmoothPerm? x d)) (Perms L)))
```

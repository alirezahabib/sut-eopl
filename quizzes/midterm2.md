## EOPL Midterm 
> Alireza Habibzadeh `99109393`

### ‍2

#### i

![alt text](https://i.pinimg.com/736x/16/e2/f1/16e2f14de161f85ccc4fcb9f27d48407.jpg)


از درخت تصمیم استفاده می‌کنیم.

مطابق شکل در هر مرحله از بین اعضای باقی‌مانده یکی را انتخاب می‌کنیم و سپس آن عضو را از انتخاب‌هایمان حذف می‌کنیم. آن قدر این کار را ادامه می‌دهیم تا
لیست انتخاب‌های ممکنمان تهی شود. هر راس می‌تواند بیش از دو فرزند داشته باشد پس این درخت چندتایی است و دودویی نیست.

```scheme
#lang racket
(require (lib "eopl.ss" "eopl"))

(define-datatype Permtree Permtree?
  [root (children (list-of Permtree?))]
  [node (num integer?) (children (list-of Permtree?))]
  [leaf (num integer?)])
```


#### ii

```scheme
#lang racket

(define (permtree-helper l n)
  (if (null? l)
      (leaf n)
      (node n (map (λ (x) (permtree-helper (remove x l) x)) l))))

(define (ListToPermTree L)
  (root (map (λ (x) (permtree-helper (remove x L) x)) L)))
```

<img width="732" alt="image" src="https://user-images.githubusercontent.com/73132146/167300441-79205085-d29d-4dd3-9f2a-c5a523f196c6.png">


#### iii
```scheme
#lang racket

(define (PermTreeToPerms T)
  (cases Permtree T
    [root (children) (apply append (map (λ (child) (PermTreeToPerms child)) children))]
    [node (num children) (map (λ (x) (cons num x))
                              (apply append (map (λ (child) (PermTreeToPerms child)) children)))]
    [leaf (num) (list (list num))]))
```

#### v
```scheme
(define (SmoothPerms L d)
  (PermTreeToPerms (PruneSmooth (ListToPermTree L))))
```

#### q.2

```scheme
#lang racket
(require (lib "eopl.ss" "eopl"))

(define-datatype Permtree Permtree?
  [root (children (list-of Permtree?))]
  [node (num integer?) (children (list-of Permtree?))]
  [leaf (num integer?)])

(define (permtree-helper l n)
  (if (null? l)
      (leaf n)
      (node n (map (λ (x) (permtree-helper (remove x l) x)) l))))

(define (ListToPermTree L)
  (root (map (λ (x) (permtree-helper (remove x L) x)) L)))

(define (PermTreeToPerms T)
  (cases Permtree T
    [root (children) (apply append (map (λ (child) (PermTreeToPerms child)) children))]
    [node (num children) (map (λ (x) (cons num x))
                              (apply append (map (λ (child) (PermTreeToPerms child)) children)))]
    [leaf (num) (list (list num))]))

(define (SmoothPerms L d)
  (PermTreeToPerms (PruneSmooth (ListToPermTree L))))
```
 

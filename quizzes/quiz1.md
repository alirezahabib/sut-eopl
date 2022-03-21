## Design of Programming Languages Quiz 1
> Alireza Habibzadeh `99109393`

###  سوال ۱
#### الف
به این معنا است که ارجاع به توابع باید نتایح یکسان داشته باشد. این مفهوم شبیه مفهوم دقیق تابع در ریاضیات است. وقتی یک تابعی چند جای مختلف صدا زده می‌شود، خروجی آن نباید به ازای ورودی‌های یکسان متفاوت باشد. به عبارتی ```f(10)``` همواره یک مقدار را نشان می‌دهد. این در تضاد با زبان‌های غیرتابعی است که می‌تواند این طور نباشد.
یعنی توابع در زبان‌های غیرتابعی می‌توانند side-effect داشته باشند. (برای مثال یک متغییر گلوبال را آپدیت کنند.)

#### ب
چرا که در این روش دیگر لازم نیست هر بار از حافظه گلوبال چیزی لود کنیم هر دستور تابع مخصوص به خود را دارد. اما لود کردن از حافظه‌ی لوکال سریع‌تر است چرا که باز کش استفاده می‌کند. 

### سوال ۲

```scheme
#lang racket

(define (merge l1 l2)
  (cond
    [(null? l1) l2]
    [(null? l2) l1]
    [(< (car l1) (car l2)) ; (car l1) is the minimum
     (cons (car l1) (merge (cdr l1) l2))] ; so it is at the begining
    [else ; (car l2) is the minimum
     (cons (car l2) (merge (cdr l2) l1))]))
```

### سوال ۳
#### الف
```scheme
#lang racket

(define (apply l n) ; f1(f2(f3(x)))
  (if (null? l) n
      ((car l) (apply (cdr l) n)))) ; = f1( f2(f3(x)) )
```

#### ب
```scheme
#lang racket

(define (super-function l)
  (if (null? l)
      (lambda (x) x)
      (lambda (x) ((car l) ((super-function (cdr l)) x)))))
```

## EOPL Midterm 
> Alireza Habibzadeh `99109393`

### ‍5

```scheme
let f = proc (maker) proc (x)
if zero? (x)
then 0
else if zero? (-(x, 1)) then 1
else -(((maker maker) -(x, 1)), -(0, ((maker maker) -(x, 2)))) in let main = proc (x) ((f f) x)
in (main 8)
```

با تبدیل به شبیه کد ساده‌تر


```scheme
let f = proc (maker) proc (x)
  if x == 0: 0
  else if x == 1: 1
  else -(((maker maker) x-1), -((maker maker) x-2)) in let main = proc (x) ((f f) x)
in (main 8)
```

```scheme
let f = proc (maker) proc (x)
  if x == 0: 0
  else if x == 1: 1
  else ((maker maker) x-1) + ((maker maker) x-2) in let main = proc (x) ((f f) x)
in (main 8)
```

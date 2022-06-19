# EOPL Quiz 4
> Alireza Habibzadeh `99109393`

## 1

| Expression                                                       | Type Variable |
| ---------------------------------------------------------------- | ------------- |
| `successor`                                                      | $t_s$         |
| `let successor = proc(n) -(n, -1) in let x = 5 in (successor x)` | $t_0$         |
| `proc(n) -(n, -1)`                                               | $t_1$         |
| `let x = 5 in (successor x)`                                     | $t_2$         |
| `n`                                                              | $t_n$         |
| `-(n, -1)`                                                       | $t_3$         |
| `x`                                                              | $t_x$         |
| `(successor x)`                                                  | $t_4$         |


| Expression                                                       | Equations     |
| ---------------------------------------------------------------- | ------------- |
| `let successor = proc(n) -(n, -1) in let x = 5 in (successor x)` | $t_s = t_1$   |
|                                                                  | $t_0 = t_2$   |
| `proc(n) -(n, -1)`                                               | $t_1 = t_n \to t_3$ |
| `let x = 5 in (successor x)`                                     | $t_x = int$   |
|                                                                  | $t_2 = t_4$   |
| `-(n, -1)`                                                       | $t_n = int$   |
|                                                                  | $t_3 = int$   |
| `(successor x)`                                                  | $t_x \to t_4 = t_1$ |


| Equations           | Substitution  |
| ------------------- | ------------- |
| $t_s = t_1$         |               |
| $t_0 = t_2$         |               |
| $t_1 = t_n \to t_3$ |               |
| $t_x = int$         |               |
| $t_2 = t_4$         |               |
| $t_n = int$         |               |
| $t_3 = int$         |               |
| $t_x \to t_4 = t_1$ |               |


| Equations           | Substitution  |
| ------------------- | ------------- |
| $t_1 = t_n \to t_3$ | $t_0 = t_2$   |
| $t_x = int$         | $t_s = t_1$   |
| $t_2 = t_4$         |               |
| $t_n = int$         |               |
| $t_3 = int$         |               |
| $t_x \to t_4 = t_1$ |               |

| Equations           | Substitution  |
| ------------------- | ------------- |
|                     | $t_0 = t_2$ |
| $t_2 = t_4$         | $t_s = t_n \to t_3$ |
| $t_n = int$         | $t_1 = t_n \to t_3$ |
| $t_3 = int$         | $t_x = int$ |
| $t_x \to t_4 = t_1$ |               |

| Equations           | Substitution  |
| ------------------- | ------------- |
|                     | $t_0 = t_2$ |
| $t_2 = t_4$         | $t_s = int \to int$ |
|                     | $t_1 = int \to int$ |
|                     | $t_x = int$ |
| $t_x \to t_4 = t_1$ | $t_n = int$ |
|                     | $t_3 = int$ |


$$ (t_x \to t_4) = t_1 = (int \to int) $$

پس

$$ t_x = int, t_4 = int $$

| Equations           | Substitution  |
| ------------------- | ------------- |
|                     | $t_0 = t_2$ |
| $t_2 = t_4$         | $t_s = int \to int$ |
|                     | $t_1 = int \to int$ |
|                     | $t_x = int$ |
| $t_x = int$         | $t_n = int$ |
| $t_4 = int$         | $t_3 = int$ |


| Equations           | Substitution  |
| ------------------- | ------------- |
|                     | $t_0 = t_4$ |
|                     | $t_s = int \to int$ |
|                     | $t_1 = int \to int$ |
|                     | $t_x = int$ |
| $t_x = int$         | $t_n = int$ |
| $t_4 = int$         | $t_3 = int$ |
|                     | $t_2 = t_4$ |


| Equations           | Substitution  |
| ------------------- | ------------- |
|                     | $t_0 = int$ |
|                     | $t_s = int \to int$ |
|                     | $t_1 = int \to int$ |
|                     | $t_x = int$ |
|                     | $t_n = int$ |
|                     | $t_3 = int$ |
|                     | $t_2 = int$ |
|                     | $t_x = int$ |
|                     | $t_4 = int$ |

عبارت از نظر type درست است و type خروجی هم int است.

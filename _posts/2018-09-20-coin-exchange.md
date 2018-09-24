---
layout: post
categories: cs algorithms dynamic-programming
published: true
---
# Question

Given $m\in\mathbb N$ and a finite set of distinct numbers $$C = \{c_1, c_2, \dots, c_k\}\in\mathbb N$$, find the number of all possible combinations of $$\{p_1, p_2, \dots, p_k\}\subset\mathbb N\cup\{0\}$$ such that

$$
p_1\cdot c_1 + p_2\cdot c_2+\cdots + p_k\cdot c_k = m.
$$

## Coin exchange
If $c_i$'s are coin values, then the answer is equal to the total number of ways to make changes for value $m$.

## Example

If $m = 4$ and $$N = \{1, 2, 3\}$$, then the answer is $4$:

$$
\begin{aligned}
4 &= 1 + 1 + 1 + 1\\
&= 1 + 1 + 2\\
&= 2 + 2\\
&= 1 + 3
\end{aligned}
$$

# Solution
Let $A_m(c_1,\dots,c_k)$ be the answer to the question. Then we have

$$ \begin{aligned}
A_m(c_1,\dots,c_k) = A_{m-c_k}(c_1,\dots, c_k) + A_m( c_1,\dots,c_{k-1}).
\end{aligned}
$$

So we can build the solution from bottom up. Since we have

$$
A_{c_1}(c_1) = A_0(c_1) + A_{c_1}(\emptyset) = 1,
$$

we need to set $$A_0(c_1,\dots,c_i) = 1$$ for all $i \le k$. We know $A_n(c_1)$ for all $0\le n\le m$, since

$$
A_n(c_1) = \begin{cases}
1,\quad\text{if $ c_1\vert n$}\\
0,\quad\text{else}
\end{cases}
$$


We can get $A_n(c_1, c_2)$ for all $n\le m$ as follows:

$$
\begin{aligned}
A_n(c_1, c_2) =& A_{n - c_2}(c_1, c_2) + A_n(c_1)\\
=& A_{n - 2 \cdot c_2}(c_1, c_2) + A_{n - c_2}(c_1) + A_n(c_1)\\
\vdots&
\end{aligned}
$$

We continue subtracting multiples of $c_2$ from $n$ until the first term becomes $0$ or less. Then all is left on the right hand side is a function of $c_1$, whose values we already know.

The value for $A_n(c_1, c_2, c_3)$ can be found in a similar way.

## Programming
This solution can be written up in python as follows.

```python
from typing import List

def get_ways(target: int, coins: List[int]) -> int:
    ways = dict()
    ways[0] = 1
    for coin in coins:
        for value in range(target + 1):
            previous = ways.get(value - coin, 0)
            ways[value] = ways.get(value, 0) + previous
    return ways[target]
```

# Geometric Viewpoint

If $k=2$, then the solution equals the number of points with integer coordinates on the line $c_1x + c_2y=m$ in $\mathbb R^2$ in the first quadrant.

If $k=3$, then the solution equals the number of points with integer coordinates on the hyperplane $c_1x + c_2y+ c_3z = m$ in $\mathbb R^3$ in the first octant. 

### References
- [hackerrank.com](https://www.hackerrank.com/challenges/coin-change/problem)

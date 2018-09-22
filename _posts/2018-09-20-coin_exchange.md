---
layout: post
title:  "Coin exchange"
categories: cs algorithms dynamic-programming
published: false
---
Given $m\in\mathbb Z$ and a set of distinct numbers $\{n_1, n_2, \dots, n_k\}\subset\mathbb N$, find number of ways to and available coin values, find total number of ways to make change.

For example, if target value is $4$ and coin values are $1, 2, 3$, then total number of ways is $4$:
$$
1 + 1 + 1 + 1
$$
$$
1 + 1 + 2 $$
$$1 + 3 $$
$$2 + 2
$$


```python
from typing import List
```


```python
def get_ways(target: int, coins: List[int]) -> int:
    ways = dict()
    ways[0] = 1
    for coin in coins:
        for value in range(target + 1):
            previous = ways.get(value - coin, 0)
            ways[value] = ways.get(value, 0) + previous
    return ways[target]
```


```python
output1 = get_ways(4, [2, 1, 3])  # correct output: 4
print('output: {} (correct output is 4)'.format(output1))
output2 = get_ways(10, [2, 5, 3, 6])
print('output: {} (correct output is 5)'.format(output2))
```

    output: 4 (correct output is 4)
    output: 5 (correct output is 5)



```python

```

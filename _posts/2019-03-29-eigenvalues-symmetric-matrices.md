---
layout: post
title: Eigenvalues of symmetric matrices
category: math
---

# Claim

Let $A\in\mathbb R^{n\times n}$ be a real valued symmetric matrix. Then all eigenvalues of $A$ are real.

## Proof

Let $\lambda$ be an eigenvalue of $A$ and $v$ be the corresponding eigenvector, i.e.,

$$
A v = \lambda v,\quad \lambda\in\mathbb C, v\in\mathbb C^n
$$

Let $\overline{v}^T$ be the complex conjuate transpose of $v$. Then we get

$$
\overline{v}^T A v = \lambda \overline{v}^T v = \lambda \| v\|^2\tag{1}
$$

It suffices to show that $\overline v^T Av \in\mathbb R$. Let $a_{ij}$ be the $(i,j)$-th element of $A$ and $v_j$ be the $j$-th element of $v$. Then we have

$$\overline{v}^T A v = \sum_{i,j = 1}^n\overline{v}_i a_{ij}v_j
= \sum_{i=1}^n\overline{v}_i a_{ii}v_i + \sum_{i\neq j}\overline{v}_i a_{ij}v_j = I + II\tag{2}$$

The first term $I$ is real, since $$\overline v_i v_i=\vert v_i\vert^2$$. We can rewrite the second term $II$ as follows:

$$
II = \sum_{i<j}\big(a_{ij}\overline{v_i}v_j + a_{ji}\overline{v_j}v_i\big)
= \sum_{i<j}a_{ij}\big(\overline{v_i}v_j + \overline{\overline{v_i}v_j })
= \sum_{i<j}a_{ij}\cdot 2\text{Re}(\overline{v_i}v_j )
$$

Here the notation $\text{Re\,}x$ means the real part of a complex number $x$.
We have the second equality since $A$ is symmetric, i.e.,$a_{ij} = a_{ji}$.

We just showed that $I$ and $II$ are real in (2). The assertion follows from (1) and (2).
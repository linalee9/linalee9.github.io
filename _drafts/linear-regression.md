---
layout: post
title: Linear Regression
---

# Question
Given a set of data $(\vec x^j, y^j)$, $1\le j\le m$, $\vec x^j\in\mathbb R^n, y^j\in\mathbb R$, find $\vec\theta\in\mathbb R^n$ that minimizes mean squared error:

$$
\begin{pmatrix}
y^1\\
y^2 \\
\vdots\\
y^m
\end{pmatrix} = \begin{pmatrix} \vec x_1^1 & \vec x_2^1 &\cdots & \vec x_n^1\\
\vec x_1^2 & \vec x_2^2 &\cdots &\vec x_n^2\\
\vdots&\vdots&\ddots&\vdots\\
\vec x_1^m & \vec x_2^m & \cdots & \vec x_n^m
\end{pmatrix}\begin{pmatrix}
\theta_1\\
\theta_2\\
\vdots\\
\theta_n
\end{pmatrix}
$$

$X\in\mathbb R^{m\times n}$, $\vec y\in\mathbb R^{m\times 1}$, $\vec \theta\in \mathbb R^{n\times 1}$.

$$
E = (X\vec\theta - \vec y)^T (X\vec\theta - \vec y)
$$

$$
\frac{\partial E}{\partial\theta_j} = 0 \quad \forall j
$$

Let $A\in\mathbb R^{m\times n}$, $\theta\in\mathbb R^n$, and denote the $j$-the column of $A$ as $A_{*j}\in\mathbb R^{m\times 1}$ and the $j$-th row of $A$ as $A_{j*}\in\mathbb R^{1\times n}$. Then we have

$$
\begin{gathered}
\frac{\partial}{\partial\theta_j} (A\vec\theta) = \frac{\partial}{\partial\theta_j} \sum_i \theta_i A_{*i} = A_{*j},\\
\frac{\partial}{\partial\theta_j} (\vec\theta^T A^T) = 
\frac{\partial}{\partial\theta_j} \sum_i \theta_i (A^T)_{i*}= (A^T)_{j*} = (A_{*j})^T
\end{gathered}
$$

$$
E = \vec\theta^T X^T X\vec \theta - \vec\theta^T X^T \vec y - \vec y^T X\vec\theta + \|\vec y \|^2
$$
and

$$
\frac{\partial E}{\partial \theta_j} =
(X^TX\vec\theta)_{j*} - (\vec\theta ^T X^TX)_{*j} - (X^T\vec y)_{j*}-(\vec y^T X)_{*j}
$$

Note that the shape of $X^TX\vec\theta$ is $n\times 1$ and the shape of $\vec\theta^T X^TX$ is $1\times n$ and also that $\vec\theta^TX^TX = (X^TX\vec\theta)^T$. Hence we get

$$
\frac{\partial E}{\partial \theta_j} =
2(X^TX\vec\theta)_{j*}  - 2(X^T\vec y)_{j*}
$$

By letting $\frac{\partial E}{\partial \theta_j} =0$ for all $j$, we get

$$
X^TX\vec\theta = X^T\vec y
$$

If $X^TX$ is invertible, we can say

$$
\vec\theta = (X^TX)^{-1} X^T \vec y
$$

## When is $X^TX$ invertible?

Note that $X^TX$ is symmetric.
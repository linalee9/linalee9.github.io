---
layout: post
title: Linear Regression
category: ml
---

## Question

Suppose you have a set of $m$ data samples $(x_1, y_1), (x_2, y_2), \dots, (x_m, y_m)$, where $x_i\in\mathbb R^n$ and $y_i\in\mathbb R$. We want to find $\theta_1,\dots,\theta_n$, where $\theta_i\in\mathbb R$ for all $i = 1,\dots, n$, such that if we let

$$
\hat y_i = x_{i,1}\theta_1 + x_{i,2}\theta_2 + \cdots + x_{i,n}\theta_n,\quad\forall i \in [1, m]\tag{1}
$$

then it minimizes the mean squared error given as follows:

$$
E = \sum_{i=1}^n \big|\hat y_i - y_i\big|^2\tag{2}
$$

### Exploration

We can rewrite $(1)$ as follows:

$$
\hat y = X\theta,
$$

where

$$
\hat y = \begin{pmatrix}
\hat y_1\\
\hat y_2 \\
\vdots\\
\hat y_m
\end{pmatrix},\quad
X =\begin{pmatrix}  x_{1,1} &  x_{1,2} &\cdots & x_{1,n}\\
 x_{2,1} &  x_{2,2}&\cdots & x_{2,n}\\
\vdots&\vdots&\ddots&\vdots\\
 x_{m, 1} &  x_{m, 2} & \cdots &  x_{m, n}
\end{pmatrix},\quad
\theta = \begin{pmatrix}
\theta_1\\
\theta_2\\
\vdots\\
\theta_n
\end{pmatrix}.
$$

Also $(2)$ can be rewritten as

$$
\begin{aligned}
E &= \Vert\hat y - y\Vert^2 = \Vert X\theta - y\Vert^2 = (X\theta - y)^T(X\theta - y)\\
&= \theta^TX^TX\theta -\theta^TX^Ty - y^TX\theta + y^Ty
\end{aligned}
$$

To find $\theta$ that minimizes $E$, we need to solve

$$
\frac{\partial E}{\partial\theta_j} = 0, \quad j = 1,\dots, n
$$

[post]({{ site.baseurl }}{% post_url 2019-03-27-matrix-operation %})

Let $A\in\mathbb R^{m\times n}$, $\theta\in\mathbb R^n$, and denote the $j$-the column of $A$ as $$A_{*j}\in\mathbb R^{m\times 1}$$ and the $j$-th row of $A$ as $A_{j*}\in\mathbb R^{1\times n}$. Then we have

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

The following conditions are equivalent:

$$
\begin{aligned}
&X^TX \text{ is invertible}\\
&\iff \text{all eigenvalues of $X^TX$ are nonzero}\\
&\iff  v^TX^TXv \neq  0,\quad\forall v\in\mathbb R^n\setminus \{\vec 0\}\\
&\iff \Vert Xv\Vert^2\neq 0,\quad\forall v\in\mathbb R^n\setminus\{\vec 0\}\\
&\iff X \text{ has full rank}
\end{aligned}
$$


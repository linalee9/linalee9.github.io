---
layout: post
title: Basic matrix operation
category: math
---

Let $A\in\mathbb R^{n\times m}$, $v\in\mathbb R^m$ and $w\in\mathbb R^n$. Then we have

$$
\begin{aligned}
Av &= \begin{pmatrix}  a_{1,1} &  a_{1,2} &\cdots & a_{1,m}\\
 a_{2,1} &  a_{2,2}&\cdots & a_{2,m}\\
\vdots&\vdots&\ddots&\vdots\\
 a_{n, 1} &  a_{n, 2} & \cdots &  a_{n, m}
\end{pmatrix}
\begin{pmatrix}
v_1\\
v_2\\
\vdots\\
v_m
\end{pmatrix}\\
&=
\begin{pmatrix}
a_{1,1}v_1 + a_{1,2}v_2 + \cdots + a_{1,m}v_m\\
a_{2,1}v_1 + a_{2,2}v_2 + \cdots + a_{2,m}v_m\\
\vdots\\
a_{n,1}v_1 + a_{n,2}v_2 + \cdots + a_{n,m}v_m
\end{pmatrix}\\
&=v_1\begin{pmatrix}
a_{1,1}\\
a_{2,1}\\
\vdots\\
a_{n,1}
\end{pmatrix}+ v_2\begin{pmatrix}
a_{1,2}\\
a_{2,2}\\
\vdots\\
a_{n,2}
\end{pmatrix} + \cdots + v_m\begin{pmatrix}
a_{1,m}\\
a_{2,m}\\
\vdots\\
a_{n,m}
\end{pmatrix}
\end{aligned}
$$

Therefore we get

$$
\frac{\partial}{\partial v_j}\big(Av\big)
= \begin{pmatrix}
a_{1,j}\\
a_{2,j}\\
\vdots\\
a_{n,j}
\end{pmatrix},
$$

i.e., the derivative of $Av$ with respect to $v_j$ is the $j$-th column of $A$.

Similarly, we have

$$
\begin{aligned}
w^TA =& \begin{pmatrix}
w_1 & w_2 &\cdots &w_n
\end{pmatrix}\begin{pmatrix}  a_{1,1} &  a_{1,2} &\cdots & a_{1,m}\\
 a_{2,1} &  a_{2,2}&\cdots & a_{2,m}\\
\vdots&\vdots&\ddots&\vdots\\
 a_{n, 1} &  a_{n, 2} & \cdots &  a_{n, m}
\end{pmatrix}\\
=& \begin{pmatrix}
\sum_{i=1}^n a_{i,1}w_i &
\sum_{i=1}^n a_{i, 2}w_i & \cdots
&\sum_{i=1}^n a_{i,m}w_i
\end{pmatrix}\\
=& w_1\begin{pmatrix}
a_{1,1} & a_{1,2} &\cdots &a_{1,m}
\end{pmatrix} \\
& + w_2\begin{pmatrix}
a_{2,1} & a_{2,2} &\cdots &a_{2,m}
\end{pmatrix}\\
& + \cdots \\
& + w_n\begin{pmatrix}
a_{n,1} & a_{n,2} &\cdots &a_{n,m}
\end{pmatrix}.
\end{aligned}
$$

Hence

$$
\frac{\partial}{\partial w_j}\big(w^TA\big) = \begin{pmatrix}
a_{j,1} & a_{j,2} &\cdots &a_{j,m}
\end{pmatrix},
$$

i.e., the derivative of $w^TA$ with respect to $w_j$ is the $j$-th row of $A$.
# Notes on Transport Phenomena


$$\rho\frac{\partial\mathbf{u}}{\partial t}+\rho\mathbf{u}\cdot\nabla\mathbf{u}=\mu\nabla^2\mathbf{u}-\nabla P+\rho\mathbf{G}$$



### P.V. Heng

### 12/08/24


This repository offers a brief mathematical view behind the main equations
of differential analysis in transport phenomena. There are no numerical
examples, but rather, the goal is to develop a theoretical understanding
of differential conservation equations and *why* they have their form.
Thus, motivated <ins>derivations</ins> are the main results of this
document along with several methods of analyzing the resulting
equations.

In this light, physical arguments will be used rather than full
mathematical rigor. However, the math is still the forefront of the
developments, so an adequate and intuitive knowledge of calculus is
required (including vector calculus!). If you need a refresher on vector
calculus notation, refer to Appendix 1 or this
[video](https://www.youtube.com/watch?v=2DSgBZa7b88&ab_channel=BrianStorey).
The analysis is not simple, so you may be tempted to skip it, but by
reading this document carefully and working through the arguments
yourself, you should develop a reasonable intuition of the differential
transport equations. This is not to say that every mathematical step
must be understood line by line, but skipping to the end to memorize
equations does not lead to good intuition. One cannot expect to be able
to successfully perform calculations without a gut feeling for what the
equations mean. Besides, in any practical applications of transport
phenomena, computers are able to perform the math. Therefore, it is job
of the engineer to *model* the system of interest and understand what
certain terms mean and what mathematical operations will allow the
correct simulation of the system. In short: good theory = good
calculation.

In contrast, the appendices are completely optional to read and go into
more mathematical detail than the main text. Generally, they do not add
more intuition to the physical arguments, but they serve as
justification for some of the advanced developments.


```python

```

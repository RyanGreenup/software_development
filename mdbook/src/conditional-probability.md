# Conditional Probability

> [!WARNING]
> None of this has been reviewed, and it is likely to be incorrect.

Let:

- $A$ and $B$ be events
- $P(A)$ be the probability of event $A$
- $P(\not A) \equiv P(B^{\mathrm{C}})$ be the probability of A not occuring


- $E$ be some event, e.g. a person having a disease
- $T$ be a positive result for some test for the disease

We are concerned with the probability of $E$ given $T$, $P(E|T)$.

In this case the p-value is the probability of a positive test result given that the person has the disease, $P(T|E)$.

- $H_0$ be the null hypothesis
    - $H_0: E$ and $T$ are independent
- $H_1$ be the alternative hypothesis
    - $H_1: E$ and $T$ are dependent

|          | $E$                | $\not E$                | Total       |
|----------|--------------------|-------------------------|-------------|
| $T$      | $P(T \cap E)$      | $P(T \cap \not E)$      | $P(T)$      |
| $\not T$ | $P(\not T \cap E)$ | $P(\not T \cap \not E)$ | $P(\not T)$ |
| Total    | $P(E)$             | $P(\not E)$             | 1           |

## Bayes' Theorem

$$
P(E|T) = \frac{P(T|E)P(E)}{P(T)}
$$

Where:
- $P(E)$ is the prior probability of $E$
- $P(T|E)$ is the likelihood of $T$ given $E$
- $P(T)$ is the marginal probability of $T$


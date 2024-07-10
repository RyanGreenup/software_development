# Statistical Distributions and Hypothesis Testing


- Uniform
- Exponential
- Gaussian
- Student's t
- Chi-squared
    - $z \sim \mathcal{N}\left(0, 1\right) \implies z^2 \sim \chi_1$
    - $\chi_{k}^{2}  \sim n\cdot\frac{s^{2}}{\sigma^{2}}$
- F
    - Ratio of two chi-squared distributions
- Binomial
- Poisson
- Hypergeometric
- Beta
- Gamma




# Derivation of Chi Squared Distribution

The $\chi^2$ distribution is defined by sampling from the standard normal distribution. A value taken from the standard normal distribution, that is squared, will follow a chi squared distribution with 1 degree of freedom:

$$
z \sim \mathcal{N}\left(0, 1\right) \implies z^2 \sim \chi_1
$$

If $k$ of these values are sampled and then added they will follow a $\chi^{2}$ distribution with $k$ degrees of freedom:


$$
z_i \sim \mathcal{N}\left(0, 1\right) \implies \sum^k_{i=1} \left[ z^2 \right] \sim \chi_k
$$


This can be verified with R:

```{r}
N <- 10^5
k <- 99
qqplot(
  {
    rchisq(N, k)
  },
  {
    replicate(N, {
      sum(rnorm(k, 0, 1)^2)
    })
  },
  cex = 0.4,
  pch = 19,
  col = "royalblue",
  xlab = "Chi Quotients",
  ylab = "Sum of Std Normal",
  main = "QQ: Chi and Z"
)
abline(0, 1, col = "indianred")
```

## Interpreting the Chi Square Distribution

The Chi square distribution can be used to compare sample variance and population variance, this is why the distribution is used rather than a distribution of absolute values.

Although a distribution of $\sum^{k}_{i=1} \left\lvert z_{i} \right\rvert$ could be derived, it's utility is limited outside permutation tests and the closed form would involve a cases statement, i.e.:

$$
\left| x \right| = \cases{+x, \quad x \geq 0 \\
                                  -x,  \quad   x < 0}
$$

The chi square distribution is useful because:

$$
\chi^2_n \sim n \frac{s^2}{\sigma^2}
$$

It's naturally a measure of the probability of getting a ratio population variance and sample variance.

Variance is defined as a square:

$$
\sigma^{2} = \frac{1}{N} \sum^N_{i=1} \left[ \left( x_i - \mu \right)^2\right]
$$

This is because, within the gaussian distribution is the variance parameter.

$$
\begin{aligned}
\mathrm{exp}\left({z^2}\right) = \mathrm{exp}\left(\frac{1}{2} \left( \frac{x-\mu}{\sigma}\right)^2\right)
\end{aligned}
$$

The gaussian distribution is in turn characterised by the arithmetic mean, and so collapsing this reasoning provides that:

> If we use the arithmetic mean, then chi-squared is a more useful distribution than absolute value.

This isn't merely some aversion to absolute value, absolute value is a valid function and is even used in the derivation of the gaussian distribution. Squared deviation is simply a more convenient measure of spread because it is a parameter within the function.

### Showing the relationship between variance and chi square

Above, the following relationship was shown:

$$
\chi^2_n \sim n \frac{s^2}{\sigma^2}
$$

Here it will be derived:


$$
\begin{aligned}
\chi_{k}^{2}\sim\sum_{i=1}^{k}\left[z_{i}^{2}\right] & =\sum_{i=1}^{k}\left[\left(\frac{x-\mu}{\sigma}\right)^{2}\right]\\
 & =\frac{1}{\sigma^{2}}\sum_{i=1}^{k}\left[\left(x_{i}-\mu\right)^{2}\right]\\
 & =\frac{1}{\sigma^{2}}\cdot n\cdot\left(\frac{1}{n}\sum_{i=1}^{k}\left[\left(x_{i}-\mu\right)^{2}\right]\right)\\
 & =\frac{1}{\sigma^{2}}\cdot n\cdot s^{2}\\
\implies\chi_{k}^{2} & \sim n\cdot\frac{s^{2}}{\sigma^{2}}
\end{aligned}
$$


## Use of Chi Squared in Contingency Tables

### Binomial Distribution
The probability of $m$ successes over $m$ trials of constant probabilities, is characterised by a binomial distribution. Consider flipping three coins, if the goal is to have exactly two heads, the number of ways this could occur is $\binom{3}{2} = 3$, in the event of getting two heads the probability will be $\frac{1}{2} \times \frac{1}{2} \times \frac{1}{2}$, so the overall probability would be:

$$
\mathrm{P}(\mathrm{H}=2) = \binom{3}{2} \times \frac{1}{2}^1 \frac{1}{2}^2
$$

If instead there were 5 dice, and the goal was to roll 5 exactly once, no more, no less, then the probability would be:

$$
\mathrm{P}(\mathrm{Five}=1) = \binom{6}{1} \times \left(\frac{1}{6}\right)^1 \left(\frac{1}{6}\right)^5
$$

Remember, it is necessary to include not just the probability of getting 5, but also the probability of **not** getting 5!

### Multinomial Distribution

The multinomial distribution is an extension of the binomial, because ... TODO

The Binomial distribution deals with an event of only two outcomes. The probability of failure is 1-probability of success. For example, in tossing a coin, there are only "H" or "T" as outcomes.

The multinomial distribution is an extension of the binomial, whereby there are multiple possible outcomes for 'success'. For example, when rolling a die, there are 6 possible outcomes, each with a probability of occuring.

### Contingency Table

In a contingency, the values in the cells are multinomially distributed, consider, e.g.:

```{r}
## Multinomial Simulation
birds       <- rep("Bird", 4)
cats        <- rep("Cat",  2)
dogs        <- rep("Dog",  3)
animals     <- rep(c(cats, dogs, birds))
observation <- sample(animals, 30, replace = TRUE)
counts <- table(observation)

## Name and print the vector
names(counts) <- c("Bird", "Cat", "Dog")
counts
```
This could also be created thusly:

```{r}
## Multinomial Distribution
counts <- rmultinom(n = 1, size = 30, prob=c(4, 2, 3))

## Name and print the vector
counts <- c(counts)
names(counts) <- c("Bird", "Cat", "Dog")
counts
```

The values within a contingency table are multinomial, consider the following example, let's assume that this example has the same probability as a above (`c(4, 2, 3) == c(0.44, 0.22, 0.33))` and we observed this:

```{r}
o <- rbind(
  c(9, 5),
  c(11, 7),
  c(14, 6))
colnames(o) <- c("Sky", "Air")
rownames(o) <- c("Bird", "Cat", "Dog")
o
```

Under the assumption that location and animal are independent, we might have expected this:

```{r}
e <- outer(rowSums(o), colSums(o)/sum(o))
e
```

Meaning the difference between the expected multinomial value and the observed values would be:

```{r}
o-e
```

Each one of these values are an error, they represent noise and so follow a normal distribution. Errors can be shown to follow a gaussian distribution because of the underpinning assumptions made in deriving the gaussian distribution (e.g. continous negative function of distance from mean).

Via a simulation o-e can be shown as normal thusly:

```{r}
## TODO
```

Taking the multinomial sampling simulation above:

```{r}
animals <- c("Bird", "Cat", "Dog")
x <- replicate(1000, {
  obs <- sample(animals, 90, replace=TRUE)
  obs <- table(obs)
  exp <- 30
  d <- c(obs - exp)
  v <- var(d)

  return(list(d, v))
})
```

```{r}
## differences o-e
d <- unlist(x[1, ])
hist(d, main="Histogram of the Differences",
     xlab="o-e", col="pink")
```

Conveniently, the Variance of this distribution can be shown to be e:

```{r}
## variance
v <- unlist(x[2, ])
hist(v, xlab="variance",
     main="Histogram of Variances of the Difference",
     col="lightblue")
abline(v=30, col="red")
mean(v)
```

```{r}
sqrt(var(v))
```

Notice that the mean of the variances, `r mean(v)` is close to the expected value of `30`

### Individual Cells as Poisson

The reason the variance of the distribution of `o-e` values is normal with a variance of e, is because an individual cell follows a poisson distribution, for the sake of readability, consider only the first row of the contingency table:

```{r}
o[1, ]
```

Say observations were taken on different over a week, the probabilities of seeing the animals in different locations wouldn't change, and the counts of observations would be:

```{r}
many_obs <- replicate(7, {
  obs <- matrix(
    rmultinom(n=1,
              size=sum(o),
              prob=e),
    ncol = 2)
  colnames(obs) <- c("Sky", "Air")
  rownames(obs) <- c("Bird", "Cat", "Dog")
  obs[1,]
})
(many_obs <- t(many_obs))
```

Because the counts on different days are independent and depend on a constant probability, each value is a poisson distribution, which means the mean value and the variance are equal:


```{r}
lambdas <- apply(many_obs, 2, mean)
for (i in 1:2) {
  print(
    paste(
      "The mean value of",
      colnames(o)[i],
      "is equal to the variance which is",
      lambdas[i]
    )
  )
}
```

### Standardising

Because the variance of each cell is known, the cell can be standardized to have a variance of 1:

$$
\begin{aligned}
z            &= \frac{x-\mu}{\sigma} \\
             &= \frac{o-e}{\sqrt{e}} \\\
\implies z^2 &= \frac{\left(o-e\right)^2}{e}
\end{aligned}
$$

The larger $n$ the more normal the $e-o$ will be. Another way to interpret this would be assuming $o$ becomes more normal as the number of observations increases.

In the given example there are $k$ cells, each one can be standardized and added giving:


$$
\sum^k_{i=1} \left[ z^2 \right] = \sum^k_{i=1} \left[ \frac{\left(o-e\right)^2}{e} \right]
$$

the only disananalogy from a chi squared distribution is that not all the cells
are truly independent, consider the number of animals seen in the sea, in this
example all the animals in the sky was all the remaining ones, only the first
cell is independent (c-1). Of the animals only 2 of them are independent, the
third cell is just the remainder (r-1), so the number of independent cells is
$\mathrm{d.f.} = (r-1) \times (c-1)$ and so, by convention, all the cells are added but it is
convention to be conservative and set the chi-squared to be reduced down to this value:


$$
\begin{aligned}
\sum^k_{i=1} \left[ z^2 \right] &= \sum^k_{i=1} \left[ \frac{\left(o-e\right)^2}{e} \right] \\
\implies \chi^2_{\rm{d.f.}} &= \sum^k_{i=1} \left[ \frac{\left(o-e\right)^2}{e} \right]
\end{aligned}
$$

### Conclusion

The Chi Squared is defined by squaring and summing values sampled from a standard normal distribution.

This meausres the ratio of population and sample variance in a sample.

Variance is a measure of spread, it is defined by squared deviation. It is used rather than *Mean Absolute Deviation* because it is a parameter in the gaussian distribution.

A contingency table, with multinomial values, can be adapted to follow this distribution also and hence the chi squared distribution is commonly used for multinomial distributions.



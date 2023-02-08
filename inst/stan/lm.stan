data {
  int<lower=1> N;
  vector[N] x;
  vector[N] y;
}
parameters {
  real intercept;
  real beta;
  real<lower=0> sigma;
}
model {
  // ... priors, etc.
  intercept ~ normal(0, 1);
  beta ~ normal(0, 1);
  sigma ~ student_t(4, 1, .5) T[0,];
  y ~ normal(intercept + beta * x, sigma);
}

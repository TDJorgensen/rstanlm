#' Bayesian linear regression with Stan
#'
#' @export
#' @param x Numeric vector of input values.
#' @param y Numeric vector of output values.
#' @param ... Arguments passed to `rstan::sampling` (e.g. iter, chains).
#' @return An object of class `stanfit` returned by `rstan::sampling`
#'
lm_stan <- function(x, y, use_include = FALSE, ...) {
  standata <- list(x = x, y = y, N = length(y))

  if (use_include) {
         out <- rstan::sampling(stanmodels$lm2, data = standata, ...)
  } else out <- rstan::sampling(stanmodels$lm , data = standata, ...)

  return(out)
}

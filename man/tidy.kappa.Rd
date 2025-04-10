% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/psych.R
\name{tidy.kappa}
\alias{tidy.kappa}
\alias{kappa_tidiers}
\alias{psych_tidiers}
\title{Tidy a(n) kappa object}
\usage{
\method{tidy}{kappa}(x, ...)
}
\arguments{
\item{x}{A \code{kappa} object returned from \code{\link[psych:kappa]{psych::cohen.kappa()}}.}

\item{...}{Additional arguments. Not used. Needed to match generic
signature only. \strong{Cautionary note:} Misspelled arguments will be
absorbed in \code{...}, where they will be ignored. If the misspelled
argument has a default value, the default value will be used.
For example, if you pass \code{conf.lvel = 0.9}, all computation will
proceed using \code{conf.level = 0.95}. Two exceptions here are:
\itemize{
\item \code{tidy()} methods will warn when supplied an \code{exponentiate} argument if
it will be ignored.
\item \code{augment()} methods will warn when supplied a \code{newdata} argument if it
will be ignored.
}}
}
\description{
Tidy summarizes information about the components of a model.
A model component might be a single term in a regression, a single
hypothesis, a cluster, or a class. Exactly what tidy considers to be a
model component varies across models but is usually self-evident.
If a model has several distinct types of components, you will need to
specify which components to return.
}
\details{
Note that confidence level (alpha) for the confidence interval
cannot be set in \code{tidy}. Instead you must set the \code{alpha} argument
to \code{\link[psych:kappa]{psych::cohen.kappa()}} when creating the \code{kappa} object.
}
\examples{
\dontshow{if (rlang::is_installed(c("psych", "ggplot2"))) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}

# load libraries for models and data
library(psych)

# generate example data
rater1 <- 1:9
rater2 <- c(1, 3, 1, 6, 1, 5, 5, 6, 7)

# fit model
ck <- cohen.kappa(cbind(rater1, rater2))

# summarize model fit with tidiers + visualization
tidy(ck)

# graph the confidence intervals
library(ggplot2)

ggplot(tidy(ck), aes(estimate, type)) +
  geom_point() +
  geom_errorbarh(aes(xmin = conf.low, xmax = conf.high))
\dontshow{\}) # examplesIf}
}
\seealso{
\code{\link[=tidy]{tidy()}}, \code{\link[psych:kappa]{psych::cohen.kappa()}}
}
\value{
A \code{\link[tibble:tibble]{tibble::tibble()}} with columns:
  \item{conf.high}{Upper bound on the confidence interval for the estimate.}
  \item{conf.low}{Lower bound on the confidence interval for the estimate.}
  \item{estimate}{The estimated value of the regression term.}
  \item{type}{Either `weighted` or `unweighted`.}

}

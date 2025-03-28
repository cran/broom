% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/margins.R
\name{tidy.margins}
\alias{tidy.margins}
\alias{margins_tidiers}
\title{Tidy a(n) margins object}
\usage{
\method{tidy}{margins}(x, conf.int = FALSE, conf.level = 0.95, ...)
}
\arguments{
\item{x}{A \code{margins} object returned from \code{\link[margins:margins]{margins::margins()}}.}

\item{conf.int}{Logical indicating whether or not to include a confidence
interval in the tidied output. Defaults to \code{FALSE}.}

\item{conf.level}{The confidence level to use for the confidence interval
if \code{conf.int = TRUE}. Must be strictly greater than 0 and less than 1.
Defaults to 0.95, which corresponds to a 95 percent confidence interval.}

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
The \code{margins} package provides a way to obtain coefficient marginal
effects for a variety of (non-linear) models, such as logit or models with
multiway interaction terms. Note that the \code{glance.margins()} method
requires rerunning the underlying model again, which can take some time.
Similarly, an \code{augment.margins()} method is not currently supported, but
users can simply run the underlying model to obtain the same information.
}
\examples{
\dontshow{if (rlang::is_installed("margins")) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}

# load libraries for models and data
library(margins)

# example 1: logit model
mod_log <- glm(am ~ cyl + hp + wt, data = mtcars, family = binomial)

# get tidied "naive" model coefficients
tidy(mod_log)

# convert to marginal effects with margins()
marg_log <- margins(mod_log)

# get tidied marginal effects
tidy(marg_log)
tidy(marg_log, conf.int = TRUE)

# requires running the underlying model again. quick for this example
glance(marg_log)

# augmenting `margins` outputs isn't supported, but
# you can get the same info by running on the underlying model
augment(mod_log)

# example 2: threeway interaction terms
mod_ie <- lm(mpg ~ wt * cyl * disp, data = mtcars)

# get tidied "naive" model coefficients
tidy(mod_ie)

# convert to marginal effects with margins()
marg_ie0 <- margins(mod_ie)
# get tidied marginal effects
tidy(marg_ie0)
glance(marg_ie0)

# marginal effects evaluated at specific values of a variable (here: cyl)
marg_ie1 <- margins(mod_ie, at = list(cyl = c(4,6,8)))

# summarize model fit with tidiers
tidy(marg_ie1)

# marginal effects of one interaction variable (here: wt), modulated at
# specific values of the two other interaction variables (here: cyl and drat)
marg_ie2 <- margins(mod_ie,
                    variables = "wt",
                    at = list(cyl = c(4,6,8), drat = c(3, 3.5, 4)))

# summarize model fit with tidiers
tidy(marg_ie2)
\dontshow{\}) # examplesIf}
}
\seealso{
\code{\link[=tidy]{tidy()}}, \code{\link[margins:margins]{margins::margins()}}
}
\concept{margins tidiers}
\value{
A \code{\link[tibble:tibble]{tibble::tibble()}} with columns:
  \item{conf.high}{Upper bound on the confidence interval for the estimate.}
  \item{conf.low}{Lower bound on the confidence interval for the estimate.}
  \item{estimate}{The estimated value of the regression term.}
  \item{p.value}{The two-sided p-value associated with the observed statistic.}
  \item{statistic}{The value of a T-statistic to use in a hypothesis that the regression term is non-zero.}
  \item{std.error}{The standard error of the regression term.}
  \item{term}{The name of the regression term.}

}

% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/biglm.R
\name{tidy.biglm}
\alias{tidy.biglm}
\title{Tidy a(n) biglm object}
\usage{
\method{tidy}{biglm}(x, conf.int = FALSE, conf.level = 0.95, exponentiate = FALSE, ...)
}
\arguments{
\item{x}{A \code{biglm} object created by a call to \code{\link[biglm:biglm]{biglm::biglm()}} or
\code{\link[biglm:bigglm]{biglm::bigglm()}}.}

\item{conf.int}{Logical indicating whether or not to include a confidence
interval in the tidied output. Defaults to \code{FALSE}.}

\item{conf.level}{The confidence level to use for the confidence interval
if \code{conf.int = TRUE}. Must be strictly greater than 0 and less than 1.
Defaults to 0.95, which corresponds to a 95 percent confidence interval.}

\item{exponentiate}{Logical indicating whether or not to exponentiate the
the coefficient estimates. This is typical for logistic and multinomial
regressions, but a bad idea if there is no log or logit link. Defaults
to \code{FALSE}.}

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
\examples{
\dontshow{if (rlang::is_installed("biglm")) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}

# load modeling library
library(biglm)

# fit model -- linear regression
bfit <- biglm(mpg ~ wt + disp, mtcars)

# summarize model fit with tidiers
tidy(bfit)
tidy(bfit, conf.int = TRUE)
tidy(bfit, conf.int = TRUE, conf.level = .9)

glance(bfit)

# fit model -- logistic regression
bgfit <- bigglm(am ~ mpg, mtcars, family = binomial())

# summarize model fit with tidiers
tidy(bgfit)
tidy(bgfit, exponentiate = TRUE)
tidy(bgfit, conf.int = TRUE)
tidy(bgfit, conf.int = TRUE, conf.level = .9)
tidy(bgfit, conf.int = TRUE, conf.level = .9, exponentiate = TRUE)

glance(bgfit)
\dontshow{\}) # examplesIf}
}
\seealso{
\code{\link[=tidy]{tidy()}}, \code{\link[biglm:biglm]{biglm::biglm()}}, \code{\link[biglm:bigglm]{biglm::bigglm()}}

Other biglm tidiers: 
\code{\link{glance.biglm}()}
}
\concept{biglm tidiers}
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

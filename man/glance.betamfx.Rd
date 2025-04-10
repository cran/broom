% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mfx.R
\name{glance.betamfx}
\alias{glance.betamfx}
\title{Glance at a(n) betamfx object}
\usage{
\method{glance}{betamfx}(x, ...)
}
\arguments{
\item{x}{A \code{betamfx} object.}

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
Glance accepts a model object and returns a \code{\link[tibble:tibble]{tibble::tibble()}}
with exactly one row of model summaries. The summaries are typically
goodness of fit measures, p-values for hypothesis tests on residuals,
or model convergence information.

Glance never returns information from the original call to the modeling
function. This includes the name of the modeling function or any
arguments passed to the modeling function.

Glance does not calculate summary measures. Rather, it farms out these
computations to appropriate methods and gathers the results together.
Sometimes a goodness of fit measure will be undefined. In these cases
the measure will be reported as \code{NA}.

Glance returns the same number of columns regardless of whether the
model matrix is rank-deficient or not. If so, entries in columns
that no longer have a well-defined value are filled in with an \code{NA}
of the appropriate type.
}
\details{
This glance method wraps \code{\link[=glance.betareg]{glance.betareg()}} for \code{\link[mfx:betamfx]{mfx::betamfx()}} objects.
}
\examples{
\dontshow{if (rlang::is_installed("mfx")) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}

library(mfx)

# Simulate some data
set.seed(12345)
n <- 1000
x <- rnorm(n)

# Beta outcome
y <- rbeta(n, shape1 = plogis(1 + 0.5 * x), shape2 = (abs(0.2 * x)))
# Use Smithson and Verkuilen correction
y <- (y * (n - 1) + 0.5) / n

d <- data.frame(y, x)
mod_betamfx <- betamfx(y ~ x | x, data = d)

tidy(mod_betamfx, conf.int = TRUE)

# Compare with the naive model coefficients of the equivalent betareg call (not run)
# tidy(betamfx(y ~ x | x, data = d), conf.int = TRUE)

augment(mod_betamfx)
glance(mod_betamfx)
\dontshow{\}) # examplesIf}
}
\seealso{
\code{\link[=glance.betareg]{glance.betareg()}}, \code{\link[mfx:betamfx]{mfx::betamfx()}}

Other mfx tidiers: 
\code{\link{augment.betamfx}()},
\code{\link{augment.mfx}()},
\code{\link{glance.mfx}()},
\code{\link{tidy.betamfx}()},
\code{\link{tidy.mfx}()}
}
\concept{mfx tidiers}
\value{
A \code{\link[tibble:tibble]{tibble::tibble()}} with exactly one row and columns:
  \item{AIC}{Akaike's Information Criterion for the model.}
  \item{BIC}{Bayesian Information Criterion for the model.}
  \item{df.null}{Degrees of freedom used by the null model.}
  \item{df.residual}{Residual degrees of freedom.}
  \item{logLik}{The log-likelihood of the model. [stats::logLik()] may be a useful reference.}
  \item{nobs}{Number of observations used.}
  \item{pseudo.r.squared}{Like the R squared statistic, but for situations when the R squared statistic isn't defined.}

}

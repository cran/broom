% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/stats-smooth.spline.R
\name{glance.smooth.spline}
\alias{glance.smooth.spline}
\title{Tidy a(n) smooth.spine object}
\usage{
\method{glance}{smooth.spline}(x, ...)
}
\arguments{
\item{x}{A \code{smooth.spline} object returned from \code{\link[stats:smooth.spline]{stats::smooth.spline()}}.}

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
\dontshow{if (FALSE) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}

# fit model
spl <- smooth.spline(mtcars$wt, mtcars$mpg, df = 4)

# summarize model fit with tidiers
augment(spl, mtcars)

# calls original columns x and y
augment(spl)

library(ggplot2)
ggplot(augment(spl, mtcars), aes(wt, mpg)) +
  geom_point() +
  geom_line(aes(y = .fitted))
\dontshow{\}) # examplesIf}
}
\seealso{
\code{\link[=augment]{augment()}}, \code{\link[stats:smooth.spline]{stats::smooth.spline()}}

Other smoothing spline tidiers: 
\code{\link{augment.smooth.spline}()}
}
\concept{smoothing spline tidiers}
\value{
A \code{\link[tibble:tibble]{tibble::tibble()}} with exactly one row and columns:
  \item{crit}{Minimized criterion}
  \item{cv.crit}{Cross-validation score}
  \item{df}{Degrees of freedom used by the model.}
  \item{lambda}{Choice of lambda corresponding to `spar`.}
  \item{nobs}{Number of observations used.}
  \item{pen.crit}{Penalized criterion.}
  \item{spar}{Smoothing parameter.}

}

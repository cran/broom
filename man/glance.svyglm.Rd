% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/survey.R
\name{glance.svyglm}
\alias{glance.svyglm}
\title{Glance at a(n) svyglm object}
\usage{
\method{glance}{svyglm}(x, maximal = x, ...)
}
\arguments{
\item{x}{A \code{svyglm} object returned from \code{\link[survey:svyglm]{survey::svyglm()}}.}

\item{maximal}{A \code{svyglm} object corresponding to the maximal
model against which to compute the BIC. See Lumley and Scott
(2015) for details. Defaults to \code{x}, which is equivalent
to not using a maximal model.}

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
\examples{
\dontshow{if (rlang::is_installed("survey")) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}

# load libraries for models and data
library(survey)

set.seed(123)
data(api)

# survey design
dstrat <-
  svydesign(
    id = ~1,
    strata = ~stype,
    weights = ~pw,
    data = apistrat,
    fpc = ~fpc
  )

# model
m <- svyglm(
  formula = sch.wide ~ ell + meals + mobility,
  design = dstrat,
  family = quasibinomial()
)

glance(m)
\dontshow{\}) # examplesIf}
}
\references{
Lumley T, Scott A (2015). AIC and BIC for modelling with complex
survey data. \emph{Journal of Survey Statistics and Methodology}, 3(1).
}
\seealso{
\code{\link[survey:svyglm]{survey::svyglm()}}, \code{\link[stats:glm]{stats::glm()}}, \link[survey:anova.svyglm]{survey::anova.svyglm}

Other lm tidiers: 
\code{\link{augment.glm}()},
\code{\link{augment.lm}()},
\code{\link{glance.glm}()},
\code{\link{glance.lm}()},
\code{\link{glance.summary.lm}()},
\code{\link{tidy.glm}()},
\code{\link{tidy.lm}()},
\code{\link{tidy.lm.beta}()},
\code{\link{tidy.mlm}()},
\code{\link{tidy.summary.lm}()}
}
\concept{lm tidiers}
\value{
A \code{\link[tibble:tibble]{tibble::tibble()}} with exactly one row and columns:
  \item{AIC}{Akaike's Information Criterion for the model.}
  \item{BIC}{Bayesian Information Criterion for the model.}
  \item{deviance}{Deviance of the model.}
  \item{df.null}{Degrees of freedom used by the null model.}
  \item{df.residual}{Residual degrees of freedom.}
  \item{null.deviance}{Deviance of the null model.}

}

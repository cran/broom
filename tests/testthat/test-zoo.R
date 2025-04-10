skip_on_cran()

skip_if_not_installed("modeltests")
library(modeltests)

skip_if_not_installed("zoo")

test_that("tidy.zoo", {
  set.seed(1071)
  z.index <- zoo::as.Date(sample(12450:12500, 10))
  z.data <- matrix(rnorm(30), ncol = 3)

  colnames(z.data) <- c("Aa", "Bb", "Cc")
  z <- zoo::zoo(z.data, z.index)

  check_arguments(tidy.zoo)

  td <- tidy(z)
  check_tidy_output(td)
  check_dims(td, 30, 3)

  colnames(z.data) <- c("Not dataframe", "(compatible", "names -")
  z <- zoo::zoo(z.data, z.index)
  td <- tidy(z)
  expect_true(all(unique(td$series) %in% colnames(z.data)))

  # test for univariate functionality
  z2 <- zoo::zoo(rnorm(30), z.index)
  td2 <- tidy(z2)

  check_tidy_output(td2)
  check_dims(td2, 10, 2)
})

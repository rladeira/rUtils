
context("is.empty.vector")

test_that("is.empty.vector throws error for bad input",{

  expect_that(is.empty.vector(matrix()),
              throws_error("Parameter must be a vector!"))
  expect_that(is.empty.vector(data.frame()),
              throws_error("Parameter must be a vector!"))
})

test_that("is.empty.vector behaves correctly",{

  expect_that(is.empty.vector(list()), is_true())
  expect_that(is.empty.vector(character()), is_true())
  expect_that(is.empty.vector(logical()), is_true())
  expect_that(is.empty.vector(list(1)), is_false())
  expect_that(is.empty.vector(c("")), is_false())
})

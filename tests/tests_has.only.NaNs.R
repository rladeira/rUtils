
context("has.only.NaNs")

test_that("has.only.NaNs behaves correctly", {

  expect_that(has.only.NaNs(c(NaN, NaN)), is_true())
  expect_that(has.only.NaNs(c(NA, NaN)), is_false())
  expect_that(has.only.NaNs(c(NaN, 1)), is_false())
  expect_that(has.only.NaNs(c(NaN, "1")), is_false())
  expect_that(has.only.NaNs(numeric()), is_false())
  expect_that(has.only.NaNs(list(NA, NaN)), is_false())
  expect_that(has.only.NaNs(list(NaN, NaN)), is_true())
})

test_that("has.only.NaNs of missing is FALSE", {

  expect_that(has.only.NaNs(c(NA, NA)), is_false())
})

test_that("has.only.NaNs of non vector type throws exception", {

  expect_that(has.only.NaNs(matrix()), throws_error("vec must be a vector!"))
  expect_that(has.only.NaNs(data.frame()), throws_error("vec must be a vector!"))
  expect_that(has.only.NaNs(factor(1:10)), throws_error("vec must be a vector!"))
})



context("last")

test_that("last throws exception for empty vector or list.", {

  expect_that(
    last(list()),
    throws_error("last: x can't be empty.")
  )
  expect_that(
    last(numeric()),
    throws_error("last: x can't be empty.")
  )
})

test_that("last retrieves last element of a vector.", {

  vec <- 1:100
  expect_true(last(vec) == 100)
})

test_that("last retrieves last element of a list", {

  l <- lapply(1:100, function(i) i)
  expect_true(last(l) == 100)
})


context("first")

test_that("first throws exception for empty vector or list.", {

  expect_that(
    first(list()),
    throws_error("first: x can't be empty.")
  )
  expect_that(
    first(numeric()),
    throws_error("first: x can't be empty.")
  )
})

test_that("first retrieves first element of a vector.", {

  vec <- 1:100
  expect_true(first(vec) == 1)
})

test_that("first retrieves first element of a list", {

  l <- lapply(1:100, function(i) i)
  expect_true(first(l) == 1)
})

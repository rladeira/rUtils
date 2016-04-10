
context("time_it")

test_that("time_it throws exception for bad input",{

  expect_that(time_it(list()),
              throws_error("Invalid argument! operation must be a function."))
  expect_that(time_it(1),
              throws_error("Invalid argument! operation must be a function."))
  expect_that(time_it(character()),
              throws_error("Invalid argument! operation must be a function."))

})

test_that("time_it returns correct time type", {

  f <- function() sapply(1:1000, sum)

  t1 <- time_it(f)
  t2 <- time_it(f, type = "user.self")
  t3 <- time_it(f, type = "sys.self")

  expect_that(names(t1)[1], equals("elapsed"))
  expect_that(names(t2)[1], equals("user.self"))
  expect_that(names(t3)[1], equals("sys.self"))

})

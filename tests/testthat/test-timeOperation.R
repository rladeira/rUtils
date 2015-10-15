
context("timeOperation")

test_that("timeOperation throws exception for bad input",{

  expect_that(timeOperation(list()),
              throws_error("Invalid argument! operation must be a function."))
  expect_that(timeOperation(1),
              throws_error("Invalid argument! operation must be a function."))
  expect_that(timeOperation(character()),
              throws_error("Invalid argument! operation must be a function."))

})

test_that("timeOperation returns correct time type", {

  f <- function() { sapply(1:1000, sum) }

  t1 <- timeOperation(f)
  t2 <- timeOperation(f, type = "user.self")
  t3 <- timeOperation(f, type = "sys.self")

  expect_that(names(t1)[1], equals("elapsed"))
  expect_that(names(t2)[1], equals("user.self"))
  expect_that(names(t3)[1], equals("sys.self"))

})

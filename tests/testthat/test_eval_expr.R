
context("eval_expr")

test_that("eval_expr throws exception for bad input",{

  expect_that(
    eval_expr(list()),
    throws_error("expr must be of type character!"))
  expect_that(
    eval_expr(c("1+1", "1+1")),
    throws_error("expr must have just one character element!"))
  expect_that(
    eval_expr(character()),
    throws_error("expr cannot be empty!"))

})

test_that("eval_expr evaluates text as code", {

  eval_expr("a <- 1")
  eval_expr("b <- list(i = 1)")
  eval_expr("c <- 1:100")
  d <- eval_expr("2*2")

  expect_that(a, equals(1))
  expect_that(is.list(b), is_true())
  expect_that(b$i, equals(1))
  expect_that(length(c), equals(100))
  expect_that(d, equals(4))
})

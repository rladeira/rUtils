
context("eval.expression")

test_that("eval.expression throws exception for bad input",{

  expect_that(eval.expression(list()),
              throws_error("expression.as.character must be of type character!"))
  expect_that(eval.expression(c("1+1", "1+1")),
              throws_error("expression.as.character must have just one character element!"))
  expect_that(eval.expression(character()),
              throws_error("expression.as.character cannot be empty!"))

})

test_that("eval.expression evaluates text as code", {

  eval.expression("a <- 1")
  eval.expression("b <- list(i = 1)")
  eval.expression("c <- 1:100")

  expect_that(a, equals(1))
  expect_that(is.list(b), is_true())
  expect_that(b$i, equals(1))
  expect_that(length(c), equals(100))
})

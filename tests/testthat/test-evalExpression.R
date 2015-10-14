
context("evalExpression")

test_that("evalExpression throws exception for bad input",{

  expect_that(evalExpression(list()),
              throws_error("expressionAsCharacter must be of type character!"))
  expect_that(evalExpression(c("1+1", "1+1")),
              throws_error("expressionAsCharacter must have just one character element!"))
  expect_that(evalExpression(character()),
              throws_error("expressionAsCharacter cannot be empty!"))

})

test_that("evalExpression evaluates text as code", {

  evalExpression("a <- 1")
  evalExpression("b <- list(i = 1)")
  evalExpression("c <- 1:100")
  d <- evalExpression("2*2")

  expect_that(a, equals(1))
  expect_that(is.list(b), is_true())
  expect_that(b$i, equals(1))
  expect_that(length(c), equals(100))
  expect_that(d, equals(4))}
)

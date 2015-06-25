
context("vector.to.string")

test_that("vector.to.string throws exception for bad input",{

  expect_that(vector.to.string(1:10, 1),
              throws_error("collapse must be of type character!"))
  expect_that(vector.to.string(1:10, list()),
              throws_error("collapse must be of type character!"))
  expect_that(vector.to.string(matrix(), ""),
              throws_error("vec must be a vector!"))

})

test_that("vector.to.string formats vectors to string", {

  expect_that(vector.to.string(c(1,2,3)), equals("1, 2, 3"))
  expect_that(vector.to.string(c("1","2","3")), equals("1, 2, 3"))
  expect_that(vector.to.string(c(1,2,NA)), equals("1, 2, NA"))
})

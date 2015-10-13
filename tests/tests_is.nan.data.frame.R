
context("is.nan.data.frame")

test_that("is.nan.data.frame throws exception for bad input", {

  expect_that(is.nan.data.frame(list()),
              throws_error("d must be a data.frame."))

  expect_that(is.nan.data.frame("1"),
              throws_error("d must be a data.frame."))

  expect_that(is.nan.data.frame(1),
              throws_error("d must be a data.frame."))

})

test_that("is.nan.data.frame should detect NaNs", {

  d <- data.frame(c1 = rep(NaN, 10),
  c2 = rep(NaN, 10))
  d[is.nan(d)] <- 0

  apply(d, 1,
        function(row) {
          sapply(row,
                 function(i) {
                   expect_that(i, equals(0))
                 })
        })
})

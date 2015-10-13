
context("runWithCpuParallelBackend")

test_that("runWithCpuParallelBackend throws exception for bad input", {

  func <- function() {}

  expect_that(runWithCpuParallelBackend(list()),
              throws_error("taskToBeExecuted must be a function!"))

  expect_that(runWithCpuParallelBackend(func, nCores = "1"),
              throws_error("nCores must be of numeric type!"))

  expect_that(runWithCpuParallelBackend(func, nCores = c(10, 10)),
              throws_error("nCores must be a numeric vector with length one!"))

  expect_that(runWithCpuParallelBackend(func, nCores = -1),
              throws_error("nCores must be a positive integer!"))

})

test_that("runWithCpuParallelBackend should work properly", {

  summation <- function(){
    # saves the result in the parent enviroment
    result <<- sum(foreach(i = 1:10000, .combine = "c") %dopar% {i})
  }

  runWithCpuParallelBackend(summation)

  expect_that(result, equals(50005000))
})


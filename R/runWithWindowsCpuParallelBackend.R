
#' @title
#' CPU Parallel Processing in Windows OS
#'
#' @description
#' Utility function which executes a task with automatic configured windows parallel
#' backend. Under the hoods, it uses the \code{\link[doSNOW]{makeCluster}}
#' function from the \code{doSNOW} package.
#'
#' @details
#' This function also saves in the global environment a boolean variable called
#' \code{activeParallelBackend} indicating if the parallel backend is
#' available to use.
#'
#' @inheritParams runWithCpuParallelBackend
#'
#' @examples
#' library(foreach)
#'
#' # a function simulating an useful parallel task
#' summation <- function(){
#'    # saves the result in the parent enviroment
#'    result <<- sum(foreach(i = 1:10000, .combine = "c") %dopar% {sqrt(i)})
#' }
#'
#' runWithWindowsCpuParallelBackend(summation)
#' print(result) ## 666716.5
#'
#' @export


runWithWindowsCpuParallelBackend <- function(taskToBeExecuted,
                                             nCores = NULL,
                                             ...) {
  library(parallel)
  library(doSNOW)

  if(is.null(nCores))
    nCores <- as.numeric(detectCores())
  if(!is.numeric(nCores))
    stop("nCores must be of numeric type!")
  if(length(nCores) != 1)
    stop("nCores must be a numeric vector with length one!")
  if(nCores[1] < 1)
    stop("nCores must be a positive integer!")
  if(!is.function(taskToBeExecuted))
    stop("taskToBeExecuted must be a function!")

  cl <- makeCluster(nCores, type = "SOCK", outfile="")
  registerDoSNOW(cl)

  assign("activeParallelBackend", TRUE, envir = .GlobalEnv)

  taskToBeExecuted(...)

  stopCluster(cl)
  assign("activeParallelBackend", FALSE, envir = .GlobalEnv)

  return(invisible())
}

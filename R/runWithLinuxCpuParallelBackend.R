
#' @title
#' CPU Parallel Processing in Linux
#'
#' @description
#' Utility function which executes a task with automatic configured linux parallel
#' backend. Under the hoods, it uses the \code{\link[doMC]{registerDoMC}}
#' function from the \code{doMC} package.
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
#' runWithLinuxCpuParallelBackend(summation)
#' print(result) ## 666716.5
#'
#' @export


runWithLinuxCpuParallelBackend <- function(taskToBeExecuted,
                                           nCores = NULL,
                                           ...){

  if(is.null(nCores))
    nCores <- detectCores()
  if(!is.integer(nCores))
    stop("nCores must be an integer!")
  if(!is.function(taskToBeExecuted))
    stop("taskToBeExecuted must be a function!")

  library(parallel)
  library(doMC)

  registerDoMC(nCores)
  assign("activeParallelBackend", TRUE, envir = .GlobalEnv)

  taskToBeExecuted(...)

  assign("activeParallelBackend", TRUE, envir = .GlobalEnv)
}

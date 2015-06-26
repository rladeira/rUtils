
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
#' \code{windows.parallel.backend} indicating if the parallel backend is
#' available to use.
#'
#' @inheritParams execute.with.cpu.parallel.backend
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
#' execute.with.windows.cpu.parallel.backend(summation)
#' print(result) ## 666716.5
#'
#' @export


execute.with.windows.cpu.parallel.backend <- function(task.to.be.executed,
                                                 n.cores = NULL,
                                                 ...){

  library(parallel)
  library(doSNOW)

  if(is.null(n.cores))
    n.cores <- detectCores()
  if(!is.integer(n.cores))
    stop("n.cores must be an integer!")
  if(!is.function(task.to.be.executed))
    stop("task.to.be.executed must be a function!")

  cl <- makeCluster(n.cores, type = "SOCK", outfile="")
  registerDoSNOW(cl)

  assign("windows.parallel.backend", TRUE, envir = .GlobalEnv)

  task.to.be.executed(...)

  stopCluster(cl)
  assign("windows.parallel.backend", FALSE, envir = .GlobalEnv)
}

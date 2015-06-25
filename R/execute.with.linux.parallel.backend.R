
#' @title
#' CPU parallel processing in Linux
#'
#' @description
#' Utility function which executes a task with automatic configured linux parallel
#' backend. Under the hoods, it uses the \code{\link[doMC]{registerDoMC}}
#' function from the \code{doMC} package.
#'
#' @details
#' This function also saves in the global environment a boolean variable called
#' \code{linux.parallel.backend} indicating if the parallel backend is
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
#'    result <<- sum(foreach(i = 1:1000, .combine = "c") %dopar% {i*i})
#' }
#'
#' execute.with.linux.cpu.parallel.backend(summation)
#' print(result)
#'
#'

execute.with.linux.cpu.parallel.backend <- function(task.to.be.executed,
                                                n.cores = NULL,
                                                ...){

  if(is.null(n.cores))
    n.cores <- detectCores()
  if(!is.integer(n.cores))
    stop("n.cores must be an integer!")
  if(!is.function(task.to.be.executed))
    stop("task.to.be.executed must be a function!")

  library(parallel)
  library(doMC)

  registerDoMC(n.cores)
  assign("linux.parallel.backend", TRUE, envir = .GlobalEnv)

  task.to.be.executed(...)

  assign("linux.parallel.backend", TRUE, envir = .GlobalEnv)
}

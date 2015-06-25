

#' @title
#' CPU Parallel Processing
#'
#' @description
#' Helper function which automatically configures a CPU parallel
#' backend either on Linux or Windows (MAC OS is not supported).
#' It is specially useful when there is a requirement to write R
#' code that should be portable between windows and linux.
#'
#' @details
#' This function saves in global environment either a boolean variable
#' called \code{linux.parallel.backend} or \code{windows.parallel.backend},
#' indicating if the parallel backend is available for use and the type of
#' the operating system in which the code is being run.
#'
#' @param task.to.be.executed a function representing a task to be executed
#' with parallel processing.
#' @param n.cores the numbers of CPU cores to be used in the parallel
#' processing. By default, it uses the numbers of cores returned by the
#' \code{\link[parallel]{detectCores}} function. It must be an integer.
#' @param ... additional paramaters to be delegated to \code{task.to.be.executed}
#' function.
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
#' # this code is portable between windows and linux, if the right packages
#' # are installed in both of them.
#' execute.with.cpu.parallel.backend(summation)
#' print(result) ## 666716.5
#'
#'

execute.with.cpu.parallel.backend <- function(task.to.be.executed,
                                              n.cores = NULL,
                                              ...){

  library(parallel)

  if(is.null(n.cores))
    n.cores <- detectCores()
  if(!is.integer(n.cores))
    stop("n.cores must be an integer!")
  if(!is.function(task.to.be.executed))
    stop("task.to.be.executed must be a function!")

  switch(Sys.info()[['sysname']],
         Windows = execute.with.windows.parallel.config(task.to.be.executed, n.cores, ...),
         Linux   = execute.with.linux.parallel.config(task.to.be.executed, n.cores, ...))
}

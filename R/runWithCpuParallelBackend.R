

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
#' This function saves in global environment a boolean variable
#' called \code{activeParallelBackend}, indicating whether or not
#' the parallel backend is available for use.
#'
#' @param taskToBeExecuted a function representing a task to be executed
#' with parallel processing.
#' @param nCores the numbers of CPU cores to be used in the parallel
#' processing. By default, it uses the numbers of cores returned by the
#' \code{\link[parallel]{detectCores}} function. It must be an integer.
#' @param ... additional paramaters to be delegated to \code{taskToBeExecuted}
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
#' runWithCpuParallelBackend(summation)
#' print(result) ## 666716.5
#'
#' @export


runWithCpuParallelBackend <- function(taskToBeExecuted,
                                      nCores = NULL,
                                      ...){

  library(parallel)

  if(is.null(nCores))
    nCores <- detectCores()
  if(!is.integer(nCores))
    stop("nCores must be an integer!")
  if(!is.function(taskToBeExecuted))
    stop("taskToBeExecuted must be a function!")

  switch(Sys.info()[['sysname']],
         Windows = execute.with.windows.cpu.parallel.backend(taskToBeExecuted, nCores, ...),
         Linux   = execute.with.linux.cpu.parallel.backend(taskToBeExecuted, nCores, ...))
}

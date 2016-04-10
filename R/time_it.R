
#' @title
#' Time execution measurement
#'
#' @description
#' Function to measure how much time (in seconds) some operation
#' has taken to execute.
#'
#' @param operation a target function to have its execution time
#' measured.
#' @param type the OS time type to be returned by time_it.
#' Defaults to 'elapsed'.
#'
#' @examples
#'
#' f <- function() { sapply(1:1000000, sum) }
#' timeElapsed <- time_it(f)
#'
#' @export

time_it <- function(operation, type = c("elapsed", "user.self", "sys.self")) {

  if (is.function(operation) == FALSE) {
    stop("Invalid argument! operation must be a function.")
  }
  type <- match.arg(type)
  start_time <- proc.time()
  operation()
  end_time <- proc.time()
  time_taken <- end_time - start_time
  time_taken[type]
}

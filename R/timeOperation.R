
#' @title
#' Time execution measurement
#'
#' @description
#' Function to measure how much time (in seconds) some operation
#' has taken to execute.
#'
#' @param operation a target function to have its execution time
#' measured.
#' @param type the OS time type to be returned by timeOperation.
#' Defaults to "elapsed".
#'
#' @examples
#'
#' f <- function() { sapply(1:1000000, sum) }
#' timeElapsed <- timeOperation(f)
#'
#' @export

timeOperation <-
  function(operation,
           type=c("elapsed", "user.self", "sys.self")) {

    if(is.function(operation) == FALSE)
      stop("Invalid argument! operation must be a function.")

    type <- match.arg(type)
    startTime <- proc.time()
    operation()
    endTime <- proc.time()
    timeTaken <- endTime - startTime

    return(timeTaken[type])
  }

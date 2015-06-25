

#' @title
#' Error swallower
#'
#' @description
#' Recursive helper function to reinvoke other function
#' passed as parameter if some unexpected error occurs.
#' However, if the invoked function is buggy and always throws some
#' error in its internal execution, it'll generate a infinite
#' loop. So be careful and just use this function to handle
#' errors when exceptions seldom occur. For instance, it would
#' be useful in some function which communicates over a network
#' and thus depends on external resources that could fail
#' unexpectedly.
#'
#' @param func function to be monitored and restarted if some
#' unexpected error happens.
#' @param ... additional paramaters to be delegated to \code{func}.
#'
#' @examples
#' get.some.resource.in.network.mock <- function(param1, param2) {}
#'
#'  loop.until.done <- function(
#'    func = get.some.resource.in.network.mock,
#'    param1 = param1,
#'    param2 = param2)
#'
#' @export

loop.until.done <- function(func, ...){

  if(!is.function(func))
    stop("func must be a funtion!")

  tryCatch(
    func(...),
    error = function(e){
      print(e)
      loop.until.done(func, ...)
    })
}

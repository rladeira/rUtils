
#' @title
#' Error Swallower
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
#' get_some_network_resource <- function(param1, param2) {}
#'
#'  loop_until_done <- function(
#'    func = get_some_network_resource,
#'    param1 = param1,
#'    param2 = param2)
#'
#' @export

loop_until_done <- function(func, ...) {

  if (!is.function(func)) {
    stop("func must be a funtion!")
  }
  tryCatch(func(...), error = function(e) {
    print(e)
    loop_until_done(func, ...)
  })
  invisible()
}


#' @title
#' Element Retrieval
#'
#' @description
#' Retrieve the last element of a vector or a list.
#'
#' @param x a vector or list
#' @param is_list is x a list?
#'
#' @examples
#'
#' last(1:100)
#' ## 100
#'
#' @export

last <- function(x, is_list = FALSE) {

  if (length(x) == 0) {
    stop("last: x can't be empty.")
  }
  len <- length(x)
  if (is_list) {
    return(x[[len]])
  } else {
    return(x[len])
  }
}

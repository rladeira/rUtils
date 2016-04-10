
#' @title
#' Element Retrieval
#'
#' @description
#' Retrieve the first element of a vector or list.
#'
#' @param x a vector or list
#' @param is_list is x a list?
#'
#' @examples
#'
#' first(1:100)
#' ## 1
#'
#' @export

first <- function(x, is_list = FALSE) {

  if (length(x) == 0) {
    stop("first: x can't be empty")
  }
  if (is_list) {
    return(x[[1]])
  } else {
    return(x[1])
  }
}

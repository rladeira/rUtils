
#' @title
#' Metaprogramming
#'
#' @description
#' Helper function to parse a vector with a single character element as
#' code.
#'
#' @param expr a vector of length 1 containing the
#' code to be executed as a character element.
#'
#' @examples
#'
#' eval_expr('n <- 1 + 1')
#' cat(n)
#' ## 2
#'
#' @export

eval_expr <- function(expr) {

  if (!is.character(expr)) {
    stop("expr must be of type character!")
  }
  if (length(expr) > 1) {
    stop("expr must have just one character element!")
  }
  if (length(expr) == 0) {
    stop("expr cannot be empty!")
  }

  eval(parse(text = expr), envir = parent.frame())
}

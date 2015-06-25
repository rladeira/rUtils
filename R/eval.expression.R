
#' @title
#' Metaprogramming
#'
#' @description
#' Helper function to parse a vector with a single character element as
#' code.
#'
#' @param expression.as.character a vector of length 1 containing the
#' code to be executed as a character element.
#'
#' @examples
#'
#' eval.expression("n <- 1 + 1")
#' cat(n)
#'

eval.expression <- function(expression.as.character){

  if(length(expression.as.character) > 1)
    stop("expression.as.character must have just one character element!")
  if(is.vector.empty(expression.as.character))
    stop("expression.as.character cannot be empty!")
  if(!is.character(expression.as.character))
    stop("expression.as.character must be of type character!")

  eval(parse(text = expression.as.character),
       envir = parent.frame())
}

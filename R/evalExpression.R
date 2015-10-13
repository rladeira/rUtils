
#' @title
#' Metaprogramming
#'
#' @description
#' Helper function to parse a vector with a single character element as
#' code.
#'
#' @param expressionAsCharacter a vector of length 1 containing the
#' code to be executed as a character element.
#'
#' @examples
#'
#' evalExpression("n <- 1 + 1")
#' cat(n) ## 2
#'
#' @export

evalExpression <- function(expressionAsCharacter) {

  if(!is.character(expressionAsCharacter))
    stop("expressionAsCharacter must be of type character!")
  if(length(expressionAsCharacter) > 1)
    stop("expressionAsCharacter must have just one character element!")
  if(length(expressionAsCharacter) == 0)
    stop("expressionAsCharacter cannot be empty!")

  eval(parse(text = expressionAsCharacter),
       envir = parent.frame())
}

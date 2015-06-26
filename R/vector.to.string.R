
#' @title
#' Vector Formatting
#'
#' @description
#' This function joins every element of a vector into a single
#' character element. Useful for formatting output.
#'
#' @param vec a vector containing the elements to be joined.
#' @param collapse character value to use as a separator between
#' the elements of \code{vec}.
#'
#' @examples
#' vector.to.string(1:10)
#' ## Produces "1, 2, 3, 4, 5, 6, 7, 8, 9, 10"
#'
#' @export

vector.to.string <- function(vec, collapse = ", "){

  if(!is.vector(vec))
    stop("vec must be a vector!")
  if(!is.character(collapse))
    stop("collapse must be of type character!")

  paste(vec, collapse = collapse)
}

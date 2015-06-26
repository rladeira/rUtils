

#' @title
#' Vector
#'
#' @description
#' This function indicates whether or not a vector is empty.
#' @param vec a vector.
#' @return A boolean vector with just one element indicating if the vector \code{vec} is empty.
#'
#' @examples
#' is.vector.empty(1:10) ## FALSE
#' is.vector.empty(numeric()) ## TRUE
#'
#'
#' @export

is.empty.vector <- function(vec){

  if(!is.vector(vec))
    stop("Parameter must be a vector!")

  for( element in vec){
    return(FALSE)
  }

  return(TRUE)
}

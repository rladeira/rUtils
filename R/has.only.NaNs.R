
#' @title
#' NaN Check
#'
#' @description
#' Test if a vector has just NaN elements.
#'
#' @param vec a vector
#'
#' @examples
#' has.only.NaNs(c(NaN, NaN, NaN)) ## TRUE
#' has.only.NaNs(c(1, NaN, NaN))   ## FALSE
#'

has.only.NaNs <- function(vec){

  if(!is.vector(vec))
    stop("vec must be a vector!")

  for(e in vec){
    if(!is.nan(e)) return(FALSE)
  }

  if(is.vector.empty(vec))
    return(FALSE)

  return(TRUE)
}

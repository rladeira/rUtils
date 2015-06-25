
#' @title
#' Character Capitalization
#'
#' @description
#' Capitalize all elements of a character vector.
#'
#' @param character.vec a character vector to be capitalized.
#'
#' @examples
#' vec <- c("ab", "ac", "ad")
#' capitalize(vec)
#' ## prints
#' ## "Ab"    "Ac"    "Ad"
#'

capitalize <- function(character.vec) {

  if(!is.character(character.vec))
    stop("character.vec must be a character vector!")
  if(is.vector.empty(character.vec))
    return(character())

  splitted <- strsplit(character.vec, " ", fixed = TRUE)

  sapply(splitted,
         function(piece){

           browser()

           paste(toupper(substring(piece, 1,1)),
                 substring(piece, 2),
                 sep="", collapse=" ")
         })
}

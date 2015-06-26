
#' @title
#' Character Matching
#'
#' @description
#' Helper function wrapping over native \code{\link[base]{grepl}}
#' function to provide a more readable way of testing whether or
#' not a character contains other.
#'
#' @param sub.character the character to seek.
#' @param character the character to be tested if contains
#' \code{sub.character}
#'
#' @examples
#' character.contains("ab", "abc") ## returns TRUE
#' character.contains("abc", "ab") ## returns FALSE.
#'
#' @export

character.contains <- function(sub.character, character){

  if(!is.character(sub.character))
    stop("sub.character must be of type character!")
  if(!is.character(character))
    stop("character must be of type character!")
  if(length(sub.character) > 1 || length(character) > 1)
    stop("sub.character and character must contain just one character element.")

  grepl(sub.character, character)
}

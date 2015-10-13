
#' @title
#' NaN
#'
#' @description
#' function to extend data.frame class, adding NaN checking.
#'
#' @param data a data.frame
#'
#' @examples
#' d <- data.frame(c1 = rep(NaN, 10),
#' c2 = rep(NaN, 10))
#' d[is.nan(d)] <- 0
#'
#' @export

is.nan.data.frame <- function(d) {

  if(is.data.frame(d) == FALSE)
    stop("d must be a data.frame.")

  do.call(cbind, lapply(d, is.nan))
}


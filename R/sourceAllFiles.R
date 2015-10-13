
#' @title
#' Source Multiple Files
#'
#' @description
#' Source multiples files whose extensions are .R and .rda in the
#' paths passed as parameter.
#'
#' @param path a character vector of path names;
#' the default corresponds to the working directory,
#'  \code{getwd()}
#'
#' @examples
#' sourceAllFiles(file.path("dir1", "dir2"))
#' sourceAllFiles()
#'
#' @export


sourceAllFiles <- function(path = NULL){

  if(is.null(path))
    path <- getwd()

  file.sources <- list.files(path = path,
                             pattern="*.R$",
                             ignore.case=TRUE,
                             full.names = TRUE,
                             recursive = TRUE,
                             include.dirs = TRUE)

  data.sources <- list.files(path = path,
                             pattern="*.rda$",
                             ignore.case=TRUE,
                             full.names = TRUE,
                             recursive = TRUE,
                             include.dirs = TRUE)

  sapply(data.sources, load, .GlobalEnv)
  sapply(file.sources, source, .GlobalEnv)
}

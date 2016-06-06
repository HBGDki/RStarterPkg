

#' Hello World!
#'
#' More in-depth description goes here.
#'
#' @param text text string to be
#' @export
#' @return a character string with a '!' added to the end
#' @examples
#' hello()
#' # "world!"
#' hello("example")
#' # "example!"
hello <- function(text = world()) {
  if (! is.character(text)) {
    stop("'text' must be of type character")
  }

  text <- paste(text, "!", sep = "")

  return(text)
}


#' World text string
#'
#' @export
#' @return 'world'
world <- function() {
  "world"
}

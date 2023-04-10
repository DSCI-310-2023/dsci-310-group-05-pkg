#' Create a nearest neighbor specification object
#'
#' This function creates a specification object for use in training k-nearest
#' neighbor models for classification.The `weight_func` parameter specifies the
#' weight function to use and the specification object is returned for use in a
#' modeling workflow.
#'
#' @param weight_func A string specifying the weight function to use.
#' @return returns the specification object
#' @import parsnip
#' @export
#' @examples create_knn_spec("rectangular")
#'
create_knn_spec <- function(weight_func) {
  if (missing(weight_func)) {
    stop("weight_func must be provided.")
  }
  if (!is.character(weight_func)) {
    stop("weight_func must be a character string.")
  }
  if (nchar(weight_func) == 0) {
    stop("weight_func must not be an empty string.")
  }
  spec <-
    parsnip::nearest_neighbor(
      weight_func = weight_func,
      neighbors = tune()
    ) %>%
    parsnip::set_engine("kknn") %>%
    parsnip::set_mode("classification")
  return(spec)
}

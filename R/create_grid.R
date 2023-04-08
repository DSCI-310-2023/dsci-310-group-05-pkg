#' Create a grid of values to tune over
#'
#' This function generates a grid of values to tune over for the
#' number of nearest neighbors in the k-nearest neighbor classification model.
#' The grid includes integers ranging from the specified min_neighbors to
#' max_neighbors, inclusive.
#'
#' @param min_neighbors An integer specifying the minimum number of neighbors to
#'  include in the grid.
#' @param max_neighbors An integer specifying the maximum number of neighbors to
#'  include in the grid.
#' @return A tibble containing the grid of values to tune over.
#' @import tibble
#' @export
#' @examples create_grid(1, 30)
create_grid <- function(min_neighbors, max_neighbors) {
  if (is.null(min_neighbors)) {
    stop("min_neighbors must be provided.")
  }
  if (is.null(max_neighbors)) {
    stop("max_neighbors must be provided.")
  }
  if (!is.numeric(min_neighbors)) {
    stop("Input values must be numeric.")
  }
  if (!is.numeric(max_neighbors)) {
    stop("Input values must be numeric.")
  }
  if (min_neighbors < 1 || max_neighbors < 1) {
    stop("Input values must be greater than or equal to 1.")
  }
  if (min_neighbors > max_neighbors) {
    stop("Minimum value cannot be greater than maximum value.")
  }
  gridvals <-
    tibble::tibble(neighbors = seq(min_neighbors, max_neighbors))
  return(gridvals)
}

#' Create a v-fold cross-validation object
#'
#' This function creates a v-fold cross-validation object for use in a modeling
#' workflow.The number of folds is specified by the `v` argument. If a `strata`
#' argument is given, then the cross-validation will be stratified by that
#' variable.
#'
#' @param data A dataframe containing the data.
#' @param v An integer specifying the number of folds.
#' @param strata A string specifying the name of the strata variable, if any.
#' @return A v-fold cross-validation object for use in a workflow.
#' @import rsample
#' @export
#' @examples
#' df <- data.frame(
#' Age = c(3, 5, 6, 7, 8, 9),
#' Gender = c(-0.95197, 0.48246, -0.48246, -0.48246, 0.48246, -0.48246),
#' Nscore = c(-0.14882, -0.67825, -0.46725, -1.32828, 0.62967, -0.24649),
#' Escore = c(-0.80615, -0.30033, -1.09207, 1.93886, 2.57309, 0.00332),
#' Oscore = c(-0.01928, -1.55521, -0.45174, -0.84732, -0.97631, -1.42424),
#' Ascore = c(0.59042, 2.03972, -0.30172, -0.30172, 0.76096, 0.59042),
#' Nicotine = c(0, 1, 1, 0, 1, 1),
#' Cannabis = c("no", "yes", "no", "yes", "no", "yes")
#' )
#'
#' create_vfold(df, 5, "Cannabis")
create_vfold <- function(data, v, strata) {
  if (is.null(v)) {
    stop("v must be provided.")
  }
  if (!is.numeric(v)) {
    stop("v must be a numeric value.")
  }
  if (v < 2) {
    stop("v must be greater than or equal to 2.")
  }
  vfold <-
    rsample::vfold_cv(data, v = v, strata = all_of(strata))
  return(vfold)
}

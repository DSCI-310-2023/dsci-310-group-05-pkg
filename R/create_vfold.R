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
#' create_vfold(drug_data, 5, "Cannabis")
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
    rsample::vfold_cv(data, v = v, strata = strata)
  return(vfold)
}

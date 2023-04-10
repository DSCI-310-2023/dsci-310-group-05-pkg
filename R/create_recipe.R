#' Create a recipe for a dataframe
#'
#' This function creates a recipe object for use in a modeling workflow.
#' The recipe includes a formula where the response variable is the
#' `response_var`and all other columns in the input dataframe are used as
#' predictors. The recipe object also includes steps for scaling and centering
#' the predictor variables.
#'
#' @param data A dataframe containing the data.
#' @param response_var A string specifying the name of the response variable.
#' @return A recipe object for use in a workflow.
#' @importFrom stats as.formula
#' @importFrom recipes recipe
#' @importFrom recipes step_scale
#' @importFrom recipes step_center
#' @importFrom recipes all_predictors
#' @export
#' @example create_recipe(drug_data, "Cannabis")

create_recipe <- function(data, response_var) {
  if (is.null(data)) {
    stop("data must be provided.")
  }
  if (is.null(response_var)) {
    stop("response_var must be provided.")
  }
  if (!is.character(response_var)) {
    stop("response_var must be a character string.")
  }
  if (!response_var %in% colnames(data)) {
    stop("response_var must be a column in data.")
  }
  recipe <-
    recipes::recipe(stats::as.formula(paste0(response_var, " ~ .")), data = data) %>%
    recipes::step_scale(recipes::all_predictors()) %>%
    recipes::step_center(recipes::all_predictors())
  return(recipe)
}

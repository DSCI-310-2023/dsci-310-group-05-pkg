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
#' @examples
#' df <- data.frame(
#' Age = c(3, 5, 6, 7, 8, 9),
#' Gender = c(-0.95197, 0.48246, -0.48246, -0.48246, 0.48246, -0.48246),
#' Nscore = c(-0.14882, -0.67825, -0.46725, -1.32828, 0.62967, -0.24649),
#' Escore = c(-0.80615, -0.30033, -1.09207, 1.93886, 2.57309, 0.00332),
#' Oscore = c(-0.01928, -1.55521, -0.45174, -0.84732, -0.97631, -1.42424),
#' Ascore = c(0.59042, 2.03972, -0.30172, -0.30172, 0.76096, 0.59042),
#' Nicotine = c(0, 1, 1, 0, 1, 1),
#' Cannabis = c("no", "no", "no", "no", "no", "no")
#' )
#' create_recipe(df, "Cannabis")

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

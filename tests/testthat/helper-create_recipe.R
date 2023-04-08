#function input for tests
response_var = "Cannabis"
df <- data.frame(
  Age = c(3, 5, 6, 7, 8, 9),
  Gender = c(-0.95197, 0.48246, -0.48246, -0.48246, 0.48246, -0.48246),
  Nscore = c(-0.14882, -0.67825, -0.46725, -1.32828, 0.62967, -0.24649),
  Escore = c(-0.80615, -0.30033, -1.09207, 1.93886, 2.57309, 0.00332),
  Oscore = c(-0.01928, -1.55521, -0.45174, -0.84732, -0.97631, -1.42424),
  Ascore = c(0.59042, 2.03972, -0.30172, -0.30172, 0.76096, 0.59042),
  Nicotine = c(0, 1, 1, 0, 1, 1),
  Cannabis = c("no", "no", "no", "no", "no", "no")
)
test_recipe <- recipes::recipe(as.formula(paste0(response_var, " ~ .")),
                               data = df
) %>%
  recipes::step_scale(all_predictors()) %>%
  recipes::step_center(all_predictors())

not_response_var <- "Test"

#expected outputs
expected_recipe_class <- "recipe"

# Test case 1
test_that("create_recipe returns a recipe object", {
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

  expected_recipe_class <- "recipe"

  expect_s3_class(test_recipe, expected_recipe_class)
})

# Test case 2
test_that("create_recipe throws an error if response variable not in dataset", {
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
  not_response_var <- "Test"
  expect_error(
    create_recipe(df, not_response_var),
    "response_var must be a column in data."
  )
})

# Test case 3
test_that("create_recipe throws an error when data is missing", {
  response_var = "Cannabis"
  expect_error(create_recipe(NULL, response_var), "data must be provided.")
})

# Test case 4
test_that("create_recipe throws an error when data is missing", {
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
  expect_error(create_recipe(df, NULL), "response_var must be provided.")
})

# Test case 5
test_that("create_recipe throws an error when data is missing", {
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
  expect_error(
    create_recipe(df, 123),
    "response_var must be a character string."
  )
})

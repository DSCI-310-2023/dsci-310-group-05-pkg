# Test create_vfold function

# Test case 1
test_that("create_vfold returns a valid vfold object", {
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
  response_var <- "Cannabis"
  test_vfold <- rsample::vfold_cv(df, v = 5, strata = response_var)
  expected_num_splits <- 5
  expected_vfold_class <- "vfold_cv"

  expect_s3_class(test_vfold, expected_vfold_class)
  expect_equal(length(test_vfold$splits), expected_num_splits)
})

# Test case 2
test_that("create_vfold throws an error when v is missing", {
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
  response_var <- "Cannabis"
  expect_error(create_vfold(df, NULL, response_var), "v must be provided.")
})

# Test case 3
test_that("create_vfold throws an error when v is not numeric", {
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
  v_string <- "five"
  response_var <- "Cannabis"

  expect_error(
    create_vfold(df, v_string, response_var),
    "v must be a numeric value."
  )
})

# Test case 4
test_that("create_vfold throws an error when v is less than 2", {
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
  v_small <- 1
  response_var <- "Cannabis"

  expect_error(
    create_vfold(df, v_small, response_var),
    "v must be greater than or equal to 2."
  )
})

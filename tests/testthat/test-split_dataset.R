# Define test cases
test_that("split_dataset function returns a list with two data frames", {
  # Call the function
  set.seed(123)

  data_set <- data.frame(
    x = rnorm(100),
    y = sample(c("A", "B", "C"), 100, replace = TRUE),
    z = rnorm(100)
  )

  strata_variable <- "y"
  predictor <- "x"

  actual_split <- split_dataset(data_set, all_of(strata_variable), all_of(predictor))

  # Test that the function returns a list with two data frames
  expect_type(actual_split, "list")
  expect_equal(length(actual_split), 2)
  expect_type(actual_split[[1]], "list")
  expect_type(actual_split[[2]], "list")
})

test_that("split_dataset function splits data set into training and testing
          sets correctly", {
  # Create a helper script to provide data for the tests
  # Example data
  set.seed(123)
  data_set <- data.frame(
    x = rnorm(100),
    y = sample(c("A", "B", "C"), 100, replace = TRUE),
    z = rnorm(100)
  )

  strata_variable <- "y"
  predictor <- "x"

  # Create expected training and testing datasets
  split <- initial_split(data_set, prop = 0.75, strata = all_of(strata_variable))
  expected_training_data <- training(split)
  expected_testing_data <- testing(split)
  actual_split <- split_dataset(data_set, all_of(strata_variable), all_of(predictor))

  # Test that the training set has the expected number of observations
  expect_equal(nrow(actual_split[[1]]), nrow(expected_training_data))

  # Test that the testing set has the expected number of observations
  expect_equal(nrow(actual_split[[2]]), nrow(expected_testing_data))

  # Test that the training set and testing set are mutually exclusive
  expect_equal(intersect(
    rownames(actual_split[[1]]),
    rownames(actual_split[[2]])
  ), character(0))
})

test_that("split_dataset function splits data set into training and testing
          sets with correct proportion", {
  # Call the function
  set.seed(123)
  data_set <- data.frame(
    x = rnorm(100),
    y = sample(c("A", "B", "C"), 100, replace = TRUE),
    z = rnorm(100)
  )

  strata_variable <- "y"
  predictor <- "x"
  actual_split <- split_dataset(data_set, all_of(strata_variable), all_of(predictor))

  # Test that the proportion of observations in the training set is correct
  expect_equal(nrow(actual_split[[1]]) / nrow(data_set), 0.75, tolerance = 0.02)

  # Test that the proportion of observations in the testing set is correct
  expect_equal(nrow(actual_split[[2]]) / nrow(data_set), 0.26, tolerance = 0.02)
})

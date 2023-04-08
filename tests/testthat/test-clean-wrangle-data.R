test_that("wrangle_training_data should return a data frame", {
  expect_s3_class(wrangle_training_data(
    training_data, predictor, strata_variable,
    group_labels
  ), "data.frame")
})

test_that("wrangle_training_data should return correct output for
          accurate input", {
  output <- training_data %>%
    dplyr::group_by({{ predictor }}, {{ strata_variable }}) %>%
    dplyr::summarize(n = n()) %>%
    dplyr::mutate(label = group_labels)
  expect_identical(
    wrangle_training_data(
      training_data, predictor, strata_variable,
      group_labels
    ),
    output
  )
})

test_that("wrangle_training_data throws an error if predictor or strata_variable
          are not in training_data", {
            training_data <- data.frame(
              predictor = c("yes", "no", "yes", "no"),
              strata_variable = c("yes", "yes", "no", "no"),
              outcome = c(1, 1, 0, 1)
            )
            predictor <- "predictor"
            strata_variable <- "strata_variable"
            error <- "error"
            group_labels <- c("Group 1")

  expect_error(
    wrangle_training_data(training_data, error, strata_variable, group_labels),
    "Unexpected input: predictor or strata_variable not found in the
    training_data"
  )

  expect_error(
    wrangle_training_data(training_data, predictor, error, group_labels),
    "Unexpected input: predictor or strata_variable not found in the
    training_data"
  )
})

test_that("wrangle_training_data throws an error if group_labels is an empty
          vector", {
  training_data <- data.frame(
    predictor = c("yes", "no", "yes", "no"),
    strata_variable = c("yes", "yes", "no", "no"),
    outcome = c(1, 1, 0, 1)
  )
  predictor <- "predictor"
  strata_variable <- "strata_variable"

  expect_error(
    wrangle_training_data(training_data, predictor, strata_variable, NULL),
    "Unexpected input: group_labels must be a vector that is not-empty"
  )

  expect_error(
    wrangle_training_data(
      training_data, predictor, strata_variable,
      character()
    ),
    "Unexpected input: group_labels must be a vector that is not-empty"
  )
})

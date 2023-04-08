test_that("wrangle_training_data should return a data frame", {
  expect_s3_class(wrangle_training_data(
    training_data, predictor, strata_variable,
    group_labels
  ), "data.frame")
})

test_that("wrangle_training_data throws an error if group_labels is an empty
          vector", {
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

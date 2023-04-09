# Test case 1
test_that("create_vfold handles valid input arguments", {
  expect_silent(create_vfold(df, v = v_good, strata = response_var))
})
# Test case 2
test_that("create_vfold throws error if v is not provided", {
  expect_error(
    create_vfold(df, v = NULL, strata = response_var),
    "v must be provided."
  )
})
# Test case 3
test_that("create_vfold throws error if v is not numeric", {
  expect_error(
    create_vfold(df, v = v_string, strata = response_var),
    "v must be a numeric value."
  )
})
# Test case 4
test_that("create_vfold throws error if v is less than 2", {
  expect_error(
    create_vfold(df, v = v_small, strata = response_var),
    "v must be greater than or equal to 2."
  )
})
# Test case 5
test_that("create_vfold returns a vfold_cv object with the expected number
          of splits", {
  output_vfold <- create_vfold(df, v_good, response_var)
  expect_equal(length(output_vfold$splits), expected_num_splits)
})

# Test case 6
test_that("create_vfold returns a v-fold object", {
  output_vfold <- create_vfold(df, v_good, response_var)
  expect_true(is(output_vfold, expected_vfold_class))
})

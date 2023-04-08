# Test create_vfold function

# Test case 1
test_that("create_vfold returns a valid vfold object", {
  expect_s3_class(test_vfold, expected_vfold_class)
  expect_equal(length(test_vfold$splits), expected_num_splits)
})

# Test case 2
test_that("create_vfold throws an error when v is missing", {
  expect_error(create_vfold(df, NULL, response_var), "v must be provided.")
})

# Test case 3
test_that("create_vfold throws an error when v is not numeric", {
  expect_error(
    create_vfold(df, v_string, response_var),
    "v must be a numeric value."
  )
})

# Test case 4
test_that("create_vfold throws an error when v is less than 2", {
  expect_error(
    create_vfold(df, v_small, response_var),
    "v must be greater than or equal to 2."
  )
})

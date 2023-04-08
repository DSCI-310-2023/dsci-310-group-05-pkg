# Test create_knn function

# Test case 1
test_that("create_knn_spec sets the mode to classification", {
  expect_equal(test_spec$mode, expected_mode)
})

# Test case 2
test_that("create_knn_spec sets the engine to kknn", {
  expect_equal(test_spec$engine, expected_engine)
})

# Test case 3
test_that("create_knn_spec returns a model specification object", {
  expect_s3_class(test_spec, expected_spec_class)
})

# Test case 4
test_that("weight_func is a character", {
  expect_error(create_knn_spec(123), "weight_func must be a character")
})

# Test case 5
test_that("create_knn_spec throws an error when weight_func is empty", {
  expect_error(
    create_knn_spec(""),
    "weight_func must not be an empty string"
  )
})

# Test case 6
test_that("create_knn_spec throws an error when no weight_func is passed", {
  expect_error(
    create_knn_spec(),
    "weight_func must be provided"
  )
})

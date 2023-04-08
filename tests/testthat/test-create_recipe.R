# Test case 1
test_that("create_recipe returns a recipe object", {
  expect_s3_class(test_recipe, expected_recipe_class)
})

# Test case 2
test_that("create_recipe throws an error if response variable not in dataset", {
  expect_error(
    create_recipe(df, not_response_var),
    "response_var must be a column in data."
  )
})

# Test case 3
test_that("create_recipe throws an error when data is missing", {
  expect_error(create_recipe(NULL, response_var), "data must be provided.")
})

# Test case 4
test_that("create_recipe throws an error when data is missing", {
  expect_error(create_recipe(df, NULL), "response_var must be provided.")
})

# Test case 5
test_that("create_recipe throws an error when data is missing", {
  expect_error(
    create_recipe(df, 123),
    "response_var must be a character string."
  )
})

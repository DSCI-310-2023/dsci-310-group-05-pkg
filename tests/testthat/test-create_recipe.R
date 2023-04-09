# Test case 1: Test that create_recipe returns a recipe object
test_that("create_recipe returns a recipe object", {
  result <- create_recipe(df, response_var)
  expect_s3_class(result, expected_recipe_class)
})

# Test case 2: Test that create_recipe throws an error if data is null
test_that("create_recipe throws an error if data is null", {
  expect_error(create_recipe(NULL, response_var), "data must be provided.")
})

# Test case 3: Test that create_recipe throws an error if response_var is null
test_that("create_recipe throws an error if response_var is null", {
  expect_error(create_recipe(df, NULL), "response_var must be provided.")
})

# Test case 4: Test that create_recipe throws an error if response_var is not a
# character string
test_that("create_recipe throws an error if response_var is not a character
          string", {
  expect_error(
    create_recipe(df, 123),
    "response_var must be a character string."
  )
})

# Test case 5: Test that create_recipe throws an error if response_var is not
# a column in data
test_that("create_recipe throws an error if response_var is not a column in
          data", {
  expect_error(create_recipe(df, not_response_var))
})

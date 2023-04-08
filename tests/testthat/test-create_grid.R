# Test cases for create_grid

# Test case 1
test_that("create_grid creates a grid with the correct number of neighbors", {
  min_neighbors <- 5
  max_neighbors <- 10
  test_grid <- tibble::tibble(neighbors = seq(min_neighbors, max_neighbors))

  expected_num_rows_grid <- max_neighbors - min_neighbors + 1
  expect_equal(nrow(test_grid), expected_num_rows_grid)
})

# Test case 2
test_that("create_grid throws an error when input values are not numeric", {
  expect_error(create_grid("a", 5), "Input values must be numeric.")
  expect_error(create_grid(1, "b"), "Input values must be numeric.")
})

# Test case 3
test_that("create_grid throws an error when input values are less than 1", {
  expect_error(
    create_grid(0, 5),
    "Input values must be greater than or equal to 1."
  )
  expect_error(
    create_grid(1, -2),
    "Input values must be greater than or equal to 1."
  )
})

# Test case 4
test_that("create_grid throws an error when min_neighbors is greater
          than max_neighbors", {
            expect_error(
              create_grid(5, 2),
              "Minimum value cannot be greater than maximum value."
            )
          })

# Test case 5
test_that("create_grid throws an error when min_neighbors is missing", {
  expect_error(create_grid(NULL, 5), "min_neighbors must be provided.")
})

# Test case 6
test_that("create_grid throws an error when max_neighbors is missing", {
  expect_error(create_grid(2, NULL), "max_neighbors must be provided.")
})

# Test case 7
test_that("create_grid returns a tibble", {
  expected_tibble <- "tbl_df"
  expect_s3_class(create_grid(2, 5), expected_tibble)
})

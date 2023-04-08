#function input for tests
min_neighbors <- 5
max_neighbors <- 10
test_grid <- tibble::tibble(neighbors = seq(min_neighbors, max_neighbors))

#expected function for tests
expected_num_rows_grid <- max_neighbors - min_neighbors + 1

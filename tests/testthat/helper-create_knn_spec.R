#function input for tests
test_spec <- parsnip::nearest_neighbor(
  weight_func = "rectangular",
  neighbors = tune()
) %>%
  parsnip::set_engine("kknn") %>%
  parsnip::set_mode("classification")

spec <- create_knn_spec(weight_func = "rectangular")

#expected function outputs
expected_mode <- "classification"
empty_weight_func <- ""
expected_engine <- "kknn"
expected_spec_class <- "model_spec"

# Test cases for predict_drugs_workflow
test_that("predict_drugs_workflow returns the expected output", {
  result <- (predict_drugs_workflow(mock_knn_wf, test_data))
  # Test case 1
  expect_identical(colnames(result),
                   expected_columns)
  # Test case 2
  expect_true(all(result$.pred_class %in% expected_results))
  # Test case 3
  expect_equal(result$.pred_class, expected_predictions)
})

# Test case 4
test_that("predict_drugs_workflow() returns a dataframe", {
  result <- (predict_drugs_workflow(mock_knn_wf, test_data))
  expect_s3_class(result, mock_pred_class)
})

# Test case 5
test_that("predict_drugs_workflow() handles non-data frame test_data
          input correctly", {
            expect_error(predict_drugs_workflow(mock_knn_wf, not_dataframe),
                         "The test data input must be a dataframe.")
          })

# Test case 6
test_that("predict_drugs_workflow() handles null knn_wf input correctly", {
  expect_error(predict_drugs_workflow(NULL, drugs_test))
})

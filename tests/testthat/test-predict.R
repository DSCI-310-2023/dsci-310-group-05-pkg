# Test cases for predict_drugs_workflow

test_that("predict_drugs_workflow returns the expected output", {
  # Test case 1
  expect_identical(colnames(result), expected_columns)
  # Test case 2
  expect_true(all(result$.pred_class %in% expected_results))
  # Test case 3
  expect_equal(result$.pred_class, expected_predictions)
})

test_that("predict_drugs_workflow() returns a dataframe", {
  expect_s3_class(mock_pred_data, mock_pred_class)
})

test_that("predict_drugs_workflow() handles non-data frame test_data input
          correctly", {
  expect_error(predict_drugs_workflow(drugs_workflow, not_dataframe))
})

test_that("predict_drugs_workflow() throws an error if knn_wf is null", {
  expect_error(predict_drugs_workflow(NULL, drugs_test))
})

test_that("predict_drugs_workflow() throws an error if test_data is not a
          dataframe", {
  expect_error(
    predict_drugs_workflow(mock_knn_wf, list(a = 1, b = 2, c = 3)))
})

test_that("predict_drugs_workflow returns a dataframe with the expected
          columns", {
  result <- predict_drugs_workflow(mock_knn_wf, test_data)
  expect_identical(colnames(result), expected_columns)
})

test_that("predict_drugs_workflow returns a dataframe with the same number of
          rows as test_data", {
  result <- predict_drugs_workflow(mock_knn_wf, test_data)
  expect_equal(nrow(result), nrow(test_data))
})

test_that("predict_drugs_workflow returns a dataframe with the expected
          predicted outcomes", {
  result <- predict_drugs_workflow(mock_knn_wf, test_data)
  expect_identical(result$.pred_class, expected_predictions)
})

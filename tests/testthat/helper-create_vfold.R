#function inputs for tests
df <- data.frame(
  Age = c(3, 5, 6, 7, 8, 9),
  Gender = c(-0.95197, 0.48246, -0.48246, -0.48246, 0.48246, -0.48246),
  Nscore = c(-0.14882, -0.67825, -0.46725, -1.32828, 0.62967, -0.24649),
  Escore = c(-0.80615, -0.30033, -1.09207, 1.93886, 2.57309, 0.00332),
  Oscore = c(-0.01928, -1.55521, -0.45174, -0.84732, -0.97631, -1.42424),
  Ascore = c(0.59042, 2.03972, -0.30172, -0.30172, 0.76096, 0.59042),
  Nicotine = c(0, 1, 1, 0, 1, 1),
  Cannabis = c("no", "yes", "no", "yes", "no", "yes")
)

response_var <- "Cannabis"
test_vfold <- rsample::vfold_cv(df, v = 5, strata = response_var)
test_vfold_2 <- rsample::vfold_cv(df, v = 2, strata = response_var)

v_good <- 5
v_small <- 1
v_string <- "five"

#expected function outputs
expected_num_splits <- 3
expected_vfold_class <- "vfold_cv"

# Tests for the horizontal_hist function

# Test case 1
test_that("horizontal_hist produces a plot", {
  # Set up helper data
  test_data_1 <- data.frame(
    x = c(1, 2, 3, 4), y = c(10, 20, 30, 40),
    color = c("red", "blue", "green", "red")
  )

  # Call function
  plot <- horizontal_hist(test_data_1, "x", "y", "x", "y", "Test Plot",
    plot_width = 6, plot_height = 4
  )
  expect_true(is.ggplot(plot))
})

# Test case 2
test_that("horizontal_hist produces the correct x-axis label", {
  # Set up helper data
  test_data_1 <- data.frame(
    x = c(1, 2, 3, 4), y = c(10, 20, 30, 40),
    color = c("red", "blue", "green", "red")
  )
  x_var <- "x"
  y_var <- "y"
  color_var <- "color"
  x_label <- "x"
  y_label <- "y"
  color_label <- "Color"
  plot_title <- "Test Plot"
  plot_width <- 6
  plot_height <- 4

  options(repr.plot.width = plot_width, repr.plot.height = plot_height)

  expected_hist_plot <- ggplot(test_data_1, aes(x = reorder(x, -y), y = y)) +
    geom_bar(stat = "identity") +
    coord_flip() +
    labs(x = x_label, y = y_label, title = plot_title) +
    theme(text = element_text(size = 20))

  # Call function
  plot <- horizontal_hist(test_data_1, "x", "y", "x", "y", "Test Plot",
    plot_width = 6, plot_height = 4
  )
  expect_equal(xlab(plot)$label, xlab(expected_hist_plot)$label)
})

# Test case 3
test_that("horizontal_hist produces the correct y-axis label", {
  # Set up helper data
  test_data_1 <- data.frame(
    x = c(1, 2, 3, 4), y = c(10, 20, 30, 40),
    color = c("red", "blue", "green", "red")
  )
  x_var <- "x"
  y_var <- "y"
  color_var <- "color"
  x_label <- "x"
  y_label <- "y"
  color_label <- "Color"
  plot_title <- "Test Plot"
  plot_width <- 6
  plot_height <- 4

  options(repr.plot.width = plot_width, repr.plot.height = plot_height)

  expected_hist_plot <- ggplot(test_data_1, aes(x = reorder(x, -y), y = y)) +
    geom_bar(stat = "identity") +
    coord_flip() +
    labs(x = x_label, y = y_label, title = plot_title) +
    theme(text = element_text(size = 20))

  # Call function
  plot <- horizontal_hist(test_data_1, "x", "y", "x", "y", "Test Plot",
    plot_width = 6, plot_height = 4
  )
  expect_equal(ylab(plot)$label, ylab(expected_hist_plot)$label)
})

# Test case 4
test_that("horizontal_hist produces the correct title", {
  # Set up helper data
  test_data_1 <- data.frame(
    x = c(1, 2, 3, 4), y = c(10, 20, 30, 40),
    color = c("red", "blue", "green", "red")
  )
  x_var <- "x"
  y_var <- "y"
  color_var <- "color"
  x_label <- "x"
  y_label <- "y"
  color_label <- "Color"
  plot_title <- "Test Plot"
  plot_width <- 6
  plot_height <- 4

  options(repr.plot.width = plot_width, repr.plot.height = plot_height)

  expected_hist_plot <- ggplot(test_data_1, aes(x = reorder(x, -y), y = y)) +
    geom_bar(stat = "identity") +
    coord_flip() +
    labs(x = x_label, y = y_label, title = plot_title) +
    theme(text = element_text(size = 20))

  # Call function
  plot <- horizontal_hist(test_data_1, "x", "y", "x", "y", "Test Plot",
    plot_width = 6, plot_height = 4
  )
  expect_equal(ggtitle(plot)$labels, ggtitle(expected_hist_plot)$labels)
})

--------------------------------------------------------------------------------
  # Tests for the scatterplot function
  # Test case 1
  test_that("scatterplot produces a plot", {
    # Set up helper data
    test_data_1 <- data.frame(
      x = c(1, 2, 3, 4), y = c(10, 20, 30, 40),
      color = c("red", "blue", "green", "red")
    )

    # Call function
    plot <- scatterplot(test_data_1, "x", "y", "color", "x", "y", "Color",
      "Test Plot",
      plot_width = 6, plot_height = 4
    )
    expect_true(is.ggplot(plot))
  })

# Test case 2
test_that("scatterplot produces the correct x-axis label", {
  # Set up helper data
  test_data_1 <- data.frame(
    x = c(1, 2, 3, 4), y = c(10, 20, 30, 40),
    color = c("red", "blue", "green", "red")
  )
  x_var <- "x"
  y_var <- "y"
  color_var <- "color"
  x_label <- "x"
  y_label <- "y"
  color_label <- "Color"
  plot_title <- "Test Plot"
  plot_width <- 6
  plot_height <- 4

  options(repr.plot.width = plot_width, repr.plot.height = plot_height)

  expected_scatter_plot <- ggplot(test_data_1, aes(x = x, y = y, color = color)) +
    geom_point() +
    theme(text = element_text(size = 18)) +
    labs(x = "x", y = "y", color = "Color", title = "Test Plot")

  # Call the function
  plot <- scatterplot(test_data_1, "x", "y", "color", "x", "y", "Color",
    "Test Plot",
    plot_width = 6, plot_height = 4
  )
  expect_equal(xlab(plot)$label, xlab(expected_scatter_plot)$label)
})

# Test case 3
test_that("scatterplot produces the correct y-axis label", {
  # Set up helper data
  test_data_1 <- data.frame(
    x = c(1, 2, 3, 4), y = c(10, 20, 30, 40),
    color = c("red", "blue", "green", "red")
  )
  x_var <- "x"
  y_var <- "y"
  color_var <- "color"
  x_label <- "x"
  y_label <- "y"
  color_label <- "Color"
  plot_title <- "Test Plot"
  plot_width <- 6
  plot_height <- 4

  options(repr.plot.width = plot_width, repr.plot.height = plot_height)

  expected_scatter_plot <- ggplot(test_data_1, aes(x = x, y = y, color = color)) +
    geom_point() +
    theme(text = element_text(size = 18)) +
    labs(x = "x", y = "y", color = "Color", title = "Test Plot")

  plot <- scatterplot(test_data_1, "x", "y", "color", "x", "y", "Color",
    "Test Plot",
    plot_width = 6, plot_height = 4
  )
  expect_equal(ylab(plot)$label, ylab(expected_scatter_plot)$label)
})

# Test case 4
test_that("scatterplot produces the correct title", {
  # Set up helper data
  test_data_1 <- data.frame(
    x = c(1, 2, 3, 4), y = c(10, 20, 30, 40),
    color = c("red", "blue", "green", "red")
  )
  x_var <- "x"
  y_var <- "y"
  color_var <- "color"
  x_label <- "x"
  y_label <- "y"
  color_label <- "Color"
  plot_title <- "Test Plot"
  plot_width <- 6
  plot_height <- 4

  options(repr.plot.width = plot_width, repr.plot.height = plot_height)

  expected_scatter_plot <- ggplot(test_data_1, aes(x = x, y = y, color = color)) +
    geom_point() +
    theme(text = element_text(size = 18)) +
    labs(x = "x", y = "y", color = "Color", title = "Test Plot")

  # Call the function
  plot <- scatterplot(test_data_1, "x", "y", "color", "x", "y", "Color",
    "Test Plot",
    plot_width = 6, plot_height = 4
  )
  expect_equal(ggtitle(plot)$labels, ggtitle(expected_scatter_plot)$labels)
})

--------------------------------------------------------------------------------
  # Tests for the accuracy_plot function

  # Test case 1
  test_that("accuracy_plot produces a plot", {
    # Set up helper data
    test_data_2 <- data.frame(
      .metric = rep("accuracy", 30),
      neighbors = 1:30,
      mean = rnorm(30)
    )

    # Call the function
    plot <- accuracy_plot(test_data_2,
      x_label = "Neighbors", y_label = "Mean",
      plot_title = "Accuracy Plot"
    )
    expect_true(is.ggplot(plot))
  })

# Test case 2
test_that("accuracy_plot produces the correct x-axis label", {
  # Set up helper data
  test_data_2 <- data.frame(
    .metric = rep("accuracy", 30),
    neighbors = 1:30,
    mean = rnorm(30)
  )

  expected_accuracy_plot <- ggplot(test_data_2, aes(x = neighbors, y = mean)) +
    geom_point() +
    geom_line() +
    labs(x = "Neighbors", y = "Mean", title = "Accuracy Plot") +
    theme(text = element_text(size = 20)) +
    scale_x_continuous(breaks = c(1:30))

  # Call the function
  plot <- accuracy_plot(test_data_2,
    x_label = "Neighbors", y_label = "Mean",
    plot_title = "Accuracy Plot"
  )
  expect_equal(xlab(plot)$label, xlab(expected_accuracy_plot)$label)
})

# Test case 3
test_that("accuracy_plot produces the correct y-axis label", {
  # Set up helper data
  test_data_2 <- data.frame(
    .metric = rep("accuracy", 30),
    neighbors = 1:30,
    mean = rnorm(30)
  )

  expected_accuracy_plot <- ggplot(test_data_2, aes(x = neighbors, y = mean)) +
    geom_point() +
    geom_line() +
    labs(x = "Neighbors", y = "Mean", title = "Accuracy Plot") +
    theme(text = element_text(size = 20)) +
    scale_x_continuous(breaks = c(1:30))

  # Call the function
  plot <- accuracy_plot(test_data_2,
    x_label = "Neighbors", y_label = "Mean",
    plot_title = "Accuracy Plot"
  )
  expect_equal(ylab(plot)$label, ylab(expected_accuracy_plot)$label)
})

# Test case 4
test_that("accuracy_plot produces the correct title", {
  # Set up helper data
  test_data_2 <- data.frame(
    .metric = rep("accuracy", 30),
    neighbors = 1:30,
    mean = rnorm(30)
  )

  expected_accuracy_plot <- ggplot(test_data_2, aes(x = neighbors, y = mean)) +
    geom_point() +
    geom_line() +
    labs(x = "Neighbors", y = "Mean", title = "Accuracy Plot") +
    theme(text = element_text(size = 20)) +
    scale_x_continuous(breaks = c(1:30))

  # Call the function
  plot <- accuracy_plot(test_data_2,
    x_label = "Neighbors", y_label = "Mean",
    plot_title = "Accuracy Plot"
  )
  expect_equal(ggtitle(plot)$labels, ggtitle(expected_accuracy_plot)$labels)
})

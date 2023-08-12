test_that("That fpl_dreamteam returns the correct tibble", {

  result <- fpl_dreamteam()

  # Verify that a tibble is returned
  expect_type(result, "list")
  expect_s3_class(result, "tbl_df")

  # Verify the output contains the expected columns
  expected_names <- c("player", "points", "team", "position")
  expect_named(result, expected_names)

  # Verify that the columns have the correct data types
  expect_type(result$player, "character")
  expect_type(result$points, "integer")
  expect_type(result$team, "character")
  expect_type(result$position, "character")
})



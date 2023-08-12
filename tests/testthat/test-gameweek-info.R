test_that("fpl_gameweek_info returns a tibble with the correct columns and data types", {
  # Call the function and get the result
  result <- fpl_gameweek_info()

  # Verify the output returns a tibble
  expect_type(result, "list")
  expect_s3_class(result, "tbl_df")

  # Verify the output contains the expected columns
  expected_names <- c("gameweek", "gw_deadline", "gw_finished", "data_checked",
                      "gw_current", "gw_previous", "gw_next", "gw_highest_score",
                      "gw_average_score", "transfers_made", "chip_plays",
                      "player_most_selected", "player_most_captained",
                      "player_most_vice_captained", "player_most_transferred_in",
                      "top_player", "top_player_points")
  expect_named(result, expected_names)

  # Verify that the columns have the correct data types
  expect_type(result$gameweek, "character")
  expect_type(result$gw_deadline, "double")
  expect_s3_class(result$gw_deadline, "POSIXct")
  expect_type(result$gw_finished, "logical")
  expect_type(result$data_checked, "logical")
  expect_type(result$gw_current, "logical")
  expect_type(result$gw_previous, "logical")
  expect_type(result$gw_next, "logical")
  expect_type(result$gw_highest_score, "integer")
  expect_type(result$gw_average_score, "integer")
  expect_type(result$transfers_made, "integer")
  expect_type(result$chip_plays, "list")
  expect_type(result$player_most_selected, "character")
  expect_type(result$player_most_captained, "character")
  expect_type(result$player_most_vice_captained, "character")
  expect_type(result$player_most_transferred_in, "character")
  expect_type(result$top_player, "character")
  expect_type(result$top_player_points, "integer")
})


# ------------------------------------------------------------------------------

test_that("fpl_next_gw returns the correct gameweek name", {
  # Call the function and get the result
  result <- fpl_next_gw()

  # Verify that the result is a character vector (gameweek name)
  expect_type(result, "character")
  expect_match(result, "^Gameweek\\s\\d{1,2}")
})


# ------------------------------------------------------------------------------

test_that("fpl_next_gw_deadline returns the correct deadline time", {
  # Call the function and get the result
  result <- fpl_next_gw_deadline()

  # Verify that the result is a POSIXct object (deadline time)
  expect_type(result, "double")
  expect_s3_class(result, "POSIXct")
})


# ------------------------------------------------------------------------------

test_that("fpl_current_gw returns the correct current gameweek name", {
  # Call the function and get the result
  result <- fpl_current_gw()

  # Verify that the result is a character vector (gameweek name)
  expect_type(result, "character")
  expect_match(result, "^Gameweek\\s\\d{1,2}")
})

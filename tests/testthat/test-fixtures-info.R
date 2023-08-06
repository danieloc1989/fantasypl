test_that("fpl_fixtures_info returns a tibble with the correct columns and data types", {
  # Call the function and get the result
  result <- fpl_fixtures_info()

  # Verify the output is a tibble
  expect_type(result, "list")
  expect_s3_class(result, "tbl_df")

  # Verify the output contains the expected columns
  expect_named(result, c("gw_id", "game_id", "team_h", "team_h_score", "team_a", "team_a_score",
                         "stats", "kickoff_time", "kickoff_time_provisional", "started", "finished", "fpl_game_code"))

  # Verify that the columns have the correct data types
  expect_type(result$gw_id, "integer")
  expect_type(result$game_id, "integer")
  expect_type(result$team_h, "character")
  #expect_type(result$team_h_score, "integer")
  expect_type(result$team_a, "character")
  #expect_type(result$team_a_score, "integer")
  expect_type(result$stats, "list")
  expect_type(result$kickoff_time, "double")
  expect_s3_class(result$kickoff_time, "POSIXct")
  expect_type(result$kickoff_time_provisional, "logical")
  expect_type(result$started, "logical")
  expect_type(result$finished, "logical")
  expect_type(result$fpl_game_code, "integer")
})

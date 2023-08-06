test_that("fpl_team_info returns a tibble with the correct columns and data types", {
  # Call the function and get the result
  result <- fpl_team_info()

  # Verify the output is a tibble
  expect_type(result, "list")
  expect_s3_class(result, "tbl_df")

  # Verify the output contains the expected columns
  expected_names <- c("team_fpl_code", "team_name", "team_abb", "season_id",
                      "form", "played", "win", "draw", "loss", "points",
                      "league_position", "strength", "strength_overall_home",
                      "strength_defence_home", "strength_attack_home",
                      "strength_overall_away", "strength_defence_away",
                      "strength_attack_away")
  expect_named(result, expected_names)

  # Verify that the columns have the correct data types
  expect_type(result$team_fpl_code, "integer")
  expect_type(result$team_name, "character")
  expect_type(result$team_abb, "character")
  expect_type(result$season_id, "integer")
  #expect_type(result$form, "numeric")
  expect_type(result$played, "integer")
  expect_type(result$win, "integer")
  expect_type(result$draw, "integer")
  expect_type(result$loss, "integer")
  expect_type(result$points, "integer")
  expect_type(result$league_position, "integer")
  expect_type(result$strength, "integer")
  expect_type(result$strength_overall_home, "integer")
  expect_type(result$strength_defence_home, "integer")
  expect_type(result$strength_attack_home, "integer")
  expect_type(result$strength_overall_away, "integer")
  expect_type(result$strength_defence_away, "integer")
  expect_type(result$strength_attack_away, "integer")
})

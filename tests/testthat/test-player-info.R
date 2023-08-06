# FPL player information - `fpl_player_info()`

test_that("fpl_player_info returns the correct tibble", {
  # Call the function and get the result
  result <- fpl_player_info()

  # Verify that a tibble is returned
  expect_type(result, "list")
  expect_s3_class(result, "tbl_df")

  # Verify the output contains the expected columns
  expected_names <- c("player_season_id", "player_name", "first_name",
                      "second_name", "team", "squad_number", "player_position",
                      "player_fpl_code", "special")
  expect_named(result, expected_names)

  # Verify that the columns have the correct data types
  expect_type(result$player_season_id, "integer")
  expect_type(result$player_name, "character")
  expect_type(result$first_name, "character")
  expect_type(result$second_name, "character")
  expect_type(result$team, "character")
  #expect_type(result$squad_number, "integer")
  expect_type(result$player_position, "character")
  expect_type(result$player_fpl_code, "integer")
  expect_type(result$special, "logical")
})

# ------------------------------------------------------------------------------

# FPL player statistics - `fpl_player_stats()`

test_that("fpl_player_stats returns a tibble with the correct columns", {
  # Call the function and get the result
  result <- fpl_player_stats()

  # Verify that a tibble is returned
  expect_type(result, "list")
  expect_s3_class(result, "tbl_df")

  # Verify the output contains the expected columns
  expected_names <- c("player_season_id", "player_name", "selected_pct",
                      "selected_rank", "selected_rank_type", "current_price",
                      "now_cost_rank", "now_cost_rank_type", "cost_change_start",
                      "cost_change_start_fall", "cost_change_event",
                      "cost_change_event_fall", "total_transfers_in",
                      "gw_transfers_in", "transfers_out", "transfers_out_event",
                      "minutes", "starts", "starts_per_90", "total_points",
                      "points_per_game", "points_per_game_rank",
                      "points_per_game_rank_type", "bonus", "bps", "form",
                      "form_rank", "form_rank_type", "value_form",
                      "value_season", "yellow_cards", "red_cards", "goals_scored",
                      "assists", "goals_conceded", "goals_conceded_per_90",
                      "own_goals", "clean_sheets", "clean_sheets_per_90", "saves",
                      "saves_per_90", "penalties_missed", "penalties_saved",
                      "xg_scored", "xg_scored_per_90", "xa", "xa_per_90",
                      "xg_involvement", "xg_involvement_per_90", "xg_conceded",
                      "xg_conceded_per_90", "in_dreamteam", "dreamteam_count")
  expect_named(result, expected_names)
})


# ------------------------------------------------------------------------------

# FPL player ICT index - `fpl_player_ict()`

test_that("fpl_player_ict returns a tibble with the correct columns and data types", {
  # Call the function and get the result
  result <- fpl_player_ict()

  # Verify that a tibble is returned
  expect_type(result, "list")
  expect_s3_class(result, "tbl_df")

  # Verify the output contains the expected columns
  expected_names <- c("player_season_id", "player_name", "ict_index",
                      "ict_index_rank", "ict_index_rank_type", "influence",
                      "influence_rank", "influence_rank_type", "creativity",
                      "creativity_rank", "creativity_rank_type", "threat",
                      "threat_rank", "threat_rank_type")
  expect_named(result, expected_names)

  # Verify that the columns have the correct data types
  expect_type(result$player_season_id, "integer")
  expect_type(result$player_name, "character")
  expect_type(result$ict_index, "double")
  expect_type(result$ict_index_rank, "integer")
  expect_type(result$ict_index_rank_type, "integer")
  expect_type(result$influence, "double")
  expect_type(result$influence_rank, "integer")
  expect_type(result$influence_rank_type, "integer")
  expect_type(result$creativity, "double")
  expect_type(result$creativity_rank, "integer")
  expect_type(result$creativity_rank_type, "integer")
  expect_type(result$threat, "double")
  expect_type(result$threat_rank, "integer")
  expect_type(result$threat_rank_type, "integer")
})

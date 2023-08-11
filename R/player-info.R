#' Get Fantasy Premier League Information of All Players.
#'
#' This function retrieves information about all FPL players, such as player IDs,
#' names, positions, and team details, using the Fantasy Premier League API.
#'
#' @return A tibble (`data.frame`) with the following columns:
#'   \describe{
#'     \item{\code{player_season_id}}{The ID of the player for the current season.}
#'     \item{\code{player_name}}{The web name of the player.}
#'     \item{\code{first_name}}{The first name of the player.}
#'     \item{\code{second_name}}{The last name of the player.}
#'     \item{\code{team}}{The abbreviation of the team the player belongs to.}
#'     \item{\code{squad_number}}{The squad number of the player.}
#'     \item{\code{player_position}}{The player's position in the FPL game.}
#'     \item{\code{player_fpl_code}}{The FPL code of the player.}
#'     \item{\code{special}}{}
#'   }
#'
#' @examples
#' fpl_player_info()
#'
#' @export
fpl_player_info <- function() {

  call_api("bootstrap-static")$elements |>
    tibble::as_tibble() |>
    dplyr::select(player_season_id = "id",
                  player_name = "web_name",
                  "first_name",
                  "second_name",
                  "team",
                  "squad_number",
                  player_position = "element_type",
                  player_fpl_code = "code",
                  "special") |>
    purrr::modify_at("team", \(x) dplyr::case_match(x, !!!team_season_id_to_abb)) |>
    purrr::modify_at("player_position", \(x) dplyr::case_match(x, !!!position_id_to_abb))

}

#' Get Fantasy Premier League Headline Statistics of All Players.
#'
#' This function retrieves all players' headline statistics from the Fantasy Premier League API and
#' processes the data into a tibble with relevant player information and statistics.
#'
#' @return A tibble containing player statistics with the following columns:
#'   \describe{
#'     \item{\code{player_season_id}}{Player ID for the current season.}
#'     \item{\code{player_name}}{Name of the player.}
#'     \item{\code{selected_pct}}{Percentage of FPL managers who have selected the player.}
#'     \item{\code{selected_rank}}{Rank of the player based on selected percentage.}
#'     \item{\code{selected_rank_type}}{Type of rank for selected percentage.}
#'     \item{\code{current_price}}{Current price of the player in FPL.}
#'     \item{\code{now_cost_rank}}{Rank of the player based on current price.}
#'     \item{\code{now_cost_rank_type}}{Type of rank for current price.}
#'     \item{\code{...}}{(additional columns with various player statistics).}
#' }
#'
#' @examples
#' fpl_player_stats()
#'
#' @export
fpl_player_stats <- function() {

  call_api("bootstrap-static")$elements |>
    tibble::as_tibble() |>
    dplyr::select(player_season_id = "id",
                  player_name = "web_name",
                  selected_pct = "selected_by_percent",
                  "selected_rank",
                  "selected_rank_type",
                  current_price = "now_cost",
                  "now_cost_rank",
                  "now_cost_rank_type",
                  "cost_change_start",
                  "cost_change_start_fall",
                  "cost_change_event",
                  "cost_change_event_fall",
                  total_transfers_in ="transfers_in",
                  gw_transfers_in = "transfers_in_event",
                  "transfers_out",
                  "transfers_out_event",
                  "minutes",
                  "starts",
                  "starts_per_90",
                  "total_points",
                  "points_per_game",
                  "points_per_game_rank",
                  "points_per_game_rank_type",
                  "bonus",
                  "bps",
                  "form",
                  "form_rank",
                  "form_rank_type",
                  "value_form",
                  "value_season",
                  "yellow_cards",
                  "red_cards",
                  "goals_scored",
                  "assists",
                  "goals_conceded",
                  "goals_conceded_per_90",
                  "own_goals",
                  "clean_sheets",
                  "clean_sheets_per_90",
                  "saves",
                  "saves_per_90",
                  "penalties_missed",
                  "penalties_saved",
                  xg_scored = "expected_goals",
                  xg_scored_per_90 = "expected_goals_per_90",
                  xa = "expected_assists",
                  xa_per_90 = "expected_assists_per_90",
                  xg_involvement = "expected_goal_involvements",
                  xg_involvement_per_90 = "expected_goal_involvements_per_90",
                  xg_conceded = "expected_goals_conceded",
                  xg_conceded_per_90 = "expected_goals_conceded_per_90",
                  "in_dreamteam",
                  "dreamteam_count") |>
    purrr::modify_at("selected_pct", \(x) as.double(x) / 100) |>
    purrr::modify_at("current_price", \(x) x / 10)
}


#' Get Fantasy Premier League ICT Index Information of All Players.
#'
#' This function retrieves information about the ICT (Influence, Creativity,
#' Threat) index of all FPL players using the Fantasy Premier League API.
#'
#' @return A tibble (`data.frame`) with the following columns:
#'   \describe{
#'     \item{\code{player_season_id}}{The ID of the player for the current season.}
#'     \item{\code{player_name}}{The web name of the player.}
#'     \item{\code{ict_index}}{The player's ICT index value.}
#'     \item{\code{ict_index_rank}}{The player's ICT index rank.}
#'     \item{\code{ict_index_rank_type}}{The type of rank (e.g., "overall").}
#'     \item{\code{influence}}{The player's influence score.}
#'     \item{\code{influence_rank}}{The player's influence rank.}
#'     \item{\code{influence_rank_type}}{The type of influence rank (e.g., "overall").}
#'     \item{\code{creativity}}{The player's creativity score.}
#'     \item{\code{creativity_rank}}{The player's creativity rank.}
#'     \item{\code{creativity_rank_type}}{The type of creativity rank (e.g., "overall").}
#'     \item{\code{threat}}{The player's threat score.}
#'     \item{\code{threat_rank}}{The player's threat rank.}
#'     \item{\code{threat_rank_type}}{The type of threat rank (e.g., "overall").}
#'   }
#'
#' @examples
#' fpl_player_ict()
#'
#' @export
fpl_player_ict <- function() {

  call_api("bootstrap-static")$elements |>
    tibble::as_tibble() |>
    dplyr::select(player_season_id = "id",
                  player_name = "web_name",
                  "ict_index",
                  "ict_index_rank",
                  "ict_index_rank_type",
                  "influence",
                  "influence_rank",
                  "influence_rank_type",
                  "creativity",
                  "creativity_rank",
                  "creativity_rank_type",
                  "threat",
                  "threat_rank",
                  "threat_rank_type") |>
    purrr::modify_at(c("ict_index", "influence", "creativity", "threat"), as.double)
}


fpl_player_detailed_stats <- function(player_id) {

  if (length(player_id) != 1) {
    cli::cli_abort("{.arg player_id} must be of length 1.")
  }

  player_id <- as.integer(player_id)

  player_name <- dplyr::case_match(player_id, !!!the$players_recode)

  message(paste0(player_name), "'s per game season statistics")

  call_api("element-summary", player_id = player_id)$history |>
    tibble::as_tibble() |>
    dplyr::select(gameweek = "round",
                  game_id =  "fixture",
                  opponent = "opponent_team",
                  "total_points",
                  "starts",
                  "minutes",
                  "goals_scored",
                  "assists",
                  "clean_sheets",
                  "goals_conceded",
                  "own_goals",
                  "penalties_saved",
                  "penalties_missed",
                  "yellow_cards",
                  "red_cards",
                  "saves",
                  "bonus",
                  "bps",
                  "influence",
                  "creativity",
                  "threat",
                  "ict_index",
                  xg_scored = "expected_goals",
                  xa = "expected_assists",
                  xg_involvement = "expected_goal_involvements",
                  xg_conceded = "expected_goals_conceded",
                  price = "value",
                  "selected",
                  "transfers_in",
                  "transfers_out",
                  "transfers_balance") |>
    purrr::modify_at("price", \(x) x / 10) |>
    purrr::modify_at("opponent", \(x) dplyr::case_match(x, !!!team_season_id_to_abb))

}


fpl_player_find_id <- function(name, team = NULL) {

  if (!is.null(team)) {
    team <- rlang::arg_match(team, values = team)
  }

  data <-
    call_api("bootstrap-static")$elements |>
    tibble::as_tibble() |>
    dplyr::select(player_season_id = "id",
                  player_name = "web_name",
                  "first_name",
                  "second_name",
                  "team") |>
    purrr::modify_at("team", \(x) dplyr::case_match(x, !!!team_season_id_to_abb))


}

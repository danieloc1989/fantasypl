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
    purrr::modify_at("team", \(x) dplyr::case_match(x, !!!the$teams_recode)) |>
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
    purrr::modify_at(c("current_price", "cost_change_start", "cost_change_start_fall", "cost_change_event", "cost_change_event_fall"), \(x) x / 10)
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

#' Get Fantasy Premier League player's fixture-level statistics.
#'
#' This function retrieves detailed fixture-level statistics for a specific player in the Fantasy Premier League (FPL). You can obtain per-game season statistics including total points, starts, minutes played, goals scored, assists, clean sheets, goals conceded, and more.
#'
#' @param player_id The unique ID of the player in the FPL.
#'
#' @return A tibble (data frame) with the following columns:
#'   \describe{
#'     \item{\code{gameweek}}{The gameweek number.}
#'     \item{\code{game_id}}{The unique ID of the fixture.}
#'     \item{\code{opponent}}{The opponent team's name.}
#'     \item{\code{total_points}}{Total FPL points earned in the gameweek.}
#'     \item{\code{starts}}{The number of starts in the gameweek.}
#'     \item{\code{minutes}}{The total number of minutes played in the gameweek.}
#'     \item{\code{goals_scored}}{The number of goals scored in the gameweek.}
#'     \item{\code{assists}}{The number of assists provided in the gameweek.}
#'     \item{\code{clean_sheets}}{The number of clean sheets in the gameweek.}
#'     \item{\code{goals_conceded}}{The number of goals conceded in the gameweek.}
#'     \item{\code{own_goals}}{The number of own goals scored in the gameweek.}
#'     \item{\code{penalties_saved}}{The number of penalties saved in the gameweek.}
#'     \item{\code{penalties_missed}}{The number of penalties missed in the gameweek.}
#'     \item{\code{yellow_cards}}{The number of yellow cards received in the gameweek.}
#'     \item{\code{red_cards}}{The number of red cards received in the gameweek.}
#'     \item{\code{saves}}{The number of saves made in the gameweek.}
#'     \item{\code{bonus}}{The bonus points earned in the gameweek.}
#'     \item{\code{bps}}{The Bonus Points System (BPS) score in the gameweek.}
#'     \item{\code{influence}}{The influence score in the gameweek.}
#'     \item{\code{creativity}}{The creativity score in the gameweek.}
#'     \item{\code{threat}}{The threat score in the gameweek.}
#'     \item{\code{ict_index}}{The ICT (Influence, Creativity, Threat) index score in the gameweek.}
#'     \item{\code{xg_scored}}{The expected goals scored in the gameweek.}
#'     \item{\code{xa}}{The expected assists in the gameweek.}
#'     \item{\code{xg_involvement}}{The expected goal involvements in the gameweek.}
#'     \item{\code{xg_conceded}}{The expected goals conceded in the gameweek.}
#'     \item{\code{price}}{The player's price for the gameweek.}
#'     \item{\code{selected}}{The number of FPL managers who have selected the player for their team.}
#'     \item{\code{transfers_in}}{The number of transfers in for the player in the gameweek.}
#'     \item{\code{transfers_out}}{The number of transfers out for the player in the gameweek.}
#'     \item{\code{transfers_balance}}{The net transfers balance for the player in the gameweek.}
#'   }
#'
#' @examples
#' fpl_player_fixture_stats(player_id = 1)
#'
#' @export
fpl_player_fixture_stats <- function(player_id) {

  player_id <- check_id(player_id)

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
    purrr::modify_at("opponent", \(x) dplyr::case_match(x, !!!the$teams_recode))
}

#' Find Fantasy Premier League player IDs.
#'
#' This function searches for player IDs in the Fantasy Premier League based on their names and optionally their teams. A fuzzy match is implemnted.
#'
#' @param name The name of the player to search for.
#' @param team (Optional) The team or teams to filter the search by. Defaults to all teams.
#'
#' @return The player IDs matching the search criteria. If no match is found, returns NA_integer_.
#'
#' @examples
#' fpl_find_player_id("Salah", team = "LIV")
#' fpl_find_player_id("Rashford")
#'
#' @export
fpl_find_player_id <- function(name, team = NULL) {

  team_var <- team %||% the$teams_abb
  team_var <- rlang::arg_match(team_var, values = the$teams_abb, multiple = TRUE)

  if (length(name) != 1) {
    cli::cli_abort("{.arg name} must be of length 1.")
  }
  if (!is.character(name)) {
    cli::cli_abort("{.arg team} must be a character.")
  }


  data <-
    call_api("bootstrap-static")$elements |>
    tibble::as_tibble() |>
    dplyr::select(player_season_id = "id",
                  player_name = "web_name",
                  "first_name",
                  "second_name",
                  "team") |>
    purrr::modify_at("team", \(x) dplyr::case_match(x, !!!the$teams_recode)) |>
    dplyr::filter(.data$team %in% team_var) |>
    dplyr::filter(agrepl(name, .data$player_name, ignore.case = TRUE) |
                  agrepl(name, .data$first_name, ignore.case = TRUE) |
                  agrepl(name, .data$second_name, ignore.case = TRUE))

  if (length(data$player_season_id) == 0) {
    cli::cli_alert_warning("No player was found with the search criteria. Please redefine your search.")
    return(NA_integer_)
  }

  if (length(data$player_season_id) == 1) {
    cli::cli_alert_success("{.strong {data$player_name}} ({data$first_name} {data$second_name}) for {data$team} matched your search.")
    return(data$player_season_id)
  }

  if (length(data$player_season_id) >= 2) {
    cli::cli_alert_info("{.strong {length(data$player_season_id)}} players were found matching the criteria. These are as follows:")
    data |>
      dplyr::mutate(line = glue::glue("{player_name} ({first_name} {second_name}) - {team} --> {player_season_id}")) |>
      _$line |>
      cli::cli_li()
    return(NA_integer_)
  }
}

#' Get Fantasy Premier League fixtures information.
#'
#' This function retrieves information about FPL fixtures, such as gameweek and fixture IDs, the teams, fixture score using the Fantasy Premier League API.
#'
#' @return A tibble (data frame) with the following columns:
#'   \describe{
#'     \item{\code{gw_id}}{The id for the gameweek.}
#'     \item{\code{game_id}}{The fixture's season id.}
#'     \item{\code{team_h}}{The home team.}
#'     \item{\code{team_h_score}}{The home team's score.}
#'     \item{\code{team_a}}{The away team.}
#'     \item{\code{team_a_score}}{A numeric of the away team's score.}
#'     \item{\code{stats}}{The fixture's statistics.}
#'     \item{\code{kickoff_time}}{A datetime of the fixture's kickoff in UCT.}
#'     \item{\code{kickoff_time_provisional}}{A logical indicating if the kickoff time is provisional.}
#'     \item{\code{started}}{A logical indicating if the fixture has started.}
#'     \item{\code{finished}}{A logical indicating if the fixture has finished.}
#'     \item{\code{fpl_game_code}}{The fixture's FPL code.}
#'   }
#'
#' @examples
#' fpl_team_info()
#'
#' @export
fpl_fixtures_info <- function() {

  call_api("fixtures") |>
    tibble::as_tibble() |>
    dplyr::select(gw_id = "event",
                  game_id = "id",
                  "team_h",
                  "team_h_score",
                  "team_a",
                  "team_a_score",
                  "stats",
                  "kickoff_time",
                  kickoff_time_provisional = "provisional_start_time",
                  "started",
                  "finished",
                  fpl_game_code = "code") |>
    purrr::modify_at("kickoff_time", \(x) lubridate::ymd_hms(x, tz = "UTC")) |>
    purrr::modify_at("team_h", \(x) dplyr::case_match(x, !!!the$teams_recode)) |>
    purrr::modify_at("team_a", \(x) dplyr::case_match(x, !!!the$teams_recode)) |>
    dplyr::arrange(.data$game_id)
}


#' Get Fixtures for Specific Premier League Teams
#'
#' This function retrieves fixture information for a specific Premier League teams.
#'
#' @param team A character vector of team abbreviations.
#' @return A tibble (data frame) with fixture information including game details.
#'
#' @examples
#' get_team_fixtures(c("ARS", "CHE"))
#'
#' @export
get_team_fixtures <- function(team) {

  team <- rlang::arg_match(team, values = team_abb, multiple = TRUE)

  fpl_fixtures_info() |>
    dplyr::filter(!.data$finished) |>
    dplyr::select(-c("team_h_score", "team_a_score", "stats", "started", "finished")) |>
    dplyr::filter(.data$team_h %in% team | .data$team_a %in% team)
}


#' Get Results for Specific Premier League Teams
#'
#' This function retrieves result information for a specific Premier League teams.
#'
#' @param team A character vector of team abbreviations.
#' @return A tibble (data frame) with result information including game details.
#'
#' @examples
#' get_team_results(c("ARS", "CHE"))
#'
#' @export
get_team_results <- function(team) {

  team <- rlang::arg_match(team, values = team_abb, multiple = TRUE)

  fpl_fixtures_info() |>
    dplyr::filter(.data$finished) |>
    dplyr::select(-c("kickoff_time_provisional", "started", "finished")) |>
    dplyr::filter(.data$team_h %in% team | .data$team_a %in% team)
}

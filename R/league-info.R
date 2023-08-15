#' Get Fantasy Premier League classic league information.
#'
#' This function retrieves information about a classic league in Fantasy Premier League
#' using the provided league ID. It displays the league standings, including each
#' entry's total points, rank, and other relevant details.
#'
#' @param league_id The ID of the classic league (numeric).
#'
#' @return A tibble (data frame) with the following columns:
#'   \describe{
#'     \item{\code{fpl_entry_id}}{The FPL entry ID of the participant.}
#'     \item{\code{entry_season_id}}{The ID of the season for the participant.}
#'     \item{\code{entry_name}}{The name of the participant.}
#'     \item{\code{entry_team}}{The team name of the participant.}
#'     \item{\code{gw_total}}{The total points scored by the participant in the current gameweek.}
#'     \item{\code{overall_total}}{The overall total points scored by the participant.}
#'     \item{\code{current_rank}}{The current rank of the participant in the league.}
#'     \item{\code{previous_rank}}{The previous rank of the participant in the league.}
#'   }
#'
#' @examples
#' fpl_league_info(12345)
#'
#' @export
fpl_league_info <- function(league_id) {

  if (!is.numeric(league_id)) {
    cli::cli_abort("{.arg league_id} must be a numeric input.")
  }

  league <- call_api("leagues-classic", league_id = league_id)

  update <-
    league$last_updated_data |>
    lubridate::as_datetime() |>
    format('%H:%M on %e %B %Y')

  cli::cli_alert("The standings for {.strong {league$league$name}} league. Last updated at {update}.")
  cli::cat_line()

  league$standings$results |>
    tibble::as_tibble() |>
    dplyr::select(fpl_entry_id = "entry",
                  entry_season_id = "id",
                  entry_name = "player_name",
                  entry_team = "entry_name",
                  gw_total = "event_total",
                  overall_total = "total",
                  current_rank = "rank",
                  previous_rank = "last_rank")
}

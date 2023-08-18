#' Get the Fantasy Premier League dream team for a specific gameweek.
#'
#' This function retrieves the dream team (best performing players) for a specific
#' gameweek in the Fantasy Premier League using the official API. You can specify the
#' gameweek ID to get the dream team for a specific gameweek. If the gameweek ID is not
#' provided, the function will retrieve the dream team for the current gameweek.
#'
#' @param gameweek_id The ID of the gameweek for which to retrieve the dream team. If not provided,
#'   the dream team for the current gameweek will be retrieved.
#'
#' @return A tibble (data frame) with the following columns:
#'   \describe{
#'     \item{\code{player}}{The names of the players in the dream team.}
#'     \item{\code{points}}{The points scored by the player.}
#'     \item{\code{team}}{The players' team.}
#'     \item{\code{position}}{The players' position.}
#'   }
#'
#' @examples
#' # Get the dream team for the current gameweek
#' fpl_dreamteam()
#'
#' # Get the dream team for a specific gameweek (e.g., gameweek 5)
#' # fpl_dreamteam(gameweek_id = 5)
#'
#' @export
fpl_dreamteam <- function(gameweek_id = NULL) {

  if (is.null(gameweek_id)) {

    gameweek_id <-
      call_api("bootstrap-static")$events |>
      dplyr::filter(.data$is_current) |>
      dplyr::pull("id")

  } else {

    gameweek_id <- as.integer(gameweek_id)

    if (gameweek_id < 1L || gameweek_id > 38L) {
      cli::cli_abort("{.arg gameweek_id} must be between 1 and 38.")
    }

    finished <-
      call_api("bootstrap-static")$events |>
      dplyr::filter(.data$id == gameweek_id) |>
      dplyr::pull("finished")

    if (!finished) {
      cli::cli_abort("The {.arg gameweek_id} provided has not yet finished.")
    }
  }

  player_details <-
    call_api("bootstrap-static")$elements |>
    tibble::as_tibble() |>
    dplyr::select(player = "id",
                  "team",
                  position = "element_type")

  call_api("dream-team", gw_id = gameweek_id)$team |>
    tibble::as_tibble() |>
    dplyr::select(-"position") |>
    dplyr::rename(player = "element") |>
    dplyr::left_join(player_details, by = dplyr::join_by("player" == "player")) |>
    purrr::modify_at("player", \(x) dplyr::case_match(x, !!!the$players_recode)) |>
    purrr::modify_at("team", \(x) dplyr::case_match(x, !!!the$teams_recode)) |>
    purrr::modify_at("position", \(x) dplyr::case_match(x, !!!position_id_to_abb))
}

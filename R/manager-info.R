#' Get Fantasy Premier League manager information.
#'
#' This function retrieves information about a Fantasy Premier League manager using
#' the provided manager ID. It displays the manager's performance details, including
#' points, rank, transfers, and other relevant statistics.
#'
#' @param manager_id The ID of the FPL manager (nmeric).
#'
#' @return A tibble (data frame) with the following columns:
#'   \describe{
#'     \item{\code{gameweek_id}}{The ID of the gameweek.}
#'     \item{\code{gw_points}}{The points scored by the manager in the gameweek.}
#'     \item{\code{points_on_bench}}{The points scored by the manager's benched players in the gameweek.}
#'     \item{\code{total_points}}{The total points scored by the manager.}
#'     \item{\code{gw_rank}}{The rank of the manager in the gameweek.}
#'     \item{\code{overall_rank}}{The overall rank of the manager.}
#'     \item{\code{value}}{The value of the manager's team.}
#'     \item{\code{bank}}{The remaining budget of the manager.}
#'     \item{\code{gw_transfers}}{The number of transfers made by the manager in the gameweek.}
#'     \item{\code{gw_transfers_cost}}{The total cost of transfers made by the manager in the gameweek.}
#'   }
#'
#' @examples
#' fpl_manager_info(123456)
#'
#' @export
fpl_manager_info <- function(manager_id) {

  manager_id <- check_manager(manager_id)

  call_api("entry", manager_id = manager_id, manager_history = TRUE)$current |>
    tibble::as_tibble() |>
    dplyr::select(gameweek_id = "event",
                  gw_points = "points",
                  "points_on_bench",
                  "total_points",
                  gw_rank = "rank",
                  "overall_rank",
                  "value",
                  "bank",
                  gw_transfers = "event_transfers",
                  gw_transfers_cost = "event_transfers_cost"
                  ) |>
    purrr::modify_at(c("value", "bank"), \(x) x / 10)
}


#' Get Fantasy Premier League manager's team picks for a specific gameweek.
#'
#' This function retrieves the player picks made by an FPL manager for a specific gameweek,
#' including the player IDs, positions, captaincy/vice-captaincy status, and multipliers.
#'
#' @param manager_id The ID of the FPL manager (numeric).
#' @param gw_id The ID of the gameweek (default: current gameweek).
#'
#' @return A tibble (data frame) with the following columns:
#'   \describe{
#'     \item{\code{player}}{The player ID of the pick.}
#'     \item{\code{pick_number}}{The position of the pick in the manager's team.}
#'     \item{\code{is_captain}}{Whether the player is chosen as captain (TRUE/FALSE).}
#'     \item{\code{is_vice_captain}}{Whether the player is chosen as vice-captain (TRUE/FALSE).}
#'     \item{\code{multiplier}}{The multiplier applied to the player's points.}
#'   }
#'
#' @examples
#' fpl_manager_picks(123456)
#'
#' @importFrom cli cli_alert
#'
#' @export
fpl_manager_picks <- function(manager_id, gw_id = current_gw()) {

  manager_id <- check_manager(manager_id)
  gw_id <- check_gameweek(gw_id)

  call_api("entry", manager_id = manager_id, gw_id = gw_id)$picks |>
    tibble::as_tibble() |>
    dplyr::select(player = "element",
                  pick_number = "position",
                  "is_captain",
                  "is_vice_captain",
                  "multiplier") |>
    purrr::modify_at("player", \(x) dplyr::case_match(x, !!!the$players_recode))
}



#' Get Fantasy Premier League manager's historical performance of previous seasons.
#'
#' This function retrieves the historical performance an FPL manager (if exists).
#'
#' @param manager_id The ID of the FPL manager (numeric).
#'
#' @return A tibble (data frame) with the following columns:
#'   \describe{
#'     \item{\code{season_name}}{The previous season the manager took part.}
#'     \item{\code{total_points}}{The total points scored in that season.}
#'     \item{\code{rank}}{The overall rank of that season.}
#'   }
#'
#' @examples
#' fpl_manager_history(123456)
#'
#' @export
fpl_manager_history <- function(manager_id) {

  manager_id <- check_manager(manager_id)

  call_api("entry", manager_id = manager_id, manager_history = TRUE)$past |>
    tibble::as_tibble()
}


#' Get the total number of Fantasy Premier League managers.
#'
#' This function retrieves the total number of managers participating in the Fantasy Premier League.
#'
#' @return The total number of FPL managers.
#'
#' @examples
#' fpl_total_managers()
#'
#' @export
fpl_total_managers <- function() {
  call_api("bootstrap-static")$total_players
}

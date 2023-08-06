#' Get Fantasy Premier League gameweek information.
#'
#' This function retrieves information about the gameweeks and its details,
#' such as the gameweek name, deadline time, finished status, current status, previous status,
#' next status, highest score, average entry score, transfers made, chip plays, most selected player,
#' most captained player, most vice-captained player, most transferred-in player, and the top player
#' of the gameweek, along with their details.
#'
#' @return A tibble (data frame) with the following columns:
#'   \describe{
#'     \item{\code{gameweek}}{The name of the gameweek.}
#'     \item{\code{gw_deadline}}{The deadline datetime of the gameweek in UTC.}
#'     \item{\code{gw_finished}}{A logical value indicating whether the gameweek is finished.}
#'     \item{\code{data_checked}}{A logical value indicating whether the data for the gameweek was checked.}
#'     \item{\code{gw_current}}{A logical value indicating whether the gameweek is the active one.}
#'     \item{\code{gw_previous}}{A logical value indicating whether the gameweek is the previous one.}
#'     \item{\code{gw_next}}{A logical value indicating whether the gameweek is the next one.}
#'     \item{\code{gw_highest_score}}{The highest score achieved by any FPL player in the gameweek.}
#'     \item{\code{gw_average_score}}{The average score of all FPL entries in the gameweek.}
#'     \item{\code{transfers_made}}{The total number of transfers made in the gameweek.}
#'     \item{\code{chip_plays}}{The chip plays made in the gameweek.}
#'     \item{\code{player_most_selected}}{The player who is most selected by FPL managers in the gameweek.}
#'     \item{\code{player_most_captained}}{The player who is most captained by FPL managers in the gameweek.}
#'     \item{\code{player_most_vice_captained}}{The player who is most vice-captained by FPL managers in the gameweek.}
#'     \item{\code{player_most_transferred_in}}{The player who is most transferred-in by FPL managers in the gameweek.}
#'     \item{\code{top_player}}{The top-performing player in the gameweek.}
#'     \item{\code{top_player_info}}{Additional details about the top-performing player of that gameweek.}
#'   }
#'
#' @examples
#' fpl_gameweek_info()
#'
#' @export
fpl_gameweek_info <- function() {

  data <- call_api("bootstrap-static")

  time_zone <- data$game_settings$timezone

  data$events |>
    tibble::as_tibble() |>
    dplyr::select(gameweek = "name",
                  gw_deadline = "deadline_time",
                  gw_finished = "finished",
                  "data_checked",
                  gw_current = "is_current",
                  gw_previous = "is_previous",
                  gw_next = "is_next",
                  gw_highest_score = "highest_score",
                  gw_average_score = "average_entry_score",
                  "transfers_made",
                  "chip_plays",
                  player_most_selected = "most_selected",
                  player_most_captained = "most_captained",
                  player_most_vice_captained = "most_vice_captained",
                  player_most_transferred_in = "most_transferred_in",
                  top_player = "top_element",
                  top_player_info = "top_element_info") |>
    purrr::modify_at("gw_deadline", \(x) lubridate::ymd_hms(x, tz = time_zone))
}

#' Get the Next Fantasy Premier League Gameweek
#'
#' This function retrieves the next gameweek in the Fantasy Premier League.
#'
#' @return The next gameweek in character format.
#'
#' @importFrom rlang .data
#'
#' @examples
#' next_gw()
#'
#' @export
next_gw <- function() {

  call_api("bootstrap-static")$events |>
    dplyr::select("name", "is_next") |>
    dplyr::filter(.data$is_next) |>
    dplyr::pull("name")
}


#' Get the Deadline Time of the Next Fantasy Premier League Gameweek
#'
#' This function retrieves the deadline time of the next gameweek in the Fantasy Premier League.
#'
#' @return The deadline time of the next gameweek in POSIXct format.
#'
#' @importFrom rlang .data
#'
#' @examples
#' next_gw_deadline()
#'
#' @export
next_gw_deadline <- function() {

  call_api("bootstrap-static")$events |>
    dplyr::select("deadline_time", "is_next") |>
    dplyr::filter(.data$is_next) |>
    dplyr::pull("deadline_time") |>
    lubridate::ymd_hms()
}


#' Get the Current Fantasy Premier League Gameweek
#'
#' This function retrieves the current gameweek in the Fantasy Premier League.
#'
#' @return The current gameweek.
#'
#' @importFrom rlang .data
#'
#' @examples
#' current_gw()
#'
#' @export
current_gw <- function() {

  call_api("bootstrap-static")$events |>
    dplyr::select("name", "is_current") |>
    dplyr::filter(.data$is_current) |>
    dplyr::pull("name")
}


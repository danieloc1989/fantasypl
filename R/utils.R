#' Call the Fantasy Premier League API
#'
#' This function calls the Fantasy Premier League API with the specified endpoint
#'
#' @param endpoint The API endpoint to call. Possible values are "bootstrap-static", "fixtures", "element-summary", "entry", "leagues-classic", "dream-team" or "event-status".
#'
#' @return Parsed JSON data returned by the API.
#'
#' @noRd
call_api <- function(endpoint,
                     player_id = NULL,
                     gw_id = NULL,
                     manager_id = NULL,
                     manager_history = FALSE,
                     league_id = NULL) {

  base_url <- "https://fantasy.premierleague.com/api"
  append <- NULL

  endpoint <- rlang::arg_match(endpoint,
                               values = c("bootstrap-static", "fixtures",
                                          "element-summary",  "entry",
                                          "leagues-classic",  "dream-team",
                                          "event-status"))

  # element-summary
  if (endpoint == "element-summary") {
    if (is.null(player_id)) {
      cli::cli_abort("{.arg player_id} must be declared when {.arg endpoint} is '{endpoint}'.")
    } else {
        append <- player_id
      }
  }

  # entry (manager)
  if (endpoint == "entry") {
    if (is.null(manager_id)) {
      cli::cli_abort("{.arg entry_id} must be declared when {.arg endpoint} is '{endpoint}'.")
    } else if (manager_history) {
      append <- glue::glue("{manager_id}/history")
    } else if (!is.null(gw_id)) {
      append <- glue::glue("{manager_id}/event/{gw_id}/picks")
    } else {
      append <- manager_id
    }
  }

  # leagues-classics
  if (endpoint == "leagues-classic") {
    if (is.null(league_id)) {
      cli::cli_abort("{.arg league_id} must be declared when {.arg endpoint} is '{endpoint}'.")
    } else {
      append <- glue::glue("{league_id}/standings")
    }
  }

  # dream-team
  if (endpoint == "dream-team") {
    if (is.null(gw_id)) {
      cli::cli_abort("{.arg gw_id} must be declared when {.arg endpoint} is '{endpoint}'.")
    } else if (gw_id < 1L || gw_id > 38L) {
      cli::cli_abort("{.arg gw_id} must be between 1 and 38.")
    } else {
      append <- gw_id
    }
  }

  httr2::request(base_url) |>
    httr2::req_url_path_append(endpoint) |>
    httr2::req_url_path_append(append) |>
    httr2::req_perform() |>
    httr2::resp_body_string() |>
    jsonlite::fromJSON()
}


#' Checks if ids provided satisfies whole number
#'
#' @noRd
check_id <- function(x,
                     arg = rlang::caller_arg(x),
                     call = rlang::caller_env()) {

  if (length(x) != 1) {
    cli::cli_abort("{.arg {arg}} must be of length 1.", call = call)
  }

  if (!is.numeric(x)) {
    cli::cli_abort("{.arg {arg}} must a numeric.", call = call)
  }

  if ((x %% 1) != 0) {
    cli::cli_abort("{.arg {arg}} must a whole number.", call = call)
  }

  invisible(x)
}


#' Pulls the current gameweek id
#'
#' @noRd
current_gw <- function() {
  gw_data <- call_api("bootstrap-static")$events
  gw_data$id[gw_data$is_current == TRUE]
}


#' Determines if gameweek is completed
#'
#' @noRd
gw_finished <- function(gw_id) {

  gw_id <- check_id(gw_id)

  if (gw_id < 1 || gw_id > 38) {
    cli::cli_abort("{.arg gw_id} must be between 1 and 38.")
  }

  gw_data <- call_api("bootstrap-static")$events
  gw_data$finished[gw_data$id == gw_id]
}

#' @importFrom rlang .data
NULL

#' @importFrom rlang %||%
NULL

## onLoad hook =================================================================

.onLoad <- function(lib, pkg) {
  rlang::run_on_load()
}

# create environment
the <- new.env(parent = emptyenv())

## players ---------------------------------------------------------------------

# player names used to
the$players_names <- NULL

rlang::on_load(the$players_names <-
                 call_api("bootstrap-static")$elements |>
                 _$web_name)

# player season id to name used in case_match functions
the$players_recode <- NULL

player_recode <- function() {
  data <- call_api("bootstrap-static")$elements
  purrr::map2(data$id, data$web_name, rlang::new_formula)
}

rlang::on_load(the$players_recode <- player_recode())


## teams -----------------------------------------------------------------------

# team names
the$teams_abb <- NULL

rlang::on_load(the$teams_abb <-
                 call_api("bootstrap-static")$teams |>
                 _$short_name)

the$teams_recode <- NULL

team_recode <- function() {
  data <- call_api("bootstrap-static")$teams
  purrr::map2(data$id, data$short_name, rlang::new_formula)
}

rlang::on_load(the$teams_recode <- team_recode())

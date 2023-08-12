#' @importFrom rlang .data

.onLoad <- function(lib, pkg) {
  rlang::run_on_load()
}

# create environment
the <- new.env(parent = emptyenv())

## players ---------------------------------------------------------------------

# player names used to
the$players_names <- NULL

player_names <- function() {

  data <- call_api("bootstrap-static")$elements
  data$web_name
}

rlang::on_load(the$players_names <- player_names())

# player season id to name used in case_match functions
the$players_recode <- NULL

player_recode <- function() {

  data <- call_api("bootstrap-static")$elements
  purrr::map2(data$id, data$web_name, rlang::new_formula)
}

rlang::on_load(the$players_recode <- player_recode())




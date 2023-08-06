#' This matcher function is used to get
matcher <- function(names, values) {

  if(!is.atomic(names) || !is.atomic(values)) {
    cli::cli_abort("{.arg names} and {.arg values} must be atomic vectors.")
  }

  if(length(names) != length(values)) {
    cli::cli_abort("{.arg names} and {.arg values} must be the same lenght.")
  }

  purrr::map2(names, values, rlang::new_formula)
}



data <- call_api("bootstrap-static")


# Team names -------------------------------------------------------------------

team_ids <-
  data$teams |>
  tibble::as_tibble() |>
  dplyr::select(team_fpl_code = code,
                team_name = name,
                team_abb = short_name,
                team_season_id = id)

team_season_id_to_name <-
  matcher(team_ids$team_season_id, team_ids$team_name)

team_season_id_to_abb <-
  matcher(team_ids$team_season_id, team_ids$team_abb)

team_fpl_code_to_name <-
  matcher(team_ids$team_fpl_code, team_ids$team_name)

team_fpl_code_to_abb <-
  matcher(team_ids$team_fpl_code, team_ids$team_abb)

# Player Positions -------------------------------------------------------------

player_positions <-
  data$element_types |>
  dplyr::select(position_id = id,
                position_name = singular_name,
                position_abb = singular_name_short)

position_id_to_name <-
  player_positions |>
  dplyr::select(position_id, position_name) |>
  tibble::deframe()

position_id_to_abb <-
  player_positions |>
  dplyr::select(position_id, position_abb) |>
  tibble::deframe()


usethis::use_data(team_season_id_to_name,
                  team_season_id_to_abb,
                  team_fpl_code_to_name,
                  team_fpl_code_to_abb,
                  position_id_to_name,
                  position_id_to_abb,
                  overwrite = TRUE,
                  internal = TRUE)

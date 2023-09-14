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

team_abb <- team_ids$team_abb

# Player Positions -------------------------------------------------------------

player_positions <-
  data$element_types |>
  dplyr::select(position_id = id,
                position_name = singular_name,
                position_abb = singular_name_short)

position_id_to_name <-
  matcher(player_positions$position_id, player_positions$position_name)

position_id_to_abb <-
  matcher(player_positions$position_id, player_positions$position_abb)



# PL 23/24 team colours
# Colours extracted from team websites, mainly from svg fill values.

team_colours <- tibble::tribble(
  ~team_abb,  ~primary_colour, ~secondary_colour,
  "ARS",      "#EF0107",       "#023474",
  "AVL",      "#7D1142",       "#94BEE5",
  "BOU",      "#E62333",       "#000000",
  "BRE",      "#C10000",       "#FFFFFF",
  "BHA",      "#0054a5",       "#FFFFFF",
  "BUR",      "#6C1D45",       "#99D6EA",
  "CHE",      "#034694",       "#FFFFFF",
  "CRY",      "#1B458F",       "#E31C3D",
  "EVE",      "#003399",       "#FFFFFF",
  "FUL",      "#FFFFFF",       "#000000",
  "LIV",      "#C8102E",       "#FFFFFF",
  "LUT",      "#FF4500",       "#FFFFFF",
  "MCI",      "#6CADDF",       "#1C2C5B",
  "MUN",      "#DA020E",       "#000000",
  "NEW",      "#000000",       "#FFFFFF",
  "NFO",      "#FF2400",       "#FFFFFF",
  "SHU",      "#E52B50",       "#FFFFFF",
  "TOT",      "#FFFFFF",       "#001C58",
  "WHU",      "#7A263A",       "#80CFFF",
  "WOL",      "#FDB913",       "#000000"
)


usethis::use_data(team_season_id_to_name,
                  team_season_id_to_abb,
                  team_fpl_code_to_name,
                  team_fpl_code_to_abb,
                  team_abb,
                  position_id_to_name,
                  position_id_to_abb,
                  team_colours,
                  overwrite = TRUE,
                  internal = TRUE)

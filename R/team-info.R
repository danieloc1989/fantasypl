#' Get Fantasy Premier League team information.
#'
#' This function retrieves information about FPL teams, such as team IDs, names,
#' abbreviations, performance, and strength indicators using the Fantasy Premier League API.
#'
#' @return A tibble (data frame) with the following columns:
#'   \describe{
#'     \item{\code{team_fpl_code}}{The FPL code of the team.}
#'     \item{\code{team_name}}{The name of the team.}
#'     \item{\code{team_abb}}{The abbreviation of the team.}
#'     \item{\code{season_id}}{The ID of the season.}
#'     \item{\code{form}}{The team's recent form.}
#'     \item{\code{played}}{The number of matches played.}
#'     \item{\code{win}}{The number of matches won.}
#'     \item{\code{draw}}{The number of matches drawn.}
#'     \item{\code{loss}}{The number of matches lost.}
#'     \item{\code{points}}{The total number of points earned.}
#'     \item{\code{league_position}}{The team's current league position.}
#'     \item{\code{strength}}{The team's overall strength.}
#'     \item{\code{strength_overall_home}}{The team's home strength overall.}
#'     \item{\code{strength_defence_home}}{The team's home defensive strength.}
#'     \item{\code{strength_attack_home}}{The team's home attacking strength.}
#'     \item{\code{strength_overall_away}}{The team's away strength overall.}
#'     \item{\code{strength_defence_away}}{The team's away defensive strength.}
#'     \item{\code{strength_attack_away}}{The team's away attacking strength.}
#'   }
#'
#' @examples
#' fpl_team_info()
#'
#' @export
fpl_team_info <- function() {

  call_api("bootstrap-static")$teams |>
    tibble::as_tibble() |>
    dplyr::select(team_fpl_code = "code",
                  team_name = "name",
                  team_abb = "short_name",
                  season_id = "id",
                  "form",
                  "played",
                  "win",
                  "draw",
                  "loss",
                  "points",
                  league_position = "position",
                  "strength",
                  "strength_overall_home",
                  "strength_defence_home",
                  "strength_attack_home",
                  "strength_overall_away",
                  "strength_defence_away",
                  "strength_attack_away")
}

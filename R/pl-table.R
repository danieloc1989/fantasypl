##' Print Premier League Table.
#'
#' This function prints a table with Premier League teams' performance data, including
#' the number of matches played, wins, draws, losses and points.
#'
#' @return A `gt` table object displaying the Premier League table.
#'
#' @examples
#' pl_table()
#'
#' @export
pl_table <- function() {

  time_stamp <- format(Sys.time(), "%e %B %y at %H:%M %Z")

  table_df <-
    call_api("bootstrap-static")$teams |>
    dplyr::select(Team = "name",
                  Played = "played",
                  Win = "win",
                  Draw = "draw",
                  Loss = "loss",
                  Points = "points",
                  "position") |>
    dplyr::arrange(.data$position) |>
    dplyr::select(-"position")

  table_df |>
    gt::gt() |>
    gt::tab_header(
      title = gt::md("**Premier League Table**")
    ) |>
    gt::tab_options(
      heading.background.color = "dodgerblue4",
      column_labels.background.color = "dodgerblue3",
      column_labels.font.weight = "bold",
      table_body.hlines.color = "grey30"
    ) |>
    gtExtras::gt_highlight_rows(
      rows = 1,
      fill = "gold",
      alpha = 0.7
    ) |>
    gtExtras::gt_highlight_rows(
      rows = c(18:20),
      fill = "lightpink2",
      alpha = 0.5,
      font_weight = "normal"
    ) |>
    gtExtras::gt_highlight_rows(
      rows = c(2:17),
      fill = "lightblue",
      alpha = 0.5,
      font_weight = "normal"
    ) |>
    gt::tab_source_note(
      source_note =  paste0("As on the ", time_stamp, ".Created by {fantasypl}.")
    ) |>
    gt::cols_width(
      Team ~ gt::px(160),
      gt::everything() ~ px(80)
    )
}

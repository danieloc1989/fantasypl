% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/player-info.R
\name{fpl_player_ict}
\alias{fpl_player_ict}
\title{Get Fantasy Premier League ICT Index Information of All Players.}
\usage{
fpl_player_ict()
}
\value{
A tibble (\code{data.frame}) with the following columns:
\describe{
\item{\code{player_season_id}}{The ID of the player for the current season.}
\item{\code{player_name}}{The web name of the player.}
\item{\code{ict_index}}{The player's ICT index value.}
\item{\code{ict_index_rank}}{The player's ICT index rank.}
\item{\code{ict_index_rank_type}}{The type of rank (e.g., "overall").}
\item{\code{influence}}{The player's influence score.}
\item{\code{influence_rank}}{The player's influence rank.}
\item{\code{influence_rank_type}}{The type of influence rank (e.g., "overall").}
\item{\code{creativity}}{The player's creativity score.}
\item{\code{creativity_rank}}{The player's creativity rank.}
\item{\code{creativity_rank_type}}{The type of creativity rank (e.g., "overall").}
\item{\code{threat}}{The player's threat score.}
\item{\code{threat_rank}}{The player's threat rank.}
\item{\code{threat_rank_type}}{The type of threat rank (e.g., "overall").}
}
}
\description{
This function retrieves information about the ICT (Influence, Creativity,
Threat) index of all FPL players using the Fantasy Premier League API.
}
\examples{
fpl_player_ict()

}


# Fantasy Premier League API  Wrapper - {fantasypl}

<!-- badges: start -->
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN status](https://www.r-pkg.org/badges/version/fantasypl)](https://CRAN.R-project.org/package=fantasypl)
<!-- badges: end -->

The goal of {fantasypl} is to retrieve data from the Fantasy Premier League API endpoints and provide it in a convenient tabular format (tibble).

## Installation

You can install the development version of {fantasypl} like so:

``` r
# install.packages("pak")
pak::pak("danieloc1989/fantasypl")
```

## Retrieving FPL data

There are a number of functions that including:

- team details - `fpl_team_info()`

- fixture details - `fpl_fixtures_info()`

- player details - `fpl_player_info()`, `fpl_player_ict()` and `fpl_player_stats()`

``` r
library(fantasypl)

# get Premier League team information
fpl_team_info()
```

## TODO

- Finalise the endpoint connections functions.

- Update various functions to deal with updates to data types, once the season begins. 

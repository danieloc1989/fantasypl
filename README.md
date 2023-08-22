
<!-- README.md is generated from README.Rmd. Please edit that file -->

# fantasypl - An R Package for Fantasy Premier League Data

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/fantasypl)](https://CRAN.R-project.org/package=fantasypl)
[![Codecov test
coverage](https://codecov.io/gh/danieloc1989/fantasypl/branch/master/graph/badge.svg)](https://app.codecov.io/gh/danieloc1989/fantasypl?branch=master)
[![R-CMD-check](https://github.com/danieloc1989/fantasypl/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/danieloc1989/fantasypl/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of `{fantasypl}` is to retrieve data from the Fantasy Premier
League API endpoints and provide it in a convenient tabular format
(tibble).

## Installation

You can install the development version of `{fantasypl}` from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("danieloc1989/fantasypl")
```

There is no intention of releasing this package on CRAN.

## Retrieving FPL data

``` r
library(fantasypl)
```

The package provides functions to retrieve various types of FPL data,
including player information, team details, gameweek information, and
more.

### Player Information

You can obtain general player information for all 670 registered players
in the Premier League:

``` r
# General details of all players
fpl_player_info()
#> # A tibble: 670 × 9
#>    player_season_id player_name  first_name second_name       team  squad_number
#>               <int> <chr>        <chr>      <chr>             <chr> <lgl>       
#>  1                1 Balogun      Folarin    Balogun           ARS   NA          
#>  2                2 Cédric       Cédric     Alves Soares      ARS   NA          
#>  3                3 M.Elneny     Mohamed    Elneny            ARS   NA          
#>  4                4 Fábio Vieira Fábio      Ferreira Vieira   ARS   NA          
#>  5                5 Gabriel      Gabriel    dos Santos Magal… ARS   NA          
#>  6                6 Havertz      Kai        Havertz           ARS   NA          
#>  7                7 Holding      Rob        Holding           ARS   NA          
#>  8                8 G.Jesus      Gabriel    Fernando de Jesus ARS   NA          
#>  9                9 Jorginho     Jorge Luiz Frello Filho      ARS   NA          
#> 10               10 Kiwior       Jakub      Kiwior            ARS   NA          
#> # ℹ 660 more rows
#> # ℹ 3 more variables: player_position <chr>, player_fpl_code <int>,
#> #   special <lgl>
```

This function returns basic information such as names, teams, positions,
and player IDs.

For more all player season statistics, you can use:

``` r
# Season statistics of all players 
fpl_player_stats()
#> # A tibble: 670 × 53
#>    player_season_id player_name  selected_pct selected_rank selected_rank_type
#>               <int> <chr>               <dbl>         <int>              <int>
#>  1                1 Balogun             0.007           203                 37
#>  2                2 Cédric              0.004           257                 95
#>  3                3 M.Elneny            0.001           430                141
#>  4                4 Fábio Vieira        0.001           417                132
#>  5                5 Gabriel             0.265            10                  3
#>  6                6 Havertz             0.038            88                 28
#>  7                7 Holding             0.002           340                130
#>  8                8 G.Jesus             0.013           151                 27
#>  9                9 Jorginho            0.002           318                 94
#> 10               10 Kiwior              0.001           425                165
#> # ℹ 660 more rows
#> # ℹ 48 more variables: current_price <dbl>, now_cost_rank <int>,
#> #   now_cost_rank_type <int>, cost_change_start <dbl>,
#> #   cost_change_start_fall <dbl>, cost_change_event <dbl>,
#> #   cost_change_event_fall <dbl>, total_transfers_in <int>,
#> #   gw_transfers_in <int>, transfers_out <int>, transfers_out_event <int>,
#> #   minutes <int>, starts <int>, starts_per_90 <dbl>, total_points <int>, …
```

If more detailed level of information is required

``` r
# Find player's ID
haaland <- fpl_find_player_id("haaland")
#> ✔ Haaland (Erling Haaland) for MCI matched your search.

# Retrieve Haaland season statistics
fpl_player_fixture_stats(haaland)
#> Haaland's per game season statistics
#> # A tibble: 2 × 31
#>   gameweek game_id opponent total_points starts minutes goals_scored assists
#>      <int>   <int> <chr>           <int>  <int>   <int>        <int>   <int>
#> 1        1       1 BUR                13      1      79            2       0
#> 2        2      16 NEW                 2      1      90            0       0
#> # ℹ 23 more variables: clean_sheets <int>, goals_conceded <int>,
#> #   own_goals <int>, penalties_saved <int>, penalties_missed <int>,
#> #   yellow_cards <int>, red_cards <int>, saves <int>, bonus <int>, bps <int>,
#> #   influence <chr>, creativity <chr>, threat <chr>, ict_index <chr>,
#> #   xg_scored <chr>, xa <chr>, xg_involvement <chr>, xg_conceded <chr>,
#> #   price <dbl>, selected <int>, transfers_in <int>, transfers_out <int>,
#> #   transfers_balance <int>
```

### Team Information

To get information about all Premier League teams, you can use:

``` r
# PL team info
fpl_team_info()
#> # A tibble: 20 × 18
#>    team_fpl_code team_name     team_abb season_id form  played   win  draw  loss
#>            <int> <chr>         <chr>        <int> <lgl>  <int> <int> <int> <int>
#>  1             3 Arsenal       ARS              1 NA         0     0     0     0
#>  2             7 Aston Villa   AVL              2 NA         0     0     0     0
#>  3            91 Bournemouth   BOU              3 NA         0     0     0     0
#>  4            94 Brentford     BRE              4 NA         0     0     0     0
#>  5            36 Brighton      BHA              5 NA         0     0     0     0
#>  6            90 Burnley       BUR              6 NA         0     0     0     0
#>  7             8 Chelsea       CHE              7 NA         0     0     0     0
#>  8            31 Crystal Pala… CRY              8 NA         0     0     0     0
#>  9            11 Everton       EVE              9 NA         0     0     0     0
#> 10            54 Fulham        FUL             10 NA         0     0     0     0
#> 11            14 Liverpool     LIV             11 NA         0     0     0     0
#> 12           102 Luton         LUT             12 NA         0     0     0     0
#> 13            43 Man City      MCI             13 NA         0     0     0     0
#> 14             1 Man Utd       MUN             14 NA         0     0     0     0
#> 15             4 Newcastle     NEW             15 NA         0     0     0     0
#> 16            17 Nott'm Forest NFO             16 NA         0     0     0     0
#> 17            49 Sheffield Utd SHU             17 NA         0     0     0     0
#> 18             6 Spurs         TOT             18 NA         0     0     0     0
#> 19            21 West Ham      WHU             19 NA         0     0     0     0
#> 20            39 Wolves        WOL             20 NA         0     0     0     0
#> # ℹ 9 more variables: points <int>, league_position <int>, strength <int>,
#> #   strength_overall_home <int>, strength_defence_home <int>,
#> #   strength_attack_home <int>, strength_overall_away <int>,
#> #   strength_defence_away <int>, strength_attack_away <int>
```

*Team information has not been updated as of yet on the system. A
warning will be introduced to this function if this persists.*

### Gameweek and Fixtures Information

To obtain information about gameweeks and fixtures, you can use the
following functions:

``` r
# Information on gameweeks
fpl_gameweek_info()
#> # A tibble: 38 × 17
#>    gameweek  gw_deadline         gw_finished data_checked gw_current gw_previous
#>    <chr>     <dttm>              <lgl>       <lgl>        <lgl>      <lgl>      
#>  1 Gameweek… 2023-08-11 17:30:00 TRUE        TRUE         FALSE      TRUE       
#>  2 Gameweek… 2023-08-18 17:15:00 TRUE        TRUE         TRUE       FALSE      
#>  3 Gameweek… 2023-08-25 17:30:00 FALSE       FALSE        FALSE      FALSE      
#>  4 Gameweek… 2023-09-01 17:30:00 FALSE       FALSE        FALSE      FALSE      
#>  5 Gameweek… 2023-09-16 10:00:00 FALSE       FALSE        FALSE      FALSE      
#>  6 Gameweek… 2023-09-23 12:30:00 FALSE       FALSE        FALSE      FALSE      
#>  7 Gameweek… 2023-09-30 10:00:00 FALSE       FALSE        FALSE      FALSE      
#>  8 Gameweek… 2023-10-07 10:00:00 FALSE       FALSE        FALSE      FALSE      
#>  9 Gameweek… 2023-10-21 10:00:00 FALSE       FALSE        FALSE      FALSE      
#> 10 Gameweek… 2023-10-27 17:30:00 FALSE       FALSE        FALSE      FALSE      
#> # ℹ 28 more rows
#> # ℹ 11 more variables: gw_next <lgl>, gw_highest_score <int>,
#> #   gw_average_score <int>, transfers_made <int>, chip_plays <list>,
#> #   player_most_selected <chr>, player_most_captained <chr>,
#> #   player_most_vice_captained <chr>, player_most_transferred_in <chr>,
#> #   top_player <chr>, top_player_points <int>

# Each PL fixture
fpl_fixtures_info()
#> # A tibble: 380 × 12
#>    gw_id game_id team_h team_h_score team_a team_a_score stats        
#>    <int>   <int> <chr>         <int> <chr>         <int> <list>       
#>  1     1       1 BUR               0 MCI               3 <df [10 × 3]>
#>  2     1       2 ARS               2 NFO               1 <df [10 × 3]>
#>  3     1       3 BOU               1 WHU               1 <df [10 × 3]>
#>  4     1       4 BHA               4 LUT               1 <df [10 × 3]>
#>  5     1       5 EVE               0 FUL               1 <df [10 × 3]>
#>  6     1       6 NEW               5 AVL               1 <df [10 × 3]>
#>  7     1       7 SHU               0 CRY               1 <df [10 × 3]>
#>  8     1       8 BRE               2 TOT               2 <df [10 × 3]>
#>  9     1       9 CHE               1 LIV               1 <df [10 × 3]>
#> 10     1      10 MUN               1 WOL               0 <df [10 × 3]>
#> # ℹ 370 more rows
#> # ℹ 5 more variables: kickoff_time <dttm>, kickoff_time_provisional <lgl>,
#> #   started <lgl>, finished <lgl>, fpl_game_code <int>
```

### Weekly Dream Team

You can retrieve the Dream Team for the current gameweek like this:

``` r
# The Dream Team for the current gameweek
fpl_dreamteam()
#> # A tibble: 11 × 4
#>    player    points team  position
#>    <chr>      <int> <chr> <chr>   
#>  1 Vicario       11 TOT   GKP     
#>  2 Estupiñan     11 BHA   DEF     
#>  3 Aurier        10 NFO   DEF     
#>  4 Digne         10 AVL   DEF     
#>  5 Mbeumo        16 BRE   MID     
#>  6 March         15 BHA   MID     
#>  7 Bailey        14 AVL   MID     
#>  8 Mitoma        12 BHA   MID     
#>  9 Diogo J.      12 LIV   MID     
#> 10 Wissa         11 BRE   FWD     
#> 11 Antonio        9 WHU   FWD
```

## Additional Notes

The API may be unavailable for a brief period after a gameweek deadline
as the system updates manager selections.

## Contributing

If you find issues or have suggestions for improvements, please open an
issue on the [GitHub
repository](https://github.com/danieloc1989/fantasypl/issues). I welcome
contributions and collaboration.

## License

This package is released under the MIT License.

Happy fantasy gaming with `{fantasypl}`!

# TPL 23/24 team colours
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

usethis::use_data(team_colours, overwrite = TRUE)

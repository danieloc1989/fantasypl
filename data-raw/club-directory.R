# Information from Club Directory of the Premier League Handbook Season 2023/24
# URL: https://resources.premierleague.com/premierleague/document/2023/08/07/b7ce673f-fc5f-4bc3-911a-e6b32476c9dc/PL_Handbook_2023-24_DIGITAL_03.08.23.pdf


club_directory <-
  dplyr::bind_cols(

    tibble::tribble(
      ~abb, ~full_name, ~stadium,  ~address, ~postcode,
      "BOU", "AFC Bournemouth", "Vitality Stadium", "Dean Court, Bournemouth", "BH7 7AF",
      "ARS", "Arsenal", "Emirates Stadium", "Highbury House, 75 Drayton Park, London", "N5 1BU",
      "AVL", "Aston Villa", "Villa Park", "Birmingham", "B6 6HE",
      "BRE", "Brentford", "Gtech Community Stadium", "Lionel Road South, Brentford", "TW8 0RU",
      "BHA", "Brighton & Hove Albion", "The American Express Stadium", "Village Way, Falmer, Brighton, East Sussex", "BN1 9BL",
      "BUR", "Burnley", "Turf Moor", "Harry Potts Way, Burnley, Lancashire", "BB10 4BX",
      "CHE", "Chelsea", "Stamford Bridge", "Fulham Road, London", "SW6 1HS",
      "CRY", "Crystal Palace", "Selhurst Park Stadium", "London", "SE25 6PU",
      "EVE", "Everton", "Goodison Park", "Goodison Road, Liverpool", "L4 4EL",
      "FUL", "Fulham", "Craven Cottage", "Stevenage Road, London", "SW6 6HH",
      "LIV", "Liverpool", "Anfield Road", "Anfield, Liverpool", "L4 0TH",
      "LUT", "Luton Town", "Kenilworth Stadium", "1 Maple Road, Luton, Bedfordshire", "LU4 8AW",
      "MCI", "Manchester City", "Etihad Stadium", "Etihad Campus, Manchester", "M11 3FF",
      "MUN", "Manchester United", "Old Trafford", "Sir Matt Busby Way, Old Trafford, Manchester", "M16 0RA",
      "NEW", "Newcastle United", "St James’ Park", "Newcastle Upon Tyne", "NE1 4ST",
      "NFO", "Nottingham Forest", "The City Ground", "Pavilion Road, West Bridgford, Nottingham", "NG2 5FJ",
      "SHU", "Sheffield United", "Bramall Lane", "Sheffield", "S2 4SU",
      "TOT", "Tottenham Hotspur", "Tottenham Hotspur Stadium", "Lilywhite House, 782 High Road, Tottenham, London", "N17 0BX",
      "WHU", "West Ham United", "London Stadium", "Queen Elizabeth Olympic Park, London", "E20 2ST",
      "WOL", "Wolverhampton Wanderers", "Molineux Stadium", "Waterloo Road, Wolverhampton, West Midlands", "WV1 4QR"),

    tibble::tribble(
      ~capacity,  ~pitch_width,  ~pitch_length,
      11307,      68,            105,
      60704,      68,            105,
      42530,      68,            105,
      17250,      68,            105,
      31876,      68,            105,
      21744,      68,            105,
      40173,      67.5,          103,
      25486,      68,            101,
      39414,      68,            100.48,
      24500,      65,            100,
      61276,      68,            101,
      10265,      65.8,          100.6,
      53400,      68,            105,
      74031,      68,            105,
      52257,      68,            105,
      30404,      68,            105,
      32050,      68,            105,
      62850,      68,            105,
      62500,      68,            105,
      31750,      68,            105),

    tibble::tribble(
      ~kit,      ~sponsor,             ~manager_coach,
      "Umbro",   "Dafabet",            "Andoni lraola Sagarna",
      "adidas",  "Emirates",           "Mikel Arteta",
      "Castore", "BK8",                "Unai Emery",
      "Umbro",   "Hollywood Bets",     "Thomas Frank",
      "Nike",    "American Express",   "Roberto De Zerbi",
      "Umbro",   "W88",                "Vincent Kompany",
      "Nike",    NA,                   "Mauricio Pochettino",
      "MACRON",  "CINCH",              "Roy Hodgson",
      "Hummel",  "Stake.com",          "Sean Dyche",
      "adidas",  "SBOTOP",             "Marco Silva",
      "Nike",    "Standard Chartered", "Jurgen Klopp",
      "Umbro",   "Utilita",            "Rob Edwards",
      "PUMA",    "Etihad Airways",     "Pep Guardiola",
      "adidas",  "TeamViewer",         "Erik ten Hag",
      "Castore", "Sela",               "Eddie Howe",
      "adidas",  NA,                   "Steve Cooper",
      "Errea",   NA,                   "Paul Heckingbottom",
      "Nike",    "AIA",                "Ange Postecoglou",
      "Umbro",   "Betway",             "David Moyes",
      "Castore", "AstroPay",           "Gary O'Neil"))


usethis::use_data(club_directory, overwrite = TRUE)

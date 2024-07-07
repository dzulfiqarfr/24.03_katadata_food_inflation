# Get the poverty rate and share of households with high food expenses

here::i_am("src/poverty_and_food_expenses.R")

# Packages ----------------------------------------------------------------

library(conflicted)
library(here)
library(tidyverse)
conflict_prefer("filter", "dplyr", quiet = TRUE)

# Data --------------------------------------------------------------------

fsva_raw <- read_csv(
  here("data", "tabel_data.csv"),
  col_types = list(
    Komposit = col_integer(),
    `IKP Ranking` = col_integer()
  )
)

# Wrangling ---------------------------------------------------------------

poverty_food_expenses <- fsva_raw |> 
  select(
    province_city = Wilayah,
    share_poverty = `Kemiskinan (%)`,
    share_household_food_expense_high = `Pengeluaran Pangan (%)`
  ) |> 
  separate_wider_delim(
    province_city,
    " - ",
    names = c("province", "city")
  ) |> 
  mutate(
    across(.cols = c(province, city), .fns = str_to_title),
    province = str_replace_all(
      province,
      c("Dki" = "DKI", "Daerah Istimewa" = "")
    )
  )

# Export ------------------------------------------------------------------

write_csv(
  poverty_food_expenses,
  here("results", "poverty_and_food_expenses.csv")
)

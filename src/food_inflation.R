# Get food inflation

here::i_am("src/food_inflation.R")

# Packages ----------------------------------------------------------------

library(conflicted)
library(here)
library(tidyverse)
conflict_prefer("filter", "dplyr", quiet = TRUE)
conflict_prefer("lag", "dplyr", quiet = TRUE)
library(bpsr)

# Data --------------------------------------------------------------------

dataset_list <- bps_dataset(page = Inf, lang = "eng")

food_cpi_dataset_id <- dataset_list |> 
  filter( 
    title == str_c(
      "Consumer Price Index of Foods, Beverages and Tobacco Group and Sub ",
      "(2018=100)"
    )
  ) |> 
  pull(dataset_id)

food_cpi_raw <- bps_get_dataset(
  food_cpi_dataset_id,
  keep = c("period_id"),
  lang = "eng"
)

# Wrangling ---------------------------------------------------------------

food_cpi_clean <- food_cpi_raw |> 
  select(
    city = vertical_var,
    expenditure_group = derived_var,
    year,
    month = period_id,
    cpi = var
  ) |> 
  mutate(month = as.integer(month))

# Analysis ----------------------------------------------------------------

food_inflation_yoy <- mutate(
  food_cpi_clean,
  rate_inflation_yoy = (cpi - lag(cpi)) / lag(cpi) * 100,
  .by = c(city, expenditure_group, month)
)

national_food_inflation_yoy <- food_inflation_yoy |> 
  filter(
    city == "INDONESIA",
    between(
      make_date(year, month),
      as.Date("2021-01-01"),
      as.Date("2022-03-01")
    )
  ) |> 
  select(!city)

# Export ------------------------------------------------------------------

write_csv(
  national_food_inflation_yoy,
  here("results", "food_inflation.csv")
)

# Run other scripts to produce analysis

here::i_am("src/run_all.R")

# Packages ----------------------------------------------------------------

library(here)

# Analysis ----------------------------------------------------------------

# Silence tidyverse's startup message to reduce clutter in the console
options(tidyverse.quiet = TRUE)

source(here("src", "poverty_and_food_expenses.R"))

rm(list = ls())

source(here("src", "food_inflation.R"))

rm(list = ls())
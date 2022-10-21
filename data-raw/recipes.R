library(tidyverse)

recipes <- read_csv("karsdorp-et-al/01-introduction-cook-books/data/feeding-america.csv")
recipes <- recipes |> mutate(ingredients=str_split(ingredients,";"))
usethis::use_data(recipes, overwrite = TRUE)

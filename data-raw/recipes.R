library(tidyverse)
library(curl)

zipfile <- "karsdorp-et-al.zip"

# Fetch the datasets for Karsdorp et al.'s  Humanities Data Analysis, stored at
# doi:10.5281/zenodo.891264

curl_download("https://zenodo.org/record/3560761/files/data.zip?download=1",
              destfile=zipfile)

unzip(zipfile,
      files="01-introduction-cook-books/data/feeding-america.csv",
      junkpaths=T)

recipes <- read_csv("feeding-america.csv")
recipes <- recipes |> mutate(ingredients=str_split(ingredients,";"))
usethis::use_data(recipes, overwrite = TRUE)

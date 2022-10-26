library(tidyverse)
library(curl)

data_dir <- tempfile()
dir.create(data_dir)

us_zipfile <- file.path(data_dir, "names.zip")

curl_download("https://www.ssa.gov/oact/babynames/names.zip",
              destfile=us_zipfile)

unzip(us_zipfile, exdir=data_dir)

recent_ssa_names <- tibble(filename=Sys.glob(file.path(data_dir, "*.txt"))) |>
    mutate(dat=map(filename, read_csv, col_names=c("name", "sex", "n"))) |>
    mutate(year=str_extract(filename, "yob\\d{4}")) |>
    mutate(year=as.integer(str_sub(year, 4, 7))) |>
    select(year, dat) |>
    unnest(dat)

# read live births counts obtained from CDC Wonder 10/25/22
recent_us_births <- read_tsv("us_births.txt", n_max = 10) |>
    select(year=Year, sex=`Sex of Infant`, births=Births) |>
    mutate(sex=fct_recode(sex, M="Male", F="Female"))

recent_ssa_names <- recent_ssa_names |>
    inner_join(recent_us_births, by=c("year", "sex")) |>
    mutate(prop=n / births) |>
    select(-births)

unlink(data_dir, recursive=TRUE)

data_dir <- tempfile()
dir.create(data_dir)

states_zipfile <- file.path(data_dir, "states.zip")


curl_download("https://www.ssa.gov/oact/babynames/state/namesbystate.zip",
              destfile=states_zipfile)

unzip(states_zipfile, exdir=data_dir)

recent_ssa_state_names <- tibble(filename=Sys.glob(
    file.path(data_dir, "*.TXT"))) |>
    mutate(dat=map(filename, read_csv,
                   col_names=c("state", "sex", "year", "name", "n"),
                   col_types="_cici")) |>
    mutate(state=str_extract(filename, "\\w\\w\\.TXT$")) |>
    mutate(state=str_sub(state, 1, 2)) |>
    select(-filename) |>
    unnest(dat)

states_fips <- read_delim("https://www2.census.gov/geo/docs/reference/state.txt",
    delim="|") |>
    select(state_code=STATE, state=STUSAB)

recent_state_births <- read_tsv("state_births.txt", n_max=510) |>
    select(year=Year, state_code=`State of Residence Code`,
           sex=`Sex of Infant`, births=Births) |>
    inner_join(states_fips, by="state_code") |>
    select(-state_code) |>
    mutate(sex=fct_recode(sex, M="Male", F="Female"))


recent_ssa_state_names <- recent_ssa_state_names |>
    inner_join(recent_state_births, by=c("state", "year", "sex")) |>
    mutate(prop=n / births) |>
    select(-births)

unlink(data_dir, recursive=TRUE)

usethis::use_data(recent_ssa_names, recent_us_births, recent_ssa_state_names, recent_state_births, overwrite = TRUE)

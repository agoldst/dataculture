library(tidyverse)
library(xml2)

data_dir <- tempfile()
dir.create(data_dir)
zip_file <- file.path(data_dir, "hamlet.zip")

download.file("https://shakespeare.folger.edu/downloads/xml/hamlet_XML_FolgerShakespeare.zip", destfile=zip_file)

unzip(zip_file,
      files="hamlet_XML_FolgerShakespeare/Ham.xml",
      junkpaths=TRUE,
      exdir=data_dir)

ham <- read_xml(file.path(data_dir, "Ham.xml"))
ham_acts <- xml_find_all(ham, './/d1:div1[@type="act"]')
ham_sp <- tibble(
        act=map_chr(ham_acts, xml_attr, "n")) |>
    mutate(sc_elem=map(ham_acts, xml_find_all, './/d1:div2[@type="scene"]')) |>
    mutate(scene=map(sc_elem, map_chr, xml_attr, "n")) |>
    mutate(speaker1=map(sc_elem, map, xml_find_all,  './/d1:sp')) |>
    mutate(speaker1=map(speaker1, map, map_chr, xml_attr, "who")) |>
    select(act, scene, speaker1) |>
    unnest_longer(c(scene, speaker1)) |>
    unnest(speaker1) |>
    filter(!is.na(speaker1))   # there's one of these in 4.5 because of textual stuff

# add speaker2 column
ham_sp <- ham_sp |>
    mutate(speaker2=case_when(
        act == lead(act) & scene == lead(scene) ~ lead(speaker1),
        TRUE ~ NA_character_
    )) |>
    filter(!is.na(speaker2)) # discard end-of-scene "turns"

# now split up multiple-speaker speech headings into multiple interactions

ham_sp <- ham_sp |>
    mutate(across(c(speaker1, speaker2), str_split, " ")) |>
    unnest(speaker1) |>
    unnest(speaker2)

# clean up speaker labels a little

ham_sp <- ham_sp |>
    mutate(across(c(speaker1, speaker2),
                  str_replace, '^#', "")) |>
    mutate(across(c(speaker1, speaker2),
                  str_replace, '_Ham$', ""))

# rearrange A,B alphabetically (i.e. symmetrize) and tally in each scene

hamlet <- ham_sp |>
    mutate(s1=pmin(speaker1, speaker2),
           s2=pmax(speaker1, speaker2)) |>
    count(act, scene, s1, s2, name="turns") |>
    select(s1, s2, act, scene, turns)

usethis::use_data(hamlet, overwrite=T)

unlink(data_dir, recursive=TRUE)

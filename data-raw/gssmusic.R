library(gssr)
library(tidyverse)

data(gss_all)
data(gss_doc)

weight_vars <- c("id", "vpsu", "vstrat", "adults", "wtssall")

psn_cts_vars <- c("age", "educ", "realinc", "realrinc", "prestg80")
psn_cat_vars <- c("sex", "race", "degree")

gssmusic_musicvars <- c(
    "bigband",
    "blues",
    "blugrass",
    "classicl",
    "conrock",
    "country",
    "folk",
    "gospel",
    "hvymetal",
    "jazz",
    "latin",
    "moodeasy",
    "musicals",
    "newage",
    "oldies",
    "opera",
    "rap",
    "reggae"
)

gssmusic <- gss_all |>
    filter(year == 1993) |>
    select(all_of(c(weight_vars, psn_cts_vars, psn_cat_vars, gssmusic_musicvars))) |>
    mutate(
        across(everything(), haven::zap_missing),
        across(all_of(c(weight_vars, psn_cts_vars)), as.numeric),
        across(all_of(psn_cat_vars), as_factor)) |>
    # create summaries of music likes and dislikes
    rowwise() |>
    mutate(
        music_dislikes=sum(c_across(all_of(gssmusic_musicvars)) >= 4, na.rm=T), 
        music_likes=sum(c_across(all_of(gssmusic_musicvars)) <= 2, na.rm=T)) |>
    ungroup() |>
    # recode music variables, order from dislike to like
    mutate(across(all_of(gssmusic_musicvars), factor,
        levels=rev(1:5),
        labels=rev(c("like very much", "like", "mixed", "dislike", "dislike very much"))))

gssmusic_doc <- gss_doc |>
    filter(id %in% colnames(gssmusic))

usethis::use_data(gssmusic, gssmusic_musicvars, gssmusic_doc, overwrite = TRUE)

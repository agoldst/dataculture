library(tidyverse)
library(tidytext)

url_base <- "https://raw.githubusercontent.com/tedunderwood/horizon/master/chapter2"

tgz_file <- "sourcefiles/data_for_chapter2.tar.gz"
if (!file.exists(tgz_file)) {
    if (!dir.exists("sourcefiles"))
        dir.create("sourcefiles")

    download.file("https://www.ideals.illinois.edu/items/105528/bitstreams/334050/object?dl=1", destfile=tgz_file)
}

if (length(Sys.glob("sourcefiles/*.tsv")) != 1047) {
    untar(tgz_file, exdir="sourcefiles")
    stopifnot(length(Sys.glob("sourcefiles/*.tsv")) == 1047)
}

data_file <- function (docid)
    str_c(file.path("sourcefiles", docid), ".tsv")

genre_meta <- read_csv(file.path(url_base, "metadata/concatenatedmeta.csv")) |>
    # eliminate one row for which we lack a datafile
    filter(file.exists(data_file(docid)))

stopifnot(nrow(genre_meta) == 1047)

sf_features <- read_csv(
    file.path(url_base, "modeloutput/allSF.coefs.csv"),
    col_names=c("word", "beta", "b"), col_types="c__")

det_features <- read_csv(
    file.path(url_base, "modeloutput/detectnewgatesensation.coefs.csv"),
    col_names=c("word", "beta", "b"), col_types="c__")

gothic_features <- read_csv(
    file.path(url_base, "modeloutput/allgothic.coefs.csv"),
    col_names=c("word", "beta", "b"), col_types="c__")

# gather the features
features <- full_join(sf_features, det_features) |>
    full_join(gothic_features)


# Nine chicago lab files cause file-reading problems because they have a
# feature `#punct_\t` and read_tsv sees the \t as a separator. However, this is
# not actually a feature used in any of Underwood's models, so we can just
# ignore that line.

chiproblems <- data_file(c(
    "11364",
    "10838",
    "10877",
    "20632",
    "20709",
    "20743",
    "20871",
    "21094",
    "24001"
))

get_terms <- function (filename) {
    if (filename %in% chiproblems) {
        filename <- read_lines(filename) |>
            discard(str_detect, "^#punct_\t") |>
            str_c(collapse="\n")
    }
    read_tsv(filename, col_names=c("word", "weight"), col_types="cd") |>
        semi_join(features, by="word")
}

genre_features <- genre_meta |> select(docid) |>
    mutate(data=map(docid, compose(get_terms, data_file))) |>
    unnest(data) |>
    cast_sparse(docid, word, weight)

usethis::use_data(genre_meta, genre_features, overwrite=T)

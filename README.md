# Datasets for a "Data and Culture" course

This R package supplies example data for the labs in an introductory general-audience course, "Data and Culture" (359:207) which I co-taught  with Prof. Meredith McGill at Rutgers University, New Brunswick in Fall 2022. The course syllabus and slides from the data-analysis presentations can be downloaded from [dc22.andrewgoldstone.com/slides](https://dc22.andrewgoldstone.com/slides).

The labs themselves are also available, together with some supplementary blog posts about other data discussed in the course not included in this package, on [dc22.andrewgoldstone.com](https://dc22.andrewgoldstone.com).

The major themes of the data-analysis part of the course were:

- cultural tastes over time and (social) space
- text-mining fiction and the problem of genre 
- historical and fictional social networks

Anyone is of course welcome to reuse or remix any of the datasets here (as well as the associated pedagogical material). I have tried to document the data in some detail in the online R help. Here is a brief summary:

**48,032 recipes from 74 American cookbooks, 1803–1922, tabulated by ingredients and ethnic and geographic origins of recipes** (`recipes`). Source: [Feeding America](https://lib.msu.edu/feedingamericadata), via Folgert Karsdorp et al., [_Humanities Data Analysis: Case Studies with Python_](https://doi.org/10.5281/zenodo.891264)

**New babies' first names in the United States, nationally and by state** (`recent_ssa_names`, `recent_ssa_state_names`). The variables cover 2016–2020, supplementing first-name data from the [`babynames`](https://cran.r-project.org/package=babynames) and [`ukbabynames`](https://cran.r-project.org/package=ukbabynames) packages (also used in the course). Source: U.S. Social Security Administration.

**Survey data on Americans' musical tastes** (`gssmusic`), from the 1993 [General Social Survey](https://gss.norc.org) Culture Module. Source: the GSS, via [Kieran Healy's gssr package](https://kjhealy.github.io/gssr/).

**Ted Underwood's corpus of English-language fiction with associated subgenre labels** (`genre_meta`, `genre_features`). The data cover 1047 British and American novels 1760–1989, with extensive metadata about each volume. Underwood designed the corpus to study the differences between genre labels like science fiction or crime fiction assigned by various hands and a "random" baseline set of novels. For class exercises partially replicating his analysis, I reformatted his original replication data for convenient processing in R. Source: Underwood's [replication repository](https://github.com/tedunderwood/horizon) for _Distant Horizons: Digital Evidence and Literary Change_ (University of Chicago Press, 2021).

**Character interactions in _Hamlet_** (`hamlet`). Automatically extracted from the [New Folger XML text](https://www.folger.edu/explore/shakespeares-works/download/#hamlet), to support network analysis of the play. Source: [New Folger Shakespeare Library](https://www.folger.edu/explore/shakespeares-works/), Karsdorp et al.'s _Humanities Data Analysis_.

**The networks of revolutionary Boston** (`ggraph::whigs`). Secret society memberships of members of Boston's Whig activists on the eve of the American Revolution. This is Sir Not Appearing In This Package, but the `ggraph` package, which I taught in the course, includes this dataset, created by [Kieran Healy](https://github.com/kjhealy/revere) on the basis of work by the historian [David Hackett Fischer](https://www.worldcat.org/title/34184142).

The [data-raw] directory contains R code demonstrating how I obtained and formatted the R objects included as data.


For pedagogical purposes I found it useful to include the R packages I was teaching with in the labs  as dependencies of this package. That way all required R packages for the course could be installed as follows:

```r
install.packages("remotes") # if necessary
remotes::install_github("agoldst/dataculture", dependencies=TRUE)
```

For R-development purposes, I have removed these "excess" dependencies so anyone who wants the package just for a dataset doesn't have to install the entire `tidyverse` or the fairly heavyweight `igraph` and `ggraph` packages. I do recommend teaching with the Tidyverse first, last, and always.

I am grateful to Meredith McGill, who co-taught 359:207 with me, as well as all our students, who never explicitly said they _didn't_ want to be test subjects.

Andrew Goldstone, July 2023

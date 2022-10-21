#' Historic American Cookbook Recipes Data
#'
#' Information about 48,032 recipes from 74 American cookbooks, 1803–1922, including ingredients and ethnic and geographic origins.
#'
#' Slightly reprocessed from the accompanying data to Folgert Karsdorp et al., _Humanities Data Analysis: Case Studies with Python_ (Princeton University Press, 2021), chap. 1. Karsdorp et al. prepared a CSV file containing preprocessed recipe data derived from XML-encoded cookbooks in Feeding America: The Historic American Cookbook Dataset (East Lansing: Michigan State University Libraries Stephen O. Murray and Keelung Hong Special Collections), 2003, <https://lib.msu.edu/feedingamericadata>. That CSV file is represented as a `tbl_df` object here.
#'
#' Recipe data are derived from editorial markup: the Feeding America editors marked up recipe ingredients and assigned recipes to ethnic, meal-stage, and regional categories. Those categories are recorded unmodified here. 
#'
#' @format ## `recipes`
#' A data frame with 48032 rows and 6 columns:
#' \describe{
#'   \item{book_id}{book identifier (filename in Feeding America data)}
#'   \item{date}{year of publication}
#'   \item{ethnicgroup}{ethnic category (may be \code{NA})}
#'   \item{recipe_class}{type of recipe}
#'   \item{region}{geographic region of origin}
#'   \item{ingredients}{\code{list} of recipe ingredients}
#' }
#' @source <https://doi.org/10.5281/zenodo.891264>
"recipes"

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

#' Historic American Cookbook Recipes: Ingredients Data
#'
#' Unnested version of \code{recipes}.
#'
#' For exploratory convenience, a duplicate version of \code{recipes} with the
#' \code{ingredients} list-column unnested and each recipe ssigned a distinct ID.
#'
#' @format ## `ingreds`
#' A data frame with 382487 rows and 7 columns:
#' \describe{
#'   \item{recipe_id}{sequential recipe number}
#'   \item{book_id}{book identifier (filename in Feeding America data)}
#'   \item{date}{year of publication}
#'   \item{ethnicgroup}{ethnic category (may be \code{NA})}
#'   \item{recipe_class}{type of recipe}
#'   \item{region}{geographic region of origin}
#'   \item{ingredients}{name of ingredient}
#' }
#' @source <https://doi.org/10.5281/zenodo.891264>
"ingreds"


#' US baby names, 2016–2020
#'
#' Names by birth year and sex, from the U.S. Social Security Administration.
#'
#' A supplement to the `babynames` package with a few more years of data. Frequencies are not strictly comparable as the denominator is US live births rather than Social Security applicants as in `babynames`.
#'
#' @format ## `recipes`
#' A data frame with 161,413 rows and 5 columns:
#' \describe{
#'   \item{year}{birth year}
#'   \item{name}{first name}
#'   \item{sex}{\code{M} or \code{F}}
#'   \item{n}{count}
#'   \item{prop}{frequency per live births of that sex}
#' }
#' @source <https://www.ssa.gov/oact/babynames/names.zip> for the names, <http://wonder.cdc.gov/natality-expanded-current.html> for live births data.
"recent_ssa_names"

#' US baby names, 2016–2020, by state
#'
#' Names by birth year, sex, and state, from the U.S. Social Security Administration.
#'
#' Recent baby names, by state, as a supplement to the `babynames` package. Frequencies are not strictly comparable as the denominator is state live births rather than Social Security applicants as in `babynames`.
#'
#' @format ## `recipes`
#' A data frame with 161,413 rows and 5 columns:
#' \describe{
#'   \item{year}{birth year}
#'   \item{name}{first name}
#'   \item{sex}{\code{M} or \code{F}}
#'   \item{n}{count}
#'   \item{state}{state (two-letter code)}
#'   \item{prop}{frequency per live births of that sex}
#' }
#' @source <https://www.ssa.gov/oact/babynames/namesbystate.zip> for the names, <http://wonder.cdc.gov/natality-expanded-current.html> for live births data.
"recent_ssa_state_names"

#' General Social Survey 1993 Culture Module Excerpt
#'
#' Selected variables from the 1993 General Social Survey, including the questions on musical taste from the Culture Module. Data has been selected from the Cumulative Data File made available in the `gssr` package, categorical variables have been converted to `factor` type for convenience, and two new variables, `music_likes` and `music_dislikes`, have been created.
#'
#' @format ## `gssmusic`
#' A data frame with 1606 rows and 33 columns.
#' \describe{
#'   \item{music_likes}{number of music genres respondent likes or likes very much}
#'   \item{music_dislikes}{number of music genres respondent dislikes or dislikes very much}
#' }
#' @source General Social Survey, <https://gss.norc.org/>, via Kieran Healy's gssr package <https://kjhealy.github.io/gssr/>.
"gssmusic"


#' Volume Metadata from Underwood, Distant Horizons, Chap. 2
#'
#' Metadata from Ted Underwood's reproduction repository for *Distant Horizons*, chap. 2: publication information, record locators, and genre tags derived from bibliographic sources for a selection of science-fiction, detective, Gothic, and "random" fiction.
#'
#' Underwood's information about the `tags` column:
#' 
#' | tag          | texts   | dates       | description or source                                                                                                                                                                                                                                                                                                                                                           |
#' |--------------|---------|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
#' | det100       | 89      | 1829 - 1941 | *The First Hundred Years of Detective Fiction, 1841-1941.* 1973. Lilly Library, Bloomington, IN. <http://www.indiana.edu/~liblilly/etexts/detective/>                                                                                                                                                                                                                           |
#' | chimyst      | 146     | 1923-1989   | Works categorized by librarians as “detective” or “mystery fiction,” collected at the Chicago Text Lab.                                                                                                                                                                                                                                                                         |
#' | locdetmyst   | 45      | 1832-1922   | Works categorized by librarians as “detective and mystery fiction,” collected in HathiTrust.                                                                                                                                                                                                                                                                                    |
#' | locdetective | 16      | 1865-1912   | Works categorized by librarians with the subject heading “Detectives.” Often casebook fiction.                                                                                                                                                                                                                                                                                  |
#' | crime        | 2       | 1972-1974   | Works categorized by librarians as “crime fiction” but not “detective fiction.”                                                                                                                                                                                                                                                                                                 |
#' | cozy         | 10      | 1920-1952   | Works by authors mentioned as writing country-house mysteries in *The Mystery Readers' Advisory: The Librarian's Clues to Murder and Mayhem*, by John Charles, Joanna Morrison, and Candace Clark (Chicago: ALA, 2002).                                                                                                                                                         |
#' | hardboiled   | 10      | 1929-1970   | Appendix to Geoffrey O’Brien, *Hardboiled America* (New York: Van Nostrand Reinhold, 1981).                                                                                                                                                                                                                                                                                     |
#' | newgate      | 7       | 1828-1840   | Keith Hollingsworth, *The Newgate Novel,* Detroit 1963.                                                                                                                                                                                                                                                                                                                         |
#' | sensation    | 14      | 1860-1880   | “The Sensation Novel,” Winifred Hughes, in *A Companion to the Victorian Novel,* ed. Patrick Brantlinger and William B. Thesing (Blackwell, 2002).                                                                                                                                                                                                                              |
#' | lockandkey   | 10      | 1800-1903   | Works anthologized in *The Lock and Key Library: Classic Mystery and Detective Stories,* edited by Julian Hawthorne (New York, 1909). Includes writers like Dostoevsky who probably were not seen as writers of mysteries even in 1909; not included in the article’s model of “detective fiction.”                                                                             |
#' | pbgothic     | 96      | 1764-1988   | “Chronology” in David Punter and Glennis Byron, *The Gothic* (Malden: Blackwell, 2004).                                                                                                                                                                                                                                                                                         |
#' | stangothic   | 21      | 1791-1834   | A small subset of works tagged as “Gothic” in Stanford Literary Lab metadata.                                                                                                                                                                                                                                                                                                   |
#' | lochorror    | 4       | 1818        | Works tagged as “horror” by librarians, collected in HathiTrust.                                                                                                                                                                                                                                                                                                                |
#' | chihorror    | 23      | 1933-1989   | Works tagged as “horror” by librarians, collected in the Chicago Text Lab.                                                                                                                                                                                                                                                                                                      |
#' | locghost     | 28      | 1826-1922   | Works tagged as “ghost stories” by librarians.                                                                                                                                                                                                                                                                                                                                  |
#' | locscifi     | 21      | 1836-1909   | Works tagged as “science fiction” by librarians and collected in HathiTrust.                                                                                                                                                                                                                                                                                                    |
#' | chiscifi     | 144     | 1901-1989   | Works tagged as “science fiction” by librarians and collected at the Chicago Text Lab.                                                                                                                                                                                                                                                                                          |
#' | femscifi     | 9       | 1818-1922   | Ockerbloom, Mary Mark. 2015. “Pre-1950 Utopias and Science Fiction by Women.”                                                                                                                                                                                                                                                                                                   |
#' | anatscifi    | 36      | 1771-1922   | Stableford, Brian. 2004. “The Emergence of Science Fiction” and “Science Fiction Between the Wars.” In *Anatomy of Wonder,* edited by Neil Barron, 5th edition, 3-44.                                                                                                                                                                                                |
#' | chiutopia    | 13      | 1920-1976   | Works tagged as “Utopias” by librarians, collected at the Chicago Text Lab, not folded into “science fiction” in this article.                                                                                                                                                                                                                                                  |
#' | chifantasy   | 53      | 1901-1989   | Works tagged as “fantastic” or “fantasy fiction” by librarians, not folded into “science fiction” for the purposes of this article.                                                                                                                                                                                                                                             |
#' | juvenile     | 23      | 1904-1922   | Works for a juvenile audience; collected but not used in this article.                                                                                                                                                                                                                                                                                                          |
#' | drop         | 33      | 1838-1922   | Works that I decided not to use, left in the metadata for transparency. The most common reason is that they are juvenile.                                                                                                                                                                                                                                                       |
#' | random       | 169     | 1769-1922   | Works randomly selected from HathiTrust Digital Library, using fiction metadata developed in the NEH-funded project “Understanding Genre in a Collectiono f a Million Volumes.” “Random selection” here means that the volumes were selected randomly but then approved or rejected by the author, to avoid stray volumes of nonfiction, classical poetry, juvenile works, etc. |
#' | chirandom    | 202     | 1920-1989   | Works randomly selected from the Chicago Text Lab. Selection here was more genuinely random. Note that both “random” tags can coexist with other genre tags. A randomly-selected volume could also be “chimyst,” for instance; in that case it will be excluded from the negative (contrast) set only if “chimyst” is in the positive set.                                      |
#' | teamred      | 484     | 1760-1989   | Randomly selected authors for a sanity check.                                                                                                                                                                                                                                                                                                                                   |
#' | teamblack    | 500     | 1764-1989   | Randomly selected authors for a sanity check.                                                                                                                                                                                                                                                                                                                                   |
#' | stew         | 224     | 1764-1989   | A random selection of volumes balanced between Gothic, science fiction, and crime/detective traditions, in order to create a ghastly genre stew.                                                                                                                                                                                                                                |
#' 
#' @format ## `genre_meta`
#' A data frame with 1047 rows and 15 columns, notably
#' \describe{
#'   \item{docid}{unique identifier corresponding to extracted features filename}
#'   \item{firstpub}{year of first publication of title}
#'   \item{tags}{string with genre tags, separated by \code{" | "}}
#' }
#' @source <https://github.com/tedunderwood/horizon/blob/master/chapter2/metadata/concatenatedmeta.csv>; for the description of genre tags, <https://github.com/tedunderwood/horizon/blob/master/chapter2/metadata/genrecategorieschapter2.docx>; and see Ted Underwood, *Distant Horizons: Digital Evidence and Literary Change* (Chicago: University of Chicago Press, 2019), chap. 2.
"genre_meta"

#' Document-term matrix for fiction genres from Underwood, Distant Horizons, chap. 2
#'
#' Data (extracted word-frequency and other features for fiction volumes) used in modeling fiction genre by Underwood in _Distant Horizons_, chap. 2. The features are only those used in the regularized logistic regression models of science fiction, detective fiction, and Gothic supplied by Underwood in his reproduction repository, and do not include all features found in the accompanying source data files.
#'
#' @format ## `genre_features`
#' A sparse dgCMatrix with 1047 rows corresponding to documents and 4889 columns corresponding to features. The row names are document IDs corresponding to \code{genre_meta$docid} and the column names given the features as used by Underwood.
#'
#' @source <https://www.ideals.illinois.edu/items/105528> for the data; files in <https://github.com/tedunderwood/horizon/blob/master/chapter2/modeloutput> for the choice of features.
"genre_features"


#' Speaker interactions in Hamlet
#'
#' Speaker interactions in Shakespeare's _Hamlet_. Two characters are recorded as interacting if one speaks directly after another within a scene of the play. X speaking after Y is counted the same as Y speaking after X. Data has been extracted from the XML version of the New Folger Library Edition of _Hamlet_ (a conflated text of the play) following a method demonstrated in Karsdorp et al.'s _Humanities Data Analysis_.
#'
#' Speaker identifications have been extracted from `who` attributes of `sp` speech-heading tags, with leading `#` and trailing `_Ham` removed. 
#'
#' @format ## `hamlet`
#' A data frame with 140 rows and 5 columns
#' \describe{
#'   \item{s1}{first speaker in interaction, alphabetically}
#'   \item{s2}{second speaker in interaction, alphabetically}
#'   \item{act}{act number of the play in which the pair appears}
#'   \item{scene}{scene number of the play in which the pair appears}
#'   \item{turns}{number of times either speaks after the other in that act and scene}
#' }
#'
#' @source <https://shakespeare.folger.edu/shakespeares-works/hamlet/download/>. The New Folger Shakespeare is available under a [CC-BY-NC 3.0](https://creativecommons.org/licenses/by-nc/3.0/deed.en_US) license. The algorithm for extracting interactions is based on Folgert Karsdorp et al., _Humanities Data Analysis: Case Studies with Python_ (Princeton University Press, 2021), chap. 2.
"hamlet"

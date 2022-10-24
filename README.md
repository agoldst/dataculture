# R Materials for 359:207

This repository contains supporting materials for the R labs in the Data and Culture course at Rutgers University, New Brunswick (359:207). The materials are organized as an R package and should be installed from within R as follows:

```r
install.packages("remotes") # if necessary
remotes::install_github("agoldst/dataculture", dependencies=TRUE)
```

To update the package, simply do

```r
remotes::install_github("agoldst/dataculture")
```

To install the data associated with the `gender` package, which is used in the course, run

```r
gender::install_genderdata_package()
```

library(here)
library(icesTAF)

setwd(here::here('example-3'))
getwd()
# https://github.com/ices-taf-dev/wiki-example-3/blob/main/model.R


taf.skeleton()
data(trees)

write.taf(trees,dir="bootstrap/initial/data")

draft.data(
  data.files = "trees.csv",
  data.scripts = NULL,
  originator = "Ryan, T. A., Joiner, B. L. and Ryan, B. F. (1976) The Minitab Student Handbook. Duxbury Press.",
  title = "Diameter, Height and Volume for Black Cherry Trees",
  file = TRUE,
  append = FALSE # create a new DATA.bib
)

taf.boot()

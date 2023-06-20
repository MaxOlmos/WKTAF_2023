library(icesSharePoint)
library(devtools)
install_github("ices-tools-prod/icesSharePoint")


options(icesSharePoint.username = "molmos")
# check it has worked
options("icesSharePoint.molmos")

options(icesSharePoint.site = "/ExpertGroups/WGHANSA")


# https://github.com/ices-tools-prod/icesSharePoint

options(icesSharePoint.site = "/ExpertGroups/WGHANSA")
path <- "2022 Meeting Documents/07. Software/hom.27.9.a/inputs"
files <- spdir(path, full = TRUE, recursive = TRUE)
for (file in files) {
  spgetfile(file.path(path, file), destdir = ".")  
}


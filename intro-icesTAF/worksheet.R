
# Install Packages --------------------------------------------------------
# -------------------------------------------------------------------------
# run the following lines in R to update to the most recent version of icesTAF

install.packages("icesTAF", repos = c(
  icestoolsprod = 'https://ices-tools-prod.r-universe.dev',
  CRAN = 'https://cloud.r-project.org'))

library(icesTAF)
?icesTAF
library(TAF)
?TAF
# wiki page https://github.com/ices-taf/doc/wiki/Getting-set-up


# Exemple 1 ---------------------------------------------------------------
# -------------------------------------------------------------------------

## Creating an empty TAF project
## --------------------------------------
setwd("~example-1/")
# First we create an empty TAF project,
# and in this case we will call it example-1,
# and then moving our working directory to this folder. We do this by running

taf.skeleton("example-1")
setwd("example-1")

# Bring data set, example with tress
data(trees)
head(trees)

write.taf(trees, dir = "example-1/bootstrap/initial/data")


# The way TAF works, is that only data in bootstrap/data are allowed to be used by the TAF scripts, 
# and the way that the bootstrap/data folder is populated is by creating entries in a file called DATA.bib,
# and then running taf.bootstrap().

# We will create the DATA.bib file using the useful draft.data() function, and as we do so, will add some useful information to document the dataset we are importing:
  
  draft.data(
    data.files = "trees.csv",
    data.scripts = NULL,
    originator = "Ryan, T. A., Joiner, B. L. and Ryan, B. F. (1976) The Minitab Student Handbook. Duxbury Press.",
    title = "Diameter, Height and Volume for Black Cherry Trees",
    file = TRUE,
    append = FALSE # create a new DATA.bib
  )

# after running
taf.bootstrap()


## Adding a local collection of data files
## -----------------------------------------

data(trees)
data(cars)
# make the directory we want to write to
mkdir("bootstrap/initial/data/my-collection")
# save files there
write.taf(trees, dir = "bootstrap/initial/data/my-collection")
write.taf(cars, dir = "bootstrap/initial/data/my-collection")


# Again we document this using draft.data() to add it to the DATA.bib file, but this time there are two differences:
# 1. We are adding a new record, so we set append = TRUE as we want to add a record to an existing list of records.
# 2. We are adding a folder, so we set source = "folder"

draft.data(
  data.files = "my-collection",
  data.scripts = NULL,
  originator = "R datasets package",
  title = "Collection of R data",
  source = "folder",
  file = TRUE,
  append = FALSE # create a new DATA.bib
)

# CREATE IN BOOSTRAP/DATA/MYCOLLCETION/ THE DATA THAT WILL BE THEN RUN BY THE MODEL 
taf.bootstrap()


# Adding file from url
draft.data(
  data.files = "HadSST.4.0.1.0_median.nc",
  data.scripts = NULL,
  originator = "UK MET office",
  title = "Met Office Hadley Centre observations datasets",
  year = 2022,
  source = "https://www.metoffice.gov.uk/hadobs/hadsst4/data/netcdf/HadSST.4.0.1.0_median.nc",
  file = TRUE,
  append = TRUE
)

taf.bootstrap()


#In this example we create a script where we write a short recipe of how to get our data, 
#and then register this in the DATA.bib file. Firstly you need to write a script, 
#and for this example the following code will do that for you:

cat('library(icesTAF)
library(sf)

download(
  "https://gis.ices.dk/shapefiles/OSPAR_Subregions.zip"
)

unzip("OSPAR_Subregions.zip")
unlink("OSPAR_Subregions.zip")

areas <- st_read("OSPAR_subregions_20160418_3857.shp")

# write as csv
st_write(
  areas, "ospar-areas.csv",
  layer_options = "GEOMETRY=AS_WKT"
)

unlink(dir(pattern = "OSPAR_subregions_20160418_3857"))
',
  file = "bootstrap/ospar-areas.R"
)

draft.data(
  data.files = NULL,
  data.scripts = "ospar-areas.R",
  originator = "OSPAR",
  title = "OSPAR areas",
  file = TRUE,
  append = TRUE
)

taf.bootstrap(taf=TRUE) # force to re read everything






# -------------------------------------------------------------------------
# -------------------------------------------------------------------------



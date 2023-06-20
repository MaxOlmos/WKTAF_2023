library(here)
library(icesTAF)

setwd(here::here('example-taf-script-1'))
getwd()


# get code
run_dir <- download.analysis("ices-taf-dev/wiki-example-3")
# view downloaded code
browseURL(run_dir)

# run analysis
run.analysis(run_dir)
# view result
browseURL(run_dir)
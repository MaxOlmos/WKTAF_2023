install.packages("here")
library(here)
here::here("example-2")
getwd()

taf.skeleton("example-2")
setwd(here::here("example-2"))

cat('library(stockassessment)

# download model from stockassessment.org
fit <- fitfromweb("WBCod_2021_cand01")

# save to model folder
save(fit, file = "fit.rData")

',
    file = "bootstrap/sam_fit.R"
)



cat('sam_assessment <- "WBCod_2021_cand01"

sam_dir <-
  paste0(
    "https://stockassessment.org/datadisk/stockassessment/userdirs/user3/",
    sam_assessment,
    "/data/"
  )

files <-
  paste0(
    c("cn", "cw", "dw", "lf", "lw", "mo", "nm", "pf", "pm", "survey", "sw"),
    ".dat"
  )

for (file in files) {
  download(paste0(sam_dir, file))
}

',
file = "bootstrap/sam_data.R"
)



draft.data(
  data.files = NULL,
  data.scripts = c("sam_data", "sam_fit"),
  originator = "WGBFAS",
  title = c("SAM input data for ...", "SAM fitted object for ..."),
  year = 2021,
  period = "1985-2020",
  file = TRUE,
  append = FALSE
)

##################################################
library(remotes)
install_github("ices-tools-prod/msy")
getwd()


detach("package:msy",unload=TRUE)
taf.library("msy")


# software bib
draft.software("msy", file=TRUE)
draft.software("TMB", file=TRUE)
# install software and library
taf.bootstrap()



taf.library()

fit <- ss.win()

try(detach("package:msy", unload = TRUE))
taf.library(msy)



##############################################################################################

if (!dir.exists("bootstrap/initial/software")){
  dir.create("bootstrap/initial/software")
}


draft.software(source=c("bootstrap/initial/software/ss_win.exe"), 
               author = "Richard D. Methot Jr., Chantel R. Wetzel, Ian G. Taylor, Kathryn L. Doering, Kelli F. Johnson", 
               year = 2022, 
               title = "SS3 executable (for Windows)",
               version = "3.30.20",
               file = TRUE, 
               append = FALSE)
taf.bootstrap()








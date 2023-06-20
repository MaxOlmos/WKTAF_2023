
taf.skeleton.sa.org("example-4", "Cod_27_5b1")
getwd()

setwd("example-4")
taf.bootstrap()


draft.data(
  data.scripts = NULL,
  data.files = "reportTemplate.docx",
  originator = "ICES",
  year = 2019,
  title = "ICES TAF word template for report automation",
  source = "https://github.com/ices-taf/doc/raw/master/reportTemplate.docx",
  append = TRUE,
  file = TRUE
)
taf.bootstrap()

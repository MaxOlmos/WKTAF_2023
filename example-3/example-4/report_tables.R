mkdir("report")

load("model/fit.RData", verbose = TRUE)

years <- unique(fit$data$aux[, "year"])

## catage
catage <- read.taf("data/catage.csv")
# row.names(catage) <- years[1:nrow(catage)]

catage <- cbind(catage, total = rowSums(catage))
catage <- rbind(catage, mean = colMeans(catage))

write.taf(catage, "report/catage.csv")

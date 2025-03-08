library(plumber)
library(jsonlite)

# set path to folder containing the source codes
setwd("D:/Workspace/R/dssi-plumber")
pr = plumb("src/deploy_noYAML.R")

pr$run(port = 8000)

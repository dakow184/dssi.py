# call in the libraries

#install.packages("pacman")# run this only once if you do not have pacman package

pacman::p_load(tidyverse, caret, corrplot,car, relaimpo)

# set path to folder containing the source codes
setwd("D:/Workspace/R/dssi-plumber")

# read the data file & inspect it's structure.
# do not modify the csv path as it is using relative path.
cars = read.csv('data/cars.csv')
summary(cars)

#set initial seed for reproducibility
set.seed(123)

# train-test split
inds = createDataPartition(cars$Price, p=0.7, list=FALSE,times=1)
train_set = cars[inds,]
test_set = cars[-inds,]

# train model
model = lm(Price ~. , data = train_set)
# feature select
final_model = stepAIC(model)
summary(final_model)

# save final model
saveRDS(final_model, "models/car_price.rds")
# RDS (R Data Serialization) files are a common format for saving R objects in RStudio, 
# and they allow you to preserve the state of an object between R sessions.

# Load the data on the number of visitors to the instructors blog from here: 
# https://d396qusza40orc.cloudfront.net/predmachlearn/gaData.csv


# Fit a model using the bats() function in the forecast package to the training time series. 
# Then forecast this model for the remaining time points. For how many of the testing points 
# is the true value within the 95% prediction interval bounds?

# 96%
# 95%
# 93%
# 94%


library(lubridate)  # For year() function below
dat = read.csv("./gaData.csv")
training = dat[year(dat$date) < 2012,]
testing = dat[(year(dat$date)) > 2011,]
tstrain = ts(training$visitsTumblr)

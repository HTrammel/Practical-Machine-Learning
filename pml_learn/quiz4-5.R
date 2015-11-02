# Question 5
# Set the seed to 325 and fit a support vector machine using the e1071 package 
# to predict Compressive Strength using the default settings. Predict on 
# the testing set. What is the RMSE?

# a. 107.44
# b. 45.09
# c. 6.72
# d. 6.93

set.seed(325)
library(AppliedPredictiveModeling)
data(concrete)
inTrain = createDataPartition(concrete$CompressiveStrength, p = 3/4)[[1]]
training = concrete[ inTrain,]
testing = concrete[-inTrain,]

require(e1071)
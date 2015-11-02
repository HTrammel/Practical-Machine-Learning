# Load the concrete data

# Set the seed to 233 and fit a lasso model to predict Compressive Strength. 
# Which variable is the last coefficient to be set to zero as the penalty increases? 
# (Hint: it may be useful to look up ?plot.enet).

# a. Cement
# b. CoarseAggregate
# c. FineAggregate
# d. Water

set.seed(233)
library(AppliedPredictiveModeling)
data(concrete)
inTrain = createDataPartition(concrete$CompressiveStrength, p = 3/4)[[1]]
training = concrete[ inTrain,]
testing = concrete[-inTrain,]

library(glmnet)
obj <- glmnet(training, training$CompressiveStrength, lambda=1)
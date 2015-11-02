# Load the Alzheimer's data 
# Set the seed to 62433 and predict diagnosis with all the other variables 
# using a random forest ("rf"), boosted trees ("gbm") and linear discriminant 
# analysis ("lda") model. Stack the predictions together using 
# random forests ("rf"). What is the resulting accuracy on the test set? 
# Is it better or worse than each of the individual predictions?
# 
# a. Stacked Accuracy: 0.76 is better than lda but not random forests or boosting.
# b. Stacked Accuracy: 0.80 is better than all three other methods
# c. Stacked Accuracy: 0.93 is better than all three other methods
# d. Stacked Accuracy: 0.80 is better than random forests and lda and 
# the same as boosting.

library(caret)
library(gbm)
set.seed(62433)
library(AppliedPredictiveModeling)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

rf_mod <- train(diagnosis ~ ., data=training, method="rf")
bt_mod <- train(diagnosis ~ ., data=training, method="gbm")
ld_mod  <- train(diagnosis ~ ., data=training, method="lda")

pred_rf <- predict(rf_mod, testing)
pred_bt <- predict(bt_mod, testing)
pred_ld <- predict(ld_mod, testing)

predDF <- data.frame(pred_rf, pred_bt, pred_ld, diagnosis=training$diagnosis)
combModFit <- train(diagnosis ~ ., method="rf", data=predDF)
combPred <- predict(combModFit, data=predDF)

print(combPred)
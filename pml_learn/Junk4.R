# Then set the seed to 13234 and fit a logistic regression model 
# (method="glm", be sure to specify family="binomial") with Coronary 
# Heart Disease (chd) as the outcome and age at onset, current alcohol 
# consumption, obesity levels, cumulative tabacco, type-A behavior, and 
# low density lipoprotein cholesterol as predictors. Calculate the 
# misclassification rate for your model using this function and a
# prediction on the "response" scale:

library(dplyr)
library(ggplot2)
library(caret)

library(ElemStatLearn)
data(SAheart)
set.seed(8484)
train = sample(1:dim(SAheart)[1],size=dim(SAheart)[1]/2,replace=F)
trainSA = SAheart[train,]
testSA = SAheart[-train,]

missClass = function(values,prediction){
    sum(((prediction > 0.5)*1) != values)/length(values)
}

set.seed(13234)
train_fit <- train(chd ~ age + alcohol + obesity + tobacco + typea + ldl,
                   method = "glm",
                   family = "binomial",
                   data = trainSA)

train_pred <- predict(train_fit, trainSA)
test_pred <- predict(train_fit, testSA)

train_err <- missClass(trainSA$chd, train_pred)
test_err <- missClass(testSA$chd, test_pred)
library(caret)
library(AppliedPredictiveModeling)
set.seed(3433)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]
library(dplyr)

train_base <- NULL
train_base$diagnosis <- training[[1]]
train_data <- cbind(train_base, select(training, starts_with("IL")))

test_base <- NULL
test_base$diagnosis <- testing[[1]]
test_data <- cbind(test_base, select(testing, starts_with("IL")))

pre_il <- preProcess(train_data, method="pca", thresh = 0.90)
train_pred <- predict(pre_il, train_data)
modelFit <- train(training$diagnosis ~ ., method="glm", data = train_pred)

test_pred <- predict(pre_il, test_data)
cm <- confusionMatrix(testing$diagnosis,predict(modelFit,test_pred))
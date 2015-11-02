library(caret)
library(AppliedPredictiveModeling)
set.seed(3433)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

trn_data <- NULL
trn_data$diagnosis <- training[[1]]
trn_data <- cbind(trn_data, select(training, starts_with("IL")))

test_data <- NULL
test_data$diagnosis <- testing[[1]]
test_data <- cbind(test_data, select(testing, starts_with("IL")))

asis_fit <- train(diagnosis ~ . , 
              method="glm", 
              data=trn_data)

preProc <- preProcess(trn_data, method="pca", thresh = 0.80)
trn_pred <- predict(preProc, train_data)
pca_fit <- train(diagnosis ~ . , 
               method="glm",
               data=trn_pred)


# test_pred <- predict(preProc, test_data)
# cm <- confusionMatrix(testing$diagnosis,predict(modelFit,test_pred))

print("As_Is")
print(asis_fit)
print("PCA")
print(pca_fit)
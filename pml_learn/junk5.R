# Load the vowel.train and vowel.test data sets:
#     library(ElemStatLearn)
# data(vowel.train)
# data(vowel.test) 
# Set the variable y to be a factor variable in both the training and test set. 
#Then set the seed to 33833. Fit a random forest predictor relating the factor 
#variable y to the remaining variables. Read about variable importance in random 
#forests here: http://www.stat.berkeley.edu/~breiman/RandomForests/cc_home.htm#ooberr
#The caret package uses by defualt the Gini importance. Calculate the variable 
#importance using the varImp function in the caret package. What is the order of 
#variable importance?
# The order of the variables is:
#     x.2, x.1, x.5, x.8, x.6, x.4, x.3, x.9, x.7,x.10
# The order of the variables is:
#     x.10, x.7, x.9, x.5, x.8, x.4, x.6, x.3, x.1,x.2
# The order of the variables is:
#     x.10, x.7, x.5, x.6, x.8, x.4, x.9, x.3, x.1,x.2
# The order of the variables is:
#     x.2, x.1, x.5, x.6, x.8, x.4, x.9, x.3, x.7,x.10

library(dplyr)
library(ggplot2)
library(randomForest)
library(caret)

library(ElemStatLearn)
data(vowel.train)
data(vowel.test) 

vtrain <- vowel.train
vtest <- vowel.test

vtrain$y <- as.factor(vtrain$y)
vtest$y <- as.factor(vtest$y)

vtrain_rf <- randomForest(y ~ ., method = "rf", data=vtrain)

vimp <- varImp(vtrain_rf, scale=T)

imp <- vimp$importance
print(imp)

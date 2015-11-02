# Set the variable y to be a factor variable in both the training and test set. 
# Then set the seed to 33833. Fit (1) a random forest predictor relating the 
# factor variable y to the remaining variables and (2) a boosted predictor using 
# the "gbm" method. Fit these both with the train() command in the caret package. 
# 
# What are the accuracies for the two approaches on the test data set? 
# What is the accuracy among the test set samples where the two methods agree?

library(ElemStatLearn)
library(caret)

data(vowel.train)
data(vowel.test) 

train_df <- vowel.train
test_df <- vowel.test

train_df$y <- as.factor(train_df$y)
test_df$y <- as.factor(test_df$y)

set.seed(33833)

forest_mod <- train(x=train_df, y=train_df$y, method="rf")
boost_mod <- train(x=train_df, y=train_df$y, method="gbm")

rf_pred <- predict(forest_mod, test_df)
bst_pred <- predict(boost_mod, test_df)


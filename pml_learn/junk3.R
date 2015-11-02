library(pgmm)
library(rpart)
library(tree)

data(olive)
olive = olive[,-1]



otree <- rpart(Area ~ . , data=olive, method="class")

where <- plot(otree, newdata = as.data.frame(t(colMeans(olive))), type="prob")
## running decision tree with iris
library(caret)
library(rpart.plot)
#Data Slicing
irisdata<-iris
set.seed(3033)
intrain <- createDataPartition(y = irisdata$Species, p= 0.7, list = FALSE)
training <- irisdata[intrain,]
testing <- irisdata[-intrain,]

#Preprocessing & Training
anyNA(irisdata)
trctrl <- trainControl(method = "repeatedcv", number = 10, repeats = 3)
set.seed(3333)

dtree_fit <- train(Species ~., data = training, method = "rpart",
                   parms = list(split = "information"),
                   trControl=trctrl,
                   tuneLength = 10)
prp(dtree_fit$finalModel, box.palette = "Reds", tweak = 1.2)
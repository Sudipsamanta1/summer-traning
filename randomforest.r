irisdata <- iris
irisTrainData = sample(1:150,100)
irisValData = setdiff(1:150,irisTrainData)
trainData <- irisdata[irisTrainData,]

library(randomForest)
iris_randforest <- randomForest(Species ~.,data = trainData)
iris_randforest$importance
iris_randforest
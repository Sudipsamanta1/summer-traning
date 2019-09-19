
### running ann on ll-all data
library(nnet)
leuko_data <- read.csv("leukemia-selected-100.csv")

#The neural network requires that the species be normalized using one-of-n normalization. We will normalize between 0 and 1.  
#setwd("/home/mca100/rwp")

#Breaking the data into train and test data
trainDataIndx = sample(1:72,52)
testDataIndx = setdiff(1:72,trainDataIndx)

trainData <- leuko_data[trainDataIndx,]
testData <- leuko_data[testDataIndx,]
#mat <- as.matrix(mat)

xTrain <- subset(trainData, select=-class)
yTrain <- subset(trainData, select=class)

xTest <- subset(testData, select=-class)
yTest <- subset(testData, select=class)

ideal <- class.ind(leuko_data$class)

ann_model = nnet(xTrain, ideal[trainDataIndx,], size=9, softmax=TRUE)

pred <- predict(ann_model, leuko_data[testDataIndx,-5], type="class")

table(pred,unlist(yTest))

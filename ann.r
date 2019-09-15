### running ann on ll-all data

library(nnet)
leuko_df <- read.csv("/home/sudip/summer-tranning-project/dataset/leukemia_small")
#irisdata<-iris
#The neural network requires that the species be normalized using one-of-n normalization. We will normalize between 0 and 1.  
#setwd("/home/mca100/rwp")
#setwd("~/summer-tranning-project/r code")

#Breaking the data into train and test data
trainDataIndx = sample(1:3572,3000)
testDataIndx = setdiff(1:3572,trainDataIndx)

trainData <- mat[trainDataIndx,]
testData <- mat[testDataIndx,]
mat <- as.matrix(mat)

xTrain <- subset(trainData, select=-class)
yTrain <- subset(trainData, select=class)

xTest <- subset(testData, select=-class)
yTest <- subset(testData, select=class)

ideal <- class.ind(mat$class)

ann_model = nnet(xTrain, ideal[trainDataIndx,], size=25, softmax=TRUE)

pred <- predict(ann_model,leuko_df[testDataIndx,-5], type="class")

table(pred,unlist(yTest))


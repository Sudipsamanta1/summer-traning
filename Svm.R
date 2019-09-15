setwd("~/summer-tranning-project/r code")
mat <- read.csv("/home/sudip/summer-tranning-project/r code/LL-ALL-selected-transpose.csv")

factor(mat[,101])
#[1] LL  LL  LL  LL  LL  LL  LL  LL  LL  ALL ALL ALL ALL ALL ALL ALL ALL ALL[19] ALL
#Levels: ALL LL

library("e1071")

#Breaking the data into train and test data
trainData = sample(1:19,15)
testData = setdiff(1:19,trainData)

trainData <- mat[trainData,]
testData <- mat[testData,]
#mat <- as.matrix(mat)
x <- subset(mat, select=-class)
y <- subset(mat, select=class)

svm_model <- svm(class ~ ., data=mat)
summary(svm_model)

svm_model1 <- svm(as.matrix(x),ifelse(mat[,101] == "ALL",1,0))
summary(svm_model1)
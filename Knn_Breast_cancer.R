library("gmodels")
library(class)

wdbc.data <- read.csv("wdbc.data")
input <- wdbc.data[,3:32]
output <- wdbc.data[,2]
table(output)
summary(input)
############### Lets normalize ################
normalize <- function(x) {
  (x - min(x))/(max(x)-min(x))
}
normalize(c(1,2,3,4,5))
input.normalized <- as.data.frame(sapply(input, normalize))
summary(input.normalized)
################################################

####### Split out training and test data ###########
trainSet <- input.normalized[1:469,]
trainSet.Output <- output[1:469]

testSet <- input.normalized[470:569,]
expected.Output <- output[470:569]

############# Using KNN ###############################

testSet.output <- knn(trainSet, testSet, trainSet.Output, k =21)
CrossTable(expected.Output, testSet.output)

############# Normalizing using z-scores ##############

input.znormalized <- as.data.frame(scale(input))
trainSet.z <- input.znormalized[1:469,]
testSet.z <- input.znormalized[470:569,]

########## again using Knn #############################
testSet.z.output <- knn(trainSet.z, testSet.z, trainSet.Output, k =21)
CrossTable(expected.Output, testSet.z.output)
############################################################


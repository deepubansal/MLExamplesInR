library(plyr)
titanic.data <- read.csv("titanic_data.csv")
table(titanic.data$Pclass)
input <- titanic.data[, c("Sex", "Age", "Fare", "Pclass", "Embarked")]
input$Sex <- revalue(input$Sex, c("male" = 1, "female"= 0))
input <- input[!is.na(input$Age),]
input <- input[!input$Embarked=="",]

input$Embarked_Q <- revalue(input$Embarked, c("Q"=1, "S"= 0, "C"=0))
input$Embarked_S <- revalue(input$Embarked, c("Q"=0, "S"= 1, "C"=0))
input$Pclass_1 <- mapvalues(input$Pclass, from=c(1,2,3), to=c(1,0,0))
input$Pclass_2 <- mapvalues(input$Pclass, from=c(1,2,3), to=c(0,1,0))

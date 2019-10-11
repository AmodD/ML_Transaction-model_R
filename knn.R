pathvar <-"/home/gayatri/Fortiate/Build/Workspaces/R/ML_Transaction-model_R/data.csv"
df = read.csv(pathvar)
df$X = NULL
df$POS_DATA = NULL
print(df)

is.na.data.frame(df)
df$POS.Entry.Mode <- gsub("[[:punct:]]", "", df$POS.Entry.Mode)
df$POS.Entry.Mode <- gsub(pattern = "", replacement = 000, x = df$POS.Entry.Mode)
df$POS.Entry.Mode = as.factor(df$POS.Entry.Mode)
df$Response.Code = as.factor(df$Response.Code)
df$PROCESSING_CODE = as.factor(df$PROCESSING_CODE)
df$Merchant.Category.Code = as.factor(df$Merchant.Category.Code)

library(caTools)
results = sample.split(df$Response.Code,SplitRatio = 0.8)
df.train = df[results == TRUE, ]
df.test = df[results == FALSE, ]

NROW(df.train)
NROW(df.test)

library(rpart)
classifier = rpart(Response.Code ~ .,data = df.train)
predictions = predict(classifier,newdata = df.test)
confusionMatrix(table(df.test$Response.Code,predictions))
printaccuracy = function(cm){
  correct.predictions = sum(diag(cm))
  total.predictions = sum(cm)
  accuracy = (correct.predictions/ total.predictions)*100
  print(accuracy)
}
printaccuracy(cm)


library(caret)
classifier = knn3(Response.Code ~ .,data = df.train,k=5)
predictions = predict(classifier,newdata = df.test,type = "class",na.action = na.pass)
NROW(predictions)
NROW(df.test$Response.Code)
levels(predictions)
levels(df.test$Response.Code)
identical(levels(predictions),levels(df.test$Response.Code))
tab<-table(predictions,df.test)
confusionMatrix(predictions,df.test$Response.Code)


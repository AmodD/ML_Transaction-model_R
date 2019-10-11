pathvar <-"/home/gayatri/Fortiate/Build/Workspaces/R/ML_Transaction-model_R/data_csv.csv"
df = read.csv(pathvar,,colClasses='character')
df = df[c("PROCESSING_CODE","POS_DATA","TRANSACTION_AMOUNT","CARD_ACCEPTOR_ACTIVITY","CODE_ACTION","POS_ENTRY_MODE")]


library(testthat)
test_that("path is correct",{
  expect_match(pathvar,"/home/gayatri/Fortiate/Build/Workspaces/R/ML_Transaction-model_R/data_csv.csv")
})
x<- dput(names(df))
print(x)

names = c("PROCESSING_CODE","POS_DATA","TRANSACTION_AMOUNT","CARD_ACCEPTOR_ACTIVITY","CODE_ACTION","POS_ENTRY_MODE")

test_that("columns are correct",{
  expect_identical(x,names)
})

library(plyr)
df$POS_ENTRY_MODE = as.character(df$POS_ENTRY_MODE)
df$POS_ENTRY_MODE[df$POS_ENTRY_MODE == "???"] <- "000"

df$POS_ENTRY_MODE = as.factor(df$POS_ENTRY_MODE)
NROW(df$POS_ENTRY_MODE)
df$CODE_ACTION = as.factor(df$CODE_ACTION)
NROW(df$CODE_ACTION)
df$PROCESSING_CODE = as.factor(df$PROCESSING_CODE)
NROW(df$PROCESSING_CODE)
df$CARD_ACCEPTOR_ACTIVITY = as.factor(df$CARD_ACCEPTOR_ACTIVITY)
NROW(df$CARD_ACCEPTOR_ACTIVITY)

df$TERM_CARD_READ_CAP <- sapply(strsplit(as.character(df$POS_DATA),''), "[", 1)
df$TERM_CH_VERI_CAP <- sapply(strsplit(as.character(df$POS_DATA),''), "[", 2)
df$TERM_CARD_CAPTURE_CAP<- sapply(strsplit(as.character(df$POS_DATA),''), "[", 3)
df$TERM_ATTEND_CAP <- sapply(strsplit(as.character(df$POS_DATA),''), "[", 4)
df$CH_PRESENCE_IND <- sapply(strsplit(as.character(df$POS_DATA),''), "[", 5)
df$CARD_PRESENCE_IND <- sapply(strsplit(as.character(df$POS_DATA),''), "[", 6)
df$TXN_CARD_READ_IND <- sapply(strsplit(as.character(df$POS_DATA),''), "[", 7)
df$TXN_CH_VERI_IND <- sapply(strsplit(as.character(df$POS_DATA),''), "[", 8)
df$TXN_CARD_VERI_IND<- sapply(strsplit(as.character(df$POS_DATA),''), "[", 9)
df$TRACK_REWRITE_CAP <- sapply(strsplit(as.character(df$POS_DATA),''), "[", 10)
df$TERM_OUTPUT_IND <- sapply(strsplit(as.character(df$POS_DATA),''), "[", 11)
df$PIN_ENTRY_IND <- sapply(strsplit(as.character(df$POS_DATA),''), "[", 12)
df$POS_DATA =NULL


library(caTools)
results = sample.split(df$CODE_ACTION,SplitRatio = 0.8)
df.train = df[results == TRUE, ]
df.test = df[results == FALSE, ]

NROW(df.train)
NROW(df.test)

library(rpart)

classifier = rpart(CODE_ACTION ~ .,data = df.train)

predictions = predict(classifier,newdata = df.test)
confusionMatrix(table(df.test$CODE_ACTION,predictions))
printaccuracy = function(cm){
  correct.predictions = sum(diag(cm))
  total.predictions = sum(cm)
  accuracy = (correct.predictions/ total.predictions)*100
  print(accuracy)
}
printaccuracy(cm)


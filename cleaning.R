pathvar <-"/home/gayatri/Fortiate/Build/Workspaces/R/ML_Transaction-model_R/data.csv"
df = read.csv(pathvar)

test_that("path is correct",{
  expect_match(pathvar,"/home/gayatri/Fortiate/Build/Workspaces/R/ML_Transaction-model_R/data.csv")
})
df$X = NULL
x<- dput(names(df))
print(x)

names = c("Merchant.Category.Code", "POS.Entry.Mode", "POS_DATA", "PROCESSING_CODE", 
          "Response.Code", "Transaction.Amount")
identical(x,names)

test_that("columns are correct",{
  expect_identical(x,names)
})
df$POS_DATA = as.integer(df$POS_DATA)
format(df$POS_DATA,sci=FALSE)
options("scipen"=100, "digits"=12)
print(df$POS_DATA,digits = 21)

df$POS.Entry.Mode <- gsub("[[:punct:]]", "", df$POS.Entry.Mode)
df$POS.Entry.Mode <- gsub(pattern = "", replacement = 000, x = df$POS.Entry.Mode)
df$POS_DATA <- gsub("[[:punct:]]", 0, df$POS_DATA)


df$POS.Entry.Mode = as.factor(df$POS.Entry.Mode)
df$Response.Code = as.factor(df$Response.Code)
df$PROCESSING_CODE = as.factor(df$PROCESSING_CODE)
df$Merchant.Category.Code = as.factor(df$Merchant.Category.Code)


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




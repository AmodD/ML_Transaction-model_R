df = read.csv("/home/gayatri/Fortiate/Build/Workspaces/R/ML_Transaction-model_R/data.csv")
df$X = NULL
describe(df)
print(df)

df$POS.Entry.Mode <- gsub("[[:punct:]]", "", df$POS.Entry.Mode)
df$POS.Entry.Mode <- gsub(pattern = "", replacement = 000, x = df$POS.Entry.Mode)

df$POS_DATA <- gsub("[[:punct:]]", "", df$POS_DATA)
df$POS_DATA <- gsub(pattern = "", replacement = 000, x = df$POS_DATA)
df$POS.Entry.Mode = as.factor(df$POS.Entry.Mode)
df$PROCESSING_CODE = as.factor(df$PROCESSING_CODE)
df$Response.Code = as.factor(df$Response.Code)
df$Merchant.Category.Code = as.factor(df$Merchant.Category.Code)
df$POS_DATA = as.(df$POS_DATA)


print(df$POS.Entry.Mode)
print(df$Response.Code)
print(df$PROCESSING_CODE)
print(df$Merchant.Category.Code)

print(df)

x<- dput(names(df))
print(x)

names = c("Merchant.Category.Code", "POS.Entry.Mode", "POS_DATA", "PROCESSING_CODE", 
          "Response.Code", "Transaction.Amount")
identical(x,names)

test_that("columns are correct",{
  expect_identical(x,names)
})

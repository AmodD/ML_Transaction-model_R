#library(psych)
library(stringr)

path2 <- importcsv(path3)
print(path2)
test_that("path is incorrect",{
  expect_match(path2,"/home/gayatri/Downloads/sample.csv")
  })





















#f= read.csv("/home/gayatri/Downloads/Sample Transactions-Test Data-Assignment-1 (1).csv")
#expect_that(f, is_a('data.frame'))


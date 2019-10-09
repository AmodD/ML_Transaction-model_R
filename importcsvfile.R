library(stringr)
library(stringi)
path3 <- readline(prompt="Enter path: ")       
#path3 = "/home/Downloads/sample.csv"
mbm <- microbenchmark(importcsv <- function(path3){

  return(path3)
})
describe(mbm)
print(sum(mbm[2]))


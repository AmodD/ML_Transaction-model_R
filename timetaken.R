#start.time <- Sys.time()
#df = read.csv("/home/gayatri/Fortiate/Build/Workspaces/R/ML_Transaction-model_R/Sample Transactions-test Data.csv")
#describe(df)
#View(df)
#df = df[c(11,12,14,29,35,83)]
#write.csv(df,'/home/gayatri/Fortiate/Build/Workspaces/R/ML_Transaction-model_R/SampleDatanew.csv',row.names = FALSE)
#end.time <- Sys.time()s
#time.taken <- end.time - start.time
#print(time.taken)
data = read.csv("/home/gayatri/Fortiate/Build/Workspaces/R/ML_Transaction-model_R/SampleDatanew.csv",check.names=TRUE,stringsAsFactors=TRUE)
typeof(data$POS.Entry.Mode)
#droplevels(x, exclude = if(anyNA(levels(x))) NULL else NA, ...)
describe(data)

print(droplevels.data.frame(data$POS_ENTRY_MODE))
print(col.names)

  
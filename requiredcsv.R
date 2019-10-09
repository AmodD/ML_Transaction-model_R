#df = read.csv("/home/gayatri/Fortiate/Build/Workspaces/R/ML_Transaction-model_R/new.csv")
#df = df[c(11,12,14,29,35,83)]
#write.csv(df,'/home/gayatri/Fortiate/Build/Workspaces/R/ML_Transaction-model_R/SampleDatanew.csv',row.names = FALSE)
df = read.csv("/home/gayatri/Fortiate/Build/Workspaces/R/ML_Transaction-model_R/test.csv",colClasses=c(id="character"))
print(df)
write.csv(df,'/home/gayatri/Fortiate/Build/Workspaces/R/ML_Transaction-model_R/data.csv',row.names = FALSE)

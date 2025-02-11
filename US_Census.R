#Locate and import data file
Lab3<-read.csv(file.choose(),header = T)
#Structure of the dataset
str(Lab3)
#replacing commas in column 6 using gsub
Column6=gsub(",","",Lab3$MedianHouseholdIncome)
Lab3$MedianHouseholdIncome<-as.numeric(Column6)
#Review summary of Dataset
str(Lab3)
#Review the summary of the dataset
summary(Lab3)
#Drop records with missing values
Lab3_2<-na.omit(Lab3)
#Review summary of new dataset
summary(Lab3_2)
#View duplicate records
Lab3_2[duplicated(Lab3_2),]
#Remove duplicated records
Lab3_3<-Lab3_2[!duplicated(Lab3_2),]
#View structure of Lab3_3
str(Lab3_3)
#Replace letters in column 1 by zero using gsub
column1=gsub("[A-Z]", "0", Lab3_3$RegionID)
Lab3_3$RegionID<-column1
#view the structure of Lab3_3
str(Lab3_3)
#Save cleaned file
write.csv(Lab3_3, file = "Lab3_3.csv")

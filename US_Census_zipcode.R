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
#import zipcode file
zipcode<-read.delim(file.choose(),header=T)
#View the head of this file to find unnamed variables
head(zipcode)
#Rename all variables
names(zipcode)<-c("country_code","postal_code","place","state","st","county",
                  "countrycode","community","communitycode","latitude","longitude",
                  "accuracy")
#recheck names of new variables
names(zipcode)
#view the structure of the file. 
str(zipcode)
#Convert postal_code to character
zipcode$postal_code<-as.character(zipcode$postal_code)
#verify postal_code is converted to character
str(zipcode)
#install dplyr and utilize join function
install.packages("dplyr")
library(dplyr)
#use inner join to mer two dataframes and name Lab3_4
Lab3_4<-inner_join(Lab3_3,zipcode,by=c("RegionID"="postal_code"))
#View first few rows of new dataset
head(Lab3_4)
#Verify structure
str(Lab3_4)
#Save as new file
write.csv(Lab3_4, file = "Lab3_4.csv")
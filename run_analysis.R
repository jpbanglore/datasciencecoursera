setwd("C:\\Learning\\Data Science\\CleaningData\\week3\\UCI HAR Dataset\\")
#Read the data in x_train.txt into a table. 
xTrainData <- read.table("./train/X_train.txt",header=FALSE)
#head(xTrainData)
#Read the data in x_test.txt into a table. 
xTestData <- read.table("./test/X_test.txt",header=FALSE)
#head(xTestData)

#Read the activity data from y_test.txt and y_train.txt into tables.
yTestData <- read.table("./test/y_test.txt")
#dim(yTestData)
#Column bind the activity train data with the x_train data. Column bind the activity test data as well with the x_test data. 
xTestDataActivity <- cbind(yTestData,xTestData)

yTrainData <- read.table("./train/y_train.txt")
#dim(yTrainData)
xTrainDataActivity <- cbind(yTrainData,xTrainData)
#head(xTestDataActivity)
#dim(xTrainDataActivity)

#Now merge the test and the train data by using row bind function. 
mergedData <- rbind(xTestDataActivity,xTrainDataActivity)
#dim(mergedData)

#Read the subject test and train data from subject_test.txt and subject_train.txt files. 
subTestData <- read.table("./test/subject_test.txt")
#dim(subTestData)  
subTrainData <- read.table("./train/subject_train.txt")
#dim(subTrainData)  

#Merge the subject test and train data by row binding. Make sure that row binding is in the correct order.

mergedSubject <- rbind(subTestData,subTrainData)
#dim(mergedSubject)

#Now add the subject column in the data set obtained in step 5 by column bind function. 
mergedSubjectData <- cbind(mergedSubject,mergedData)
#dim(mergedSubjectData)

#Read features.txt file into a table and create a features vector containing all 
# the feature names and two more variable names - Activity and Subject.
features <- read.table("./features.txt")
#head(features)
#dim(features)
featuresVector <- as.vector(features[[2]])
featuresVector1 <- c("Subject","Activity",featuresVector)

#Set the names of the merged data set variables by using the feature names vector created in step 9. 
names(mergedSubjectData) <- featuresVector1

#Extract only the variables that have 'mean' and 'std' in their names.
relevantData1 <- mergedSubjectData[,grep(c("mean"), names(mergedSubjectData))]
relevantData2 <- mergedSubjectData[,grep(c("std"), names(mergedSubjectData))]
relevantData <- cbind(mergedSubjectData["Subject"],mergedSubjectData["Activity"],relevantData1,relevantData2)
  
#names(relevantData)
#names(relevantData2)
  
#head(relevantData)
#dim(relevantData)
#Now use gsub function to replace activity codes by meaningful names. 

relevantData$Activity <- gsub("1","WALKING",relevantData$Activity)
relevantData$Activity <- gsub("2","WALKING_UPSTAIRS",relevantData$Activity)
relevantData$Activity <- gsub("3","WALKING_DOWNSTAIRS",relevantData$Activity)
relevantData$Activity <- gsub("4","SITTING",relevantData$Activity)
relevantData$Activity <- gsub("5","STANDING",relevantData$Activity)
relevantData$Activity <- gsub("6","LAYING",relevantData$Activity)

names(relevantData) <- gsub("()-", "",names(relevantData))
names(relevantData)
names(relevantData) <- gsub("[:():]", "",names(relevantData))
#names(relevantData)
#library(dplyr)
#dataTbl <- tbl_df(relevantData)
#relevantDataGroup <- group_by(dataTbl,Activity, Subject)
#dim(relevantDataGroup)
#colMeans(relevantDataGroup)

#Use reshape2 library and melt the dataset to group data by Activity and Subject variables. 
library(reshape2)
meltData <- melt(relevantData, c("Activity", "Subject"))

#Use dcast to calculate mean of all variables in the molten data and this will create a wide tidy dataset.
wideData <- dcast(meltData, Activity + Subject ~ variable, mean)

  
  
  
  
  
  
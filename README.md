### Introduction

This document describes the run_analysis.R script that I have written to analyse the 
human activity recognition using smartphone dataset. 
The CodeBook for the project is available (CodeBook.txt). It describes the data processing 
steps and also the variables of the output data. 

### Details of run_analysis.R

1. Read the data in x_train.txt into a table. 
2. Read the data in x_test.txt into a table. 
3. Read the activity data from y_test.txt and y_train.txt into tables.
4. Column bind the activity train data with the x_train data. Column bind the activity test data as well with the x_test data. 
5. Now merge the test and the train data by using row bind function. 
6. Read the subject test and train data from subject_test.txt and subject_train.txt files. 
7. Merge the subject test and train data by row binding. Make sure that row binding is in the correct order - 
it should be in the same order as the merging order in step 5.
8. Now add the subject column in the data set obtained in step 5 by column bind function. 
9. Read features.txt file into a table and create a features vector containing all the feature names and two more variable names - Activity and Subject.
10. Set the names of the merged data set variables by using the feature names vector created in step 9. 
11. Extract only the variables that have 'mean' and 'std' in their names.
12. Now use gsub function to replace activity codes by meaningful names. 
13. Also, make the variable names meaningful by removing un-necessary braces and hyphens. 
14. Use reshape2 library and melt the dataset to group data by Activity and Subject variables. 
15. Use dcast to calculate mean of all variables in the molten data and this will create a wide tidy dataset. 




# run_analysis
The data linked to from the course website represent data collected from the accelerometers from the 
Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
Here are the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


## The run_analysis script does the following:     
1 Merges the training and the test sets to create one data set.       
2 Extracts only the measurements on the mean and standard deviation for each measurement.        
3 Uses descriptive activity names to name the activities in the data set.       
4 Appropriately labels the data set with descriptive variable names.      
5 Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


## The main steps are the following:
unzip the file contained in the zip to your working directory.      
read the feature.txt used as colnames (add subject & activity).       
read the X_test & x_train txt (measurement) and merge them.       
read the subject txt (test & train) and merge them.      
read the y_train and y_test (activity variable) and merge them.      
Uses descriptive activity names to name the activities in the data set.      
merge the measurement, activity, subject variable.      
add the colnames to the merged dataframe.       
Extracts only the measurements on the mean and standard deviation for each measurement.      
Appropriately labels the data set with descriptive variable names using Camel Case.       
Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
## unzip the file contained in the zip to your working directory
## read the feature.txt used as colnames (add subject & activity)
feature<-read.table("UCI HAR Dataset/features.txt")
colnames<-as.vector(feature[,2])
colnames<-c(colnames,"Subject","Activity")
## read the X_test & x_train txt (measurement) and merge them
X_test<-read.table("UCI HAR Dataset/test/X_test.txt")
X_train<-read.table("UCI HAR Dataset/train/X_train.txt")
X_merge<-rbind(X_train,X_test)
## read the subject txt (test & train) and merge them
subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt")
subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt")
subject_merge<-rbind(subject_train,subject_test)
## read the y_train and y_test (activity variable) and merge them
y_train<-read.table("UCI HAR Dataset/train/y_train.txt")
y_test<-read.table("UCI HAR Dataset/test/y_test.txt")
y_merge<-rbind(y_train,y_test)
## Uses descriptive activity names to name the activities in the data set
y_merge$V1[y_merge$V1=="1"]<-"WALKING"
y_merge$V1[y_merge$V1=="2"]<-"WALKING_UPSTAIRS"
y_merge$V1[y_merge$V1=="3"]<-"WALKING_DOWNSTAIRS"
y_merge$V1[y_merge$V1=="4"]<-"SITTING"
y_merge$V1[y_merge$V1=="5"]<-"STANDING"
y_merge$V1[y_merge$V1=="6"]<-"LAYING"
## merge the measurement, activity, subject variable
dat_merge<-cbind(X_merge,subject_merge,y_merge)
## add the colnames to the merged dataframe
colnames(dat_merge)<-colnames
## Extracts only the measurements 
## On the mean and standard deviation for each measurement.
col_mean<-grep(colnames,pattern="mean()")
col_std<-grep(colnames,pattern="std()")
col_target<-c(col_mean,col_std,562,563)
col_mf<-grep(colnames,pattern="meanFreq()",invert=T)
col_extract<-intersect(col_target,col_mf)
dat_extract<-dat_merge[,col_extract]
## Appropriately labels the data set with descriptive variable names. 
## use Camel Case.
colnames<-colnames(dat_extract)
for (i in 1:68){
    colnames[i]<-gsub("-|\\()", "", colnames[i])
    colnames[i]<-gsub("mean", "Mean", colnames[i])
    colnames[i]<-gsub("std", "Std", colnames[i])
}
colnames(dat_extract)<-colnames
## Creates a second, independent tidy data set with the average of 
## each variable for each activity and each subject. 
dat_output<-aggregate(dat_extract,
    by=list(dat_extract$Activity,dat_extract$Subject),FUN="mean",na.rm=T)
dat_output<-dat_output[,1:68]
colnames<-colnames(dat_output)
colnames[1:2]<-c("activity","subject")
colnames(dat_output)<-colnames
write.table(dat_output,file="tidydata.txt",row.names=F)
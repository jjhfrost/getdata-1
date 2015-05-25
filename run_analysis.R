
#1.Merges the training and the test sets to create one data set.
#2.Extracts only the measurements on the mean and standard deviation for each measurement. 
#3.Uses descriptive activity names to name the activities in the data set
#4.Appropriately labels the data set with descriptive variable names. 
#5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
setwd("E:/Coursera/getdata-1")

activityLabel <-read.table(file = "UCI HAR Dataset/activity_labels.txt",header = FALSE,col.names = c("activity","activityLabel"))

#train set
train <- read.table(file = "UCI HAR Dataset/train/subject_train.txt",header = FALSE,col.names = "subject")

activity <- read.table(file = "UCI HAR Dataset/train/y_train.txt",header = FALSE,col.names = "activity")
train <- cbind(train,merge(activity,activityLabel))

temp <- read.table(file = "UCI HAR Dataset/train/X_train.txt",header = FALSE)

train<-cbind(train,mean=rowMeans(temp))
train<-cbind(train,std=apply(temp, 1 ,sd))

#test set
test <- read.table(file = "UCI HAR Dataset/test/subject_test.txt",header = FALSE,col.names = "subject")

activity <- read.table(file = "UCI HAR Dataset/test/y_test.txt",header = FALSE,col.names = "activity")

test <- cbind(test,merge(activity,activityLabel))

temp <- read.table(file = "UCI HAR Dataset/test/X_test.txt",header = FALSE)

test<-cbind(test,mean=rowMeans(temp))
test<-cbind(test,std=apply(temp, 1 ,sd))

#merge train and test set
all <- rbind(train, test)
secondDataSet <- all[1,]
secondDataSet <- data.frame()
subjectActivity <- unique(all[,1:3])

for (i in 1:nrow(subjectActivity)) {
    tempmean <- colMeans(all[which(all$subject==subjectActivity$subject[i] & all$activity==subjectActivity$activity[i]),][,4:5] )
    secondDataSet <- rbind(secondDataSet, cbind(subjectActivity[i,],mean = tempmean[1],std = tempmean[2]))
}
write.table(secondDataSet,"result.txt",row.names = FALSE)


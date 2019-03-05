## Run_Analysis.R
## Getting and Cleaning Data Course Project: Peer graded assignement

## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set.
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Load package dplyr
library(dplyr)


#downloading dataset
filename <- "getdata_coursera.zip"

if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename)
}  
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

#Assigning all dataframes
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

## 1. Merges the training and the test sets to create one data set.
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
Merged_Data <- cbind(Subject, Y, X)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement
TData <- Merged_Data %>% select(subject, code, contains("mean"), contains("std"))

## 3. Uses descriptive activity names to name the activities in the data set
TData$code <- activities[TData$code, 2]

## 4. Appropriately labels the data set with descriptive activity names
names(TData)[2] = "activity"
names(TData)<-gsub("Acc", "Accelerometer", names(TData))
names(TData)<-gsub("Gyro", "Gyroscope", names(TData))
names(TData)<-gsub("BodyBody", "Body", names(TData))
names(TData)<-gsub("Mag", "Magnitude", names(TData))
names(TData)<-gsub("^t", "Time", names(TData))
names(TData)<-gsub("^f", "Frequency", names(TData))
names(TData)<-gsub("tBody", "TimeBody", names(TData))
names(TData)<-gsub("-mean()", "Mean", names(TData), ignore.case = TRUE)
names(TData)<-gsub("-std()", "STD", names(TData), ignore.case = TRUE)
names(TData)<-gsub("-freq()", "Frequency", names(TData), ignore.case = TRUE)
names(TData)<-gsub("angle", "Angle", names(TData))
names(TData)<-gsub("gravity", "Gravity", names(TData))

## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject
tidyData <- TData %>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean))
write.table(tidyData, "Tidy_Data.txt", row.name=FALSE)

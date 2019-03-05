This is a code book that describes the variables, the data, and any transformations or work 
that performed to clean up the data.

The aims of the R script called run_analysis.R are the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set.
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# 1. 
X is created by merging x_train and x_test using rbind() function.
Y  is created by merging y_train and y_test using rbind() function.
Subject  is created by merging subject_train and subject_test using rbind() function.
Merged_Data is created by merging Subject, Y and X using cbind() function.

#2
TData is created by subsetting Merged_Data, selecting only columns: 
subject, code, and the measurements on the mean and standard deviation.

#3
The numbers in the "Code column" of TData are replaced with activities taken from the second column of the  "activities" variable.

#4
Labels in the TData setreplaced with descriptive variable names

#5
Tidy_Data is created by taking the means in TData (groupped by subject and activity).
